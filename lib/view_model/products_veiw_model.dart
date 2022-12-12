import 'dart:async';
import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/repositories/products_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository productRepository;

  ProductViewModel({required this.productRepository}){
    listenProducts("");
  }
  List<ProductModel> productAdmin = [];
  late StreamSubscription subscription;

  List<ProductModel> products = [];

  // listenProducts() async {
  //   subscription = productRepository.getProducts().listen((allProducts) {
  //     products = allProducts;
  //     notifyListeners();
  //   })
  //     ..onError((er) {});
  // }
  Stream<List<ProductModel>> listenProducts1() =>
      productRepository.getProducts();

  addProduct(ProductModel productModel) =>
      productRepository.addProduct(productModel: productModel);

  updateProduct(ProductModel productModel) =>
      productRepository.updateProduct(productModel: productModel);

  deleteProduct(String docId) => productRepository.deleteProduct(docId: docId);

  // listenProductsID(String categoryId) async {
  //   subscription = productRepository
  //       .getProductsById(categoryId: categoryId)
  //       .listen((allProducts) {
  //     print("ALL PRODUCTS LENGTH:${allProducts.length}");
  //     products = allProducts;
  //     notifyListeners();
  //   });
  // }
  listenProducts(String categoryId) async {
    subscription = productRepository
        .getProduct(categoryId: categoryId)
        .listen((allProducts) {
      if(categoryId.isEmpty) productAdmin = allProducts;
      print("ALL PRODUCTS LENGTH:${allProducts.length}");
      products = allProducts;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
