import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  // ตัวควบคุมสำหรับช่องกรอกจำนวนเงินบาท
  final TextEditingController quantity = TextEditingController();

  // ค่าผลลัพธ์ที่จะแสดงในกรณีที่ยังไม่ได้ทำการคำนวณ
  String result = 'กรุณาใส่จำนวนเงินบาทที่ต้องการแลก';
  
  // ค่าเริ่มต้นสำหรับการแลกเปลี่ยน
  String rate = '4.20';  // อัตราแลกเปลี่ยน
  String currencyName = 'เยน';  // ชื่อสกุลเงิน
  String code = 'JPY';  // รหัสสกุลเงิน

  // ฟังก์ชันคำนวณการแลกเปลี่ยน
  void calculateExchange() {
    // ตรวจสอบว่าผู้ใช้กรอกจำนวนเงินหรือไม่
    if (quantity.text.isEmpty) {
      setState(() {
        result = 'กรุณาใส่จำนวนเงินที่ต้องการแลก';  // ถ้าไม่กรอกให้แสดงข้อความนี้
      });
      return;
    }

    try {
      // พยายามแปลงค่าจำนวนเงินจาก TextField เป็นตัวเลข
      double amount = double.parse(quantity.text);
      // แปลงค่าอัตราแลกเปลี่ยนจาก String เป็นตัวเลข
      double exchangeRate = double.parse(rate);
      // คำนวณจำนวนเงินที่ได้จากการแปลง
      double calculated = amount * exchangeRate;
      
      // แสดงผลลัพธ์
      setState(() {
        result = 'จำนวนเงิน ${amount.toStringAsFixed(2)} บาท\n'
                'แปลงเป็น ${calculated.toStringAsFixed(2)} $currencyName';
      });
    } catch (e) {
      // ถ้าผู้ใช้กรอกข้อมูลไม่ถูกต้อง เช่น ไม่ใช่ตัวเลข
      setState(() {
        result = 'กรุณาใส่ตัวเลขที่ถูกต้อง';  // แจ้งให้ผู้ใช้ใส่ตัวเลขที่ถูกต้อง
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // รับค่า arguments ถ้ามีการส่งมา
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, dynamic>) {
      // ถ้ามีการส่งค่า arguments มา, อัปเดตอัตราแลกเปลี่ยน, ชื่อสกุลเงิน และรหัส
      rate = args['rate'].toString();
      currencyName = args['currencyName'].toString();
      code = args['code'].toString();
    }

    //  UI สำหรับการคำนวณ
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          // แสดงรูปภาพที่เกี่ยวข้องกับสกุลเงิน
          Image.asset('assets/new_yen.jpg', width: 150),
          // แสดงข้อความอธิบายการแปลงสกุลเงิน
          Text('แปลงสกุลเงินบาท-$currencyName ($code)'),
          const SizedBox(height: 20),
          // กล่องแสดงอัตราแลกเปลี่ยน
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'อัตราแลกเปลี่ยน: 1 บาท = $rate $currencyName',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          // ช่องกรอกจำนวนเงินบาท
          TextField(
            controller: quantity,
            keyboardType: TextInputType.number,  // ใช้แป้นพิมพ์สำหรับตัวเลข
            decoration: const InputDecoration(
              labelText: 'จำนวนเงินบาท',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // ปุ่มกดเพื่อคำนวณการแลกเปลี่ยน
          ElevatedButton(
            onPressed: calculateExchange,  // เมื่อกดปุ่มให้เรียกฟังก์ชันคำนวณ
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff09ce3),  // สีพื้นหลังปุ่ม
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),  // การจัดการ padding
            ),
            child: const Text('แปลงค่าเงิน', style: TextStyle(fontSize: 15)),
          ),
          const SizedBox(height: 20),
          // แสดงผลลัพธ์หลังจากคำนวณ
          Text(
            result,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    quantity.dispose();
    super.dispose();
  }
}
