import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/features/posts/models/post_data_ui_models.dart';
import 'package:flutter_bloc_api/features/posts/repos/posts_repo.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  PostblocBloc() : super(PostblocInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<AddPostEvent>(addPostEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostblocState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostDataUiModels> posts = await PostsRepo.fetchPosts();
    emit(PostFetchingSucessfulState(posts: posts));
  }

  FutureOr<void> addPostEvent(
      AddPostEvent event, Emitter<PostblocState> emit) async {
    bool sucess = await PostsRepo.addPost();
    print(sucess);
    if (sucess) {
      PostAdditionSucessfulState();
    } else {
      PostAdditionErrorState();
    }
  }
}
