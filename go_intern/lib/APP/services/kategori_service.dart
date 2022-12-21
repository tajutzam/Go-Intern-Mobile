import 'dart:convert';

import 'package:go_intern/APP/model/kategori_response.dart';
import 'package:go_intern/APP/repositories/kategori_repository.dart';

class KategoriService {
  KategoriRepo repo = KategoriRepo();

  Future<Kategori>findAll() async {
    var response = await repo.findAll();
      return Kategori.fromJson(jsonDecode(response.body));
  }
}
