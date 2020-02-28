import 'dart:async';

import 'package:expenses/blocs/drawer_bloc.dart';
import 'package:expenses/blocs/home_bloc.dart';
import 'package:expenses/components/custom_drawer/custom_drawer.dart';
import 'package:expenses/screens/home/seach_dialog.dart';
import 'package:expenses/screens/login/login_screen.dart';
import 'package:expenses/screens/transaction/transaction_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final _pageControlller = PageController();

  // Cria objeto do drawer bloc
  DrawerBloc _drawerBloc;
  // Cria objeto do HomeBloc
  HomeBloc _homeBloc;
  // Stream Subscription retira da memoria o drawerbloc
  StreamSubscription _drawerSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cria a instancia do Drawer Bloc para pegar o contexto dentro do metodo didChangeDependencies
    DrawerBloc drawerBloc = Provider.of<DrawerBloc>(context);
    if (_drawerBloc != drawerBloc) {
      _drawerBloc = drawerBloc;
      _drawerSubscription?.cancel();
      _drawerSubscription = _drawerBloc.outPage.listen((page) {
        _pageControlller.jumpToPage(page);
      });
    }

    HomeBloc homeBloc = Provider.of<HomeBloc>(context);

    if (_homeBloc != homeBloc) {
      _homeBloc = homeBloc;
    }
  }

  void dispose() {
    _drawerSubscription.cancel();
    super.dispose();
  }

  _openSearch(String currentSearch) async {
    final String seach = await showDialog(
      context: context,
      builder: (context) => SeachDialog(currentSearch: currentSearch),
    );
    if (seach != null) {
      _homeBloc.setSeach(seach);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          initialData: '',
          stream: _homeBloc.outSeach,
          builder: (context, snapshot) {
            if (snapshot.data.isEmpty) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () => _openSearch(snapshot.data),
                // LayoutBuilder deixa a opção de selecionar o campo em qualquer parte para selecionar o editor
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      child: Text(snapshot.data),
                      width: constraints.biggest.width,
                    );
                  },
                ),
              );
            }
          },
        ),
        actions: <Widget>[
          StreamBuilder<String>(
              stream: _homeBloc.outSeach,
              initialData: '',
              builder: (context, snapshot) {
                if (snapshot.data.isEmpty) {
                  return IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _openSearch('');
                      });
                } else {
                  return IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _homeBloc.setSeach('');
                      });
                }
              })
        ],
      ),
      drawer: CustomDrawer(),
      body: PageView(
        controller: _pageControlller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          //Home(),
          TransactionHome(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          LoginScreen(),
        ],
      ),
    );
  }
}
