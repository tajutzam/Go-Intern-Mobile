import 'dart:convert';

import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/penghargaan_response.dart';
import 'package:go_intern/APP/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  UserRepository userRepository = UserRepository();

  uploadImage(filename, path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    userRepository.uploadImage(filename, path, username);
  }

  Future<UserResponse> getDataUser(username) async {
    var response = await userRepository.getDataUser(username);
    return UserResponse.fromJson(jsonDecode(response.body));
  }

  Future<UserFindByIdResponse> findById(id) async {
    var response = await userRepository.findById(id);
    print(response.body);
    return UserFindByIdResponse.fromJson(jsonDecode(response.body));
  }

  addDataSekolah(sekolah, jurusan, id) async {
    return await userRepository.addDataSekolah(sekolah, jurusan, id);
  }

  showDataSekolah(id) async {
    return await userRepository.showDatasekolah(id);
  }

  updatePenghargaan(filename, judul, username) async {
    return await userRepository.upadatePenghargaan(filename, judul, username);
  }

  Future<PenghargaanResponse> showPenghargaanuser(id) async {
    var res = await userRepository.showPenghargaan(id);
    return PenghargaanResponse.fromJson(jsonDecode(res.body));
  }

  showPenghargaan() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    return await userRepository.showPenghargaanByPencariMagang(id);
  }
}
