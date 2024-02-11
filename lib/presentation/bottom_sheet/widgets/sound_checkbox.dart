import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class SoundCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SoundCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: Colors.black,
          side: const BorderSide(
            color: Color.fromRGBO(217, 226, 241, 1),
          ),
          value: value,
          onChanged: onChanged,
        ),
        const Text(
          'Включить звук',
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ],
    );
  }
}
