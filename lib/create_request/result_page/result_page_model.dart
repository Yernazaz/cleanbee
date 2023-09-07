import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/create_request/create_address/create_address_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DocumentReference? address;

  String? city = '';

  String? adres = '';

  String? building = '';

  String? comment = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - CreateAddress] action in Text widget.
  DocumentReference? newAddress;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  AdressesRecord? address0;
  // Stores action output result for [Bottom Sheet - CreateAddress] action in Button widget.
  DocumentReference? newAddress1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AdressesRecord? address1;
  // Stores action output result for [Custom Action - customDateTimePicker] action in Button widget.
  DateTime? sd;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestsRecord? newRequest;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
