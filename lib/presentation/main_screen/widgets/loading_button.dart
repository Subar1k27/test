import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class LoadingButton extends StatelessWidget {
  final String buttonText;
  const LoadingButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      autofocus: false,
      onPressed: () {},
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: buttonColor, width: 2))),
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          height: 30,
          child: Text(
            buttonText,
            style: const TextStyle(
                color: buttonColor, fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
