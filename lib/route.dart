/*
 * @Author: Levi Li
 * @Date: 2023-11-29 16:00:31
 * @description: 
 */
import 'package:get/get.dart';

import 'package:flutter_getx_app/pages/home/index.dart';

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
];
