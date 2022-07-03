import 'package:flutter/material.dart';
import 'package:test1/models/catalog.dart';
import 'package:test1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDeatailPage extends StatelessWidget {
  final Item catalog;

  const HomeDeatailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.xl4.red800.make(),
          Container(
            color: context.cardColor,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child:  "Add to cart".text.make(),
            ).wh(120, 50),
          )
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    child: Image.network(catalog.image),
                    tag: (catalog.id.toString()))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "Dolor sea takimata ipsum sea eirmod aliquyam est. "
                                .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p1()
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
