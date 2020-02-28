import 'package:expenses/components/custom_drawer/widgets/custom_header.dart';
import 'package:expenses/components/custom_drawer/widgets/iconn_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        children: <Widget>[
          CustomHeader(),
          IconSection(),
          Divider(color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}