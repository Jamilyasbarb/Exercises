import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:exercicios/app/controllers/corrida_controller.dart';
import 'package:exercicios/app/pages/corrida/corrida_page.dart';
import 'package:exercicios/app/pages/andamento/andamento_page.dart';
import 'package:exercicios/app/pages/progresso/progresso_final_page.dart';
import 'package:flutter/material.dart';
import 'package:exercicios/app/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CorridaController()),
        ChangeNotifierProvider(create: (_) => AndamentoController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/' : (context) => HomePage(),
          'corrida' :(context) => CorridaPage(),
          'andamento':(context) => AndamentoPage(),
          'progresso':(context) => ProgressoFinalPage(),
        },
      ),
    );
  }
}