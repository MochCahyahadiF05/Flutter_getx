import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/entertainment_response.dart';
import '../../../data/headline_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/technology_response.dart';
import '../../../utils/api.dart';

class DashboardController extends GetxController {
  final _getConnect = GetConnect();
  //TODO: Implement DashboardController

  Future<HeadlineResponse> getHeadline() async {
	//memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
  final response = await _getConnect.get(BaseUrl.headline);
	//mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
  return HeadlineResponse.fromJson(jsonDecode(response.body));
}
  Future<EntertainmentResponse> getEntertainment() async {
	//memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
  final response = await _getConnect.get(BaseUrl.headline);
	//mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
  return EntertainmentResponse.fromJson(jsonDecode(response.body));
}
  Future<SportsResponse> getSport() async {
	//memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
  final response = await _getConnect.get(BaseUrl.headline);
	//mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
  return SportsResponse.fromJson(jsonDecode(response.body));
}
  Future<TechnologyResponse> getTeknology() async {
	//memanggil fungsi getConnect untuk melakukan request ke BaseUrl.headline
  final response = await _getConnect.get(BaseUrl.headline);
	//mengembalikan data response dalam bentuk HeadlineResponse setelah di-decode dari JSON
  return TechnologyResponse.fromJson(jsonDecode(response.body));
}


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
