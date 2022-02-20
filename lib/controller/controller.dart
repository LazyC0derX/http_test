import 'package:get/get.dart';
import 'package:http_test/models/model.dart';
import 'package:http_test/repositories/repository.dart';

class Controller extends GetxController {
  RxList<PostModel> _list = <PostModel>[].obs;
  RxList<PostModel> get postsList => _list;
  Repository _repository = Repository();

  fetchPosts() async {
    List list = await _repository.fetchPosts();
    list.forEach((element) {
      _list.add(PostModel.fromJson(element));
    });
  }
}
