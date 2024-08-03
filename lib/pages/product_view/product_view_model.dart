import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '../../core/count_controller.dart';
import '../../core/drop_down.dart';
import '../../core/icon_button.dart';
import '../../core/theme.dart';
import '../../core/util.dart';
import '../../core/widgets.dart';
import '../../core/form_field_controller.dart';
import '../../core/custom_functions.dart' as functions;
import 'product_view_widget.dart' show ProductViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends eco360Model<ProductViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CartRecord? cartDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
