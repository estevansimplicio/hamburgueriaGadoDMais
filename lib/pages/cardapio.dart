import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/custom_return_icon_icons.dart';

class Cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context));
  }

  _body(context) {
    return Container(
      color: Color(0xff3D3C3A),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _top(context),
          _banner(),
        ],
      ),
    );
  }

  _top(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _back_icon(context),
          _logo(),

        ],
      ),
    );
  }

  _back_icon(context){
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 5),
      child: IconButton(
        icon: Icon(
         Icons.arrow_back_ios,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }

  _logo(){
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 30),
      child: Image.asset(
        "assets/images/Logo_sem_borda.png",
        width: 180,
      ),
    );
  }

  _banner() {
    return Container(
      child: Image.asset(
        "assets/images/banner.jpg",
            width: 280,
      ),
    );
  }


}
