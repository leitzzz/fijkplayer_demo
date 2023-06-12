import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();

    player.setDataSource("http://x.x.x.x:8080/2125/2125.m3u8", autoPlay: true);

    Wakelock.enable();
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FijkView(
          player: player,
        ),
      ),
    );
  }
}
