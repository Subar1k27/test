// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test/constants.dart';
import 'package:test/domain/mockRepo/list_events.dart';
import 'package:test/domain/models/event.dart';

import 'widgets/event_widget.dart';

class ListEventsWidget extends StatefulWidget {
  const ListEventsWidget({super.key});

  @override
  State<ListEventsWidget> createState() => _ListEventsWidgetState();
}

class _ListEventsWidgetState extends State<ListEventsWidget> {
  List<Event> events = [];

  @override
  void initState() {
    events = ListEvents.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          alignment: Alignment.centerLeft,
          child: const Text(
            'События',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: textColor),
          ),
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 4,
                ),
            shrinkWrap: true,
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventWidget(
                event: event,
              );
            }),
        const SizedBox(
          height: 16,
        ),
        TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: buttonColor))),
            onPressed: () {},
            autofocus: false,
            child: Container(
              alignment: Alignment.center,
              height: 20,
              child: const Text('Смотреть ещё'),
            )),
      ],
    );
  }
}
