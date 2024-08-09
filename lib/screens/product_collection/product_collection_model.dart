import '/backend/backend.dart';
import '../../core/flutter_flow_icon_button.dart';
import '../../core/flutter_flow_theme.dart';
import '../../core/flutter_flow_util.dart';
import '../../core/flutter_flow_widgets.dart';
import 'product_collection_widget.dart' show ProductCollectionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCollectionModel extends FlutterFlowModel<ProductCollectionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
