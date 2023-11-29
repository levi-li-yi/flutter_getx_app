/*
 * @Author: Levi Li
 * @Date: 2023-11-29 16:06:08
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:flutter_getx_app/route.dart';
import 'package:flutter_getx_app/state/token.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Home'),
    );
  }
}
