import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double maxWidth;

  const ProgressBar({Key? key, required this.progress, required this.maxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            width: maxWidth,
            height: 64,
            color: Colors.black.withOpacity(0.2),
          ),
          Container(
            width: maxWidth * progress,
            height: 64,
            color: Colors.blue.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
