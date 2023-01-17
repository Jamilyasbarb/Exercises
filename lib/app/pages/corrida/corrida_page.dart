import 'package:exercicios/app/controllers/andamento_controller.dart';
import 'package:exercicios/app/controllers/corrida_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CorridaPage extends StatefulWidget {
  const CorridaPage({super.key});

  @override
  State<CorridaPage> createState() => _CorridaPageState();
}

class _CorridaPageState extends State<CorridaPage> {
  @override
  Widget build(BuildContext context) {

    final controller = context.watch<CorridaController>();
    final andamentoController = context.watch<AndamentoController>();

    debugPrint('---antigo lat${controller.lat}');
    debugPrint('---antigo long${controller.long}')  ;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Corrida'),
      ),  
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 400,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.lat, controller.long),
                  zoom: 18
                ),
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                onMapCreated: controller.onMapCreated,
              ),
            ),
            Container(
              height: 50,
            ),
            ClipOval(
              child: Container(
                height: 120,
                width: 120,
                color: Colors.red,
                child: TextButton(
                  child: Text('Iniciar', style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    andamentoController.start();
                    Navigator.pushNamed(context, 'andamento');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}