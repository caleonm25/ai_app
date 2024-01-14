import 'package:ai_app/controller/chat_controller.dart';
import 'package:ai_app/helper/global.dart';
import 'package:ai_app/main.dart';
import 'package:ai_app/model/message.dart';
import 'package:ai_app/widget/message_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChatBoxFeature extends StatefulWidget {
  const ChatBoxFeature({super.key});

  @override
  State<ChatBoxFeature> createState() => _ChatBoxFeatureState();
}

class _ChatBoxFeatureState extends State<ChatBoxFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Expanded(child: TextField(
            controller: _c.textC,
          textAlign: TextAlign.center,
          onTapOutside: (e) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              filled: true,
              isDense: true,
              hintText: 'Ask me anything you want...',
              hintStyle: TextStyle(fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)),
          )),

        )),
          //adding space
          const SizedBox(width: 8,),

          //send button
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).buttonColor,
            child: IconButton(
                onPressed: _c.askQuestion,
                icon: const Icon(Icons.rocket_launch_rounded,
                  color: Colors.white, size: 28,)),
          ),
        ],),
      ),

      body: Obx(
          () => ListView(
            physics: const BouncingScrollPhysics(),
            controller: _c.scrollC,
            padding: EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
            children: _c.list.map((e) => MessageCard(message: e)).toList(),
          ),
      ),
    );
  }
}
