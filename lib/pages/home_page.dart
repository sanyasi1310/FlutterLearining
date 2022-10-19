import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyBAPS App"),
      ),
      body: Container(
          child: const Center(
        child: Text('Jay Swaminarayan'),
      )),
      drawer: Drawer(),
    );
  }
}
