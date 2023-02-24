import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api.dart';
import '../../dashboard/views/dashboard_view.dart';

class LoginController extends GetxController {
  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();
  
  
  //TODO: Implement LoginController

  // final count = 0.obs;
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
    emailController.dispose();
    passwordController.dispose();
  }

  // Future<void> loginNow()  async {
  //   final response = await _getConnect.post(BaseUrl.auth, {
  //     'email': emailController.text,
  //     'password': passwordController.text
  //   });
  //   if (response.body['success'] == true) {
  //     authToken.write('token', response.body['access_token']);
  //     Get.offAll(() => const DashboardView());
  //   }else{
  //     Get.snackbar(
  //       'Error',
  //       response.body['messages'].toString(),
  //       icon: const Icon(Icons.error),
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //       forwardAnimationCurve: Curves.bounceIn,
  //       margin: const EdgeInsets.only(
  //          top: 10,
  //         left: 5,
  //         right: 5,
  //       )
  //       );
  //   }
  // }

  // void loginNow() async {
  //   final response = await _getConnect.post(BaseUrl.auth, {
  //     'email': emailController.text,
  //     'password': passwordController.text,
  //   });

  //   if (response.body['success'] == true) {
  //     authToken.write('token', response.body['access_token']);
  //     Get.offAll(() => const DashboardView());
  //   } else {
  //     Get.snackbar('Error', response.body['message'].toString(),
  //         icon: const Icon(Icons.error),
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //         forwardAnimationCurve: Curves.bounceIn,
  //         margin: EdgeInsets.only(top: 10, left: 5, right: 5));
  //   }
  // }


  void loginNow() async {
    // final response = await _getConnect.post(BaseUrl.auth, {
    //   'email': emailController.text,
    //   'password': passwordController.text,
    // });

    // if (response.body['success'] == true) {
    //   authToken.write('token', response.body['access_token']);
    //   Get.offAll(() => const DashboardView());
    // }else {
    //   Get.snackbar('Error', response.body['message'].toString(),
    //       icon: const Icon(Icons.error),
    //       backgroundColor: Colors.red,
    //       colorText: Colors.white,
    //       forwardAnimationCurve: Curves.bounceIn,
    //       margin: EdgeInsets.only(top: 10, left: 5, right: 5));
    // }

    var client = http.Client();
    var response;

    response = await client.post(
      Uri.https('demo-elearning.smkassalaambandung.sch.id', 'api/login'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    var decodedResponse =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (decodedResponse['success'] == true) {
      authToken.write('token', decodedResponse['access_token']);
      Get.offAllNamed('/home');
    } else {

      
      Get.snackbar('Error', decodedResponse['message'],
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          forwardAnimationCurve: Curves.bounceIn,
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5));
    }
  }

  // void increment() => count.value++;
}
