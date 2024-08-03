import '../../core/theme.dart';
import '../../core/util.dart';
import '../../core/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_e_wpage_model.dart';
export 'n_e_wpage_model.dart';

class NEWpageWidget extends StatefulWidget {
  const NEWpageWidget({super.key});

  @override
  State<NEWpageWidget> createState() => _NEWpageWidgetState();
}

class _NEWpageWidgetState extends State<NEWpageWidget> {
  late NEWpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NEWpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: eco360Theme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: eco360Theme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: eco360Theme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
