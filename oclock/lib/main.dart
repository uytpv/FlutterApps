// Flutter app: Real-time clock, hh:mm.sss, landscape, 3% margin
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:wakelock/wakelock.dart';

double? _originalBrightness;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // Giữ màn hình luôn sáng
  Wakelock.enable();
  runApp(const OClockApp());
}

class OClockApp extends StatelessWidget {
  const OClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OClock',
      theme: ThemeData.dark(),
      home: const ClockScreen(),
    );
  }
}

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Force landscape orientation
    return const Scaffold(
      backgroundColor: Colors.black, // nền đen tuyệt đối cho toàn màn hình
      body: SafeArea(
        child: ClockWidget(),
      ),
    );
  }
}

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
    // Lưu và chỉnh độ sáng màn hình xuống 30%
    _setBrightness();
  }

  Future<void> _setBrightness() async {
    try {
      _originalBrightness = await ScreenBrightness().current;
      await ScreenBrightness().setScreenBrightness(0.3);
    } catch (e) {}
  }

  @override
  void dispose() {
    _timer.cancel();
    // Trả lại độ sáng gốc khi thoát app
    if (_originalBrightness != null) {
      ScreenBrightness().setScreenBrightness(_originalBrightness!);
    }
    super.dispose();
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    final s = dt.second.toString().padLeft(2, '0'); // 2 số, 00-59
    return '$h:$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black, // nền đen tuyệt đối
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          _formatTime(_now),
          style: const TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white, // chữ trắng
          ),
        ),
      ),
    );
  }
}
