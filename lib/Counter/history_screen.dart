

// ================= History Screen ==================
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});


  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}


class _HistoryScreenState extends State<HistoryScreen> {
  Map<String, int> dailyCounts = {};


  @override
  void initState() {
    super.initState();
    _loadAllDays();
  }


  Future<void> _loadAllDays() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();


    Map<String, int> temp = {};
    for (var key in keys) {
      if (key.startsWith('count_')) {
        temp[key] = prefs.getInt(key) ?? 0;
      }
    }


    setState(() {
      dailyCounts = temp;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily History')),
      body: dailyCounts.isEmpty
          ? const Center(child: Text('No records found'))
          : ListView(
        padding: const EdgeInsets.all(16),
        children: dailyCounts.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(entry.key.replaceFirst('count_', '').replaceAll('_', '-')),
              trailing: Text(entry.value.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
