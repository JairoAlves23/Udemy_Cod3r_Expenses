import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransaction;

  TransactionForm({this.addTransaction});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  var _titleController = TextEditingController();

  var _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _onSubmit() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              // Serve => numberWithOptions(decimal: true) para deixar a formatação igual no IOS
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _onSubmit(),
              controller: _valueController,
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : 'Data selecionada ${DateFormat('dd/MM/y').format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _onSubmit,
                  child: Text(
                    "Nova Transação",
                    style: TextStyle(
                        fontWeight:
                            Theme.of(context).textTheme.button.fontWeight,
                        color: Theme.of(context).textTheme.button.color),
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
