import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/constants.dart';
import 'package:test/presentation/widgets/ATMinfo_widgets.dart';
import 'package:test/presentation/widgets/animation_widget.dart';
import 'package:test/presentation/widgets/list_events_widget.dart';
import 'package:test/presentation/widgets/list_finance_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: SvgPicture.asset(arrowBackIcon),
        actions: [
          SvgPicture.asset(gearIcon),
        ],
      ),
      body: const Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                ATMInfo(),
                SizedBox(
                  height: 24,
                ),
                AnimationWidget(),
                SizedBox(
                  height: 24,
                ),
                ListEventsWidget(),
                SizedBox(
                  height: 24,
                ),
                ListFinanceWidget(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          )),
    );
  }
}
