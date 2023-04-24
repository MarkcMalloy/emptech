import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';

class DashboardProfileAvatar extends StatelessWidget {
  final String url;
  final double size;
  const DashboardProfileAvatar(
      {Key? key, required this.url, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: CircleAvatar(
          radius: size,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size > 40 ? 32.0 : 12.0),
            child: Image.network(url),
          ),
        ),
      ),
    );
  }
}
