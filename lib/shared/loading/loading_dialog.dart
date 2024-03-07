import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/utils/extensions/string_ext.dart';
import 'package:sample/values/dimensions.dart';

import '../../values/strings.dart';

class LoadingDialog {
  LoadingDialog._();

  static bool _isShown = false;

  static show(BuildContext context, {String? text}) {
    if (!_isShown) {
      _isShown = true;
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: Center(
              child: Container(
                width: 150.w,
                height: 120.h,
                padding: const EdgeInsets.all(Dimensions.size16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.size12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: Dimensions.size8),
                    Flexible(
                      child: Text(
                        text.isNotNullOrEmpty() ? text! : Strings.labelLoading,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  static hide(BuildContext context) {
    if (_isShown) {
      _isShown = false;
      Navigator.pop(context);
    }
  }
}
