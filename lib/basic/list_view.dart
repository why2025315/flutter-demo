import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Demo')),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            subtitle: Text('baidu map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
        ],
      ),
    );
  }
}
