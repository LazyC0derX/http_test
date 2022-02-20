import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_test/repositories/repository.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<String>(
              future: repository.fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List list = json.decode(snapshot.data!);
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> data = list[index];
                        return Card(
                          child: ListTile(
                            title: Text(data["title"]),
                            subtitle: Text(data["body"]),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
