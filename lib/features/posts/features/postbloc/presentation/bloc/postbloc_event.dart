part of 'postbloc_bloc.dart';

abstract class PostblocEvent extends Equatable {
  const PostblocEvent();

  @override
  List<Object> get props => [];
}

class PostInitialFetchEvent extends PostblocEvent {}

class AddPostEvent extends PostblocEvent {}
