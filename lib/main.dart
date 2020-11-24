import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: OverlayEx(),
    );
  }
}

class OverlayEx extends StatefulWidget {
  @override
  _OverlayExState createState() => _OverlayExState();
}

class _OverlayExState extends State<OverlayEx> {
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: 60.0,
        right: 15.0,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 10.0,
          child: Text("1"),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overlay Demo."),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showOverlay(context);
          },
          child: Text("Button Press"),
          color: Colors.green,
        ),
      ),
    );
  }
}
