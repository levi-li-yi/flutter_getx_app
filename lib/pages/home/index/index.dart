/*
 * @Author: Levi Li
 * @Date: 2023-12-05 13:24:16
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:card_swiper/card_swiper.dart';

import 'package:flutter_getx_app/wcao/ui/theme.dart';
import 'package:flutter_getx_app/wcao/kit/index.dart';
import 'package:flutter_getx_app/pages/home/index/search_dialog.dart';

class PageViewIndex extends StatefulWidget {
  const PageViewIndex({Key? key}) : super(key: key);

  @override
  State<PageViewIndex> createState() => _PageViewIndexState();
}

class _PageViewIndexState extends State<PageViewIndex> {
  List<String> swipers = [
    WcaoUtils.getRandomImage(),
    WcaoUtils.getRandomImage(),
    WcaoUtils.getRandomImage(),
    WcaoUtils.getRandomImage(),
  ];

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width - 24;
    return Column(
      children: [
        AppBar(
          title: appBarTitle(),
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () => Get.toNamed('/history-match'),
              child: Row(
                children: [
                  Center(
                    child: Text(
                      '匹配历史',
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontSize: WcaoTheme.fsBase,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6, right: 12),
                    width: 64,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        avatar('/avatar/1.jpg'),
                        Positioned(left: 14, child: avatar('/avatar/2.jpg')),
                        Positioned(left: 28, child: avatar('/avatar/3.jpg')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // appbar title
  Widget appBarTitle() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          builder: (context) => const SearchDialog(),
          context: context,
          isScrollControlled: true,
        );
      },
      child: Row(
        children: [
          Text('匹配条件', style: TextStyle(fontSize: WcaoTheme.fsBase)),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: WcaoTheme.fsBase,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 头像
  Widget avatar(String url) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: WcaoTheme.outline),
        borderRadius: BorderRadius.circular(24),
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundImage: NetworkImage(WcaoUtils.getRandomImage()),
      ),
    );
  }

  // 标签
  Container tag(String str) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      color: Colors.black.withOpacity(.46),
      child: Text(
        str,
        style: TextStyle(fontSize: WcaoTheme.fsL),
      ),
    );
  }
}
