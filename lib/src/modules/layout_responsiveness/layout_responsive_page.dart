import 'package:flutter/material.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/pages/aspect_ratio.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/pages/flexible_expanded.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/pages/layout_builder.dart';
import 'package:flutter_example/src/modules/layout_responsiveness/pages/media_query.dart';

class LayoutResponsivePage extends StatelessWidget {
  const LayoutResponsivePage({super.key});

  static const List<Map<String, dynamic>> responsiveUIModules = [
    {"title": "Flexible & Expanded", "page": FlexibleExpanded()},
    {"title": "LayoutBuilder", "page": LayoutBuilderPage()},
    {"title": "MediaQuery", "page": MediaQueryPage()},
    {"title": "Aspect Ratio", "page": AspectRatioPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive UI"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: responsiveUIModules.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(responsiveUIModules[index]["title"]),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => responsiveUIModules[index]["page"]),
            ),
          ),
        ),
      ),
    );
  }
}
