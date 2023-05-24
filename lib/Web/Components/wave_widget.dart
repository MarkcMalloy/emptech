import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  final Color baseColor;
  final Color accentColor1;
  final Color accentColor2;

  WaveWidget({
    required this.baseColor,
    required this.accentColor1,
    required this.accentColor2,
  });

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 50),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 1.6),
      painter: WavePainter(
        baseColor: widget.baseColor,
        accentColor1: widget.accentColor1,
        accentColor2: widget.accentColor2,
        animation: _animationController,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class WavePainter extends CustomPainter {
  final Color baseColor;
  final Color accentColor1;
  final Color accentColor2;
  final Animation<double> animation;

  WavePainter({
    required this.baseColor,
    required this.accentColor1,
    required this.accentColor2,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    // draw first wave
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 4, size.height / 4 + animation.value * 50, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 3 / 4 - animation.value * 50, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.close();
    paint.color = baseColor;
    canvas.drawPath(path, paint);

    // draw second wave
    path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 4, size.height * 3 / 8 + animation.value * 50, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 5 / 8 - animation.value * 50, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.close();
    paint.color = accentColor1;
    canvas.drawPath(path, paint);

    // draw third wave
    path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 4, size.height / 2 + animation.value * 50, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 7 / 16 - animation.value * 50, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.close();
    paint.color = accentColor2;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
