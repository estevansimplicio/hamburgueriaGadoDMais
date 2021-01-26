import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:hamburgueria_gado_dmais/custom_return_icon_icons.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';

class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  TextEditingController controllerQuantidade = TextEditingController();
  TextEditingController controllerEndereco = TextEditingController();
  TextEditingController controllerPagamento = TextEditingController();
  TextEditingController controllerInfoAdicional = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void initState() {
    controllerQuantidade.text = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3D3C3A),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165.0), // here the desired height
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
                                fontSize: 17,
                                fontStyle: FontStyle.italic

                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            "R\$" + document["preco"],
                            style: TextStyle(
                                color: Colors.white,
                                // color: Color(0xffF9CC1C),
                                fontSize: 17,
                                fontStyle: FontStyle.italic
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

                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            ""+document["nome"]+"",
                            textAlign: TextAlign.center),
                          content: Form(
                            key: form,
                              child: ListView(
                                children: [
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        InkWell(
                                          child: Icon(
                                            Icons.remove_circle_outline,
                                            size: 35.0,
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
                                        ),

                                        Container(
                                          width: 137,
                                            margin: const EdgeInsets.only(left: 10, top: 10),
                                            child: Container(
                                              child: TextFormField(
                                                readOnly: true,
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
                                                        color: Color(0xff3D3C3A), fontSize: 20)),
                                                controller: controllerQuantidade,
                                                keyboardType: TextInputType.numberWithOptions(
                                                  decimal: false,
                                                ),
                                                inputFormatters: <TextInputFormatter>[
                                                  FilteringTextInputFormatter.digitsOnly
                                                ],
                                              ),
                                            )),

                                        SizedBox(
                                          width: 15,
                                        ),

                                        Container(
                                            height: 50.0,
                                            child: Row(
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
                                                      Icons.add_circle_outline,
                                                      size: 35.0,
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
                                              ],
                                            )),
                                      ],
                                    ),


                                  ),

                                  SizedBox(
                                    height: 25,
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
                                              labelText: "Endereço de entrega",
                                              floatingLabelBehavior:FloatingLabelBehavior.always,
                                              isDense: true,
                                              labelStyle:
                                              TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
                                          controller: controllerEndereco,
                                            // ignore: missing_return
                                            validator: (value){
                                              if (value.isEmpty) {
                                                return 'Informe o endereço';
                                              }

                                            }
                                        ),
                                      )),

                                  SizedBox(
                                    height: 25,
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
                                                hintText: "Cartão ou dinheiro",
                                                hintStyle: TextStyle(
                                                  fontSize: 13
                                                ),
                                                labelText: "Forma de pagamento",
                                                floatingLabelBehavior:FloatingLabelBehavior.always,
                                                isDense: true,
                                                labelStyle:
                                                TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
                                            controller: controllerPagamento,
                                            // ignore: missing_return
                                            validator: (value){
                                              if (value.isEmpty) {
                                                return 'Informe a forma de pagamento';
                                              }

                                            }
                                        ),
                                      )),

                                  SizedBox(
                                    height: 25,
                                  ),

                                  Container(
                                      child: Container(
                                        child: TextFormField(
                                          maxLines: 4,
                                            style: TextStyle(fontSize: 20),
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xff3D3C3A)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xff3D3C3A)),
                                                ),
                                                hintText: "Troco necessário, ingredientes indesejados, etc",
                                                hintStyle: TextStyle(
                                                    fontSize: 13
                                                ),
                                                labelText: "Informações adicionais",
                                                floatingLabelBehavior:FloatingLabelBehavior.always,
                                                isDense: true,
                                                labelStyle:
                                                TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
                                            controller: controllerInfoAdicional,
                                        ),
                                      )),

                                ],
                              )),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("Cancelar", style: TextStyle(color: Color(0xff3D3C3A)),),
                                onPressed: () => Navigator.of(context).pop(),
                            ),

                            FlatButton(
                                child: Text("Enviar"),
                                onPressed: () {
                                  FlutterOpenWhatsapp.sendSingleMessage(
                                      "5511944802018",
                                      "Boa noite, gostaria de pedir "+controllerQuantidade.text+" "+ document["nome"]+" \n "
                                          "\nEndereço: "+controllerEndereco.text+"\n "
                                          "\nForma de pagamento: "+controllerPagamento.text+"\n "
                                          "\nInformações adicionais: "+controllerInfoAdicional.text+"."
                                  );
                        },
                                color: Color(0xff3D3C3A)

                            )
                          ],
                        );
                      }
                    );

                    // FlutterOpenWhatsapp.sendSingleMessage("5511944802018", "Olá, gostaria de pedir um "+ document["nome"]+".");
                  },

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
      margin: const EdgeInsets.only(top: 35, left: 80, bottom: 10),
      child: Image.asset(
        "assets/images/Logo_sem_borda.png",
        width: 90,
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
