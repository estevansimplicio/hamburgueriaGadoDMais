import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/custom_return_icon_icons.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';
import 'package:hamburgueria_gado_dmais/pages/entry.dart';
import 'package:hamburgueria_gado_dmais/providers/entry_provider.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';
import 'package:provider/provider.dart';

class Cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3D3C3A),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(155.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _top(context),
              _banner(),
            ],
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("entries").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView(
              children: snapshot.data.docs.map((document) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            document["nome"],
                            style: TextStyle(
                                color: Colors.white,
                                // color: Color(0xffF9CC1C),
                                fontSize: 17
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            "R\$" + document["preco"],
                            style: TextStyle(
                                color: Colors.white,
                                // color: Color(0xffF9CC1C),
                                fontSize: 17
                            ),
                          ))
                    ],
                  ),

                  subtitle: Container(
                    child: Text(
                      document["descricao"] + "\n",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
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

  _back_icon(context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 5),
      child: IconButton(
          icon: Icon(
            CustomReturnIcon.level_up,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context)),
    );
  }

  _logo() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 50, bottom: 0),
      child: Image.asset(
        "assets/images/Logo_sem_borda.png",
        width: 150,
      ),
    );
  }

  _banner() {
    return Container(
      child: Image.asset(
        "assets/images/banner.jpg",
        width: 250,
      ),
    );
  }
}
