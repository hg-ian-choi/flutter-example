import 'package:get/get.dart';
import 'package:getx_test/practice2/data/services.dart';
import 'package:getx_test/practice2/model/product_model.dart';

class Controller extends GetxController {
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final List<Product> products = await Services.fetchProducts();
    if (products.isNotEmpty) {
      productList.value = products;
    }

  }
}