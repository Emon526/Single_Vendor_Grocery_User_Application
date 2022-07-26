import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/text_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Hi,   ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              log('MyName');
                            })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'test@gmail.com',
                  color: color,
                  textSize: 18,
                  // isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                    color: color,
                    title: "Address",
                    icon: IconlyLight.profile,
                    onPressed: () {},
                    subtitle: 'My Subtitle'),
                _listTiles(
                  color: color,
                  title: "Orders",
                  icon: IconlyLight.bag,
                  onPressed: () {},
                ),
                _listTiles(
                  color: color,
                  title: "Wishlist",
                  icon: IconlyLight.heart,
                  onPressed: () {},
                ),
                _listTiles(
                  color: color,
                  title: "Viewed",
                  icon: IconlyLight.show,
                  onPressed: () {},
                ),
                _listTiles(
                  color: color,
                  title: "Forget password",
                  icon: IconlyLight.unlock,
                  onPressed: () {},
                ),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 18,
                    // isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
                _listTiles(
                  color: color,
                  title: "Logout",
                  icon: IconlyLight.logout,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      onTap: (() {
        onPressed();
      }),
      leading: Icon(icon),
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        // isTitle: true,
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}