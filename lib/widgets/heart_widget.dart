import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return GestureDetector(
      onTap: () {
        log('heart');
      },
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
