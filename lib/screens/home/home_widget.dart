import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/home/banner1/banner1_widget.dart';
import '/widgets/home/banner2/banner2_widget.dart';
import '/widgets/home/categories/categories_widget.dart';
import '/widgets/home/new_arrivals/new_arrivals_widget.dart';
import '/widgets/home/products/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFCFFE5),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.banner1Model,
                  updateCallback: () => safeSetState(() {}),
                  child: Banner1Widget(),
                ),
                wrapWithModel(
                  model: _model.newArrivalsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NewArrivalsWidget(),
                ),
                wrapWithModel(
                  model: _model.productsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ProductsWidget(),
                ),
                wrapWithModel(
                  model: _model.banner2Model,
                  updateCallback: () => safeSetState(() {}),
                  child: Banner2Widget(),
                ),
                wrapWithModel(
                  model: _model.categoriesModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CategoriesWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
