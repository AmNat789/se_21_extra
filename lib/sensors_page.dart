import 'dart:async';

import 'package:flutter/material.dart';
import 'package:se_21/progress_bar.dart';
import 'package:sensors/sensors.dart';

class SensorsPage extends StatefulWidget {
  const SensorsPage({Key? key}) : super(key: key);

  @override
  _SensorsPageState createState() => _SensorsPageState();
}

class _SensorsPageState extends State<SensorsPage> {
  late double progress;

  List<double>? eventData;
  StreamSubscription? accelSubscription;

  @override
  void initState() {
    super.initState();
    progress = 0;
    checkAccelSubscription();
  }

  void checkAccelSubscription() {
    if (accelSubscription == null) {
      userAccelerometerEvents.listen((UserAccelerometerEvent event) {
        setState(() {
          eventData = [event.x, event.y, event.z];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accelerometer Data"),
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Center(child: ProgressBar(progress: 1, maxWidth: deviceWidth - 32)),
          SizedBox(height: 16),
          eventData != null
              ? Column(
                  children: [
                    Text("x: ${eventData![0].toStringAsPrecision(4)}"),
                    Text("y: ${eventData![1].toStringAsPrecision(4)}"),
                    Text("z: ${eventData![2].toStringAsPrecision(4)}"),
                  ],
                )
              : Container(
                  child: Text(
                      "Something went wrong. Please make sure this app is allowed to use accelerometer data"),
                ),
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
