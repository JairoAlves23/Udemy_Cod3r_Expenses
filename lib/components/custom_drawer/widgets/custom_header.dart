import 'package:expenses/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>LoginScreen(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.person,
                color: Theme.of(context).textTheme.title.color,
                size: 40.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Jairo Alves",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.title.color,
                            fontSize:
                                Theme.of(context).textTheme.title.fontSize,
                            fontFamily:
                                Theme.of(context).textTheme.title.fontFamily,
                            fontWeight:
                                Theme.of(context).textTheme.title.fontWeight),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "jairocreta@hotmail.com",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.title.color,
                            fontSize:
                                Theme.of(context).textTheme.title.fontSize,
                            fontFamily:
                                Theme.of(context).textTheme.title.fontFamily,
                            fontWeight:
                                Theme.of(context).textTheme.title.fontWeight),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
