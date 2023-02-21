import 'package:get/get.dart';
import 'package:getx_test/practice1/model/product.dart';

class CartController extends GetxController {
  List<Product> cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (previousValue, element) => previousValue + element.price);
  int get itemCount => cartItems.length;

  void addToItem(Product product_) {
    cartItems.add(product_);
  }
}
