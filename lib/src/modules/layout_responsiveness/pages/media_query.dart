import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    //highly recommended to run on web/os to check the updated value
    return Scaffold(
      appBar: AppBar(
        title: const Text("MediaQuery"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text("Height: 30%"),
            ),
          ),
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text("Height: 50%"),
            ),
          ),
          Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text("Height: 20%"),
            ),
          ),
        ],
      ),
    );
  }
}
