import 'package:exercicios/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const AppWidget());
}

