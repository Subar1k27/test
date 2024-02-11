import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/constants.dart';
import 'package:test/domain/models/finance.dart';

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
      margin: const EdgeInsets.only(right: 8),
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
