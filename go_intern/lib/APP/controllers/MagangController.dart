import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/kategori_response.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/APP/model/magangbykategori_response.dart';
import 'package:go_intern/APP/model/pagination.dart';
import 'package:go_intern/APP/services/magang_service.dart';
import 'package:go_intern/helpers/url.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_provider/path_provider.dart';

class MagangController extends GetxController {
  Timer? timer;
  TextEditingController keywordController = TextEditingController();
  List<MagangKategoriBody> dataMagangKategori = [];
  var keyword = "".obs;

  MagangMain? magangMain;
  var isDataLoading = true.obs;
  var hasmore = true.obs;
  // final _paginationFilter = PaginationFilter().obs;
  var lengthTemp = false.obs;
  bool isNull = false;
  var refreshAuto = 0.obs;
  final _lastPage = false.obs;
  final PagingController<int, PagedChildBuilderDelegate> pagingController =
      PagingController(firstPageKey: 0);

  ScrollController scrollController = ScrollController();

  // int get limit => _paginationFilter.value.limit;
  // int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  MagangService magangService = MagangService();

  Future<MagangMain?> getData() async {
    var response = await magangService.getDataMagang();
    return response;
  }

  Future<MagangMain?> findbyKeyword() async {
    return await magangService.findMagangByKeyword(keyword: keyword.value);
  }

  showMagangKategori(ktg) async {
    var responseBoll = await magangService.showMagangByKategori(kategori: ktg);
    if (responseBoll != null) {
      return responseBoll.body;
    } else {
      return null;
    }
  }

  @override
  void onInit() async {
    keywordController.addListener(() {
      keyword.value = keywordController.text;
    });
    super.onInit();
    await getData();
    // every 20 seconds refresh page
    timer = Timer.periodic(Duration(seconds: 20), (Timer t) {
      refreshAuto.value = t.tick;
    });
    super.onInit();
    ever(
      refreshAuto,
      (callback) => getData(),
    );
    debounce(
      keyword,
      (callback) async {
        await findbyKeyword();
        print(keyword);
      },time: Duration(seconds: 1)
    );
  }
}
