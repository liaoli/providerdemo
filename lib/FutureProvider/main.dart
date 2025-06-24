import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2));
  return "Alice";
}

void main() {
  runApp(
    FutureProvider<String>(
      create: (_) => fetchUserName(),
      initialData: "Loading...",
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = Provider.of<String>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FutureProvider 示例')),
        body: Center(child: Text('Hello, $name')),
      ),
    );
  }
}

