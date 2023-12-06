/*
 * @Author: Levi Li
 * @Date: 2023-11-29 16:00:31
 * @description: 
 */
import 'package:get/get.dart';

import 'package:flutter_getx_app/pages/home/index.dart';
import 'package:flutter_getx_app/pages/login/verify_code.dart';
import 'package:flutter_getx_app/pages/login/password.dart';
import 'package:flutter_getx_app/pages/home/message/chart/index.dart';

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/login/verify-code', page: () => const LoginVerifyCode()),
  GetPage(name: '/login/password', page: () => const LoginPassword()),
  GetPage(name: '/message/chat', page: () => const MessageChat())
];
