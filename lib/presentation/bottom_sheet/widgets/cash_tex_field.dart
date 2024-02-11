// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class CashWidget extends StatelessWidget {
  const CashWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: const TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CashTextField(text: 'Cash'),
            CashTextField(text: 'Cashless'),
          ],
        ),
      ],
    );
  }
}

class CashTextField extends StatelessWidget {
  final String text;
  const CashTextField({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.43,
      child: TextFormField(
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(132, 172, 172, 172))),
            labelText: text,
            labelStyle:
                const TextStyle(color: Color.fromARGB(132, 172, 172, 172)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
