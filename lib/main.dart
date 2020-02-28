import 'package:expenses/blocs/home_bloc.dart';
import 'package:expenses/screens/base_screen/base_screen.dart';
//import 'package:expenses/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/drawer_bloc.dart';
import 'blocs/login/login_bloc.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider(
            create: (_) => DrawerBloc(),
            dispose: (context, value) => value.dispose(),
          ),
          Provider(
            create: (_) => HomeBloc(),
            dispose: (context, value) => value.dispose(),
          ),
        ],
        child: MaterialApp(
          home: BaseScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            fontFamily: 'Quicksand',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
