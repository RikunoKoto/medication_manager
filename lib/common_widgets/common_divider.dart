import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
    this.leftIndent = 0,
    this.rightIndent = 0,
  });

  //左のインデントの幅
  final double leftIndent;

  //右のインデントの幅
  final double rightIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.5,
      indent: leftIndent,
      endIndent: rightIndent,
    );
  }
}
