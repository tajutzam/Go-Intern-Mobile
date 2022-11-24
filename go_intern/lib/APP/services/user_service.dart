import 'dart:convert';

import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  UserRepository userRepository = UserRepository();

  uploadImage(filename, path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    userRepository.uploadImage(filename, path , username);
  }

  Future<UserResponse> getDataUser(username) async {
    var response = await userRepository.getDataUser(username);
    print(response.body);
    return UserResponse.fromJson(jsonDecode(response.body));
  }
}
