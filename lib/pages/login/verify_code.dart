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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Head(),
                buildVerifyCode(),
                loginButton(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login/password');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: Text(
                      '密码登录',
                      style: TextStyle(
                        color: WcaoTheme.primaryFocus,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '登录即同意',
                          style: TextStyle(color: WcaoTheme.placeholder),
                        ),
                        InkWell(
                          child: const Text('《服务协议》'),
                          onTap: () => {
                            Navigator.pushNamed(context, '/agreement/user'),
                          },
                        ),
                        Text(
                          '及',
                          style: TextStyle(color: WcaoTheme.placeholder),
                        ),
                        InkWell(
                          child: const Text('《隐私政策》'),
                          onTap: () => {
                            Navigator.pushNamed(context, '/agreement/privacy'),
                          },
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 密码登录
  Column buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                '密码',
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
            decoration: InputDecoration(
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

  // 登录按钮
  InkWell loginButton() {
    return InkWell(
      onTap: () {
        TokenController.to.set();
        Get.offAllNamed('/home');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 36),
        alignment: Alignment.center,
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: WcaoTheme.primary,
          borderRadius: WcaoTheme.radius,
        ),
        child: const Text(
          '登录',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // 验证码
  Column buildVerifyCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          child: Wrap(
            children: [
              Text(
                '验证码',
                style: TextStyle(
                  fontSize: 14,
                  color: WcaoTheme.placeholder,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 6,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: '请输入验证码',
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
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    '获取验证码',
                    style: TextStyle(
                      fontSize: 14,
                      color: WcaoTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
