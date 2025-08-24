import 'package:screen_brightness/screen_brightness.dart';
import 'package:wakelock/wakelock.dart';
import 'components/flip_block.dart';
import 'components/colon_block.dart';
import 'components/ampm_block.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const FlipClockApp());
}

class FlipClockApp extends StatelessWidget {
  const FlipClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlipClockScreen(),
    );
  }
}

class FlipClockScreen extends StatelessWidget {
  const FlipClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double padding = constraints.maxWidth * 0.03; // Padding 3% mỗi bên
            double availableWidth = constraints.maxWidth - (2 * padding);
            // Độ rộng tối đa trừ cho khoảng cách 2 bên
            double blockCount = 6; // 6 số
            double colonCount = 2; // 2 dấu :
            double ampmWidthRatio = 1; // AM/PM nhỏ hơn khối số
            double blockSpacing = 0.1; // spacing giữa các khối
            double blockWidth = availableWidth /
                (blockCount +
                    (colonCount * 0.5) +
                    ((blockCount + colonCount) * blockSpacing) +
                    ampmWidthRatio);
            double blockHeight = constraints.maxHeight * 0.35;
            double fontSize = blockHeight * 0.6;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlipClockRow(
                    blockWidth: blockWidth,
                    blockHeight: blockHeight,
                    fontSize: fontSize,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FlipClockRow extends StatefulWidget {
  final double blockWidth;
  final double blockHeight;
  final double fontSize;
  const FlipClockRow(
      {super.key,
      required this.blockWidth,
      required this.blockHeight,
      required this.fontSize});

  @override
  State<FlipClockRow> createState() => _FlipClockRowState();
}

class _FlipClockRowState extends State<FlipClockRow> {
  late Timer _timer;
  late DateTime _now;

  double? _originalBrightness;

  String _formatDateInFinnish(DateTime date) {
    // Tên các ngày trong tuần bằng tiếng Phần Lan
    const List<String> weekdays = [
      'Sunnuntai',
      'Maanantai', 
      'Tiistai',
      'Keskiviikko',
      'Torstai',
      'Perjantai',
      'Lauantai'
    ];
    
    // Tên các tháng bằng tiếng Phần Lan
    const List<String> months = [
      'tammikuuta',
      'helmikuuta',
      'maaliskuuta',
      'huhtikuuta',
      'toukokuuta',
      'kesäkuuta',
      'heinäkuuta',
      'elokuuta',
      'syyskuuta',
      'lokakuuta',
      'marraskuuta',
      'joulukuuta'
    ];
    
    String weekday = weekdays[date.weekday % 7];
    String month = months[date.month - 1];
    int day = date.day;
    int year = date.year;
    
    return '$weekday, $day. $month $year';
  }

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
    _initBrightnessAndWakelock();
  }

  Future<void> _initBrightnessAndWakelock() async {
    try {
      _originalBrightness = await ScreenBrightness().application;
      await ScreenBrightness().setApplicationScreenBrightness(0.3);
    } catch (e) {
      // Ignore brightness setting errors
    }
    Wakelock.enable();
  }

  @override
  void dispose() {
    _timer.cancel();
    // Trả lại độ sáng gốc khi thoát app
    if (_originalBrightness != null) {
      ScreenBrightness().setApplicationScreenBrightness(_originalBrightness!);
    }
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hour = _now.hour % 12 == 0 ? 12 : _now.hour % 12;
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = _now.minute.toString().padLeft(2, '0');
    final secondStr = _now.second.toString().padLeft(2, '0');
    final isPM = _now.hour >= 12;
    final formattedDate = _formatDateInFinnish(_now);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlipBlock(
                digit: hourStr[0],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              FlipBlock(
                digit: hourStr[1],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              ColonBlock(
                fontSize: widget.fontSize * 0.7,
                height: widget.blockHeight,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              FlipBlock(
                digit: minuteStr[0],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              FlipBlock(
                digit: minuteStr[1],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              ColonBlock(
                fontSize: widget.fontSize * 0.7,
                height: widget.blockHeight,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              FlipBlock(
                digit: secondStr[0],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.04),
              FlipBlock(
                digit: secondStr[1],
                width: widget.blockWidth,
                height: widget.blockHeight,
                fontSize: widget.fontSize,
              ),
              SizedBox(width: widget.blockWidth * 0.3),
              AmPmBlock(
                isPM: isPM,
                height: widget.blockHeight * 0.5,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // khoảng cách với đồng hồ
        Flexible(
          child: Text(
            formattedDate,
            style: TextStyle(
              fontSize: widget.fontSize * 0.35, // chữ nhỏ hơn để tránh overflow
              color: Color(0xff333333),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
