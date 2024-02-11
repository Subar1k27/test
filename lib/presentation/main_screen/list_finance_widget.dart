import 'package:flutter/material.dart';

import 'package:test/constants.dart';
import 'package:test/domain/mockRepo/list_finance.dart';
import 'package:test/domain/models/finance.dart';

import 'widgets/finance_card.dart';

class ListFinanceWidget extends StatefulWidget {
  const ListFinanceWidget({super.key});

  @override
  State<ListFinanceWidget> createState() => _ListFinanceWidgetState();
}

class _ListFinanceWidgetState extends State<ListFinanceWidget> {
  List<Finance> finances = [];

  @override
  void initState() {
    finances = ListFinance.getFinance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Финансы',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: textColor),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 24),
            height: 70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: finances.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final Finance finance = finances[index];

                  return FinanceCard(finance: finance);
                })),
      ],
    );
  }
}
