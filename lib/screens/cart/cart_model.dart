import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/cart/cart_product_view_card/cart_product_view_card_widget.dart';
import '/widgets/cart/order_summary/order_summary_widget.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OrderSummary component.
  late OrderSummaryModel orderSummaryModel;

  @override
  void initState(BuildContext context) {
    orderSummaryModel = createModel(context, () => OrderSummaryModel());
  }

  @override
  void dispose() {
    orderSummaryModel.dispose();
  }
}
