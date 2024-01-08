import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  const SharedPrefPage({super.key, required this.title});

  final String title;

  @override
  State<SharedPrefPage> createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  static const String counterNumberPrefs = 'counterNumber';

  int _counter = 0;

  void _saveNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterNumberPrefs, _counter);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveNumber();
    });
  }

  void _loadNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterNumberPrefs) ?? 0;
    });
  }

  void _resetNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(counterNumberPrefs);
    _loadNumber();
  }

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
              onPressed: () {
                _resetNumber();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
