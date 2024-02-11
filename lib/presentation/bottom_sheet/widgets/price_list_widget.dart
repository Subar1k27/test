// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test/constants.dart';

import 'package:test/domain/mockRepo/list_price.dart';
import 'package:test/domain/models/price.dart';

class PriceListWidget extends StatefulWidget {
  const PriceListWidget({super.key});

  @override
  _PriceListWidgetState createState() => _PriceListWidgetState();
}

class _PriceListWidgetState extends State<PriceListWidget> {
  List<Price> priceList = [];
  final List<TextEditingController> _firstController = [];
  final List<TextEditingController> _secondController = [];

  @override
  void initState() {
    priceList = ListPrice.getPrice();
    for (int i = 0; i < priceList.length; i++) {
      _firstController.add(TextEditingController());

      priceList[i].priceId == null
          ? _firstController[i].text = ''
          : _firstController[i].text = priceList[i].priceId.toString();

      _secondController.add(TextEditingController());
      priceList[i].price == null
          ? _secondController[i].text = ''
          : _secondController[i].text = priceList[i].price.toString();
    }
    super.initState();
  }

  void _addNewPrice() {
    setState(() {
      priceList.add(Price());
      _firstController.add(TextEditingController());
      _secondController.add(TextEditingController());
      _firstController.last.text = '';
      _secondController.last.text = '';
    });
  }

  void _removePrice(int index) {
    setState(() {
      priceList.removeAt(index);
      _firstController.removeAt(index);
      _secondController.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Прайс листы',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Последняя синхронизация с модемом',
            style: TextStyle(color: textColor),
          ),
          Text(
            '1 час назад',
            style: TextStyle(color: textColor),
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '  #',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 60),
            Text(
              'Цена',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        ...priceList.asMap().entries.map((entry) {
          int index = entry.key;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceTextField(
                  width: 50,
                  controller: _firstController,
                  index: index,
                  onChanged: (value) {
                    priceList[index].priceId = int.parse(value);
                  }),
              const SizedBox(
                width: 16,
              ),
              PriceTextField(
                  width: 105,
                  controller: _secondController,
                  index: index,
                  onChanged: (value) {
                    priceList[index].price = int.parse(value);
                  }),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: () => _removePrice(index),
              ),
            ],
          );
        }).toList(),
        // const SizedBox(
        //   height: 16,
        // ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: MaterialButton(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: buttonColor, width: 2),
            ),
            onPressed: _addNewPrice,
            child: const Text(
              'Добавить строку',
              style: TextStyle(color: buttonColor),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({
    Key? key,
    required this.controller,
    required this.index,
    required this.onChanged,
    required this.width,
  }) : super(key: key);

  final List<TextEditingController> controller;
  final int index;
  final Function(String) onChanged;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: width,
        child: TextFormField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            controller: controller[index],
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(217, 226, 241, 1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)))));
  }
}
