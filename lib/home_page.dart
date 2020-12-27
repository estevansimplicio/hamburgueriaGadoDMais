import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/custom_key_icons_icons.dart';
import 'package:hamburgueria_gado_dmais/pages/cardapio.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:hamburgueria_gado_dmais/pages/login.dart';
import 'package:hamburgueria_gado_dmais/pages/pedido.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      width: double.infinity,
      color: Color(0xffFFF6D9),
      // Cor de fundo mais escura: #FEE796
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _img(),
          _button(context),
          _button2(context),
          _key(context),
        ],
      ),
    );
  }

  _img() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Image.asset(
        "assets/images/Logo.png",
        width: 300,
      ),
    );
  }

  _button(context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: FlatButton(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 45),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Color(0xff292929),
          child: Text(
            "NOSSO CARDÁPIO",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          onPressed: () {
            _onClickButton(context);
          }),
    );
  }

  void _onClickButton(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Cardapio();
    }));
  }

  _button2(context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: FlatButton(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 45),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Color(0xff292929),
          child: Text(
            "FAÇA SEU PEDIDO",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          onPressed: () {
            _onClickButton3(context);
             // FlutterOpenWhatsapp.sendSingleMessage("5511944802018", "");
          },
        ));
  }

  _key(context) {
    return Container(
      margin: const EdgeInsets.only(top: 90),
      child: IconButton(
          icon: Icon(
            CustomKeyIcons.key_1,
            color: Color(0xff292929),
            size: 21,
          ),
          onPressed: () {
            _onClickButton2(context);
          }),
    );
  }

  void _onClickButton2(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }

  void _onClickButton3(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Pedido();
    }));
  }


}
