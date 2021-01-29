import 'package:flutter/material.dart';
import 'package:flutter_singleton_playground/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    CounterStatic.instance.init(5);
    super.initState();
  }

  void _decrementCounter() {
    CounterStatic.instance.decrease();
    CounterFactory().decrease();
    setState(() {});
  }

  void _incrementCounter() {
    CounterStatic.instance.increase();
    CounterFactory().increase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Singleton Playground')),
      body: _buildBody(),
      floatingActionButton: _buildButtons(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 16),
        _generateRow('Static singleton', CounterStatic.instance.count),
        _generateRow('Factory singleton', CounterFactory().count),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            CounterFactory().init(3);
            setState(() {});
          },
          child: Text('Initial Factory Counter'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.exposure_plus_1),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }

  Widget _generateRow(String labelText, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Text('$labelText: ', style: TextStyle(fontSize: 16)),
          Text(value.toString(), style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
