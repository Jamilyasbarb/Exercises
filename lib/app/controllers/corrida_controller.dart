import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CorridaController extends ChangeNotifier{
  double lat = 0.0;
  double long= 0.0;
  double latAtualizada = 0.0;
  double longAtualizada = 0.0;
  double distancia = 0.0;
  String erro = '';
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  getPosicao()async{
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async{
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if(! ativado){
      return Future.error('Por favor, habilite a locatilização');
    }

    permissao = await Geolocator.checkPermission();
    if(permissao == LocationPermission.denied){
      permissao = await Geolocator.requestPermission();
      if(permissao == LocationPermission.denied){
        Future.error('Você precisa autorizar o acesso a localização');
      }
    }

    if(permissao == LocationPermission.deniedForever){
      Future.error('Você precisar autorizar o acesso á localização');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  onMapCreated(GoogleMapController gmc) async{
    print('----------  GMCCC$gmc');
    _mapsController = gmc;
    getPosicao();
    // notifyListeners();
  }

  double positionUpdate(){
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
      timeLimit: Duration(seconds: 2)
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
      .listen((Position position) { 
        print('--------eu sou o corrida updateee');
        latAtualizada = position.latitude;
        longAtualizada = position.longitude;
        print('----antiga lat $lat');
        print('----antiga long $long');
        print('---atualizado lat $latAtualizada');
        print('---atualizado long $longAtualizada');
        print(distancia);
        print('---------------------------------');
      notifyListeners();
    });
    return distancia = Geolocator.distanceBetween(lat,long,latAtualizada,longAtualizada);
  }
} 