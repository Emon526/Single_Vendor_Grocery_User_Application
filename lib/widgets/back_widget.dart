import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : null,
      child: Icon(
        IconlyLight.arrowLeft2,
        color: color,
      ),
    );
  }
}
