import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // ข้อความหัวข้อ 'อัตราแลกเปลี่ยนวันนี้'
        const Text(
          'อัตราแลกเปลี่ยนวันนี้',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        // แสดงรูปภาพที่เกี่ยวข้องกับสกุลเงินเยน
        Image.asset('assets/new_yen.jpg', height: 200),
        const SizedBox(height: 20),

        // การแสดงข้อมูลอัตราแลกเปลี่ยนสำหรับเยน
        Card(
          elevation: 3,  // ความสูงของเงาของ Card
          child: InkWell(
            // เมื่อคลิกที่ Card จะไปที่หน้า CalculatePage พร้อมกับข้อมูลอัตราแลกเปลี่ยน
            onTap: () {
              Navigator.pushNamed(
                context,
                '/cal',
                arguments: {
                  'rate': '4.20',  // อัตราแลกเปลี่ยน 1 บาท = 4.20 เยน
                  'currencyName': 'เยน',  // ชื่อสกุลเงิน
                  'code': 'JPY',  // รหัสสกุลเงิน
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // แสดงอีโมจิธงชาติของญี่ปุ่น
                  Text('🇯🇵', style: TextStyle(fontSize: 50)),
                  SizedBox(height: 10),
                  // ชื่อสกุลเงิน (เยน)
                  Text(
                    'เยน',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // รหัสสกุลเงิน (JPY)
                  Text('JPY', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  // แสดงข้อมูลอัตราแลกเปลี่ยน
                  Text(
                    '1 บาท = 4.20 เยน',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // การแสดงข่าวสารอัตราแลกเปลี่ยนใน Container
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,  // สีพื้นหลังของ Container
            borderRadius: BorderRadius.circular(10),  // มุมโค้งของ Container
          ),
          child: const Column(
            children: [
              // หัวข้อข่าวสารอัตราแลกเปลี่ยน
              Text(
                'ข่าวสารอัตราแลกเปลี่ยน',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              
              // รายการข่าวสาร
              NewsItem(
                title: 'เงินเยนอ่อนค่าต่อเนื่อง',
                date: '15 เม.ย. 2567',
              ),
              NewsItem(
                title: 'ธนาคารกลางญี่ปุ่นคงอัตราดอกเบี้ย',
                date: '14 เม.ย. 2567',
              ),
              NewsItem(
                title: 'แนวโน้มค่าเงินเยนในปี 2567',
                date: '13 เม.ย. 2567',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget สำหรับแสดงข่าวสาร
class NewsItem extends StatelessWidget {
  final String title;
  final String date;

  const NewsItem({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // แสดงไอคอนของบทความ
          const Icon(Icons.article_outlined, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // แสดงชื่อเรื่องข่าว
                Text(title),
                // แสดงวันที่ของข่าว
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
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
