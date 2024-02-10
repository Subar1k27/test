import 'package:flutter/material.dart';
import 'package:test/constants.dart';
import 'package:test/presentation/widgets/wave_animation_widget.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.4,
            child: const LoadingBar(percentage: 55),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingButton(
                buttonText: 'Загрузка',
              ),
              SizedBox(
                height: 16,
              ),
              LoadingButton(
                buttonText: 'Инвентаризация',
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
