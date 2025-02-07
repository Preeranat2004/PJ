import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
             Text("ผู้พัฒนา:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Jettawat Bunthung", style: TextStyle(fontSize: 16)),
            Text("Gmail: Jettawatbunthung@gmail.com", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Preeranat Homchan", style: TextStyle(fontSize: 16)),
            Text("Gmail: preeranat.fam4960@gmail.com", style: TextStyle(fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }
}
