import 'package:flutter/material.dart';

import 'package:test/presentation/main_screen/wave_animation_widget.dart';

import 'widgets/loading_button.dart';

class AnimationWidget extends StatelessWidget {
  final int percentage;
  const AnimationWidget({super.key, required this.percentage});

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
            child: LoadingBar(
              percentage: percentage,
            ),
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
