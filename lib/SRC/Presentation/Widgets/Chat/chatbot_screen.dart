import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/strings.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_shadow.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_outline_button.dart';
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
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You can ask me everything about\nnames',
                style: TextStyle(fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              15.y,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  border: Border.all(),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mic_none_outlined),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // void _openMicBottomSheet() {
  //   showModalBottomSheet(
  //     backgroundColor: AppColors.white,

  //     shape: const BeveledRectangleBorder(),
  //     elevation: 0,
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(5.0),
  //         child: Container(
  //           height: 150,
  //           width: 300,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(20.0.r)
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const Text(
  //                 'You can ask me everything about\nnames',
  //                 style: TextStyle(fontSize: 15.0),
  //                 textAlign: TextAlign.center,
  //               ),
  //               Container(
  //                 decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color: AppColors.white,
  //                     border: Border.all()),
  //                 child: IconButton(
  //                   onPressed: () {},
  //                   icon: const Icon(Icons.mic_none_outlined),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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
        // backgroundColor:
        //     const Color.fromARGB(255, 238, 238, 238).withOpacity(0.94),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              ///
              ///Slivers App Bar
              ///
              SliverAppBar(
                elevation: 10,
                // backgroundColor: Colors.transparent,
                centerTitle: true,
                title: AppText(
                  'Chatbot AI',
                  style: Styles.plusJakartaSans(context,
                      fontSize: 15.sp, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('${staticAssets}chat_icon.png'),
                    ),
                  ),
                ],
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (index == 0) {
                    ///upper body
                    ///
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
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        AppShadow.minimum(),
                      ],
                      borderRadius: BorderRadius.circular(12)),
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
                        hintStyle: Styles.mediumPlusJakartaSans(context,
                            fontSize: 14.sp),
                        hintText: 'Generate a name of ...',
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            Assets.chatimage,
            height: 153.h,
            width: 137.w,
            fit: BoxFit.contain,
          ),
          5.y,
          Container(
            decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  2.x,

                  Image.asset(
                    Assets.spark,
                    height: 16.h,
                    width: 16.w,
                    fit: BoxFit.contain,
                  ),
                  // 8.x,
                  6.x,
                  AppText(
                    "Hi, you can ask me anything about names",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.lightgrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          18.y,
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(boxShadow: [
              AppShadow.minimum(),
            ], color: AppColors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.spark,
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.contain,
                    ),
                    8.x,
                    AppText(
                      "I suggest you some names you can ask\nme...",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.lightgrey,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 80.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: (suggestedNames.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      int startIndex = index * 2;
                      int endIndex = startIndex + 2;
                      endIndex = endIndex > suggestedNames.length
                          ? suggestedNames.length
                          : endIndex;

                      return Column(
                        children: suggestedNames
                            .getRange(startIndex, endIndex)
                            .map((name) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.lightgrey,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List suggestedNames = [
  'Business names',
  'Human names',
  'Games names',
  'Pet names',
  'Dish names',
  'Character names',
  'Book names',
  'Character names',
  'Dish names'
];
