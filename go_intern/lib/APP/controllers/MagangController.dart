import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_intern/APP/model/magang_response.dart';
import 'package:go_intern/APP/model/pagination.dart';
import 'package:go_intern/helpers/url.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_provider/path_provider.dart';

class MagangController extends GetxController {
  Timer? timer;

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

  getData() async {
    print('get data launch');
    final url = "${UrlHelper.baseUrl}/magang/showmagangall";
    print("get data");
    try {
      isDataLoading(true);
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        magangMain = MagangMain.fromJson(jsonDecode(response.body));
        magangMain!.body;
        hasmore.value = false;
        isDataLoading.value = false;
        isNull = false;
      } else {
        isNull = true;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading.value = false;
    }
  }
    @override
  void onInit() async {
    super.onInit();
    await getData();
    magangMain!.body.shuffle();
    // every 20 seconds refresh page
    timer = Timer.periodic(Duration(seconds: 20), (Timer t) {
      refreshAuto.value = t.tick;
    });
    super.onInit();
    ever(
      refreshAuto,
      (callback) => getData(),
    );
  }
}
