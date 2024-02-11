// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class ATMDescriptionRow extends StatelessWidget {
  const ATMDescriptionRow({
    required this.str1,
    required this.str2,
    super.key,
  });

  final String str1;
  final String str2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(str1, style: const TextStyle(color: textColor)),
        Text(str2, style: const TextStyle(color: textColor))
      ],
    );
  }
}
