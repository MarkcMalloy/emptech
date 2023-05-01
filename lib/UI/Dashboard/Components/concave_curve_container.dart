import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

class ConcaveCurveContainer extends StatelessWidget {
  final double height;
  final double curveHeight;
  final Widget child;

  ConcaveCurveContainer({required this.height, required this.curveHeight, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ConcaveClipper(curveHeight: curveHeight),
      child: Container(
        height: height,
        color: Colors.white,
        child: child,
      ),
    );
  }
}

class ConcaveClipper extends CustomClipper<Path> {
  final double curveHeight;

  ConcaveClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ConvexCurveContainer extends StatelessWidget {
  final double height;
  final double curveHeight;
  final Widget child;
  final Color borderColor;
  final double borderWidth;

  ConvexCurveContainer({
    required this.height,
    required this.curveHeight,
    required this.child,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ConvexClipper(curveHeight: curveHeight),
      child: Container(
        height: height,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(child: child),
            ClipPath(
              clipper: ConvexClipper(curveHeight: curveHeight),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: borderColor,
                      width: borderWidth,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConvexClipper extends CustomClipper<Path> {
  final double curveHeight;

  ConvexClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height - curveHeight, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}