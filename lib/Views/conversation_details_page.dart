import 'package:flutter/material.dart';

class ConversationDetailsPage extends StatefulWidget {
  final String name;
  final String initials;
  final Color avatarBg;
  final Color avatarTextColor;

  const ConversationDetailsPage({
    super.key,
    required this.name,
    required this.initials,
    required this.avatarBg,
    required this.avatarTextColor,
  });

  @override
  State<ConversationDetailsPage> createState() =>
      _ConversationDetailsPageState();
}

class _ConversationDetailsPageState extends State<ConversationDetailsPage> {
  final TextEditingController _controller = TextEditingController();

  final List<MessageModel> messages = [
    MessageModel(
      text: "Hello",
      time: "Nov 17, 4:35 PM",
      isMe: false,
    ),
    MessageModel(
      text: "hi",
      time: "Nov 17, 4:35 PM",
      isMe: true,
    ),
    MessageModel(
      text: "Conversation was marked resolved by Nasrin",
      time: "",
      type: MessageType.activity,
    ),
    MessageModel(
      text: "Conversation was reopened by Nasrin",
      time: "",
      type: MessageType.activity,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------------- HEADER ----------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: widget.avatarBg,
              child: Text(
                widget.initials,
                style: TextStyle(
                  color: widget.avatarTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),

      // --------------- BODY ------------------
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                if (msg.type == MessageType.activity) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        msg.text,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                return Align(
                  alignment:
                      msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: msg.isMe
                          ? Colors.blue.shade300
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(14),
                        topRight: const Radius.circular(14),
                        bottomLeft:
                            msg.isMe ? const Radius.circular(14) : Radius.zero,
                        bottomRight:
                            msg.isMe ? Radius.zero : const Radius.circular(14),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          msg.text,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg.time,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ---------------- REPLY BOX ----------------
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageType { text, activity }

class MessageModel {
  final String text;
  final String time;
  final bool isMe;
  final MessageType type;

  MessageModel({
    required this.text,
    this.time = "",
    this.isMe = false,
    this.type = MessageType.text,
  });
}
