import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

import 'package:flutter_getx_app/wcao/kit/index.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class MessageChat extends StatefulWidget {
  const MessageChat({Key? key}) : super(key: key);

  @override
  State<MessageChat> createState() => _MessageChatState();
}

class _MessageChatState extends State<MessageChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天'),
        actions: [actionButton(context)],
      ),
      bottomNavigationBar: const BottomAppBar(
        child: TextField(
          keyboardType: TextInputType.text,
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: '请输入...',
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 24,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            return msgItem(index, reversed: !(index % 2 == 0));
          },
        ),
      ),
    );
  }

  // 顶部导航栏按钮
  IconButton actionButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text('拉黑'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('举报'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: Text(
                        '取消',
                        style: TextStyle(color: WcaoTheme.placeholder),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 消息列表项目
  // 通过reversed判断决定消息banner显示在左侧或者右侧
  Container msgItem(int index, {bool? reversed}) {
    bool right = index % 2 == 0;

    List<Widget> temp = [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: right
              ? const EdgeInsets.only(right: 12)
              : const EdgeInsets.only(left: 12),
          child: Text(
            mock.cparagraph(min: 1, max: 3),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      CircleAvatar(
        backgroundImage: NetworkImage(WcaoUtils.getRandomImage()),
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment:
            right ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: reversed == true ? temp.reversed.toList() : temp,
      ),
    );
  }
}
