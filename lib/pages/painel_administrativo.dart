import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/home_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Painel Administrativo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3D3C3A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _body(),
    );
  }

  _body() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("Olívia",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              child: OutlineButton(
                child: Text("LOGOUT"),
                onPressed: () {
                  _signOut().whenComplete(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage()));
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }
    // return Center(
    //     child: Text(
    //   "BEM VINDA OLÍVIA",
    //   style: TextStyle(fontSize: 22),
    // ));
  }

