import 'package:get/get.dart';
import 'package:getx_test/practice1/model/product.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Product> productData = <Product>[
      Product(
        id: 1,
        productName: 'Mouse',
        productDescription: 'some description about product',
        price: 30,
      ),
      Product(
        id: 2,
        productName: 'Keyboard',
        productDescription: 'some description about product',
        price: 40,
      ),
      Product(
        id: 3,
        productName: 'Monitor',
        productDescription: 'some description about product',
        price: 620,
      ),
      Product(
        id: 4,
        productName: 'Ram',
        productDescription: 'some description about product',
        price: 80,
      ),
      Product(
        id: 5,
        productName: 'Speaker',
        productDescription: 'some description about product',
        price: 120.5,
      ),
    ];

    products.assignAll(productData);
  }
}
