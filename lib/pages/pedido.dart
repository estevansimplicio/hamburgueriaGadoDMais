import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';
import 'package:hamburgueria_gado_dmais/pages/entry.dart';
import 'package:hamburgueria_gado_dmais/providers/entry_provider.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';
import 'package:provider/provider.dart';

class Pedido extends StatefulWidget {
  @override
  _PedidoState createState() => _PedidoState();
}


class _PedidoState extends State<Pedido> {

  TextEditingController controllerQuantidade = TextEditingController();
  @override
  void initState() {
    super.initState();
    controllerQuantidade.text = "1";
  }


  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Faça seu pedido",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3D3C3A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 30),
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('entries').snapshots(),
            // ignore: missing_return
            builder: (context, snapshot){
              if (!snapshot.hasData) return const Center(
                  child: const CupertinoActivityIndicator(),
              );
              var length = snapshot.data.docs.length;
              DocumentSnapshot ds = snapshot.data.docs[length - 1];

              var _lanche;
              return Container(
                  child: new Row(
                      children: <Widget>[
                        Container(
                            width: 205,
                            child: Container(
                              child: InputDecorator(
                                isEmpty: _lanche == null,
                                decoration: const InputDecoration(
                                  hintText: 'Selecione um lanche',
                                ),
                                child: DropdownButtonFormField(
                                  value: _lanche,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _lanche = newValue;
                                      print(_lanche);
                                    });
                                  },

                                  items: snapshot.data.docs.map((DocumentSnapshot document) {
                                    return new DropdownMenuItem<String>(
                                        value: document["nome"],
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50.0)
                                          ),
                                          height: 50.0,
                                          child: new Text(document["nome"]+"   R\$"+document["preco"]),
                                        )
                                    );
                                  }).toList(),

                                ),
                              )
                            )
                        ),
                      ]
                  )
              );

            }

          )


        ],


      )
    );
  }
}


