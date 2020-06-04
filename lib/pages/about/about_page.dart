import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
      ListTile(
        title: Text(
          "Thông tin ứng dụng",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        title: Text("Title 1"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        title: Text("Title 2"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        title: Text("Title 3"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        title: Text("Title 4"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
        title: Text("Title 5"),
        trailing: Icon(Icons.arrow_forward_ios),
      )
    ]).toList()));
  }
}
