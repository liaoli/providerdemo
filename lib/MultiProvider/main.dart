import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  bool _dark = false;
  bool get isDark => _dark;
  void toggleTheme() {
    _dark = !_dark;
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeModel>().isDark;
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = context.watch<CounterModel>();
    final themeModel = context.watch<ThemeModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider 示例'),
        actions: [
          IconButton(
            icon: Icon(themeModel.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeModel.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '计数器：${counterModel.count}',
          style: TextStyle(fontSize: 28),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterModel.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
