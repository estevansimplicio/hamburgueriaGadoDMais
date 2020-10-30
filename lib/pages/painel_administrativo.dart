import 'package:flutter/material.dart';

class PainelAdministrativo extends StatelessWidget {
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
    return Center(
        child: Text(
      "BEM VINDA OLÍVIA",
      style: TextStyle(fontSize: 22),
    ));
  }
}
