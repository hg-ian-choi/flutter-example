import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/practice2/controller/controller.dart';
import 'package:getx_test/practice2/view/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context_, int index_) {
              return ProductTile(product: controller.productList[index_]);
            },
            itemCount: controller.productList.length,
          ),
        ),
      ),
    );
  }
}
