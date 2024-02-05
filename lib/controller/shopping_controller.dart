import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs; // Product 타입의 빈 리스트 생성 후 UI에 바인드 하기 위해 .obs를 붙임 (Observable로 만들어줌)

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    var productData = [
      Product(
        id: 1,
        productName: 'Product 1',
        productDescription: 'This is a product description.',
        price: 30.00,
      ),
      Product(
        id: 2,
        productName: 'Product 2',
        productDescription: 'This is a product description.',
        price: 40.00,
      ),
      Product(
        id: 3,
        productName: 'Product 3',
        productDescription: 'This is a product description.',
        price: 50.00,
      ),
      Product(
        id: 4,
        productName: 'Product 4',
        productDescription: 'This is a product description.',
        price: 60.00,
      ),
      Product(
        id: 5,
        productName: 'Product 5',
        productDescription: 'This is a product description.',
        price: 70.00,
      ),
    ];

    products.assignAll(productData); // products 리스트에 productData를 할당(assign)함
  }



}