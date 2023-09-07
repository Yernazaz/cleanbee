import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  final textFieldMask3 = MaskTextInputFormatter(mask: '+7(###)-###-##-##');
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for pass widget.
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  String? _passControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 6) {
      return 'Минимум 6 знаков!';
    }

    return null;
  }

  // State field(s) for pass2 widget.
  TextEditingController? pass2Controller;
  late bool pass2Visibility;
  String? Function(BuildContext, String?)? pass2ControllerValidator;
  String? _pass2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 6) {
      return 'Минимум 6 знаков!';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
    textController2Validator = _textController2Validator;
    passVisibility = false;
    passControllerValidator = _passControllerValidator;
    pass2Visibility = false;
    pass2ControllerValidator = _pass2ControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    emailTextController?.dispose();
    textController2?.dispose();
    passController?.dispose();
    pass2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
