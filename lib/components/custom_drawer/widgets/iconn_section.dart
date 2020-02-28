import 'package:expenses/blocs/drawer_bloc.dart';
import 'package:expenses/components/custom_drawer/widgets/icon_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerBloc _drawerBloc = Provider.of<DrawerBloc>(context);

    void _setPage(int page) {
      Navigator.of(context).pop();
      _drawerBloc.setPage(page);
    }

    return StreamBuilder<int>(
        stream: _drawerBloc.outPage,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              IconTile(
                key: null,
                label: "Compras",
                iconData: Icons.add_shopping_cart,
                highLighted: snapshot.data == 0,
                onTap: () => _setPage(0),
              ),
              IconTile(
                key: null,
                label: "Despesas",
                iconData: Icons.monetization_on,
                highLighted: snapshot.data == 1,
                onTap: () => _setPage(1),
              ),
              IconTile(
                key: null,
                label: "Ultilitários",
                iconData: Icons.list,
                highLighted: snapshot.data == 2,
                onTap: () => _setPage(2),
              ),
              IconTile(
                key: null,
                label: "Minha Conta",
                iconData: Icons.person,
                highLighted: snapshot.data == 3,
                onTap: () => _setPage(3),
              ),
            ],
          );
        });
  }
}
