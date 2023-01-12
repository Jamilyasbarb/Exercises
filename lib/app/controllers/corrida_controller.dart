import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CorridaController extends ChangeNotifier{
  double lat = 0.0;
  double long= 0.0;
  String erro = '';
  late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  getPosicao()async{
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
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
    return await Geolocator.getCurrentPosition();
  }

  onMapCreated(GoogleMapController gmc) async{
    _mapsController = gmc;
    getPosicao();
  }
}