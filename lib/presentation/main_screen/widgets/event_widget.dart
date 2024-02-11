// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/constants.dart';
import 'package:test/domain/models/event.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        alignment: Alignment.centerLeft,
        height: 50,
        child: Stack(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SvgPicture.asset(rightArrowIcon)],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 252, 110, 110),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4))),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 60,
                    child: Text(
                      event.time,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 214, 213, 213),
                          fontWeight: FontWeight.bold),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                    (event.description == null)
                        ? Container()
                        : Text(
                            event.description!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 214, 213, 213),
                            ),
                          )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
