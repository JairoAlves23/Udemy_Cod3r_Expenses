import 'package:expenses/blocs/login/field_state.dart';
import 'package:expenses/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(
                "facebook",
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.title.fontSize,
                    fontWeight: Theme.of(context).textTheme.button.fontWeight,
                    color: Theme.of(context).textTheme.button.color),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "________________________",
                  ),
                  Text("Ou"),
                  Text(
                    "________________________",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Acessa com E-mail:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "E-mail:",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                ),
              ),
            ),
            StreamBuilder<FieldState>(
              initialData: FieldState(),
              stream: _loginBloc.outEmail,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onChanged: _loginBloc.changeEmail,
                  enabled: snapshot.data.enabled,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    errorText: snapshot.data.error,
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Senha:",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                    ),
                  ),
                  Text(
                    "Esqueceu a senha:",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.title.color,
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<FieldState>(
              initialData: FieldState(),
              stream: _loginBloc.outPassWord,
              builder: (context, snapshot) {
                return TextField(
                  autocorrect: false,
                  enabled: snapshot.data.enabled,
                  onChanged: _loginBloc.changeEmail,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    errorText: snapshot.data.error,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  "Entrar",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                      fontWeight: Theme.of(context).textTheme.button.fontWeight,
                      color: Theme.of(context).textTheme.button.color),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Não tem uma conta?:",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Theme.of(context).textTheme.title.fontSize,
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    highlightColor: Colors.red,
                    onPressed: () {},
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.title.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.button.fontWeight,
                        color: Theme.of(context).textTheme.title.color,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
