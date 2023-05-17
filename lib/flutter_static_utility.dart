library flutter_static_utility;

import 'dart:math';

import 'package:flutter/material.dart';

/// email regex
bool checkEmailRegex({required String email}) {
  return RegExp(
      r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(email);
}

/// phoneNumber regex (Korean)
bool checkPhoneNumberRegex({required String phoneNumber}) {
  return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(phoneNumber);
}

/// nickname regex (Korean)
bool checkNickNameRegex(
    {required String nickName, required int min, required int max}) {
  return RegExp('^[ㄱ-ㅎ가-힣0-9a-zA-Z ]{$min,$max}\$').hasMatch(nickName.trim());
}

/// SMS regex
bool checkSMSCodeRegex({required String code, required int length}) {
  return RegExp('^[0-9]{$length}\$').hasMatch(code);
}

/// password regex
bool checkPasswordRegex(
    {required String password, required int min, required int max}) {
  return RegExp(
      '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@!%*#?~^,.&+=])[A-Za-z0-9@!%*#?~^,.&+=]{$min,$max}\$')
      .hasMatch(password);
}

/// n time ago
String timeAgo({required BuildContext context, required DateTime dateTime, bool numericDates = true}) {
  final dateNow = DateTime.now();
  final difference = dateNow.difference(dateTime);
  final local = Localizations.localeOf(context);
  final isKr = (local.languageCode == 'ko_KR');
  if (difference.inDays >= 364) {
    return (difference.inDays ~/ 364) == 1
        ? '1 ${isKr ? '년 전' : 'year ago'}'
        : '${difference.inDays ~/ 364}${isKr ? '년 전' : ' year ago'}';
  } else if (difference.inDays >= 30) {
    return (difference.inDays ~/ 30) == 1
        ? '1 ${isKr ? '개월 전' : 'month ago'}'
        : '${difference.inDays ~/ 30}${isKr ? '개월 전' : ' month ago'}';
  } else if ((difference.inDays ~/ 7) >= 1) {
    return (difference.inDays ~/ 7) == 1
        ? (numericDates)
        ? '1 ${isKr ? '주 전' : 'week ago'}'
        : isKr ? '저번 주' : 'Last week'
        : '${difference.inDays ~/ 7}${isKr ? '주 전' : ' week ago'}';
  } else if (difference.inDays >= 1) {
    return difference.inDays == 1
        ? (numericDates)
        ? '1${isKr ? '일 전' : ' day ago'}'
        : isKr ? '어제' : 'Yesterday'
        : '${difference.inDays}${isKr ? '일 전' : ' day ago'}';
  } else if (difference.inHours >= 1) {
    return difference.inHours == 1
        ? (numericDates)
        ? '1${isKr ? '시간 전' : ' hour ago'}'
        : 'An hour ago'
        : '${difference.inHours}${isKr ? '시간 전' : ' hour ago'}';
  } else if (difference.inMinutes >= 1) {
    return difference.inMinutes == 1
        ? (numericDates)
        ? isKr ? '1분 전' : '1 minute ago'
        : isKr ? '1분 전' : 'A minute ago'
        : '${difference.inMinutes}${isKr ? '분 전' : ' minutes ago'}';
  } else if (difference.inSeconds >= 5) {
    return '${difference.inSeconds}${isKr ? '초 전' : ' seconds ago'}';
  } else {
    return isKr ? '방금 전' : 'Just now';
  }
}

/// n K,M,B ... to String
String thousandToK(int value) {
  if (value < 1000) return value.toString();

  if (value < 10000) {
    final s = (value / 1000).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}K';
    }
    return '${s}K';
  }
  if (value < 1000000) {
    return '${(value / 1000).toStringAsFixed(1)}K';
  }

  if (value < 10000000) {
    final s = (value / pow(1000, 2)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}M';
    }
    return '${s}M';
  }

  if (value < 1000000000) {
    return '${(value / pow(1000, 2)).toStringAsFixed(1)}M';
  }

  if (value < 10000000000) {
    final s = (value / pow(1000, 3)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}B';
    }
    return '${s}B';
  }

  if (value < 1000000000000) {
    return '${(value / pow(1000, 3)).toStringAsFixed(1)}B';
  }

  if (value < 10000000000000) {
    final s = (value / pow(1000, 4)).toStringAsFixed(1);
    if (s[s.length - 1] == '0') {
      return '${s.substring(0, s.length - 2)}T';
    }
    return '${s}T';
  }

  if (value < 1000000000000000) {
    return '${(value / pow(1000, 4)).toStringAsFixed(1)}T';
  }

  return '${(value / pow(1000, 5)).toStringAsFixed(1)}Q';
}
/// n K,M,B ... to Class
DigitData thousandToData(int value) {
  if (value < pow(1000, 1)) {
    return DigitData(data: value, suffix: "", fraction: 0);
  } else if (value < pow(1000, 2)) {
    return DigitData(data: value / pow(1000, 1), suffix: "K", fraction: 1);
  } else if (value < pow(1000, 3)) {
    return DigitData(data: value / pow(1000, 2), suffix: "M", fraction: 1);
  } else if (value < pow(1000, 4)) {
    return DigitData(data: value / pow(1000, 3), suffix: "B", fraction: 1);
  } else if (value < pow(1000, 5)) {
    return DigitData(data: value / pow(1000, 4), suffix: "T", fraction: 1);
  } else {
    return DigitData(data: value, suffix: "", fraction: 0);
  }
}

class DigitData {
  final String suffix;
  final num data;
  final int fraction;

  DigitData({required this.data, required this.suffix, required this.fraction});
}
