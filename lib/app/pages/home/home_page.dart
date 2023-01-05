import 'package:exercicios/app/pages/home/selection_exercises_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Container(height: 50, child: Image.asset('assets/images/logo_positiva.png')),
      ),
      body: Center(
        child: SelectionExercisesComponent(),
      ),
    );
  }
}