import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/animations/animations.dart';
import 'package:flutter_example/src/modules/http_networking/http_networking.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/layout_responsive_page.dart';
import 'package:flutter_example/src/modules/local_storage/local_storage.dart';
import 'package:flutter_example/src/modules/navigation/navigation.dart';
import 'package:flutter_example/src/modules/state_management/state_management.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, dynamic>> modules = [
    {
      "title": "Responsive UI",
      "page": LayoutResponsivePage(),
      "route": "/responsive-page"
    },
    {"title": "Navigation", "page": NavigationPage(), "route": "/navigation"},
    {
      "title": "State Management",
      "page": StateManagement(),
      "route": "/state-management"
    },
    {
      "title": "Penyimpanan Data Lokal",
      "page": LocalStorage(),
      "route": "/local-storage"
    },
    {"title": "Konsumsi API", "page": ConsumeApi(), "route": "/consume-api"},
    {"title": "Animation", "page": AnimationPages(), "route": "/animation"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Basic Examples"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: modules.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(modules[index]["title"]),
            onTap: () {
              // //widget/page based navigation
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => modules[index]["page"]),
              // );

              //declared route based navigation
              Navigator.pushNamed(context, modules[index]["route"]);
            },
          ),
        ),
      ),
    );
  }
}
