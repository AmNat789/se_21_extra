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
        handleProgress();
      });
    }
  }

  void handleProgress() {
    var speedOfMovement =
        eventData!.reduce((value, element) => value * element).abs();

    if (speedOfMovement > 50) {
      progress += 0.01;
      if (progress >= 1) {
        progress = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Shaker 3000"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Shake your phone!!!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ProgressBar(
                progress: progress,
                maxWidth: deviceWidth - 32,
              ),
            ),
            eventData != null
                ? Column(
                    children: [
                      Text(
                        "Accelerometer readings",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                      Text("x: ${eventData![0].toStringAsPrecision(4)}"),
                      Text("y: ${eventData![1].toStringAsPrecision(4)}"),
                      Text("z: ${eventData![2].toStringAsPrecision(4)}"),
                    ],
                  )
                : Container(
                    child: Text(
                        "Something went wrong. Please make sure this app is able to use accelerometer data"),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    accelSubscription?.cancel();
    super.dispose();
  }
}
