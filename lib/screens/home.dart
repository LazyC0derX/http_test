import 'package:flutter/material.dart';
import 'package:http_test/models/model.dart';
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
          child: FutureBuilder<List>(
              future: repository.fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<PostModel>? posts = [];
                  snapshot.data?.forEach((element) {
                    posts?.add(PostModel.fromJson(element));
                  });
                  return ListView.builder(
                      itemCount: posts?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(posts?[index].title ?? "N/A"),
                            subtitle: Text(posts?[index].body ?? "N/A"),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
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
