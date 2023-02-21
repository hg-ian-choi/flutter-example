import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/practice1/controller/cart_controller.dart';
import 'package:getx_test/practice1/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (ShoppingController shoppingController_) {
                  return RawScrollbar(
                    thumbColor: Colors.white54,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    thickness: 10,
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: shoppingController_.products.length,
                      itemBuilder: (BuildContext context_, int index_) {
                        return Card(
                          margin: const EdgeInsets.all(12),
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
                                          shoppingController_.products[index_].productName,
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                        Text(shoppingController_
                                            .products[index_].productDescription),
                                      ],
                                    ),
                                    Text(
                                      '\$${shoppingController_.products[index_].price}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController.addToItem(shoppingController_.products[index_]);
                                  },
                                  child: const Text('Add to cart'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            GetX<CartController>(
              builder: (CartController cartController_) {
                return Text(
                  'Total amount: \$${cartController_.totalPrice}',
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                );
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (CartController cartController_) {
            return Text(
              cartController_.itemCount.toString(),
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
        icon: const Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
