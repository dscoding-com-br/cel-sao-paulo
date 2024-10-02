import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'topic_preview_widget.dart' show TopicPreviewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopicPreviewModel extends FlutterFlowModel<TopicPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (TopicSubscribe)] action in Icon widget.
  ApiCallResponse? resultTopicSubscribe;
  // Stores action output result for [Backend Call - API (TopicUnsubscribe)] action in Icon widget.
  ApiCallResponse? resultTopicUnscribe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
