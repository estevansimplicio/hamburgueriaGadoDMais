import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamburgueria_gado_dmais/pages/login.dart';
import 'package:hamburgueria_gado_dmais/pages/painel_administrativo.dart';
import 'package:hamburgueria_gado_dmais/providers/entry_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// void main() => runApp(MyApp());

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.limeAccent
        ),
        home: HomePage(),
      ),
    );
  }
}









