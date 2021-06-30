import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:person/helper/catch_exceptions.dart';
import 'package:person/logic/model/usermodel.dart';
import 'package:person/screens/userbloc/bloc/userbloc_repository.dart';

part 'userbloc_event.dart';
part 'userbloc_state.dart';

class UserblocBloc extends Bloc<UserblocEvent, UserblocState> {
  UserblocBloc(this.repository) : super(UserblocLoading());
  UserBlocRepository repository = UserBlocRepository();

  @override
  Stream<UserblocState> mapEventToState(
    UserblocEvent event,
  ) async* {
    try {
      if (event is GetUserEvent) {
        yield UserblocLoading();
        UserModel data = await repository.getUser();
        yield UserblocLoaded(data);
      }
    } catch (e) {
      yield UserError(CatchException.catchError(e));
    }
  }
}
