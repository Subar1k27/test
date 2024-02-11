// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test/constants.dart';

class LoadingBar extends StatefulWidget {
  final int percentage;

  const LoadingBar({Key? key, required this.percentage}) : super(key: key);

  @override
  _LoadingBarState createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _fillController;
  late Animation<double> _animation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_waveController)
      ..addListener(() {
        setState(() {});
      });

    _fillController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: widget.percentage.toDouble(),
    ).animate(CurvedAnimation(
      parent: _fillController,
      curve: Curves.easeInOut,
    ));

    _fillController.forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CustomPaint(
          painter: WavePainter(
            animation: _animation,
            progress: _heightAnimation.value,
          ),
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.topLeft,
              child: Text(
                '${widget.percentage}%',
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Текущий уровень загрузки',
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  final double progress;

  WavePainter({required this.animation, required this.progress})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress > 0 && progress < 100) {
      final paint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.fill;

      final path = Path();
      const waveHeight = 2.0; // высота волны
      final waveLength = size.width / 2; // длина волны
      final fillHeight = size.height * (1 - progress / 100);

      path.moveTo(0, fillHeight);
      for (double i = 0; i < size.width; i++) {
        path.lineTo(
          i,
          fillHeight +
              sin((i / waveLength * 2 * pi) + animation.value) * waveHeight,
        );
      }
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      canvas.drawPath(path, paint);
    } else if (progress == 0) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.transparent,
      );
    } else if (progress == 100) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.blue,
      );
    }
  }

  //covariant

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
