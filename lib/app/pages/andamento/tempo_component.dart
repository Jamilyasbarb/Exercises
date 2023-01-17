import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:exercicios/app/controllers/corrida_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextComponent extends StatefulWidget {
  const TextComponent({super.key});

  @override
  State<TextComponent> createState() => _TextComponentState();
}

class _TextComponentState extends State<TextComponent> {
  @override
  Widget build(BuildContext context) {

    final andamentoController = context.watch<AndamentoController>();
    final corridaController = context.watch<CorridaController>();

    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children:  [
              const Text(
                'Tempo',
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Text(
                '${andamentoController.digitHours}:${andamentoController.digitMinutes}:${andamentoController.digitSeconds} ',
                style: const TextStyle(
                  fontSize: 50
                ),
              ),
            ],
          ),
          Column(
            children:  [
              const Text(
                'Distância',
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Text(
                '${corridaController.positionUpdate().toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 50
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}