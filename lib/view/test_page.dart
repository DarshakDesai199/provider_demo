import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/test_controller.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<TestController>(context, listen: false);
    print("Build update");

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              providers.incrementTest();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              providers.refreshTest();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              providers.decrementTest();
            },
            child: Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Consumer<TestController>(
            builder: (context, value, child) => Text(
              "${providers.counter}",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ))
        ],
      ),
    );
  }
}
