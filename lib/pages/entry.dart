import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';
import 'package:hamburgueria_gado_dmais/providers/entry_provider.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  final Entry entry;

  EntryScreen({this.entry});

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final entryController = TextEditingController();
  final descricaoController = TextEditingController();
  final precoController = TextEditingController();

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();

    descricaoController.dispose();
    super.dispose();

    precoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
      //edit
      entryController.text = widget.entry.nome;

      descricaoController.text = widget.entry.descricao;

      precoController.text = widget.entry.preco;

      entryProvider.loadAll(widget.entry);
    } else {
      entryProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Painel Administrativo",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff3D3C3A),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          children: [
            TextField(
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  labelText: "Nome",
                  labelStyle:
                      TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
              onChanged: (String value) => entryProvider.changeNome = value,
              controller: entryController,
            ),
            SizedBox(
              height: 10,
            ),

            TextField(
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  labelText: "Descrição",
                  labelStyle:
                      TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
              onChanged: (String value) =>
                  entryProvider.changeDescricao = value,
              controller: descricaoController,
            ),
            SizedBox(
              height: 10,
            ),

            TextField(
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff3D3C3A)),
                  ),
                  labelText: "Valor",
                  labelStyle:
                      TextStyle(color: Color(0xff3D3C3A), fontSize: 20)),
              onChanged: (String value) =>
                  entryProvider.changePreco = value,
              controller: precoController,
            ),
            SizedBox(
              height: 35,
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 46,
              child: RaisedButton(
                  color: Color(0xff3D3C3A),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    entryProvider.saveEntry();
                    Navigator.of(context).pop();
                  }
                  // _onClickLogin(context);
                  ),
            ),


            SizedBox(
              height: 10,
            ),

            (widget.entry != null)
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 46,
                    child: RaisedButton(
                        color: Color(0xff3D3C3A),
                        child: Text(
                          "Deletar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          entryProvider.removeEntry(widget.entry.entryId);
                          Navigator.of(context).pop();
                        }
                        // _onClickLogin(context);
                        ),
                  )
                : Container(),
          ],
        ));
  }


}
