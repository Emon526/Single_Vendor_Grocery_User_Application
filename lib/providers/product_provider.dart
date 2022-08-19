import 'package:flutter/material.dart';

import '../models/products_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProduct => _productsList;
  List<ProductModel> get getOnsaleProducts {
    return _productsList.where((element) => element.isOnSale).toList();
  }

  ProductModel findProductById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByCategory(String categoryName) {
    List<ProductModel> _categoryList = _productsList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  static final List<ProductModel> _productsList = [
    ProductModel(
      id: 'Mango',
      title: 'Mango',
      imageUrl: 'https://picsum.photos/200',
      productCategoryName: 'Fruits',
      price: 0.99,
      salePrice: 0.35,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Buk-choy',
      title: 'Buk-choy',
      imageUrl: 'https://picsum.photos/200',
      productCategoryName: 'Herbs',
      price: 0.99,
      salePrice: 0.35,
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Brokoli',
      title: 'Brokoli',
      imageUrl: 'https://picsum.photos/200',
      productCategoryName: 'Herbs',
      price: 0.99,
      salePrice: 0.35,
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: 'Corn-corbs',
      title: 'Corn-corbs dfsafedfefef',
      imageUrl: 'https://picsum.photos/200',
      productCategoryName: 'Grains',
      price: 0.99,
      salePrice: 0.35,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Apicot',
      title: 'Apicot',
      imageUrl: 'https://picsum.photos/200',
      productCategoryName: 'Vegetables',
      price: 0.99,
      salePrice: 0.35,
      isOnSale: true,
      isPiece: false,
    ),
  ];
}
