/*
 * @Author: Levi Li
 * @Date: 2023-11-29 21:36:27
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_app/pages/login/widgets/head.dart';
import 'package:flutter_getx_app/state/token.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class LoginVerifyCode extends StatefulWidget {
  const LoginVerifyCode({Key? key}) : super(key: key);

  @override
  State<LoginVerifyCode> createState() => _LoginVerifyCodeState();
}

class _LoginVerifyCodeState extends State<LoginVerifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            margin: const EdgeInsets.only(bottom: 56),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
