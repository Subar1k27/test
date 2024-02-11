import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class TopAlert extends StatelessWidget {
  const TopAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 190, 8, 0.08),
          borderRadius: BorderRadius.circular(5)),
      height: 85,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.done,
            color: Colors.green,
            size: 30,
          ),
          Text(
            'Изменения от 12.07.2021, 12:30 \nприменены успешно',
            style: TextStyle(color: textColor, fontSize: 17, height: 2),
          )
        ],
      ),
    );
  }
}
