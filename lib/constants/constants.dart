import 'package:flutter/material.dart';

class Constants {
  static String apiUrl = "https://nice-cat-81.loca.lt/api/";
}

var ORDER_STATUSES = {
  "pending": {
    "text": "Pending",
    "color": Colors.deepOrange,
  },
  "approved": {
    "text": "Approved",
    "color": Colors.lightBlue,
  },
  "completed": {
    "text": "Completed",
    "color": Colors.green,
  },
  "canceled": {
    "text": "Canceled",
    "color": Colors.red,
  }
};
