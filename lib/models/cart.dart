import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/item.dart';

class Cart extends ChangeNotifier {
  // list items on sale
  List<Item> itemlist = [
    Item(
      name: 'Popcorn Maize',
      categoryName: 'Grains',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
      price: 200,
      imageUrl: 'images/cereals.png',
    ),
    Item(
      name: 'Citrus Banana Fruit Bundle',
      categoryName: 'Fruits',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
      price: 300,
      imageUrl: 'images/fruits.png',
    ),
    Item(
      name: 'Zuchini',
      categoryName: 'Greens',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
      price: 300,
      imageUrl: 'images/greens.png',
    ),
    Item(
      name: 'Broccoli Cabbage Pack',
      categoryName: 'Vegetables',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
      price: 150,
      imageUrl: 'images/vegies.png',
    ),
    Item(
      name: 'Carrot Special Pack',
      categoryName: 'Root Vegetables',
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
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
  void addToCart(Item item) {
    userCartItems.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Item item) {
    userCartItems.remove(item);
    notifyListeners();
  }
}
