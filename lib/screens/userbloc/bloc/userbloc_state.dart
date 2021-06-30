part of 'userbloc_bloc.dart';

@immutable
abstract class UserblocState {}

class UserInitial extends UserblocState {}

class UserblocLoading extends UserblocState {}

class UserblocLoaded extends UserblocState {
  final UserModel model;

  UserblocLoaded(this.model);
}

class UserError extends UserblocState {
  final String message;

  UserError(this.message);
}
