import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
      // shadowColor: Colors.red,
      child: ListTile(
        onTap: () {
          print("${item.name} is clicked");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          // ignore: prefer_const_constructors
          textScaleFactor: 1.2,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
