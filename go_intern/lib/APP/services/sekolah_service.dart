import 'dart:convert';

import 'package:go_intern/APP/model/sekolah_response.dart';
import 'package:go_intern/APP/repositories/sekolah_repository.dart';

class SekolahService {
  SekolahRepository sekolahRepository = SekolahRepository();

  getAllData() async {
    var data = await sekolahRepository.getAlldataSekolah();
    return Sekolah.fromJson(jsonDecode(data.body));
  }

  getDataPerjenjang(String jenjang) async {
    var data = await sekolahRepository.getDataPerjenjang(jenjang);
    return data.body;
  }

  Future<bool> getDataCari(String key) async {
    Sekolah data = await sekolahRepository.getDataCari(key);
    // ignore: unnecessary_null_comparison
    if (data.data.length == null) {
      return false;
    } else {
      return true;
    }
  }

  addSekolah(sekolah) async {
    var response = await sekolahRepository.addSekolah(sekolah);
    return response;
  }

  addJurusanToSekolah(sekolah, jurusan) async {
    var response =
        await sekolahRepository.addJurusanAnnSekolah(sekolah, jurusan);
    return response;
  }

  cariSekolah(sekolah) async {
    var response = await sekolahRepository.cariSekolah(sekolah);
    print(response.body);
    return response;
  }
}
