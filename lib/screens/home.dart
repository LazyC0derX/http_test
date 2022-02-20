import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_test/controller/controller.dart';
import 'package:http_test/models/model.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    controller.fetchPosts();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => ListView.builder(
                itemCount: controller.postsList.length,
                itemBuilder: (context, index) {
                  List<PostModel> posts = controller.postsList;
                  return Card(
                    child: ListTile(
                      title: Text(posts[index].title ?? "N/A"),
                      subtitle: Text(posts[index].body ?? "N/A"),
                    ),
                  );
                }))),
      ),
    );
  }
}
