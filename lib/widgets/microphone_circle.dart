import 'package:flutter/material.dart';

class MicrophoneCircle extends StatefulWidget {
  final bool animated;

  const MicrophoneCircle({
    super.key,
    this.animated = false,
  });

  @override
  State<MicrophoneCircle> createState() => _MicrophoneCircleState();
}

class _MicrophoneCircleState extends State<MicrophoneCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.9,
      upperBound: 1.05,
    );

    if (widget.animated) {
      controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: controller,
      child: Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          color: Color(0xFFE8F0FF),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.mic,
          size: 70,
          color: Colors.black54,
        ),
      ),
    );
  }
}