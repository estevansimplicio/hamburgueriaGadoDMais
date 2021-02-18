import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamburgueria_gado_dmais/custom_key_icons_icons.dart';
import 'package:hamburgueria_gado_dmais/novos_icones_icons.dart';
import 'package:hamburgueria_gado_dmais/pages/cardapio.dart';
import 'package:hamburgueria_gado_dmais/pages/login.dart';


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
          _key(context),
          _img(),
          _button(context),
          _texto(),
          // _button2(context),

        ],
      ),
    );
  }

  _img() {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: Image.asset(
        "assets/images/Logo.png",
        width: 290,
      ),
    );
  }

  _button(context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: FlatButton(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 45),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Color(0xff292929),
          child: Text(
            "NOSSO CARDÁPIO",
            style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
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

  // _button2(context) {
  //   return Container(
  //       margin: const EdgeInsets.only(top: 15),
  //       child: FlatButton(
  //         padding:
  //             const EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 45),
  //         shape: new RoundedRectangleBorder(
  //             borderRadius: new BorderRadius.circular(15.0)),
  //         color: Color(0xff292929),
  //         child: Text(
  //           "FAÇA SEU PEDIDO",
  //           style: TextStyle(color: Colors.white, fontSize: 17),
  //         ),
  //         onPressed: () {
  //           _onClickButton3(context);
  //            // FlutterOpenWhatsapp.sendSingleMessage("5511944802018", "");
  //         },
  //       ));
  // }

  _key(context) {
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 30, right: 10),
      child: IconButton(
          icon: Icon(
            NovosIcones.user_shield,
            color: Color(0xff292929),
            size: 18,
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

  _texto() {
    return Container(
      padding: const EdgeInsets.only(top: 90),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: IconButton(
                  icon: Icon(
                    NovosIcones.facebook_f,
                    color: Color(0xff292929),
                    size: 15,
                  ),

                ),
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    NovosIcones.instagram,
                    color: Color(0xff292929),
                    size: 15,
                  ),

                ),

              ),


            ],
          ),

          Center(
            child: Text(
                "@gadodemaishamburgueria",
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color: Color(0xff292929),
                      // fontStyle: FontStyle.italic,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          )


          // Text(
          //     "@gadodemaishamburgueria",
          //     style: GoogleFonts.aBeeZee(
          //       textStyle: TextStyle(
          //           color: Color(0xff292929),
          //           // fontStyle: FontStyle.italic,
          //           fontSize: 15,
          //           fontWeight: FontWeight.bold
          //       ),
          //     )
          // ),

        ],
      )
    );
  }


  // void _onClickButton3(context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
  //     return Cardapio();
  //   }));
  // }


}
