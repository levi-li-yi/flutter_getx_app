/*
 * @Author: Levi Li
 * @Date: 2023-11-29 16:06:08
 * @description: 
 */
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_app/state/token.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';
import 'package:flutter_getx_app/pages/home/index/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int curPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (TokenController.to.token.isEmpty) {
        Get.toNamed('/login/verify-code');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面容器
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageViewIndex(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WcaoTheme.primary,
        onPressed: () {
          Get.toNamed('/publish');
        },
        child: const Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BarItem(curPage == 0, 0, icon: Icons.home_filled, text: "首页"),
              BarItem(curPage == 1, 1, icon: Icons.access_alarm, text: "社区"),
              const SizedBox(width: 48),
              BarItem(curPage == 2, 2, icon: Icons.message_sharp, text: "消息"),
              BarItem(curPage == 3, 3, icon: Icons.person, text: "我的"),
            ],
          ),
        ),
      ),
    );
  }

  IconButton BarItem(bool active, int initPage,
      {required IconData icon, required String text}) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      color: active ? WcaoTheme.primary : WcaoTheme.base,
      icon: Column(
        children: [
          Icon(icon),
          Text(
            text,
            style: TextStyle(
              color: active ? WcaoTheme.primary : WcaoTheme.secondary,
            ),
          ),
        ],
      ),
      onPressed: () {
        setState(() {
          curPage = initPage;
          _pageController.jumpToPage(curPage);
        });
      },
    );
  }
}
