import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Account")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 12),

            const Text(
              "Juan Dela Cruz",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            const Text(
              "juan.delacruz@email.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// 🔹 Account Options
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("My Orders"),
              onTap: () {},
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text("Shipping Address"),
              onTap: () {},
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              onTap: () {},
            ),

            const Spacer(),

            /// 🔹 Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // UI only – navigation logic later
                },
                child: const Text("Logout", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
