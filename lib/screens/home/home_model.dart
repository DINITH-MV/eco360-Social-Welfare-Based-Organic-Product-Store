import '../../core/flutter_flow_theme.dart';
import '../../core/flutter_flow_util.dart';
import '../../core/flutter_flow_widgets.dart';
import '/widgets/home_page/banner01/banner01_widget.dart';
import '/widgets/home_page/banner02/banner02_widget.dart';
import '/widgets/home_page/categories/categories_widget.dart';
import '/widgets/home_page/new_arrivals/new_arrivals_widget.dart';
import '/widgets/home_page/products/products_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Banner01 component.
  late Banner01Model banner01Model;
  // Model for NewArrivals component.
  late NewArrivalsModel newArrivalsModel;
  // Model for Products component.
  late ProductsModel productsModel;
  // Model for Banner02 component.
  late Banner02Model banner02Model;
  // Model for Categories component.
  late CategoriesModel categoriesModel;

  @override
  void initState(BuildContext context) {
    banner01Model = createModel(context, () => Banner01Model());
    newArrivalsModel = createModel(context, () => NewArrivalsModel());
    productsModel = createModel(context, () => ProductsModel());
    banner02Model = createModel(context, () => Banner02Model());
    categoriesModel = createModel(context, () => CategoriesModel());
  }

  @override
  void dispose() {
    banner01Model.dispose();
    newArrivalsModel.dispose();
    productsModel.dispose();
    banner02Model.dispose();
    categoriesModel.dispose();
  }
}
