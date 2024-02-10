import 'package:test/domain/models/event.dart';

class ListEvents {
  static List<Event> getEvents() {
    return [
      Event(
        time: '14:00',
        title: 'Сейф переполнен',
      ),
      Event(
          time: '11:20',
          title: 'Сломался купюроприёмник',
          description: '2341245'),
      Event(
          time: '11:00',
          title: 'Закончилась наличка',
          description: 'Toshiba снековый'),
    ];
  }
}
