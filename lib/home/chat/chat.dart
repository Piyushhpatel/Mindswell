import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage(this.text, this.isBot);
}

class Chatbot {
  final String apiKey;

  Chatbot(this.apiKey);

  Future<String> getResponse(String message) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        "Content-Type": "application/json"
      },
      body: json.encode({
        "model": "gpt-3.5-turbo-instruct-0914",
        "prompt": message,
        "temperature": 0.9,
        "max_tokens": 150,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0.6,
        "stop": [" Human:", " AI:"]
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      if (responseBody.containsKey('choices') &&
          responseBody['choices'].isNotEmpty) {
        return responseBody['choices'][0]['text'];
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}

class ChatbotApp extends StatefulWidget {
  @override
  _ChatbotAppState createState() => _ChatbotAppState();
}

class _ChatbotAppState extends State<ChatbotApp> {
  final chatbot = Chatbot('API_KEY');
  List<ChatMessage> _messages = [];
  String _message = '';

  void addMessage(String text, bool isBot) {
    setState(() {
      _messages.add(ChatMessage(text, isBot));
    });
  }

  void send() async {
    addMessage(_message, false);

    try {
      final response = await chatbot.getResponse(_message);
      addMessage(response, true);
    } catch (e) {
      print('Error: $e');
      addMessage('An error occurred. Please try again.', true);
    }
    _message = ''; // Clear the input field after sending.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 18),
            child: Text(
              "Health Consultant",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Bubble(
                  message: message.text,
                  isBot: message.isBot,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _message = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: send,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final String message;
  final bool isBot;

  Bubble({required this.message, required this.isBot});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isBot ? Colors.deepPurple : Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
