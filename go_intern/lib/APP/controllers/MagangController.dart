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
  MagangMain? magangMain;
  var isDataLoading = true.obs;
  var hasmore = true.obs;
  final _paginationFilter = PaginationFilter().obs;
  var lengthTemp = false.obs;
  bool isNull = false;

  final _lastPage = false.obs;
  final PagingController<int, PagedChildBuilderDelegate> pagingController =
      PagingController(firstPageKey: 0);

  ScrollController scrollController = ScrollController();

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  getData() async {
    final url = "${UrlHelper.baseUrl}/magang/showmagangall";
    print("get data");
    try {
      isDataLoading(true);
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        magangMain = MagangMain.fromJson(jsonDecode(response.body));
        magangMain!.body.shuffle();
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

  void _changePaginationFilter(int page, int limit) {
    print("change page");
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  @override
  void onInit() async {
    super.onInit();
    getData();
    ever(_paginationFilter, (_) => getData());
    _changePaginationFilter(1, 15);
    super.onInit();
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     isDataLoading.value = false;
    //     // getData();
    //   }
    // });
  }
}
