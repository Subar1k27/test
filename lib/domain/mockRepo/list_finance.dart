import 'package:test/domain/models/finance.dart';

class ListFinance {
  static List<Finance> getFinance() {
    return [
      Finance(money: 5700, changeType: ChangeType.moneyInTA),
      Finance(money: 1255, changeType: ChangeType.cashback),
      Finance(money: 1255, changeType: ChangeType.cashback)
    ];
  }
}
