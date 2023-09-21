import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;
  const LoadingWidget({Key? key, this.size = 36.0, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: color,
              )
            : CircularProgressIndicator(
                strokeWidth: 2.0,
                color: color,
              ),
      ),
    );
  }
}
