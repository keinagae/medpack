import 'package:flutter/material.dart';

class Constants {
  static String apiUrl = "https://med-hope.herokuapp.com/api/";
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
