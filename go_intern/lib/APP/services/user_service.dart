import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/findById_response.dart';
import 'package:go_intern/APP/model/findby_response.dart';
import 'package:go_intern/APP/model/penghargaan_response.dart';
import 'package:go_intern/APP/model/riwayat_lamaran_response.dart';
import 'package:go_intern/APP/model/sekolah_user_response.dart';
import 'package:go_intern/APP/model/showMagang_response.dart';
import 'package:go_intern/APP/model/user_response.dart';
import 'package:go_intern/APP/repositories/user_repository.dart';
import 'package:go_intern/helpers/color.dart';
import 'package:go_intern/helpers/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  UserRepository userRepository = UserRepository();

  uploadImage(filename, path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    return await userRepository.uploadImage(filename, path, username);
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

  Future<SekolahUser?> showDataSekolah(id) async {
    var response = await userRepository.showDatasekolah(id);
    if (response.statusCode == 200) {
      return SekolahUser.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future showJurusanUser(id) async {
    return await userRepository.showJurusanUser(id);
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
    if (id != null) {
      return await userRepository.showPenghargaanByPencariMagang(id);
    } else {
      return null;
    }
  }

  updateDeskripsiSekolah(deskripsi) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await userRepository.updateDeskripsi(id, deskripsi);
    return response;
  }

  Future<Datauser?> showDataUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    var response = await userRepository.showdataUser(username);
    if (response.statusCode == 200) {
      return Datauser.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  updateDataPersonal({name, agama, email, jenisKelamin, tanggalLahir}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await userRepository.updateDataPersonal(
        name: name,
        agama: agama,
        email: email,
        jenisKelamin: jenisKelamin,
        tanggalLahir: tanggalLahir,
        id: id);
    print(response.body);
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.snackbar(
          'success', "${responseDecoded['message']} , Harap login kembali",
          backgroundColor: ColorHelpers.colorSnackbar, colorText: Colors.white);
      return true;
    } else {
      Get.snackbar('failed', responseDecoded['message'],
          backgroundColor: ColorHelpers.colorSnackbarfailed,
          colorText: Colors.white);
      return false;
    }
  }

  Future<bool> updateDataKeamanan(username, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response = await userRepository.updateDataKeamanan(
        username: username, password: password, id: id);
    print(response.body);
    var responsedecodedd = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Get.snackbar('Success', responsedecodedd['message'],
          backgroundColor: ColorHelpers.colorSnackbar, colorText: Colors.white);
      return true;
    } else {
      Get.snackbar('failed', responsedecodedd['message'],
          backgroundColor: ColorHelpers.colorSnackbarfailed,
          colorText: Colors.white);
      return false;
    }
  }

  Future<bool> updateCv({filename}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    var response = await userRepository.updateCv(username, filename);
    return response;
  }

  updateNoHp(npHp) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    userRepository.updateNoHp(id: id, no_telp: npHp);
  }

  updateSuratLamaran({suratLamaran}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    userRepository.updateSuratLamaran(suratLamaran, id);
  }

  Future<ShowMagangActiveResponse?> showMagangActive() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? id = sharedPreferences.getInt('id');
    if (id != null) {
      var response = await userRepository.showMagangActive(id: id);
      if (response.statusCode == 200) {
        return ShowMagangActiveResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<RiwayatLamaranResponse?> showRiwayatLamaran() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? id = sharedPreferences.getInt('id');
    if (id != null) {
      var response = await userRepository.showRiwayatLamaran(id: id);
      if (response.statusCode == 200) {
        return RiwayatLamaranResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> sendOtp({required username}) async {
    var response = await userRepository.sendOtp(username: username);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verivikasi({required username, required otp}) async {
    var response =
        await userRepository.verivikasi(username: username, otp: otp);
    EasyLoading.show(status: "Tunggu sebentar . . .");
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return true;
    } else {
      EasyLoading.dismiss();
      return false;
    }
  }

  Future<bool> resetPassword({required username, required password}) async {
    var response = await userRepository.updatePassword(
        username: username, password: password);
    EasyLoading.show(status: "Tunggu sebentar . . .");
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return true;
    } else {
      EasyLoading.dismiss();
      return false;
    }
  }

  Future<bool> updatePasswordById({required password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getInt('id');
    var response =
        await userRepository.updatePasswordById(password: password, id: id);
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      // Get.snackbar(
      //     'success', "Berhasil memperbarui password  , silahkan login ulang",
      //     backgroundColor: ColorHelpers.colorSnackbar, colorText: Colors.white);
      return true;
    } else {
      // var message = jsonDecode(response.body);
      // // Get.snackbar('success', "$message['message']",
      // //     backgroundColor: ColorHelpers.colorSnackbarfailed,
      // //     colorText: Colors.white);
      return false;
    }
  }
}
