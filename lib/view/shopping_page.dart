import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final controller = Get.put(
      ShoppingController()); //Dependency Injection을 통해 ShoppingController 클래스의 인스턴스를 생성
  // 이제 ShoppingController 클래스의 인스턴스를 사용하여 데이터를 가져올 수 있음

  final cartController = Get.put(CartController()); //일단 한번 컨트롤러가 DI 되면, find로 같은 컨트롤러를 불러와서 사용할 수 있음 (다시 컨트롤러를 생성하지 않아도 됨)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Expanded(
            //Column 위젯 내에서 ListView 위젯을 불러왔을 때, 반드시 Expanded 위젯으로 감싸야 정상 출력됨
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                // itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.products[index].productDescription}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${controller.products[index].price.toStringAsFixed(2)} ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                cartController.addToItem(controller.products[index]);
                              }, child: Text('Add to Cart')),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          GetX<CartController>(
            builder: (amu_name) {
              return Text(
                'Total Amount : \$ ${cartController.totalPrice}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                cartController.count.toString(),
                style: TextStyle(fontSize: 20),
              );
            }
          ),
          icon: Icon(Icons.add_shopping_cart)),
    );
  }
}
