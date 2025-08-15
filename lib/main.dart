import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:for_test/data/product_data_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Pagination());
  }
}

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int offset = 0;
  bool isLoading = false;
  bool isFirstLoading = false;
  List<Product> products = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadingFirstData();
    scrollController.addListener(() {
      _loadingMoreData();
    });
  }

  Future<void> _loadingFirstData() async {
    setState(() {
      isLoading = true;
      isFirstLoading = true;
    });
    final response = await ProductDataSource.getProducts(offset);
    products.addAll(response.products.products);
    setState(() {
      isLoading = false;
      isFirstLoading = false;
    });
  }

  Future<void> _loadingMoreData() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      offset += 20;
      final response = await ProductDataSource.getProducts(offset);
      products.addAll(response.products.products);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagination Test ')),
      body:
          isFirstLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                controller: scrollController,
                itemCount: products.length + 1,
                itemBuilder: (context, index) {
                  return index == products.length
                      ? isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox()
                      : ListTile(
                        title: Text(products[index].title),
                        subtitle: Text(products[index].id),
                      );
                },
              ),
    );
  }
}
