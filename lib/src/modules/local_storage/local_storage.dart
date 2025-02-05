import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  _LocalStorageState createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  String _hobby = "Loading...";
  final String _hobbyKey = "hobby";

  @override
  void initState() {
    super.initState();
    _loadHobby();
  }

  Future<void> _loadHobby() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hobby = prefs.getString(_hobbyKey) ?? "No hobby set";
    });
  }

  Future<void> _setHobby(String newHobby) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_hobbyKey, newHobby);
    _loadHobby();
  }

  Future<void> _clearHobby() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_hobbyKey);
    _loadHobby();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Storage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Hobby: $_hobby",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _setHobby("Coding"),
              child: const Text("Set Hobby to Coding"),
            ),
            ElevatedButton(
              onPressed: () => _setHobby("Gaming"),
              child: const Text("Set Hobby to Gaming"),
            ),
            ElevatedButton(
              onPressed: () => _clearHobby(),
              child: const Text("Clear Hobby"),
            ),
          ],
        ),
      ),
    );
  }
}
