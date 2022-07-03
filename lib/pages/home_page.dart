import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/models/catalog.dart';
import 'package:test1/widgets/drawer.dart';
import 'package:test1/widgets/home_widgets/catlog_header.dart';
import 'package:test1/widgets/home_widgets/catlog_list.dart';
import 'package:test1/widgets/item_widget.dart';
import 'package:test1/widgets/themes.dart';
import 'dart:convert';

// @dart=2.9
import 'package:velocity_x/velocity_x.dart';

import '../utils/MyRoutes.dart';


class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "Ravi";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    //  final dummylist = List.generate(40, (index) => CatlogModel.items[0]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor:context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
      ),
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CatlogHeader(),
              if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                CatlogList().py16().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().py16().expand(),
                )
            ],
          ),

        ),
      ),
    );
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final catlogjaon = await rootBundle.loadString("assets/files/catalog.json");
    print(catlogjaon);
    final decodedData = jsonDecode(catlogjaon);
    print(decodedData);
    var productData = decodedData["products"];
    print(productData);
    CatlogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

/*
  appBar: AppBar(
        title: Text(
          "Catlog app",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
            ? /*ListView.builder(
                itemCount: CatlogModel.items.length,
                // itemCount: dummylist.length,
                itemBuilder: (context, index) =>
                  //  return ItemWidget(item: CatlogModel.items[index],);
                  ItemWidget(
                    //item: dummylist[index],
                    item: CatlogModel.items[index],
                  )
              )*/
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatlogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Image.network(item.image,
                        ),
                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                      ));
                },
                itemCount: CatlogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
   */

}


