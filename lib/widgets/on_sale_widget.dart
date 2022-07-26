import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../inner_screens/product_details.dart';
import '../models/products_model.dart';
import '../services/utils.dart';
import 'heart_widget.dart';
import 'price_widget.dart';
import 'text_widget.dart';

class OnSaleWidgte extends StatefulWidget {
  const OnSaleWidgte({Key? key}) : super(key: key);

  @override
  State<OnSaleWidgte> createState() => _OnSaleWidgteState();
}

class _OnSaleWidgteState extends State<OnSaleWidgte> {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.routename,
                arguments: productModel.id);
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                      imageUrl: productModel.imageUrl,
                      height: size.width * 0.22,
                      width: size.width * 0.22,
                      boxFit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          TextWidget(
                            text: productModel.isPiece ? '1Piece' : '1KG',
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  log('bag');
                                },
                                child: Icon(
                                  IconlyLight.bag2,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                              const HeartButton(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                PriceWidget(
                  textPrice: '1',
                  isOnSale: true,
                  price: productModel.price,
                  salePrice: productModel.salePrice,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: productModel.title,
                  color: color,
                  textSize: 16,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
