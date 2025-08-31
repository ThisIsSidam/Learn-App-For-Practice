import 'package:flutter/material.dart';

// Example of ChangeNotifier without any external plugin

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void incrementB() {
    _count++;
  }
}

class ChangeNotifierApp extends StatelessWidget {
  const ChangeNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterModel _counterModel;

  @override
  void initState() {
    super.initState();
    _counterModel = CounterModel();
  }

  @override
  void dispose() {
    _counterModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier without Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            ListenableBuilder(
              listenable: _counterModel,
              builder: (BuildContext context, Widget? child) {
                return Text(
                  '${_counterModel.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The onPressed callback directly calls the method on our model instance.
        onPressed: () => _counterModel.incrementB(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
