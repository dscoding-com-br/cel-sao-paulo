import '/backend/api_requests/api_calls.dart';
import '/components/message_widget.dart';
import '/components/no_messages_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Message dynamic component.
  late FlutterFlowDynamicModels<MessageModel> messageModels;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // Stores action output result for [Backend Call - API (MessageSend)] action in send widget.
  ApiCallResponse? apiResponse;

  @override
  void initState(BuildContext context) {
    messageModels = FlutterFlowDynamicModels(() => MessageModel());
  }

  @override
  void dispose() {
    messageModels.dispose();
    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }
}
