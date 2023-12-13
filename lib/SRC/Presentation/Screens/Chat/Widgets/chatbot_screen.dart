import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

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
          Message(text: 'Hello', isUser: false),
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
      backgroundColor: Colors.white,
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
                      color: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue, // Replace with your desired color
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: Text("ChatBot AI"),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.blue, // Replace with your desired color
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/background_image.jpg', // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == 0) {
                      return const IntroMessage();
                    }


                    final Message message = chatMessages[index - 1];
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
                              width: 200.0, // Adjust the width as needed
                              height: 50.0, // Adjust the height as needed
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: isUserMessage
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                              child: Text(
                                message.text,
                                style: TextStyle(
                                  color: isUserMessage
                                      ? Colors.white
                                      : Colors.black,
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
                                  color: Colors.grey,
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: chatMessages.length + 1,
                ),
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    height: 50.0, // Adjust the height as needed
                    width: MediaQuery.of(context).size.width - 32.0,
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
                            icon: const Icon(Icons.mic_none_outlined),
                          ),
                          border: InputBorder.none,
                          hintText: 'Type a message...',
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
                      color: Colors.blue, shape: BoxShape.circle),
                  height: 40.0, // Adjust t
                  width: 40.0, // Adjust the width as needed
                  child: const Center(
                    child: Icon(
                      Icons.send,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
  const IntroMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/chat_image.jpg', // Replace with your image asset
            height: 153.0, // Adjust the height as needed
            width: 137.0, // Adjust the width as needed
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8.0),
          Container(
            height: 25.0, // Adjust the height as needed
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                SizedBox(width: 16.0),
                Image.asset(
                  'assets/spark.png', // Replace with your image asset
                  height: 16.0, // Adjust the height as needed
                  width: 16.0, // Adjust the width as needed
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 8.0),
                Text(
                  "Hi, you can ask me anything about names",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
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
