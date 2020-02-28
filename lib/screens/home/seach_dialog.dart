import 'package:flutter/material.dart';

class SeachDialog extends StatefulWidget {
  final String currentSearch;

  const SeachDialog({this.currentSearch});

  //_SeachDialogState createState() => _SeachDialogState(currentSearch);
  @override
  _SeachDialogState createState() => _SeachDialogState();
}

class _SeachDialogState extends State<SeachDialog> {
  /*  _SeachDialogState(String currentSearch)
      : _controller = TextEditingController(text: currentSearch); */
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        TextEditingController(text: widget.currentSearch);
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _controller.clear();
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        ),
      ],
    );
  }
}
