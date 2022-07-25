import 'package:flutter/material.dart';

import 'package:hello/models/repository.dart';

class ListRepository extends StatelessWidget {
  const ListRepository({Key? key, required this.repositories})
      : super(key: key);

  final List<Repository> repositories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(repositories[index].name),
                  subtitle: Text(repositories[index].description),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {}, 
                    child: Text(
                      'Abrir repositorio'
                    ),
                  ),
                ],
              )
            ],
          ),
          elevation: 5.0,
        );
      },
      itemCount: repositories.length,
    );
  }
}
