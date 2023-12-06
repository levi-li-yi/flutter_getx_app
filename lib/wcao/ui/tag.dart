/*
 * @Author: Levi Li
 * @Date: 2023-12-06 10:49:00
 * @description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_getx_app/wcao/ui/theme.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.text, {
    Key? key,
    this.padding,
    this.color = Colors.black,
    this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.close = false,
    this.onClose,
    this.border,
  }) : super(key: key);

  final String text;
  final EdgeInsets? padding;
  final Color? color;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;

  // 关闭按钮
  final bool close;
  // 关闭回调
  final VoidCallback? onClose;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? color?.withOpacity(.25),
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        border: border,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? WcaoTheme.fsSm,
              color: color,
              fontWeight: fontWeight,
            ),
          ),
          close
              ? InkWell(
                  onTap: onClose,
                  child: Container(
                    margin: const EdgeInsets.only(left: 2),
                    child:
                        Icon(Icons.close, color: color, size: WcaoTheme.fsBase),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
