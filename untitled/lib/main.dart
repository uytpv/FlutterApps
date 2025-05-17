import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:untitled/alarm_screen.dart';

void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chào mừng đến với ứng dụng báo thức'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chào mừng bạn đến với ứng dụng báo thức',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Chuyển đến màn hình chính khi người dùng bấm nút "Đồng ý"
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AlarmScreen()),
                );
              },
              child: Text('Đồng ý'),
            ),
          ],
        ),
      ),
    );
  }
}
