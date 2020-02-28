import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/screens/transaction/chart.dart';
import 'package:expenses/screens/transaction/transaction_form.dart';
import 'package:expenses/screens/transaction/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionHome extends StatefulWidget {
  @override
  _TransactionHomeState createState() => _TransactionHomeState();
}

class _TransactionHomeState extends State<TransactionHome> {
   final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(
          addTransaction: _addTransaction,
        );
      },
    );
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(
              recentTransaction: _recentTransaction,
            ),
            TransacitionList(
              transaction: _transactions,
              removeTransaction: _removeTransaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}