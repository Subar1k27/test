import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/constants.dart';
import 'package:test/presentation/bottom_sheet/bottom_sheet.dart';
import 'package:test/presentation/main_screen/atm_info_widgets.dart';
import 'package:test/presentation/main_screen/animation_widget.dart';
import 'package:test/presentation/main_screen/list_events_widget.dart';
import 'package:test/presentation/main_screen/list_finance_widget.dart';

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
          GestureDetector(
              onTap: () => CustomBottomSheet().showCustomBottomSheet(context),
              child: SvgPicture.asset(gearIcon)),
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
                ATMInfoWidget(),
                SizedBox(
                  height: 24,
                ),
                AnimationWidget(
                  percentage: 55, // % Текущий уровень загрузки
                ),
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
