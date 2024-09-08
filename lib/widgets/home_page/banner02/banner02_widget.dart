import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'banner02_model.dart';
export 'banner02_model.dart';

class Banner02Widget extends StatefulWidget {
  const Banner02Widget({super.key});

  @override
  State<Banner02Widget> createState() => _Banner02WidgetState();
}

class _Banner02WidgetState extends State<Banner02Widget> {
  late Banner02Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Banner02Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 254.0,
      decoration: BoxDecoration(
        color: Color(0xFFEAE0B2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 18.0, 17.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 220.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Color(0xFF598842),
                  width: 7.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/sdgbanner.png',
                  width: 300.0,
                  height: 210.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
