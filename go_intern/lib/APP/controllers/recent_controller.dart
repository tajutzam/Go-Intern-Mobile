import 'package:get/get.dart';
import 'package:go_intern/APP/model/riwayat_lamaran_response.dart';
import 'package:go_intern/APP/model/showMagang_response.dart';
import 'package:go_intern/APP/services/magang_service.dart';
import 'package:go_intern/APP/services/user_service.dart';

class RecentController extends GetxController {
  UserService userService = UserService();
  MagangService magangService = MagangService();
  List<RiwayatLamaranBody>? dataRiwayat = [];

  Future<ShowMagangActiveResponse?> showMagangActive() async {
    ShowMagangActiveResponse? response = await userService.showMagangActive();
    return response;
  }

  refreshdata() {
    showRiwayatLamaran();
    showMagangActive();
  }

  Future<RiwayatLamaranResponse?>showRiwayatLamaran() async {
    RiwayatLamaranResponse? response = await userService.showRiwayatLamaran();
    return response;
  }

  batalkanLamaran(idMagang) async {
    return await magangService.batalkanLamaran(idMagang: idMagang);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showMagangActive();
    showRiwayatLamaran();
  }
}
