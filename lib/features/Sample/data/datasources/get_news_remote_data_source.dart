// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:for_test/core/api/api_consumer.dart';
import 'package:for_test/core/api/api_strings.dart';
import 'package:for_test/core/api/dio_consumer.dart';

class GetNewsRemoteDataSource {
  final ApiConsumer _apiConsumer = DioConsumer();
  Future<StoreModel> getData() async {
    final response = await _apiConsumer.get(ApiStrings.baseUrl);
    return StoreModel.fromJson(response as List);
  }
}

class StoreModel {
  List<ProductDetailsModel> product;
  StoreModel({required this.product});
  factory StoreModel.fromJson(List json) {
    final response =
        json
            .map((product) => ProductDetailsModel.fromJson(product))
            .toList()
            .cast<ProductDetailsModel>();
    return StoreModel(product: response);
  }
}

class ProductDetailsModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  RatingModel? rating;
  ProductDetailsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.rating,
  });
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  num rate;
  int count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
