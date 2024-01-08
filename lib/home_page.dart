import 'package:flutter/material.dart';
import 'package:penyimpanan_lokal/pages/shared_pref_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokal Penyimpanan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SharedPrefPage(title: 'Shared Preferencse'),
                  ),
                );
              },
              child: const Text('Shared Preferences'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Database Lokal (SQLite)'),
            ),
          ],
        ),
      ),
    );
  }
}
