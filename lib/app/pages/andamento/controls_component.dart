import 'dart:async';

import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlsComponent extends StatefulWidget {
  const ControlsComponent({super.key});

  @override
  State<ControlsComponent> createState() => _ControlsComponentState();
}

class _ControlsComponentState extends State<ControlsComponent> {



  @override
  Widget build(BuildContext context) {
    final andamentoController = context.watch<AndamentoController>();

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Container(
              height: 120,
              width: 120,
              color: Colors.red,
              child: TextButton(
                child: Text('Continuar', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  andamentoController.start();
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Container(
              height: 120,
              width: 120,
              color: Colors.grey,
              child: TextButton(
                child: Text('Concluir', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  andamentoController.reset();
                  Navigator.of(context).pushReplacementNamed('progresso');
                },
              ),
            ),
          ),
        ),
      ],
    );
  } 
}