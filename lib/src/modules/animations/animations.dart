import 'package:flutter/material.dart';

class AnimatedWidgetsExample extends StatefulWidget {
  @override
  _AnimatedWidgetsExampleState createState() => _AnimatedWidgetsExampleState();
}

class _AnimatedWidgetsExampleState extends State<AnimatedWidgetsExample> {
  bool _isExpanded = false;
  bool _isVisible = true;
  Alignment _alignment = Alignment.topLeft;
  double _padding = 10.0;
  bool _showFirstWidget = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;
    });
  }

  void _changePadding() {
    setState(() {
      _padding = _padding == 10.0 ? 30.0 : 10.0;
    });
  }

  void _toggleCrossFade() {
    setState(() {
      _showFirstWidget = !_showFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // AnimatedContainer
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _isExpanded ? 200.0 : 100.0,
            height: _isExpanded ? 200.0 : 100.0,
            color: _isExpanded ? Colors.blue : Colors.red,
            curve: Curves.easeInOut,
            child: const Center(
              child: Text(
                'AnimatedContainer',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _toggleExpanded,
            child: Text('Toggle Container'),
          ),

          SizedBox(height: 20),

          // AnimatedOpacity
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 10),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'AnimatedOpacity',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _toggleVisibility,
            child: Text('Toggle Opacity'),
          ),

          SizedBox(height: 20),

          // AnimatedAlign
          Container(
            width: 200.0,
            height: 200.0,
            color: Colors.yellow,
            child: AnimatedAlign(
              alignment: _alignment,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    'Align',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _changeAlignment,
            child: Text('Toggle Align'),
          ),

          SizedBox(height: 20),

          // AnimatedPadding
          AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'AnimatedPadding',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _changePadding,
            child: Text('Toggle Padding'),
          ),

          SizedBox(height: 20),

          // AnimatedCrossFade
          AnimatedCrossFade(
            duration: Duration(seconds: 1),
            crossFadeState: _showFirstWidget
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.teal,
              child: const Center(
                child: Text(
                  'First Widget',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            secondChild: Container(
              width: 150.0,
              height: 150.0,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  'Second Widget',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _toggleCrossFade,
            child: Text('Toggle CrossFade'),
          ),
        ],
      ),
    );
  }
}
