import 'package:dio/dio.dart';
import 'package:person/helper/apirequster.dart';
import 'package:person/logic/model/usermodel.dart';

class UserBlocProvider {
  // ignore: missing_return
  Future<UserModel> getUser() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("");
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception("Ошибка");
    }
  }
}
