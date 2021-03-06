import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/pages/painel_administrativo.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _tUsuario = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Painel Admin.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3D3C3A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
        width: double.infinity,
        color: Color(0xffFFFFFF),
        child: ListView(
          children: <Widget>[
            TextFormField(

              validator: (String text) {
                if (text.isEmpty) {
                  return "Digite o e-mail";
                }
                return null;
              },

              controller: _tUsuario,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  labelText: "E-mail",
                  labelStyle:
                  TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (String text) {
                if (text.isEmpty) {
                  return "Digite a senha";
                }
                return null;
              },
              controller: _tSenha,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  labelText: "Senha",
                  labelStyle:
                  TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
              obscureText: true,
            ),
            SizedBox(
              height: 35,
            ),
            _button(context)
          ],
        ),
      ),
    );
  }

  _button(context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        height: 46,
        child: RaisedButton(
          color: Color(0xff3D3C3A),
            child: Text(
                "Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
            ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _signInWithEmailAndPassword();
          }
        }
    // _onClickLogin(context);
    ),
    );
    }

    Future<void> _signInWithEmailAndPassword() async {
      try{
        final User user = (await _auth.signInWithEmailAndPassword(
            email: _tUsuario.text,
            password: _tSenha.text
        ))
            .user;
        push(context, PainelAdministrativo(user : user,));
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Falha no login"),
                content: Text("E-mail ou senha incorretos."),
                actions: [
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text("E-mail ou senha incorretos."),
        // ));
      }
    }

  void _signOut() async {
    await _auth.signOut();
  }



  }




