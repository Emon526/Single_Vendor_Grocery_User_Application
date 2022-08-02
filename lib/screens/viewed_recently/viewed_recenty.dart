import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../widgets/back_widget.dart';
import '../../widgets/empty_screen.dart';
import '../../widgets/text_widget.dart';
import 'viewed_widget.dart';

class ViewedRecently extends StatefulWidget {
  static const routename = "/ViewedRecently";
  const ViewedRecently({Key? key}) : super(key: key);

  @override
  State<ViewedRecently> createState() => _ViewedRecentlyState();
}

class _ViewedRecentlyState extends State<ViewedRecently> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool _isEmpty = true;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return _isEmpty
        ? const EmptyScreen(
            title: 'Your history is empty',
            imagepath: 'assets/images/history.png',
            subtitle: 'No products has been viewed yet!',
            buttontext: 'Shop now',
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        context: context,
                        title: 'Empty your history',
                        subtitle: 'Are you sure?',
                        fct: () {});
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              leading: const BackWidget(),
              elevation: 0,
              centerTitle: true,
              backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
              title: TextWidget(
                text: 'History',
                color: color,
                textSize: 24,
                // isTitle: true,
              ),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    child: ViewedRecentlyWidget(),
                  );
                }),
          );
  }
}
