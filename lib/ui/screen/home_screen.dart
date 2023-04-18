import 'package:attendance_server/provider/server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(child: Column(children: [
        Text(context.watch<ServerProvider>().serverState.toString()),
        ElevatedButton(onPressed: context.read<ServerProvider>().start, child: Text('Start')),
        ElevatedButton(onPressed: context.read<ServerProvider>().close, child: Text('Stop')),

      ],)) ,
      
    );
  }
}
