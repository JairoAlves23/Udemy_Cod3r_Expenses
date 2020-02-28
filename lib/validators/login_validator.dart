import 'dart:async';

import 'package:expenses/blocs/login/field_state.dart';

class LoginValidator {
  final StreamTransformer<String,FieldState> emailValidator = 
  StreamTransformer<String,FieldState>.fromHandlers(handleData: (email,sink) {
    const Pattern pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    final RegExp regex = RegExp(pattern);
    if (email.isEmpty) {
      sink.add(FieldState(error: "Campo Obrigatorio"));
    } else if(!regex.hasMatch(email)) {
      sink.add(FieldState(error: "E-mail inavalido"));
    } else {
      sink.add(FieldState());
    }
  });

 final StreamTransformer<String,FieldState> passWordValidator = 
  StreamTransformer<String,FieldState>.fromHandlers(handleData: (pass,sink) {

    if (pass.isEmpty) {
      sink.add(FieldState(error: "Campo Obrigatorio"));
    } else {
      sink.add(FieldState());
    }
  });

}


