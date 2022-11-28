import 'dart:convert';

import 'package:get/get.dart';
import 'package:go_intern/APP/model/jurusan_response.dart';
import 'package:go_intern/APP/repositories/jurusan_repository.dart';

class JurusanService {
  var jurusanRepository = JurusanRepository();

  Future<Jurusan> showAllJurusan() async {
    var dataResponse = await jurusanRepository.findAllJurusan();
    print(dataResponse.body);
    var jurusan = Jurusan.fromJson(jsonDecode(dataResponse.body));

    return jurusan;
  }

  findByJurusan(jurusan) async {
    var response = await jurusanRepository.findByJurusan(jurusan);
    return response;
  }
}
