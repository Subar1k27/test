import 'package:flutter/material.dart';
import 'package:test/constants.dart';
import 'package:test/presentation/bottom_sheet/widgets/master_mode.dart';
import 'package:test/presentation/bottom_sheet/widgets/price_list_widget.dart';
import 'package:test/presentation/bottom_sheet/widgets/top_alert.dart';
import 'package:test/presentation/bottom_sheet/widgets/cash_tex_field.dart';
import 'package:test/presentation/bottom_sheet/widgets/sound_checkbox.dart';

class CustomBottomSheet {
  bool checkboxValue = true;
  void showCustomBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Container(
          // color: Colors.white,
          padding: EdgeInsets.only(
            top: 8,
            right: width * 0.05,
            left: width * 0.05,
            // bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          width: width,
          height: height * 0.9,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Загрузка',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        iconSize: 35,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const TopAlert(),
                        const SizedBox(
                          height: 24,
                        ),
                        const CashWidget(name: 'Decimal position'),
                        const SizedBox(
                          height: 24,
                        ),
                        const CashWidget(name: 'Scale factor'),
                        const SizedBox(
                          height: 24,
                        ),
                        SoundCheckbox(
                            value: checkboxValue,
                            onChanged: (value) => setState(
                                  () => checkboxValue = value!,
                                )),
                        const SizedBox(
                          height: 24,
                        ),
                        const HalfButtonSwitch(),
                        const SizedBox(
                          height: 24,
                        ),
                        const PriceListWidget(),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MaterialButton(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: buttonColor, width: 2)),
                color: buttonColor,
                onPressed: () {},
                minWidth: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                child: const Text(
                  'Сохранить изменения',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
