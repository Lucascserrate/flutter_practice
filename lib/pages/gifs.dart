import 'dart:convert'; //jsonDecode

import 'package:flutter/material.dart';
import 'package:flutterapp/models/gif_class.dart';

import 'package:http/http.dart' as http;

class Gifs extends StatefulWidget {
  const Gifs({super.key});

  @override
  State<Gifs> createState() => _GifsState();
}

class _GifsState extends State<Gifs> {
  Future<List<Gif>>? gifsList;

  Future<List<Gif>> getGifs() async {
    final res = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=3JqxnmpJNVRoG1XAYkAwa0BYao1qodfn&limit=10&rating=g'));
    List<Gif> gifs = [];
    if (res.statusCode == 200) {
      String body = utf8.decode(res.bodyBytes);
      final jsonData = jsonDecode(body);
/*       for (var i in jsonData['data']) {
        gifs.add(Gif(i['title'], i['images']['downsized']['url']));
      } */
      jsonData['data'].forEach(
          (e) => gifs.add(Gif(e['title'], e['images']['downsized']['url'])));
      return gifs;
    } else {
      return throw Exception('Connection Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    gifsList = getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gifs'),
        ),
        body: FutureBuilder(
          future: gifsList,
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: listGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return const Text('error');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  List<Widget> listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var e in data) {
      gifs.add(Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            e.url,
            fit: BoxFit.fill,
          ),
        ), // Para el border radius
      ));
    }
    return gifs;
  }
}
