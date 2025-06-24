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
        body: DemoPage(),
      ),
    );
  }
}

class ToggleModel extends ChangeNotifier {
  bool _on = false;
  bool get isOn => _on;

  void toggle() {
    _on = !_on;
    notifyListeners();
  }
}

class ToggleSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ToggleModel(),
      child: Consumer<ToggleModel>(
        builder: (_, model, __) => Switch(
          value: model.isOn,
          onChanged: (_) => model.toggle(),
        ),
      ),
    );
  }
}


class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("局部组件 Provider")),
      body: Center(child: ToggleSwitch()),
    );
  }
}

