import 'package:ai_app/screen/feature/chatbox_feature.dart';
import 'package:ai_app/screen/feature/image_feature.dart';
import 'package:ai_app/screen/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType{

  String get title => switch (this){

    HomeType.aiChatBot => 'AI ChatBox',
    HomeType.aiImage => 'AI Image Creator',
    HomeType.aiTranslator => 'Language Translator',
  };

  //lottie
  String get lottie => switch (this) {
    HomeType.aiChatBot => 'loading_blue.json',
    HomeType.aiImage => 'ai_play.json',
    HomeType.aiTranslator => 'ai_ask_me.json',
  };

  //for alignment
  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
  };

  //for padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => const EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };

  //for padding
  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() => ChatBoxFeature()),
    HomeType.aiImage => () => Get.to(() => ImageFeature()),
    HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
  };
}