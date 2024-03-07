import 'package:sample/utils/common_utils.dart';

extension StringExt on String? {
  String orEmpty() {
    if (this != null) {
      return this!;
    }
    return CommonUtils.emptyString();
  }

  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    }
    if (this!.isEmpty) {
      return true;
    }
    return false;
  }

  bool isNotNullOrEmpty() {
    if (this == null) {
      return false;
    }
    if (this!.isEmpty) {
      return false;
    }
    return true;
  }
}
