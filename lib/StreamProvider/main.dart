import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
Stream<int> countdownStream() {
  return Stream.periodic(Duration(seconds: 1), (x) => 10 - x).take(11);
}

void main() {
  runApp(
    StreamProvider<int>(
      create: (_) => countdownStream(),
      initialData: 10,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<int>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StreamProvider 示例')),
        body: Center(child: Text('倒计时: $count')),
      ),
    );
  }
}

