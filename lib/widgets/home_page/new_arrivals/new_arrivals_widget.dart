import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_arrivals_model.dart';
export 'new_arrivals_model.dart';

class NewArrivalsWidget extends StatefulWidget {
  const NewArrivalsWidget({super.key});

  @override
  State<NewArrivalsWidget> createState() => _NewArrivalsWidgetState();
}

class _NewArrivalsWidgetState extends State<NewArrivalsWidget> {
  late NewArrivalsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewArrivalsModel());

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
      height: 327.0,
      decoration: BoxDecoration(
        color: Color(0xFFEAE0B2),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(17.0, 10.0, 0.0, 0.0),
        child: Container(
          height: 287.0,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 7.0, 0.0, 10.0),
                  child: Text(
                    'NEW ARRIVALS',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Ubuntu',
                          color: Color(0xFF111111),
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord.where(
                      'NewArrival',
                      isEqualTo: true,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 90.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: SpinKitFadingCube(
                              color: Color(0xFF226B1B),
                              size: 30.0,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> rowProductsRecordList = snapshot.data!;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowProductsRecordList.length,
                            (rowIndex) {
                          final rowProductsRecord =
                              rowProductsRecordList[rowIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ProductView',
                                queryParameters: {
                                  'productDetails': serializeParam(
                                    rowProductsRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFFFFDEA),
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  11.0, 10.0, 11.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                rowProductsRecord.image,
                                                'https://cdn.pixabay.com/photo/2020/08/05/13/28/eco-5465481_960_720.png',
                                              ),
                                              width: 170.0,
                                              height: 180.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: 170.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            123.0, 12.0, 0.0, 0.0),
                                        child: Container(
                                          width: 53.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 5.0,
                                                  sigmaY: 2.0,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x9AFFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE5E7EB),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Color(
                                                                0xFF15161E),
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      rowProductsRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 8.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              formatNumber(
                                                rowProductsRecord.price,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$',
                                              ),
                                              '\$20.00',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF1E1E1E),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF606A85),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
