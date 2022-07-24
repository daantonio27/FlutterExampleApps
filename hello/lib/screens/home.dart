import 'dart:math';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hello/components/botao.dart';
import 'package:hello/models/repository.dart';
import 'package:hello/components/list_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _texto = "Hello World";
  var _repositories = new List<Repository>.empty();

  @override
  void initState() => _texto = "Apps init state";

  Future<void> searchRepositories() async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/repositories?q=flutter&page=0&per_page=10'));
    var data = jsonDecode(response.body);
    setState(() {
      _repositories =
          (data['items'] as List).map((e) => Repository.fromJson(e)).toList();
      _repositories.forEach((element) {
        print(element.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              _texto,
              style: TextStyle(fontSize: 24.0),
            ),
            Botao(
              onPressed: searchRepositories,
              text: "Clica aqui",
            ),
            Expanded(
              child: ListRepository(
                repositories: _repositories
              ),
            ),
          ],
        ),
      ),
    );
  }
}
