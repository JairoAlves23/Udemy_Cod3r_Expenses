import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacitionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransacitionList({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tr) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              child: Text(
                'R\$ ${tr.value.toStringAsFixed(2)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  DateFormat('d/MM/y').format(tr.date),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
