//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_app/models/fruit.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MainApp());
}

//permet d'adapter l'adresse de l'API locale en fonction du type de client (web, mobile...)
String getLocalhostAccordingToPlatform() {
  String host = "127.0.0.1";
  try {
    if (Platform.isAndroid) {
      host = '10.0.2.2';
    } else if (Platform.isIOS) {
      host = '0.0.0.0';
    } else if (Platform.isLinux) {
      host = "127.0.0.1";
    } else if (Platform.isFuchsia) {
      host = "127.0.0.1";
    } else if (Platform.isMacOS) {
      host = "localhost";
    } else if (Platform.isWindows) {
      host = "127.0.0.1";
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    //Platform = web
    host = "0.0.0.0";
  }

  return host;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<List<Fruit>> _readFruitsFromAPI() async {
    try {
      final String host = getLocalhostAccordingToPlatform();
      var options = <String, dynamic>{};

      //permet de personaliser le header HTTP origin
      options['origin'] = 'http://$host:3333';

      final response = await Dio().get(
        "http://$host:3333/fruits",
        options: Options(
          headers: options,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 304) {
        return response.data
            .map<Fruit>((json) => Fruit.fromJson(json))
            .toList();
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }

        throw Exception("Can't read data from API");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      throw Exception("Can't read data from API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: _readFruitsFromAPI(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Fruit>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Fruit fruit = snapshot.data![index];

                    return ListTile(
                      title: Text(fruit.name),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
