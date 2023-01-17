import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:exercicios/app/controllers/corrida_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ProgressoFinalPage extends StatefulWidget {
  const ProgressoFinalPage({super.key});

  @override
  State<ProgressoFinalPage> createState() => _ProgressoFinalPageState();
}

class _ProgressoFinalPageState extends State<ProgressoFinalPage> {
  @override
  Widget build(BuildContext context) {

    final andamentoController = context.watch<AndamentoController>();
    final corridaController = context.watch<CorridaController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progresso'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('nome do usuário'),
              subtitle: Text('caminhada'),
            ),
            Container(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Distâcia total'),
                          Text('${corridaController.distancia}    km'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Tempo total'),
                          Text('${andamentoController.digitHours}:${andamentoController.digitMinutes}:${andamentoController.digitSeconds}'),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(corridaController.lat, corridaController.long),
                      zoom: 18
                    ), 
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                  ),
                ),
              ],
            ),
          ],                
        ),
      ),
    );
  }
}