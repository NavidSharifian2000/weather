import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dartz/dartz.dart' as navid;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:wheather/Screens/Main_Screen/bloc/favorite_bloc.dart';
import 'package:wheather/Screens/Main_Screen/data/datasource/favorite_datasource.dart';
import 'package:wheather/Screens/Main_Screen/data/model/faforite_city_model.dart';
import 'package:wheather/Screens/Main_Screen/data/repository/favorite_repository.dart';
import 'package:wheather/Screens/Main_Screen/main_screen.dart';
import 'package:wheather/Screens/Search_Screen/search_city_screen.dart';
import 'package:wheather/const/Colors.dart';
import 'package:wheather/const/wheather_gradiant_background.dart';
import 'package:wheather/di/di.dart';
import 'package:wheather/utils/utctolocal.dart';
import 'package:wheather/widgets/home_appbar.dart';
import 'package:wheather/widgets/home_item_llist.dart';
import 'package:wheather/widgets/search_appbar.dart';
import 'package:wheather/widgets/search_city_item_list.dart';
import 'package:wheather/widgets/search_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: BlocProvider<CityInfoBloc>.value(
        value: locator.get<CityInfoBloc>(),
        child: main_screen(),
      ),
    ));
  }
}
