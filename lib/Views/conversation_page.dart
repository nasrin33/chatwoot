import 'package:chatwoot/Views/conversation_details_page.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversations"),
      ),
      body: ListView(
        children: const [
          ConversationItem(
            initials: "NA",
            avatarBg: Color(0xFFFBDCEF),
            avatarTextColor: Color(0xFFC2298A),
            name: "Nasrin Aktar",
            message: "hi",
            time: "18h",
          ),
          ConversationItem(
            initials: "ME",
            avatarBg: Color(0xFFFFE0BB),
            avatarTextColor: Color(0xFF99543A),
            name: "Mohammad Emon",
            message: "hi",
            time: "19h",
          ),
        ],
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final String initials;
  final Color avatarBg;
  final Color avatarTextColor;
  final String name;
  final String message;
  final String time;

  const ConversationItem({
    super.key,
    required this.initials,
    required this.avatarBg,
    required this.avatarTextColor,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ConversationDetailsPage(
                    name: name,
                    initials: initials,
                    avatarBg: avatarBg,
                    avatarTextColor: avatarTextColor,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 32,
                  height: 32,
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: avatarBg,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    initials,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: avatarTextColor,
                      fontSize: 12,
                    ),
                  ),
                ),

                // Name + Message
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFE4E4E7), width: .7),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 2),

                        // Message text
                        Row(
                          children: [
                            const Icon(
                              Icons.reply,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                message,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Time
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 4),
                  child: Text(
                    "$time ago",
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
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
