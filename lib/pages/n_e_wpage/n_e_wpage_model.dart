import '../../core/theme.dart';
import '../../core/util.dart';
import '../../core/widgets.dart';
import 'n_e_wpage_widget.dart' show NEWpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NEWpageModel extends eco360Model<NEWpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
