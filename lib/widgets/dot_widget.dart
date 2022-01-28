import 'package:flutter/material.dart';
import '../models/progress_model.dart';

class DotWidget extends StatelessWidget {
  final ProgressModel progress;
  final int index;
  const DotWidget({Key? key, required this.progress, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: progress.selectedIndex == index
            ? Colors.blue
            : Colors.red,
      ),
    );
  }
}
