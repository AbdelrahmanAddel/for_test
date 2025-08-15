import 'package:dio/dio.dart';
import 'package:for_test/core/network/dio_factory.dart';

class ProductDataSource {
  static Future<GraphResponse> getProducts(int offset) async {
    Dio dio = DioFactory.getDio();
    final response = await dio.post(
      '',
      data: GraphqlBody.getAllProductBody(offset: offset),
    );
    return GraphResponse.fromJson(response.data);
  }
}

class GraphqlBody {
  static Map<String, dynamic> getAllProductBody({required int offset}) {
    return {
      "query": """ 
          {
        products(limit: 20, offset: $offset){
          title
          id
        }
      }
      """,
    };
  }
}

class GraphResponse {
  final Products products;

  GraphResponse({required this.products});

  factory GraphResponse.fromJson(Map<String, dynamic> json) {
    return GraphResponse(products: Products.fromJson(json['data']));
  }
}

class Products {
  final List<Product> products;

  Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      products: List<Product>.from(
        json['products'].map((e) => Product.fromJson(e)),
      ),
    );
  }
}

class Product {
  final String title;
  final String id;

  Product({required this.title, required this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(title: json['title'], id: json['id']);
  }
}
