import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ---------------- Profile Section ----------------
            Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 42,
                      backgroundColor: Color(0xFFF3F4F6),
                      child: Text(
                        "NA",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    // Green Status Dot
                    Positioned(
                      right: 2,
                      bottom: 4,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  "Nasrin",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "info@ziiziiisland.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ---------------- Preferences Title ----------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),

            _buildSettingsCard(
              children: [
                _settingsTile(
                  icon: Icons.swap_horiz,
                  title: "Set availability",
                  onTap: () {},
                ),
                _divider(),
                _settingsTile(
                  icon: Icons.notifications_outlined,
                  title: "Notifications",
                  onTap: () {},
                ),
                _divider(),
                _settingsTile(
                  icon: Icons.language,
                  title: "Change Language",
                  trailing: const Text("English",
                      style: TextStyle(color: Colors.grey)),
                  onTap: () {},
                ),
                _divider(),
                _settingsTile(
                  icon: Icons.switch_account_outlined,
                  title: "Switch Account",
                  trailing: const Text("Aktar",
                      style: TextStyle(color: Colors.grey)),
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ---------------- Support Title ----------------
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),

            _buildSettingsCard(
              children: [
                _settingsTile(
                  icon: Icons.menu_book_outlined,
                  title: "Read Docs",
                  onTap: () {},
                ),
                _divider(),
                _settingsTile(
                  icon: Icons.chat_bubble_outline,
                  title: "Chat with us",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ---------------- Logout Button ----------------
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFFFFF1F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- Version Footer ----------------
            const Text(
              "Chatwoot cloud 4.3.8 (5180182)",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // -------------------- Helper Widgets --------------------

  Widget _buildSettingsCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey.shade300,
    );
  }
}
