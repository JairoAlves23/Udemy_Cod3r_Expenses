import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacitionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function removeTransaction;

  const TransacitionList({this.transaction, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma Transação Cadastrada',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                final tr = transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text('R\$ ${tr.value.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat('d/MM/y').format(tr.date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color:Theme.of(context).errorColor,
                      onPressed: () => {removeTransaction(tr.id)},
                    ),
                  ),
                );
              }),
    );
  }
}
