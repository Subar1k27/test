import 'package:test/domain/models/price.dart';

class ListPrice {
  static List<Price> price = [
    Price(priceId: 1, price: 50),
    Price(priceId: 2, price: 150),
  ];

  static List<Price> getPrice() {
    return ListPrice.price;
  }

  void addPrice(Price newPrice) {
    price.add(newPrice);
  }

  void removePrice(int position) {
    price.removeAt(position);
  }
}
