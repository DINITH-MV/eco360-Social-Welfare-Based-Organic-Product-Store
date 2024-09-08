import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/categories/categories_widget.dart';
import '/widgets/home_page/banner01/banner01_widget.dart';
import '/widgets/home_page/banner02/banner02_widget.dart';
import '/widgets/home_page/new_arrivals/new_arrivals_widget.dart';
import '/widgets/home_page/products/products_widget.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.banner01Model,
                  updateCallback: () => safeSetState(() {}),
                  child: Banner01Widget(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.newArrivalsModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NewArrivalsWidget(),
                  ),
                ),
                wrapWithModel(
                  model: _model.productsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ProductsWidget(),
                ),
                wrapWithModel(
                  model: _model.banner02Model,
                  updateCallback: () => safeSetState(() {}),
                  child: Banner02Widget(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: wrapWithModel(
                    model: _model.categoriesModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CategoriesWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
