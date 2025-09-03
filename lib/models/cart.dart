import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/item.dart';

class Cart extends ChangeNotifier {
  // list items on sale
  List<Item> itemlist = [
    Item(
      name: 'Cereals',
      description: 'sth',
      price: 200,
      imageUrl: 'images/cereals.png',
    ),
    Item(
      name: 'Fruits',
      description: 'sth',
      price: 300,
      imageUrl: 'images/fruits.png',
    ),
    Item(
      name: 'Tubers',
      description: 'sth',
      price: 300,
      imageUrl: 'images/greens.png',
    ),
    Item(
      name: 'Vegies',
      description: 'sth',
      price: 150,
      imageUrl: 'images/vegies.png',
    ),
    Item(
      name: 'Root Vegies',
      description: 'sth',
      price: 400,
      imageUrl: 'images/root_vegies.png',
    ),
  ];

  // list of items in user cart
  List<Item> userCartItems = [];

  // get list of items for sale
  List<Item> getItemsForSale() {
    return itemlist;
  }

  // get cart
  List<Item> getCartItems() {
    return userCartItems;
  }

  bool isInCart(Item item) {
    return userCartItems.contains(item);
  }

  //  add item to cart
  void addToCart(Item item){
    userCartItems.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Item item) {
    userCartItems.remove(item);  
    notifyListeners();
  }


}