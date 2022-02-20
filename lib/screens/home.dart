import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_test/controller/post_bloc/bloc/post_bloc.dart';
import 'package:http_test/models/model.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(PostFetchEvent());
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostFetchSuccess) {
                  List<PostModel> list = state.postList;
                  if (list.isNotEmpty) {
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(list[index].title ?? "N/A"),
                              subtitle: Text(list[index].body ?? "N/A"),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("No posts"),
                    );
                  }
                } else if (state is PostFetchFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is PostLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Text("An unexpected error occured"),
                  );
                }
              },
            )),
      ),
    );
  }
}
