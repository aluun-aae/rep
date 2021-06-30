import 'package:person/logic/model/usermodel.dart';
import 'package:person/screens/userbloc/bloc/userbloc_provider.dart';

class UserBlocRepository {
  Future<UserModel> getUser() {
    UserBlocProvider provider = UserBlocProvider();
    return provider.getUser();
  }
}
