import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:exercicios/app/pages/andamento/controls_component.dart';
import 'package:exercicios/app/pages/andamento/tempo_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AndamentoPage extends StatefulWidget {
  const AndamentoPage({super.key});

  @override
  State<AndamentoPage> createState() => _AndamentoPageState();
}

class _AndamentoPageState extends State<AndamentoPage> {

  @override
  Widget build(BuildContext context) {

    final andamentoController = context.watch<AndamentoController>();

    return SizedBox(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const TextComponent(),
                andamentoController.started == true ? ClipOval(
                  child: Container(
                    height: 120,
                    width: 120,
                    color: Colors.red,
                    child: TextButton(
                      child: Text('Pause', style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        andamentoController.pause();
                      },
                    ),
                  ),
                ) : const ControlsComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}