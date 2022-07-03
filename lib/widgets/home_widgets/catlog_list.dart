import 'package:flutter/material.dart';
import 'package:test1/pages/home_detail_page.dart';
import 'package:test1/utils/MyRoutes.dart';
import 'package:test1/widgets/home_widgets/catlog_image.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatlogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatlogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDeatailPage(catalog: catalog))),
              child: CatlogItem(catalog: catalog));
        });
  }
}

class CatlogItem extends StatelessWidget {
  final Item catalog;

  const CatlogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              child: CatalogImage(
                image: catalog.image,
              ),
              tag: (catalog.id.toString())),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.color(MyTheme.darkBluishColor).textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.color(MyTheme.darkBluishColor).make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                         context.theme.buttonColor,
                        ),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Add to cart".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).white.rounded.square(150).make().py16();
  }
}
