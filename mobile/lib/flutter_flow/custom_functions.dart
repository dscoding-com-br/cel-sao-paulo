import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? formatStringTime(String time) {
  if (time == '-') return '-';

  DateTime utc_time = DateTime.parse(time);
  DateTime local_time = utc_time.toLocal();

  return DateFormat('HH:mm dd/MM').format(local_time);
}
