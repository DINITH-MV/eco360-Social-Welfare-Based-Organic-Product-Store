import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late CategoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 27.0, 0.0, 16.0),
            child: Text(
              'CATEGORIES',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: StreamBuilder<List<CatogoriesRecord>>(
                      stream: queryCatogoriesRecord(
                        queryBuilder: (catogoriesRecord) =>
                            catogoriesRecord.orderBy('Name'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: SpinKitFadingCube(
                                color: Color(0xFF79DD71),
                                size: 30.0,
                              ),
                            ),
                          );
                        }
                        List<CatogoriesRecord> wrapCatogoriesRecordList =
                            snapshot.data!;

                        return Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(
                              wrapCatogoriesRecordList.length, (wrapIndex) {
                            final wrapCatogoriesRecord =
                                wrapCatogoriesRecordList[wrapIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'ProductCollection',
                                  queryParameters: {
                                    'collectionDetails': serializeParam(
                                      wrapCatogoriesRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 110.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFE8B6),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(14.0),
                                    topRight: Radius.circular(14.0),
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFF0C097),
                                    width: 4.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              wrapCatogoriesRecord.image,
                                              'https://i.pinimg.com/originals/0b/f5/af/0bf5af879d5a347c6c0b353a3af81526.png',
                                            ),
                                            width: 91.0,
                                            height: 75.0,
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0.0, -1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 7.0),
                                        child: Text(
                                          wrapCatogoriesRecord.name,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
