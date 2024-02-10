import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/constants.dart';
import 'package:test/domain/mockRepo/list_finance.dart';
import 'package:test/domain/models/finance.dart';

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

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    super.key,
    required this.finance,
  });

  final Finance finance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 20,
              child: (finance.changeType == ChangeType.cashback)
                  ? SvgPicture.asset(cashbackIcon)
                  : SvgPicture.asset(moneyIcon)),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${finance.money} ₽',
                style: const TextStyle(
                    color: textColor, fontWeight: FontWeight.bold),
              ),
              Text(
                finance.changeType.name,
                style: const TextStyle(color: textColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
