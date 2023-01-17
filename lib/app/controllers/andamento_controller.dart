import 'dart:async';

import 'package:exercicios/app/controllers/corrida_controller.dart';
import 'package:flutter/material.dart';

class AndamentoController extends ChangeNotifier{
  // controlar o tempo
  int seconds =0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started =false;
  List laps = [];
  final corridaController = CorridaController();

  //funcao de comecar tempo
  void start(){
    started= true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) { 
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds > 59){
        if(localMinutes > 59){
          localHours++;
          localMinutes = 0;
        }else{
          localMinutes++;
          localSeconds = 0;
        }
      }
      seconds = localSeconds;
      minutes = localMinutes;
      hours = localHours;
      digitSeconds = (seconds >= 10)? '$seconds' : '0$seconds';
      digitMinutes = (minutes >= 10)? '$minutes' : '0$minutes';
      digitHours = (hours >= 10)? '$hours' : '0$hours';
      // corridaController.positionUpdate();
      notifyListeners();
    });
  }

  // funcao de pausar o tempo
    pause (){
    timer!.cancel();
    started = false;
    notifyListeners();
  }

  // funcao de pausar
  void reset(){
    timer!.cancel();
    seconds = 0;
    minutes = 0;
    hours = 0;

    digitSeconds = '00';
    digitMinutes = '00';
    digitHours = '00';

    started = false;
    notifyListeners();
  }

  void addLaps(){
    String lap = '$digitHours:$digitMinutes:$digitSeconds';
    laps.add(lap);
    notifyListeners();
  }
}