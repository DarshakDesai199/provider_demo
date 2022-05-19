import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/counter_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterController>(context, listen: false);
    print("Build Called");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterController>(
              builder: (context, value, child) {
                return Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              provider.incrementCounter();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              provider.decrementCounter();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          Consumer<CounterController>(
            builder: (context, value, child) => FloatingActionButton(
              backgroundColor: provider.counter == 0 ? Colors.red : Colors.blue,
              onPressed: () {
                provider.resetCounter();
              },
              tooltip: 'Reset',
              child: Icon(Icons.refresh),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
