import 'package:flutter/material.dart';
import 'package:test1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name}pressed ");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 2.0,
        style: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,

        ),
        ),
      ),
    );
  }
}
