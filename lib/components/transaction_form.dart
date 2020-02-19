import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  var titleController = TextEditingController();
  var valueController = TextEditingController();

  final Function addTransaction;

  TransactionForm({this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextFormField(
              controller: valueController,
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    addTransaction(title, value);
                  },
                  child: Text(
                    "Nova Transação",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.purple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
