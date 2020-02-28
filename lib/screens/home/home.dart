import 'package:expenses/components/custom_drawer/custom_drawer.dart';
import 'package:expenses/screens/home/seach_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  _openSearch(String currentSearch) async {
    final String seach = await showDialog(
      context: context,
      builder: (context) => SeachDialog(currentSearch:currentSearch),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:() =>_openSearch)
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
