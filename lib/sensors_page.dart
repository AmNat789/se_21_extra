import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({Key? key}) : super(key: key);

  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  List<double>? eventData;
  StreamSubscription? accelSubscription;

  void checkAccelSubscription() {
    if (accelSubscription == null) {
      accelerometerEvents.listen((AccelerometerEvent event) {
        setState(() {
          eventData = [event.x, event.y, event.z];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accelerometer Data"),
      ),
      body: Column(
        children: [
          FloatingActionButton(onPressed: checkAccelSubscription),
          Text(
              eventData != null ? eventData![0].toStringAsPrecision(4) : "null")
        ],
      ),
    );
  }

  @override
  void dispose() {
    accelSubscription?.cancel();
    super.dispose();
  }
}
