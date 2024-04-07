import 'dart:math';
import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key, required this.status});

  final String status;

  @override
  WaveAnimationState createState() => WaveAnimationState();
}

class WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Synchronize animation with this widget
      duration: const Duration(seconds: 1), // Animation duration
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context)
                  .size
                  .height), // Set the size of the custom paint
          painter: WavePainter(
              _controller.value), // Use the WavePainter to paint the wave
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}

class WavePainter extends CustomPainter {
  final double animationValue; // Animation value to control the wave height

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = Colors.black // Green color for the wave
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Filling the wave

    final pathGreen = Path();
    pathGreen.moveTo(0, (size.height / 2) + 2);
    // pathGreen.lineTo(0, size.height * 0.6); // Starting point for the wave

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height * 0.56 +
          animationValue *
              30 *
              sin((i / size.width) * 3 * pi); // Calculate wave shape
      pathGreen.lineTo(x, y); // Define wave path
    }

    pathGreen.lineTo(
        size.width, (size.height / 2) + 2); // Complete the wave path
    // pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen); // Draw the green wave
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the wave continuously
  }
}
