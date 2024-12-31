part of 'postbloc_bloc.dart';

abstract class PostblocState extends Equatable {
  const PostblocState();

  @override
  List<Object> get props => [];
}

abstract class PostActionState extends PostblocState {}

class PostblocInitial extends PostblocState {}

class PostFetchingLoadingState extends PostblocState {}

class PostFetchingErrorState extends PostblocState {}

class PostFetchingSucessfulState extends PostblocState {
  final List<PostDataUiModels> posts;

  const PostFetchingSucessfulState({required this.posts});
}

class PostAdditionSucessfulState extends PostActionState {}

class PostAdditionErrorState extends PostActionState {}
