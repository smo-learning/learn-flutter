import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({this.id, this.amount, this.products, this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String authToken;
  final String userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://flutter-shop-app-2219d-default-rtdb.europe-west1.firebasedatabase.app/orders/$userId.json?auth=$authToken');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((id, value) {
      loadedOrders.add(
        OrderItem(
          id: id,
          amount: value['amount'],
          dateTime: DateTime.parse(value['dateTime']),
          products: (value['products'] as List<dynamic>)
              .map(
                (e) => CartItem(
                    id: e['id'],
                    title: e['title'],
                    quantity: e['quantity'],
                    price: e['price']),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-shop-app-2219d-default-rtdb.europe-west1.firebasedatabase.app/orders/$userId.json?auth=$authToken');
    final timeStamp = DateTime.now();
    var encode = json.encode(
      {
        'amount': total,
        'dateTime': timeStamp.toIso8601String(),
        'products': cartProducts
            .map(
              (e) => {
                'id': e.id,
                'title': e.title,
                'quantity': e.quantity,
                'price': e.price
              },
            )
            .toList()
      },
    );
    final response = await http.post(url, body: encode);

    _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            dateTime: timeStamp,
            products: cartProducts));
    notifyListeners();
  }
}
