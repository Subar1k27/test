// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class ATMInfo extends StatelessWidget {
  const ATMInfo({super.key});

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
          margin: const EdgeInsets.only(top: 2),
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

class ATMTitleWidget extends StatelessWidget {
  const ATMTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      margin: const EdgeInsets.only(top: 25),
      height: 110,
      child: Stack(
        children: [
          const Positioned(
              top: 10,
              right: 10,
              child: Text(
                'Снековый',
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '54467345',
                  style: TextStyle(fontSize: 25, color: textColor),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Color.fromARGB(255, 249, 120, 121),
                      ),
                      Text(
                        '   Не работает',
                        style: TextStyle(
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'ТЦ Мега, Химки',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
