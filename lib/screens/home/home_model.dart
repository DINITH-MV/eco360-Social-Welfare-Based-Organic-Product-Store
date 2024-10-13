import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/home/banner1/banner1_widget.dart';
import '/widgets/home/banner2/banner2_widget.dart';
import '/widgets/home/categories/categories_widget.dart';
import '/widgets/home/new_arrivals/new_arrivals_widget.dart';
import '/widgets/home/products/products_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Banner1 component.
  late Banner1Model banner1Model;
  // Model for NewArrivals component.
  late NewArrivalsModel newArrivalsModel;
  // Model for Products component.
  late ProductsModel productsModel;
  // Model for Banner2 component.
  late Banner2Model banner2Model;
  // Model for Categories component.
  late CategoriesModel categoriesModel;

  @override
  void initState(BuildContext context) {
    banner1Model = createModel(context, () => Banner1Model());
    newArrivalsModel = createModel(context, () => NewArrivalsModel());
    productsModel = createModel(context, () => ProductsModel());
    banner2Model = createModel(context, () => Banner2Model());
    categoriesModel = createModel(context, () => CategoriesModel());
  }

  @override
  void dispose() {
    banner1Model.dispose();
    newArrivalsModel.dispose();
    productsModel.dispose();
    banner2Model.dispose();
    categoriesModel.dispose();
  }
}
