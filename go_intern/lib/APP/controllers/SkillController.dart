import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/skill_response.dart';
import 'package:go_intern/APP/services/skill_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SkillController extends GetxController {
  List dataSkil = [].obs;
  final textC = TextEditingController();
  SkilService skilService = SkilService();
  List storageSkill = [].obs;
  var interactSkill = 0.obs;
  addToList(value) {
    dataSkil.add(value);
    // storageSkill.add(value);
    textC.text = "";
  }

  saveSkill(List list, int id) async {
    List newlist = [];
    bool response = false;
    if (storageSkill.length == list.length) {
      response = false;
    
    } else {
      for (int i = storageSkill.length; i < list.length; i++) {
        Map<String, dynamic> tempMap = {'id': 0, 'skill': list[i]['skill']};
        newlist.add(tempMap);
      }
      response = await skilService.addSkill(newlist, id);
     
    }
    if (response == true) {
      dataSkil.clear();
    }
    return response;
  }

  Future<bool> deleteSkill(id) async {
    var response = await skilService.deleteSkill(id);
    var dataResponse = jsonDecode(response.body);
    if (dataResponse['status'] == 'ok') {
      return true;
    } else {
      return false;
  }
  }
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await skilService.showSkill(sharedPreferences.getInt('id'));
    var dataSKilAsMap = jsonDecode(response.body) as Map<String, dynamic>;
    SkillMain skilMain = SkillMain.fromJson(dataSKilAsMap);
    for (int i = 0; i < skilMain.skills.length; i++) {
      Map<String, dynamic> tempMap = {
        'id': skilMain.skills[i].id,
        'skill': skilMain.skills[i].skill
      };
      dataSkil.add(tempMap);
      storageSkill.add(tempMap);
    }
  }
}
