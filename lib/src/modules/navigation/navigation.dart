import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/navigation/pages/page2.dart';
import 'package:flutter_example/src/modules/navigation/pages/page_1_params.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static const List<Map<String, dynamic>> modules = [
    {"title": "Simple Navigation", "page": NavigationPage2()},
    {"title": "Parameter Navigation", "page": ParamNavigationPage1()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Page"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: modules.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(modules[index]["title"]),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => modules[index]["page"]),
            ),
          ),
        ),
      ),
    );
  }
}
