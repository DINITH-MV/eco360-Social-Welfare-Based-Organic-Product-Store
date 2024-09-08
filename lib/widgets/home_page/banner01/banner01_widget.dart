import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'banner01_model.dart';
export 'banner01_model.dart';

class Banner01Widget extends StatefulWidget {
  const Banner01Widget({super.key});

  @override
  State<Banner01Widget> createState() => _Banner01WidgetState();
}

class _Banner01WidgetState extends State<Banner01Widget> {
  late Banner01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Banner01Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(17.0, 20.0, 17.0, 20.0),
      child: Container(
        width: 378.0,
        height: 220.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(24.0),
          ),
          border: Border.all(
            color: Color(0xFFE1A96E),
            width: 7.0,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(17.0),
              ),
              child: Image.asset(
                'assets/images/main_banner.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
