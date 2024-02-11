// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test/constants.dart';

import 'widgets/atm_description_row.dart';
import 'widgets/atm_title_widget.dart';

class ATMInfoWidget extends StatelessWidget {
  const ATMInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Торговые автоматы',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
        const ATMTitleWidget(),
        Container(
          height: 125,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ATMDescriptionRow(
                str1: 'Тип шины',
                str2: 'MDB',
              ),
              ATMDescriptionRow(
                str1: 'Уровень сигнала',
                str2: 'Стабильный',
              ),
              ATMDescriptionRow(
                str1: 'Идентификатор',
                str2: '13856646',
              ),
              ATMDescriptionRow(
                str1: 'Модем',
                str2: '3463457365',
              ),
            ],
          ),
        )
      ],
    );
  }
}
