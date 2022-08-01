import 'package:flutter/material.dart';

import '../../services/utils.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/text_widget.dart';
import 'orders_widget.dart';

class OrderScreen extends StatefulWidget {
  static const routename = "/OrderScreen";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);

    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        centerTitle: false,
        title: TextWidget(
          text: 'Your order (2)',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 6,
            ),
            child: OrderWidget(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: color,
            thickness: 1,
          );
        },
      ),
    );
  }
}
