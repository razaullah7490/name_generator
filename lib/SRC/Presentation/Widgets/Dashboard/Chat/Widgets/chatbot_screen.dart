import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Message> chatMessages = [];

  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String message) {
    setState(() {
      chatMessages.add(Message(text: message, isUser: true));
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        chatMessages.addAll([
          Message(text: AppStrings.hello, isUser: false),
        ]);
      });

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _openMicBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      shape: const BeveledRectangleBorder(),
      elevation: 0,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: FractionallySizedBox(
            heightFactor: 0.3,
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You can ask me everything about names',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all()),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic_none_outlined),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _copyMessage(String messageText) {
    Clipboard.setData(ClipboardData(text: messageText));
    // You can also show a toast or snackbar indicating that the message has been copied.
    // For simplicity, you can print a message to the console.
    print('Message copied: $messageText');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor:
            const Color.fromARGB(255, 238, 238, 238).withOpacity(0.94),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppbar(
                  title: AppStrings.chatBotAi, icon: Icons.message),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (index == 0) {
                    return const IntroMessage();
                  }

                  final Message message = chatMessages[index - 1];
                  final bool isUserMessage = message.isUser;
                  return Padding(
                      padding: EdgeInsets.all(8.0.sp),
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
                                  _copyMessage(message.text);
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
                }, childCount: chatMessages.length + 1),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: 0.07.sh,
                    width: 1.sw,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _messageController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: _openMicBottomSheet,
                              icon: const Icon(Icons.mic_none_outlined)),
                          border: InputBorder.none,
                          hintText: AppStrings.typeMessage,
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
                    if (message.isNotEmpty &&
                        _formKey.currentState!.validate()) {
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

class IntroMessage extends StatelessWidget {
  const IntroMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        children: [
          Image.asset(
            Assets.chatimage,
            height: 153.h,
            width: 137.w,
            fit: BoxFit.contain,
          ),
          8.y,
          Container(
            height: 0.05.sh,
            width: 0.9.sw,
            decoration: BoxDecoration(
                color: AppColors.lebelTextColor,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                16.x,
                Image.asset(
                  Assets.spark,
                  height: 16.h,
                  width: 16.w,
                  fit: BoxFit.contain,
                ),
                8.x,
                AppText(
                  "Hi, you can ask me anything about names",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.lightgrey,
                  ),
                ),
              ],
            ),
          ),
          24.y,
          Container(
            height: 0.2.sh,
            width: 0.9.sw,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                16.x,
                Image.asset(
                  Assets.spark,
                  height: 16.h,
                  width: 16.w,
                  fit: BoxFit.contain,
                ),
                8.x,
                Expanded(
                  child: AppText(
                    "I suggest you some names you can ask me...",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightgrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
