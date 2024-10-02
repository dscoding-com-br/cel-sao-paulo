import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/navigation_widget.dart';
import '/components/no_communities_widget.dart';
import '/components/topic_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Topic dynamic component.
  late FlutterFlowDynamicModels<TopicModel> topicModels;
  // Model for Navigation component.
  late NavigationModel navigationModel;

  @override
  void initState(BuildContext context) {
    topicModels = FlutterFlowDynamicModels(() => TopicModel());
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    topicModels.dispose();
    navigationModel.dispose();
  }
}
