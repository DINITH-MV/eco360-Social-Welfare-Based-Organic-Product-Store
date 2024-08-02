import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? increment(
  double price,
  int quantity,
) {
  return price * quantity;
}

double? delete(double value) {
  return value * -1;
}

double? taxValue(double value) {
  return value * 12 / 100;
}

double? totalWithTax(double value) {
  return value * 112 / 100;
}
