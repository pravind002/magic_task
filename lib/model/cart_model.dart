import 'dart:developer';

// import 'package:ecommagix/imports.dart';
import 'package:flutter/material.dart';

class CartModel {
  final String? id;
  final String? name;
  final int? quantity;
  final dynamic price;
  final String? category;
  final String? image;
  CartModel({
     this.id,
     this.name,
     this.quantity,
     this.price,
     this.category,
     this.image,
  });
}

class CartItems with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, String name, dynamic price, String image,
      String category) {
    log(_items.toString());
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartModel(
          id: DateTime.now().toString(),
          name: existingCartItem.name,
          quantity: existingCartItem.quantity! + 1,
          price: existingCartItem.price,
          category: existingCartItem.category,
          image: existingCartItem.image,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartModel(
                id: DateTime.now().toString(),
                name: name,
                quantity: 1,
                price: price,
                category: category,
                image: image,
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
