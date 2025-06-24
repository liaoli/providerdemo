import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LocalCounterPage(),
      ),
    );
  }
}

class LocalCounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class LocalCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocalCounterModel>(
      create: (_) => LocalCounterModel(),
      child: Scaffold(
        appBar: AppBar(title: Text("局部 Provider 示例")),
        body: Center(
          child: Consumer<LocalCounterModel>(
            builder: (_, model, __) => Text(
              '局部计数：${model.count}',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => context.read<LocalCounterModel>().increment(),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
