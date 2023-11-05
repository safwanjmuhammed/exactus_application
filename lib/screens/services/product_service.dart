import 'package:dio/dio.dart';
import 'package:exactus_application/model/product_model.dart';

class ProductService {
  final dio = Dio();

  Future<List<ProductsModel>> getProducts() async {
    try {
      final response = await dio.get(
          'http://testapp.touchworldtechnology.com:3009/v1/product/getAllProduct');

      final data = response.data['data'];
      final List<ProductsModel> productData = [];
      for (var product in data) {
        print(product);
        productData.add(ProductsModel.fromJson(product));
      }
      return productData;
    } on DioException catch (e) {
      throw e.response.toString();
    }
  }
}
