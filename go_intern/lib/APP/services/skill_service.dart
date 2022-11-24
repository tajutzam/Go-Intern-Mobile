import 'dart:io';

import 'package:go_intern/APP/repositories/skill_repository.dart';
import 'package:http/http.dart' as http;

class SkilService {
  SkilRepository skilRepository = SkilRepository();

  Future<bool> addSkill(List list, id) async {
    var response = await skilRepository.saveSkill(list, id);
    print(response);
    return response;
  }

  Future<http.Response> showSkill(id) async {
    var response = await skilRepository.showSkils(id);
    return response;
  }

  Future<http.Response> deleteSkill(id) async {
    return await skilRepository.deleteSkill(id);
  }
  
}
