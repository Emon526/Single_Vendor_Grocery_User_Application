import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routename}) {
    Navigator.pushNamed(ctx, routename);
  }
}
