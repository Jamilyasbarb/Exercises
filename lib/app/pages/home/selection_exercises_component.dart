import 'package:exercicios/app/pages/corrida/corrida_page.dart';
import 'package:flutter/material.dart';

class SelectionExercisesComponent extends StatelessWidget {
  const SelectionExercisesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 5,
            child: Column(
              children: [
                IconButton( 
                  iconSize: 80,
                  icon: Icon(Icons.directions_run), 
                  onPressed: () { 
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CorridaPage()));
                  },
                ),
                Text('Corrida'),
              ],  
            ),
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                IconButton( 
                  iconSize: 80,
                  icon: Icon(Icons.directions_walk), 
                  onPressed: () { },
                ),
                Text('Caminhada'),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: Column(
              children: [
                IconButton( 
                  iconSize: 80,
                  icon: Icon(Icons.accessibility), 
                  onPressed: () { },
                ),
                Text('Pular corda'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}