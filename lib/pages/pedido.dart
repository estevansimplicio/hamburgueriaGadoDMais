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
  TextEditingController controllerEndereco = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerQuantidade.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    var _formaPagamento;
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
                stream: FirebaseFirestore.instance
                    .collection('entries')
                    .snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const Center(
                      child: const CupertinoActivityIndicator(),
                    );
                  var length = snapshot.data.docs.length;
                  DocumentSnapshot ds = snapshot.data.docs[length - 1];

                  var _lanche;
                  return Container(
                      child: new Row(children: <Widget>[
                    Container(
                        width: 208,
                        height: 80,
                        child: Container(
                            child: InputDecorator(
                          isEmpty: _lanche == null,
                          decoration: const InputDecoration(),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff3D3C3A)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff3D3C3A)),
                                ),
                                labelText: 'Lanche',
                                labelStyle: TextStyle(
                                    color: Color(0xff3D3C3A), fontSize: 15)),
                            validator: (lanche) =>
                                lanche == null ? 'Selecione um lanche' : null,
                            value: _lanche,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _lanche = newValue;
                                print(_lanche);
                              });
                            },
                            items: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return DropdownMenuItem<String>(
                                value: document["nome"],
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //     color: Colors.blue,
                                  //     borderRadius: BorderRadius.circular(20)
                                  // ),
                                  height: 50.0,
                                  child: Text(
                                    document["nome"] +
                                        " - R\$" +
                                        document["preco"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ))),
                    Container(
                        width: 85,
                        margin: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff3D3C3A)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff3D3C3A)),
                                ),
                                isDense: true,
                                labelText: "Quantidade",
                                labelStyle: TextStyle(
                                    color: Color(0xff3D3C3A), fontSize: 15)),
                            controller: controllerQuantidade,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: false,
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        )),
                    Container(
                        height: 50.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     bottom: BorderSide(
                              //       color: Colors.black,
                              //       width: 1.0
                              //     )
                              //   )
                              // ),
                              child: InkWell(
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(controllerQuantidade.text);
                                  setState(() {
                                    currentValue++;
                                    controllerQuantidade.text = (currentValue)
                                        .toString(); // incrementing value
                                  });
                                },
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 25.0,
                              ),
                              onTap: () {
                                int currentValue =
                                    int.parse(controllerQuantidade.text);
                                setState(() {
                                  currentValue--;
                                  controllerQuantidade.text =
                                      (currentValue > 0 ? currentValue : 0)
                                          .toString(); // decrementing value
                                });
                              },
                            )
                          ],
                        )),
                  ]));
                }),
            SizedBox(
              height: 50,
            ),
            Container(
                child: Container(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3D3C3A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff3D3C3A)),
                        ),
                        labelText: "Endereço",
                        isDense: true,
                        labelStyle:
                            TextStyle(color: Color(0xff3D3C3A), fontSize: 15)),
                    controller: controllerEndereco,
                  ),
                )),

            SizedBox(
              height: 15,
            ),


            Container(
                height: 80,
                child: Container(
                    child: InputDecorator(
                      isEmpty: _formaPagamento == null,
                      decoration: const InputDecoration(),
                      child: DropdownButtonFormField<String>(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xff3D3C3A)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xff3D3C3A)),
                            ),
                            labelText: 'Forma de pagamento',
                            labelStyle: TextStyle(
                                color: Color(0xff3D3C3A), fontSize: 15)),

                        items: [
                          DropdownMenuItem<String>(
                            value: "Cartão",
                            child: Text(
                              "Cartão"
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Dinheiro",
                            child: Text(
                                "Dinheiro"
                            ),
                          ),

                        ],

                        validator: (pagamento) =>
                        pagamento == null ? 'Selecione uma forma de pagamento' : null,
                        value: _formaPagamento,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            _formaPagamento = newValue;
                            print(_formaPagamento);
                          });
                        },

                      )




                    ))),
          ],
        ));
  }
}
