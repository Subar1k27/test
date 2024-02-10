enum ChangeType {
  moneyInTA,
  cashback,
}

extension ChangeTypeExtension on ChangeType {
  String get name {
    switch (this) {
      case ChangeType.moneyInTA:
        return 'Деньги в ТА';
      case ChangeType.cashback:
        return 'Сдача';
    }
  }
}

class Finance {
  int money;
  ChangeType changeType;
  Finance({
    required this.money,
    required this.changeType,
  });
}
