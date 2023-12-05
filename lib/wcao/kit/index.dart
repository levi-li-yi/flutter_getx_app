import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_getx_app/wcao/ui/theme.dart';

const assetHost = 'https://rao.pics/r';

class WcaoUtils {
  static toast(String msg) async {
    await EasyLoading.showToast(msg);
  }

  static loading({String? msg}) async {
    await EasyLoading.show(status: msg ?? "loading...");
  }

  static dismiss() {
    EasyLoading.dismiss();
  }

  static Widget imageCache(String url, {BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.fill,
      placeholder: (context, url) => CupertinoActivityIndicator(
        color: WcaoTheme.primary,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.redAccent,
      ),
    );
  }

  static String getRandomImage() {
    return '$assetHost?t=${DateTime.now()}';
  }
}
