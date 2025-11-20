import 'package:challenge1/E-comm/view/widgets/rounded_contaianer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history_screen.dart';



class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int todayCount = 0;
  int overallCount = 0;
  String todayKey = '';

  @override
  void initState() {
    super.initState();
    _initKeys();
  }

  void _initKeys() async {
    final now = DateTime.now();
    todayKey = 'count_${now.year}_${now.month}_${now.day}';
    await _loadCounts();
  }

  Future<void> _loadCounts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      todayCount = prefs.getInt(todayKey) ?? 0;
      overallCount = prefs.getInt('overall_count') ?? 0;
    });
  }

  Future<void> _incrementCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      todayCount++;
      overallCount++;
    });
    await prefs.setInt(todayKey, todayCount);
    await prefs.setInt('overall_count', overallCount);
  }

  Future<void> _resetToday() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      todayCount = 0;
    });
    await prefs.setInt(todayKey, todayCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radha Radha Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //   onPressed: _resetToday,
            //   child: const Text('Reset Today'),
            // ),
            // const SizedBox(height: 40),
            const Text("Overall Count", style: TextStyle(fontSize: 22)),
            Text('$overallCount', style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            const Text("Today's Count", style: TextStyle(fontSize: 22)),
            Text('$todayCount', style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 80),
            InkWell(
              onTap: _incrementCount,
              child: TRoundedContainer(
                radius: 370,
                height: 370,
                width: 370,
                borderColor: Colors.red,
                backgroundColor: Colors.yellowAccent,
                child: Center(
                  child: Text(
                      'Count', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

}