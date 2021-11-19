
import 'package:flutter/material.dart';

Widget customBottom(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[800],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(title: Text("Option 1"),
            trailing: Icon(Icons.access_alarms),),
          ListTile(title: Text("Option 2"),
            trailing: Icon(Icons.ac_unit),),
        ],
      ),
    ),
  );
}