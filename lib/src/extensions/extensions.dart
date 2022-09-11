/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:chatview/src/values/enumaration.dart';
import '../utils/constants.dart';
import '../utils/emoji_parser.dart';
import '../utils/package_strings.dart';

extension TimeDifference on DateTime {
  String get getDay {
    final DateTime formattedDate = DateFormat(dateFormat).parse(toString());
    final DateFormat formatter = DateFormat.yMMMMd(enUS);
    final differenceInDays = formattedDate.difference(DateTime.now()).inDays;
    if (differenceInDays == 0) {
      return PackageStrings.today;
    } else if (differenceInDays <= 1 && differenceInDays >= -1) {
      return PackageStrings.yesterday;
    } else {
      return formatter.format(formattedDate);
    }
  }

  String get getDateFromDateTime {
    final DateFormat formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }

  String get getTimeFromDateTime => DateFormat.Hm().format(this);
}

extension ValidateString on String {
  bool get isImageUrl {
    final imageUrlRegExp = RegExp(imageUrlRegExpression);
    return imageUrlRegExp.hasMatch(this) || startsWith('data:image');
  }

  bool get fromMemory => startsWith('data:image');

  bool get isAllEmoji {
    final parser = EmojiParser();
    final text = parser.unemojify(this);
    if (!text.contains(':')) {
      return false;
    }

    for (String s in text.split(" ")) {
      if (!s.startsWith(":") || !s.endsWith(":")) {
        return false;
      } else {
        final w = EmojiUtil.stripColons(s);
        if (w != null) {
          final emo = parser.getEmojiNamed(w);
          if (emo == null) {
            return false;
          }
        }
      }
    }
    return true;
  }

  String emojisa() {
    if (!contains(':')) {
      return this;
    }
    var text = this;
    var emos = List<Emoji>.empty(growable: true);
    final parser = EmojiParser();

    for (String s in text.split(" ")) {
      if (s.startsWith(":") && s.endsWith(":")) {
        final w = EmojiUtil.stripColons(s);
        if (w != null) {
          final emo = parser.getEmojiNamed(w);
          if (emo != null) {
            emos.add(emo);
          }
        }
      }
    }

    for (Emoji emo in emos) {
      text = text.replaceAll(emo.full, emo.code);
    }
    return text;
  }

  bool get isUrl => Uri.tryParse(this)?.isAbsolute ?? false;
}

extension MessageTypes on MessageType {
  bool get isImage => this == MessageType.image;

  bool get isText => this == MessageType.text;

  bool get isVoice => this == MessageType.voice;
}

extension ConnectionStates on ConnectionState {
  bool get isWaiting => this == ConnectionState.waiting;

  bool get isActive => this == ConnectionState.active;
}
