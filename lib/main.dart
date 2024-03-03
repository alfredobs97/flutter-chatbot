import 'package:flutter/material.dart';
import 'package:flutter_chatbot/service/dialogflow_cx.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter with Gemini Chat Bot',
      home: HomePage(),
    );
  }
}

class Chat {
  final bool isMine;
  final String text;

  Chat({required this.isMine, required this.text});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DialogFlowCx dialogflow;
  @override
  initState() {
    super.initState();
    DialogFlowCx().init().then((instance) => dialogflow = instance);
  }

  Future<void> _save() async {
    final input = _chatController.text;

    setState(() {
      _chats.add(Chat(isMine: true, text: input));
    });

    _chatController.clear();

    final response = await dialogflow.detectIntent(input);

    setState(() {
      _chats.add(Chat(isMine: false, text: response.queryResult.responseMessages.first.text?.text.first ?? ''));
    });

    _chatController.clear();
  }

  final _chatController = TextEditingController();

  final List<Chat> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Flutter Assistant'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _chats.length,
              reverse: true,
              itemBuilder: (context, index) {
                final chat = _chats[_chats.length - index - 1];
                return Align(
                  alignment: chat.isMine ? Alignment.centerRight : Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: chat.isMine ? Colors.blue[200] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(chat.text),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Chat',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: _save,
                      icon: const Icon(Icons.send),
                    ),
                  ),
                  onEditingComplete: _save,
                  controller: _chatController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
