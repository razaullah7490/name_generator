import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Message> chatMessages = [];

  void _sendMessage(String message) {
    setState(() {
      chatMessages.add(Message(text: message, isUser: true));
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        chatMessages.addAll([
          Message(text: "Hello?", isUser: false),
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.scaffoldColor,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomAppbar(title: "ChatBot AI", icon: Icons.message_outlined),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final Message message = chatMessages[index];
                  final bool isUserMessage = message.isUser;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: isUserMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: isUserMessage
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 0.5.sw,
                              height: 0.06.sh,
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: isUserMessage
                                    ? AppColors.primaryColor
                                    : AppColors.white,
                                borderRadius: isUserMessage
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        topRight: Radius.circular(19),
                                        bottomLeft: Radius.circular(19),
                                      )
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(19),
                                        topRight: Radius.circular(19),
                                        bottomRight: Radius.circular(19),
                                      ),
                              ),
                              child: AppText(
                                message.text,
                                style: TextStyle(
                                  color: isUserMessage
                                      ? AppColors.white
                                      : AppColors.blackColor,
                                ),
                              ),
                            ),
                            if (!isUserMessage)
                              IconButton(
                                onPressed: () {
                                  print('Copy Action');
                                },
                                icon: const Icon(
                                  Icons.content_copy,
                                  size: 20,
                                  color: AppColors.grey,
                                ),
                              )
                          ],
                        ),
                      ));
                },
                childCount: chatMessages.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: 0.064.sh,
                    width: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                  onTap: () {
                    String message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _messageController.clear();
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    height: 40.h,
                    width: 40.w,
                    child: const Center(
                        child: Icon(
                      Icons.send,
                      size: 20,
                      color: AppColors.white,
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
