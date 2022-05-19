import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/counter_controller.dart';
import 'package:provider_demo/controller/test_controller.dart';
import 'package:provider_demo/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: ""),
      ),
    );
  }
}
