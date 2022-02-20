import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_test/models/model.dart';
import 'package:http_test/repositories/repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading()) {
    List<PostModel> _list = <PostModel>[];
    Repository _repository = Repository();

    on<PostEvent>((event, emit) async {
      if (event is PostFetchEvent) {
        try {
          List list = await _repository.fetchPosts();
          list.forEach((element) {
            _list.add(PostModel.fromJson(element));
          });
          emit(PostFetchSuccess(postList: _list));
        } catch (e) {
          emit(PostFetchFailed(message: e.toString()));
        }
      }
    });
  }
}
