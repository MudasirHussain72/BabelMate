import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:babel_mate/res/color/color.dart';

class Utils {
  static void fieldFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toasstMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.whiteColor,
        textColor: AppColors.primaryColor,
        fontSize: 16);
  }

  static String postTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    var originalDate = DateFormat('MM/dd/yyyy h:mma').format(dt);
    final todayDate = DateTime.now();
    String difference = '';

    if (kDebugMode) {
      // print(originalDate);
      // print(todayDate);
      // print(todayDate.difference(dt).inDays);
    }

    if (todayDate.difference(dt).inDays < 1) {
      //  difference = "Today" ;
      difference = DateFormat('jm').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 1 &&
        todayDate.difference(dt).inDays < 2) {
      difference = "Yesterday";
    } else if (todayDate.difference(dt).inDays >= 2 &&
        todayDate.difference(dt).inDays < 3) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 3 &&
        todayDate.difference(dt).inDays < 4) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 4 &&
        todayDate.difference(dt).inDays < 5) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 5 &&
        todayDate.difference(dt).inDays < 6) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 6 &&
        todayDate.difference(dt).inDays < 7) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 7 &&
        todayDate.difference(dt).inDays < 14) {
      difference = "${todayDate.difference(dt).inDays} Days Ago";
    } else {
      difference = originalDate;
    }

    return difference;
  }
}
