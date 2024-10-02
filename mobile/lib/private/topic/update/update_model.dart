import '/backend/api_requests/api_calls.dart';
import '/components/navigation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_widget.dart' show UpdateWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateModel extends FlutterFlowModel<UpdateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Backend Call - API (TopicUpdate)] action in Button widget.
  ApiCallResponse? responseCommunityUpdate;
  // Model for Navigation component.
  late NavigationModel navigationModel;
  // Stores action output result for [Backend Call - API (TopicClear)] action in Button widget.
  ApiCallResponse? responseMessagesClear;
  // Stores action output result for [Backend Call - API (TopicDelete)] action in Button widget.
  ApiCallResponse? responseTopicDelete;

  @override
  void initState(BuildContext context) {
    navigationModel = createModel(context, () => NavigationModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    navigationModel.dispose();
  }
}
