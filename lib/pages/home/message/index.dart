import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

import 'package:flutter_getx_app/pages/home/message/firends_dialog.dart';
import 'package:flutter_getx_app/pages/home/message/qr_scan.dart';
import 'package:flutter_getx_app/pages/home/community/page_view/like/mock.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class PageViewMessage extends StatefulWidget {
  const PageViewMessage({Key? key}) : super(key: key);

  @override
  State<PageViewMessage> createState() => _PageViewMessageState();
}

class _PageViewMessageState extends State<PageViewMessage> {
  List<MockLike> lists = [];
  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();
    setState(() {
      lists = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text('聊天'),
              actions: [PopupMenuActions(context)],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    search(),
                    Column(
                      children: lists.map((e) {
                        return InkWell(
                          child: listCard(e),
                          onTap: () => Get.toNamed('/message/chat'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton PopupMenuActions(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.add,
        size: WcaoTheme.fsBase * 1.75,
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              const Icon(Icons.crop_free),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text('扫一扫'),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const QrScan(),
              ),
            );
          },
        ),
        PopupMenuItem(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.how_to_reg),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text('添加好友'),
              ),
            ],
          ),
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => const FriendsDialog(),
            );
          },
        ),
      ],
    );
  }

  Container listCard(MockLike item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(item.avatar),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: .5,
                    color: WcaoTheme.placeholder.withOpacity(.5),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 基本信息(姓名、时间)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.nickName,
                        style: TextStyle(
                            fontSize: WcaoTheme.fsXl,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.time.split('T')[0],
                        style: TextStyle(
                          fontSize: WcaoTheme.fsSm,
                          color: WcaoTheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  // 其他信息(简介、爱好)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              item.text,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: WcaoTheme.secondary,
                                fontSize: WcaoTheme.fsBase,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: WcaoTheme.primary,
                          child: Text(
                            '${item.fav}',
                            style: TextStyle(fontSize: WcaoTheme.fsSm),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container search() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: WcaoTheme.bgColor,
        ),
        child: const TextField(
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: '请输入关键词',
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
