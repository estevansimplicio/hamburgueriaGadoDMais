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

        body:

      StreamBuilder(
            stream: FirebaseFirestore.instance.collection("entries").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

              return ListView(
                children:
                snapshot.data.docs.map((document){

                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            child: Text(document["nome"], style: TextStyle(color: Colors.white, fontSize: 20),)
                        ),

                        Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            child: Text("R\$"+document["preco"], style: TextStyle(color: Colors.white, fontSize: 20),)
                        )

                      ],
                    ),


                    // title: Container(
                    //   child: Text(document["nome"]+" ---------- R\$"+document["preco"], style: TextStyle(color: Colors.white, fontSize: 20),),
                    //
                    //
                    // ),
                    subtitle: Container(
                      child: Text(document["descricao"]+"\n", style: TextStyle(color: Colors.white),),
                    ),
                  );


                }).toList(),

              );


            }
        ),


    );

    // return Scaffold(
    //   body: _body(context));
  }

  _header() {

  }




// _list() {
//   return Scaffold(
//     body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("entries").snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//           if(!snapshot.hasData){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           return ListView(
//             children: snapshot.data.docs.map((document){
//               return Center(
//                 child: Container(
//                   child: Text("Title: "+ document["nome"]),
//                 ),
//               );
//             }).toList(),
//           );
//
//
//         }
//     ),
//   );
//
// }

// _body(context) {
//   return Container(
//     color: Color(0xff3D3C3A),
//     width: double.infinity,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         _top(context),
//         _banner(),
//         _list(context),
//       ],
//     ),
//   );
// }
//
// _top(context) {
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         _back_icon(context),
//         _logo(),
//
//       ],
//     ),
//   );
// }
//
// _back_icon(context){
//   return Container(
//     margin: const EdgeInsets.only(top: 0, left: 5),
//     child: IconButton(
//       icon: Icon(
//        CustomReturnIcon.level_up,
//         color: Colors.white,
//         size: 30,
//       ),
//       onPressed: () => Navigator.pop(context)
//     ),
//   );
// }
//
// _logo(){
//   return Container(
//     margin: const EdgeInsets.only(top: 5, left: 30),
//     child: Image.asset(
//       "assets/images/Logo_sem_borda.png",
//       width: 180,
//     ),
//   );
// }
//
// _banner() {
//   return Container(
//     child: Image.asset(
//       "assets/images/banner.jpg",
//           width: 280,
//     ),
//   );
// }
//
// _list(context) {
//   return Scaffold(
//     resizeToAvoidBottomInset: false,
//     body: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("entries").snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//         if(!snapshot.hasData){
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return ListView(
//           children: snapshot.data.docs.map((document){
//             return Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width / 1.2,
//                 height: MediaQuery.of(context).size.height / 6,
//                 child: Text("Title: "+ document["nome"]),
//               ),
//             );
//           }).toList(),
//         );
//
//
//       }
//     ),
//   );
// }




}
