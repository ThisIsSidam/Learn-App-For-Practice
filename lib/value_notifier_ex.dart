import 'package:flutter/material.dart';

// Example for ValueNotifier

class ValueNotifierApp extends StatelessWidget {
  const ValueNotifierApp({super.key});

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
  late final ValueNotifier<int> _counterNotifier;

  @override
  void initState() {
    super.initState();
    _counterNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _counterNotifier.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    _counterNotifier.value = _counterNotifier.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            ValueListenableBuilder<int>(
              valueListenable: _counterNotifier,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
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
