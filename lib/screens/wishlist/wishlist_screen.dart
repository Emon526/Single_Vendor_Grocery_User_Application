import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/text_widget.dart';
import 'wishlist_widget.dart';

class WishListScreen extends StatelessWidget {
  static const routename = '/WishListScreen';
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.warningDialog(
                  context: context,
                  title: 'Empty your wishlist?',
                  subtitle: 'Are you sure?',
                  fct: () {});
            },
            icon: Icon(
              IconlyBroken.delete,
              color: color,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Wishlist (2)',
          color: color,
          textSize: 22,
          isTitle: true,
        ),
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        // mainAxisSpacing: 16,
        // crossAxisSpacing: 20,
        itemBuilder: (context, index) {
          return const WishListWidget();
        },
      ),
    );
  }
}
