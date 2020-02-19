import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Despesas Pessoais"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Text(
                    "Gráfico",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              TransactionUser(),
            ],
          ),
        ));
  }
}
