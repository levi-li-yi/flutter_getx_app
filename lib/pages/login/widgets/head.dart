/*
 * @Author: Levi Li
 * @Date: 2023-11-29 21:36:27
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class Head extends StatefulWidget {
  const Head({Key? key}) : super(key: key);

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '登录/注册',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: WcaoTheme.base,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 36),
          child: Wrap(
            children: [
              Text(
                '手机号码',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          height: 50,
          child: TextField(
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: InputDecoration(
              counterText: '',
              hintText: '请输入手机号',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.outline,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: WcaoTheme.primaryFocus,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
