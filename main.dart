import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cal.dart';  // นำเข้าหน้า CalculatePage
import 'package:flutter_application_1/pages/contact.dart';  // นำเข้าหน้า ContactPage
import 'package:flutter_application_1/pages/home.dart';  // นำเข้าหน้า HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปแลกเปลี่ยนเงิน',  // ตั้งชื่อแอป
      theme: ThemeData(
        primarySwatch: Colors.blue,  // ตั้งสีหลักของแอป
      ),
      initialRoute: '/',  // กำหนดเส้นทางเริ่มต้นเมื่อแอปเริ่มต้น
      routes: {
        '/': (context) => const MainPage(),  // เส้นทางหลักที่ไปยัง MainPage
        '/cal': (context) => const CalculatePage(),  // เส้นทางไปหน้า CalculatePage
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // ตัวแปรสำหรับเก็บตำแหน่งที่เลือกใน BottomNavigationBar
  int _currentIndex = 0;

  // สร้าง List ของ Widget สำหรับหน้าแต่ละหน้าในแท็บต่างๆ
  final List<Widget> _pages = [
    const HomePage(),  // หน้าแรก (HomePage)
    const CalculatePage(),  // หน้าแปลงค่าเงิน (CalculatePage)
    const ContactPage(),  // หน้าติดต่อเรา (ContactPage)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แอปแลกเปลี่ยนเงิน'),  // ชื่อแอปที่แสดงใน AppBar
      ),
      body: _pages[_currentIndex],  // แสดงหน้าตามตำแหน่งที่เลือกใน BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,  // กำหนดตำแหน่งที่เลือกใน BottomNavigationBar
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // เมื่อเลือกที่แท็บใหม่ ให้เปลี่ยนแปลงค่าของ _currentIndex
          });
        },
        items: const [
          // แท็บแรก สำหรับหน้าแรก
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  // ไอคอนของแท็บหน้าแรก
            label: 'หน้าแรก',  // ชื่อที่แสดงของแท็บหน้าแรก
          ),
          // แท็บที่สอง สำหรับคำนวณ
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),  // ไอคอนของแท็บคำนวณ
            label: 'คำนวณ',  // ชื่อที่แสดงของแท็บคำนวณ
          ),
          // แท็บที่สาม สำหรับติดต่อเรา
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),  // ไอคอนของแท็บติดต่อเรา
            label: 'ติดต่อเรา',  // ชื่อที่แสดงของแท็บติดต่อเรา
          ),
        ],
      ),
    );
  }
}
