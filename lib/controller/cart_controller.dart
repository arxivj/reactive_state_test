import 'package:get/get.dart';

import '../model/product.dart';

class CartController extends GetxController {

  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price); //forin문 대신 fold를 사용하여 리스트의 합을 구하는게 더 효율적임
  int get count => cartItems.length;


  void addToItem(Product product) {
    cartItems.add(product);

  }

}
