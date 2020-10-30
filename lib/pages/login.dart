import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/pages/painel_administrativo.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _tUsuario = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Painel Administrativo",
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
                  return "Digite o nome de Usuário";
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
                  labelText: "Usuário",
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
        onPressed: () {
          _onClickLogin(context);
        }),
      );

  }

   _onClickLogin(context) async{
    if(!_formKey.currentState.validate()){
      return;
    }

    String usuario = _tUsuario.text;
    String senha = _tSenha.text;

    print("Usuário:  $usuario, Senha: $senha");

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return PainelAdministrativo();
    }));


  }
}
