import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'payment_ori_widget.dart' show PaymentOriWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentOriModel extends FlutterFlowModel<PaymentOriWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberTextController;
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  String? _cardNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Feild is Required';
    }

    if (val.length < 16) {
      return '16';
    }
    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})\$')
        .hasMatch(val)) {
      return 'Your Enter Number not in master or visa Card Number ';
    }
    return null;
  }

  // State field(s) for ExpDate widget.
  FocusNode? expDateFocusNode;
  TextEditingController? expDateTextController;
  String? Function(BuildContext, String?)? expDateTextControllerValidator;
  String? _expDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Feild is Required';
    }

    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(0[1-9]|1[0-2])\\/?([0-9]{2})\$').hasMatch(val)) {
      return 'Your Date formate Worng';
    }
    return null;
  }

  // State field(s) for CVC widget.
  FocusNode? cvcFocusNode;
  TextEditingController? cvcTextController;
  String? Function(BuildContext, String?)? cvcTextControllerValidator;
  String? _cvcTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Feild is Required';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {
    cardNumberTextControllerValidator = _cardNumberTextControllerValidator;
    expDateTextControllerValidator = _expDateTextControllerValidator;
    cvcTextControllerValidator = _cvcTextControllerValidator;
  }

  @override
  void dispose() {
    cardNumberFocusNode?.dispose();
    cardNumberTextController?.dispose();

    expDateFocusNode?.dispose();
    expDateTextController?.dispose();

    cvcFocusNode?.dispose();
    cvcTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }
}
