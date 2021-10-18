import 'package:flutter/material.dart';

class Activity {
  final String activity;
  final String type;

  Activity({
    required this.activity,
    required this.type
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json["activity"],
      type: json["type"]
    );
  }
}