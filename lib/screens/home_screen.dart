import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../const/consts.dart';
import '../inner_screens/feeds_screen.dart';
import '../inner_screens/on_sale_screen.dart';
import '../models/products_model.dart';
import '../providers/product_provider.dart';
import '../services/global_methods.dart';
import '../services/utils.dart';
import '../widgets/feed_items.dart';
import '../widgets/on_sale_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getProduct;
    List<ProductModel> productOnSale = productProvider.getOnsaleProducts;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  Consts.offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: Consts.offerImages.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red)),
              // control: const SwiperControl(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routename: OnSaleScreen.routename);
              },
              child: TextWidget(
                maxLines: 1,
                text: 'View all',
                textSize: 20,
                color: Colors.blue,
              )),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: 'On Sale'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22,
                      isTitle: true,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.25,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          productOnSale.length < 10 ? productOnSale.length : 10,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: productOnSale[index],
                          child: const OnSaleWidgte(),
                        );
                      }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Our products',
                  color: color,
                  textSize: 22,
                  isTitle: true,
                ),
                // const Spacer(),
                TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routename: FeedsScreen.routename);
                    },
                    child: TextWidget(
                      maxLines: 1,
                      text: 'Browse all',
                      textSize: 20,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
          GridView.count(
            // crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            childAspectRatio: size.width / (size.height * 0.70),
            children: List.generate(
                allProducts.length < 4 ? allProducts.length : 4, (index) {
              return ChangeNotifierProvider.value(
                  value: allProducts[index], child: const FeedIems());
            }),
          )
        ],
      ),
    ));
  }
}
