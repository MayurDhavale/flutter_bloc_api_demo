import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/features/posts/features/postbloc/presentation/bloc/postbloc_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostblocBloc postblocBloc = PostblocBloc();

  @override
  void initState() {
    postblocBloc.add(PostInitialFetchEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            postblocBloc.add(AddPostEvent());
          }),
      body: BlocConsumer<PostblocBloc, PostblocState>(
        bloc: postblocBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        builder: (BuildContext context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchingSucessfulState:
              final sucessState = state as PostFetchingSucessfulState;
              return Container(
                child: ListView.builder(
                    itemCount: sucessState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(sucessState.posts[index].id.toString()),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              sucessState.posts[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(sucessState.posts[index].body),
                          ],
                        ),
                      );
                    }),
              );

            default:
              return const SizedBox();
          }
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
