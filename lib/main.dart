import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:record/record.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // A inicialização do flutter_background_service deve ser feita aqui
  // initializeBackgroundService(); 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Áudio e Print',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Captura e Segundo Plano'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controladores
  final AudioRecorder _audioRecorder = AudioRecorder();
  final ScreenshotController _screenshotController = ScreenshotController();
  
  bool _isRecording = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _audioRecorder.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // --- 1. Lógica de Captura de Áudio ---
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      final path = await _audioRecorder.stop();
      setState(() => _isRecording = false);
      print('Áudio salvo em: $path');
    } else {
      if (await _audioRecorder.hasPermission()) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
        
        await _audioRecorder.start(const RecordConfig(), path: path);
        setState(() => _isRecording = true);
      }
    }
  }

  // --- 2. Lógica de Print da Tela ---
  Future<void> _takeScreenshot() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await _screenshotController.captureAndSave(
      directory.path,
      fileName: 'print_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    print('Print salvo em: $imagePath');
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Print salvo: $imagePath')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Foca automaticamente para o atalho de teclado funcionar
    FocusScope.of(context).requestFocus(_focusNode);

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        // Atalho para Print: Pressionar a tecla 'P' ou 'PrintScreen'
        if (event is KeyDownEvent && 
           (event.logicalKey == LogicalKeyboardKey.keyP || 
            event.logicalKey == LogicalKeyboardKey.printScreen)) {
          _takeScreenshot();
        }
      },
      child: Screenshot(
        controller: _screenshotController,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _isRecording ? Icons.mic : Icons.mic_none,
                  size: 80,
                  color: _isRecording ? Colors.red : Colors.grey,
                ),
                const SizedBox(height: 20),
                Text(
                  _isRecording ? 'Gravando em segundo plano...' : 'Aguardando ação',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _takeScreenshot,
                  child: const Text('Tirar Print (Ou aperte P)'),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _toggleRecording,
            tooltip: _isRecording ? 'Parar Gravação' : 'Iniciar Gravação',
            child: Icon(_isRecording ? Icons.stop : Icons.fiber_manual_record),
          ),
        ),
      ),
    );
  }
}