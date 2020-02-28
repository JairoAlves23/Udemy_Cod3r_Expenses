import 'package:expenses/blocs/login/field_state.dart';
import 'package:expenses/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator {
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;  
  Function(String) get changePassoword => _passwordController.sink.add;  

  Stream<FieldState> get outEmail => _emailController.stream.transform(emailValidator);
  Stream<FieldState> get outPassWord => _passwordController.stream.transform(passWordValidator);


  void setEmail(String email) {
    _emailController.add(email);
  }

  void setPassword(String password) {
    _passwordController.add(password);
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}