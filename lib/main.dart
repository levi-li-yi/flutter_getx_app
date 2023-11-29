/*
 * @Author: Levi Li
 * @Date: 2023-11-29 15:23:35
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:flutter_getx_app/route.dart';
import 'package:flutter_getx_app/state/token.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put(TokenController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // 3秒后关闭启动页
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx APP',
      theme: ThemeData(
        // appBar主题
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            color: Colors.white,
            titleTextStyle: TextStyle(
              color: WcaoTheme.base,
              fontSize: WcaoTheme.fsXl,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: IconThemeData(
              color: WcaoTheme.base,
              size: WcaoTheme.fsXl,
            )),
        primaryColor: WcaoTheme.primary,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(background: Colors.transparent),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: WcaoTheme.fsBase),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // text button点击波纹
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                color: WcaoTheme.primary,
              ),
            ),
          ),
        ),
        // 取消slider间距
        sliderTheme: SliderThemeData(
          trackHeight: 12,
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: WcaoTheme.primary,
          inactiveTrackColor: WcaoTheme.primary.withOpacity(.2),
          thumbColor: WcaoTheme.primary,
          valueIndicatorColor: WcaoTheme.primary,
          inactiveTickMarkColor: WcaoTheme.primary,
        ),
      ),
      getPages: getRoutes,
      initialRoute: '/home',
      builder: EasyLoading.init(),
    );
  }
}
