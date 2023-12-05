import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import 'package:flutter_getx_app/wcao/ui/theme.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  double age = 18;
  List<String> sex = ['男', '女', '不限'];
  List<String> edu = ['小学', '初中', '高中', '大专', '本科', '硕士', '博士', '不限'];
  List<String> constellation = [
    '白羊座',
    '金牛座',
    '双子座',
    '巨蟹座',
    '狮子座',
    '处女座',
    '天秤座',
    '天蝎座',
    '射手座',
    '摩羯座',
    '水瓶座',
    '双鱼座',
    '不限'
  ];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarTitle(context),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: body(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 弹窗body
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text('基础条件', style: TextStyle(color: WcaoTheme.secondary)),
          ),
          setAge(),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Text('其他条件', style: TextStyle(color: WcaoTheme.secondary)),
          ),
          setSex(),
          setEdu(),
          setConstellation()
        ],
      ),
    );
  }

  // 年龄选项
  Container setAge() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('年龄', style: TextStyle(fontSize: WcaoTheme.fsL)),
              Text('18-45', style: TextStyle(fontSize: WcaoTheme.fsL)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Slider(
              min: 18,
              max: 45,
              value: age,
              divisions: 27,
              label: age.round().toString(),
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // 性别
  Column setSex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text('性别', style: TextStyle(fontSize: WcaoTheme.fsL)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            buttons: sex,
            options: groupButtonOptions(),
          ),
        ),
      ],
    );
  }

  // 学历
  Column setEdu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text('学历', style: TextStyle(fontSize: WcaoTheme.fsL)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            buttons: edu,
            options: groupButtonOptions(),
          ),
        ),
      ],
    );
  }

  // 星座
  Column setConstellation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Text('星座', style: TextStyle(fontSize: WcaoTheme.fsL)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: GroupButton(
            isRadio: false,
            buttons: constellation,
            options: groupButtonOptions(),
          ),
        ),
      ],
    );
  }

  // 性别选项按钮
  GroupButtonOptions groupButtonOptions() {
    return GroupButtonOptions(
      elevation: 0,
      mainGroupAlignment: MainGroupAlignment.start,
      textPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      runSpacing: 0,
      spacing: 12,
      borderRadius: BorderRadius.circular(6),
      unselectedColor: WcaoTheme.outline.withOpacity(.25),
      selectedColor: WcaoTheme.primary.withOpacity(.2),
      unselectedTextStyle: TextStyle(
        color: WcaoTheme.base.withOpacity(.85),
        fontSize: WcaoTheme.fsSm,
      ),
      selectedTextStyle: TextStyle(
        color: WcaoTheme.primary,
        fontSize: WcaoTheme.fsSm,
      ),
    );
  }

  AppBar appbarTitle(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        '筛选条件',
        style: TextStyle(
          fontSize: WcaoTheme.fsXl,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          child: Text('确定', style: TextStyle(color: WcaoTheme.primary)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
