import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:groceryuserapp/widgets/heart_widget.dart';
import 'package:groceryuserapp/widgets/price_widget.dart';

import '../services/utils.dart';
import 'text_widget.dart';

class FeedIems extends StatefulWidget {
  const FeedIems({Key? key}) : super(key: key);

  @override
  State<FeedIems> createState() => _FeedIemsState();
}

class _FeedIemsState extends State<FeedIems> {
  final _quentityTextController = TextEditingController();
  @override
  void initState() {
    _quentityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quentityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: 'https://picsum.photos/200',
                height: size.width * 0.21,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    const HeartButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 4,
                      child: PriceWidget(
                          textPrice: _quentityTextController.text,
                          isOnSale: true,
                          price: 5.9,
                          salePrice: 2.99),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            // flex: 1,
                            child: FittedBox(
                              child: TextWidget(
                                text: 'KG',
                                color: color,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              flex: 2,
                              child: TextFormField(
                                controller: _quentityTextController,
                                key: const ValueKey('10'),
                                style: TextStyle(
                                  color: color,
                                  fontSize: 18,
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                enabled: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).cardColor,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )))),
                  child: TextWidget(
                    text: 'Add to cart',
                    color: color,
                    textSize: 20,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
