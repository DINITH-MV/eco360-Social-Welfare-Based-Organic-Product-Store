import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/home_page/banner01/banner01_widget.dart';
import '/widgets/home_page/banner02/banner02_widget.dart';
import '/widgets/home_page/categories/categories_widget.dart';
import '/widgets/home_page/new_arrivals/new_arrivals_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Banner01 component.
  late Banner01Model banner01Model;
  // Model for NewArrivals component.
  late NewArrivalsModel newArrivalsModel;
  // Model for Banner02 component.
  late Banner02Model banner02Model;
  // Model for Categories component.
  late CategoriesModel categoriesModel;

  @override
  void initState(BuildContext context) {
    banner01Model = createModel(context, () => Banner01Model());
    newArrivalsModel = createModel(context, () => NewArrivalsModel());
    banner02Model = createModel(context, () => Banner02Model());
    categoriesModel = createModel(context, () => CategoriesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    banner01Model.dispose();
    newArrivalsModel.dispose();
    banner02Model.dispose();
    categoriesModel.dispose();
  }
}
