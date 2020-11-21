

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/home_page.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';
import 'package:hamburgueria_gado_dmais/pages/entry.dart';
import 'package:hamburgueria_gado_dmais/providers/entry_provider.dart';
import 'package:hamburgueria_gado_dmais/utils/nav.dart';
import 'package:provider/provider.dart';

class PainelAdministrativo extends StatefulWidget {
  final User user;

  const PainelAdministrativo({Key key, this.user}) : super(key: key);

  @override
  _PainelAdministrativoState createState() => _PainelAdministrativoState();
}

class _PainelAdministrativoState extends State<PainelAdministrativo> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Painel Administrativo",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                onPressed: () {
                  _signOut().whenComplete(() {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                })
          ],
          backgroundColor: Color(0xff3D3C3A),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        body:
        StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                return ListTile(
                  trailing: Icon(
                      Icons.edit,
                      color: Color(0xff3D3C3A),
                  ),
                  title: Text(snapshot.data[index].nome),
                  subtitle: Text(snapshot.data[index].descricao),

                  onTap: (){
                    push(context, EntryScreen(entry: snapshot.data[index],));
                },
                );
            });
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff3D3C3A),
          child: Icon(Icons.add),
          onPressed: () {
            push(context, EntryScreen());
          },
        ));
  }



  Future _signOut() async {
    await _auth.signOut();
  }

}
