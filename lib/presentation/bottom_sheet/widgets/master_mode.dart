// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class HalfButtonSwitch extends StatefulWidget {
  const HalfButtonSwitch({Key? key}) : super(key: key);

  @override
  _HalfButtonSwitchState createState() => _HalfButtonSwitchState();
}

class _HalfButtonSwitchState extends State<HalfButtonSwitch> {
  bool _isUsed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Режим мастер',
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isUsed = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _isUsed ? Colors.blue : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'Используется',
                        style: TextStyle(
                          color: _isUsed ? Colors.white : Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isUsed = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: !_isUsed ? Colors.blue : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        'Не используется',
                        style: TextStyle(
                          color: !_isUsed ? Colors.white : Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
