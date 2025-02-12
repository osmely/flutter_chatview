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
import 'dart:async';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../values/typedefs.dart';

class ChatController {
  List<Message> initialMessageList;
  ScrollController scrollController;
  final UserByIdCallBack userById;

  ChatController({
    required this.initialMessageList,
    required this.scrollController,
    required this.userById,
  });

  StreamController<List<Message>> messageStreamController = StreamController();

  void dispose() => messageStreamController.close();

  void addMessage(Message message) {
    initialMessageList.add(message);
    messageStreamController.sink.add(initialMessageList);
  }

  void setReaction(String emoji, String messageId) {
    final message =
        initialMessageList.firstWhere((element) => element.id == messageId);
    final index = initialMessageList.indexOf(message);
    initialMessageList[index] = Message(
      id: messageId,
      message: message.message,
      createdAt: message.createdAt,
      sendById: message.sendById,
      replyMessage: message.replyMessage,
      reaction: emoji,
      messageType: message.messageType,
    );
    messageStreamController.sink.add(initialMessageList);
  }

  void scrollToLastMessage() => Timer(
        const Duration(milliseconds: 300),
        () => scrollController.animateTo(
          scrollController.position.minScrollExtent,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
        ),
      );

  void loadMoreData(List<Message> messageList) {
    initialMessageList.addAll(messageList);
    messageStreamController.sink.add(initialMessageList);
  }
}
