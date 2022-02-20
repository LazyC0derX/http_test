part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostFetchSuccess extends PostState {
  final List<PostModel> postList;

  PostFetchSuccess({required this.postList});
  @override
  List<Object> get props => [postList];
}

class PostFetchFailed extends PostState {
  final String message;

  PostFetchFailed({required this.message});
  @override
  List<Object> get props => [message];
}
