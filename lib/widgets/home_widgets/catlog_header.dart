import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';
class CatlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        "Catlog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Tranding products".text.xl2.make(),
      ],
    );
  }
}