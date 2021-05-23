import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double maxWidth;

  const ProgressBar({Key? key, required this.progress, required this.maxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: maxWidth,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
        ),
        Container(
          width: maxWidth * progress,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
