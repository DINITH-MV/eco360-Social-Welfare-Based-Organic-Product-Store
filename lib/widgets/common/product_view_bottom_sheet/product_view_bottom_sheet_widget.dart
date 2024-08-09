import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_view_bottom_sheet_model.dart';
export 'product_view_bottom_sheet_model.dart';

class ProductViewBottomSheetWidget extends StatefulWidget {
  const ProductViewBottomSheetWidget({
    super.key,
    required this.collectionDetails,
  });

  final DocumentReference? collectionDetails;

  @override
  State<ProductViewBottomSheetWidget> createState() =>
      _ProductViewBottomSheetWidgetState();
}

class _ProductViewBottomSheetWidgetState
    extends State<ProductViewBottomSheetWidget> {
  late ProductViewBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductViewBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 700.0,
        decoration: BoxDecoration(
          color: Color(0xFFECE8D5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: StreamBuilder<ProductsRecord>(
            stream: ProductsRecord.getDocument(widget!.collectionDetails!),
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

              final columnProductsRecord = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              columnProductsRecord.image,
                              'https://i.pinimg.com/originals/0b/f5/af/0bf5af879d5a347c6c0b353a3af81526.png',
                            ),
                            width: 260.0,
                            height: 260.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        columnProductsRecord.name,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                      child: Text(
                        columnProductsRecord.description,
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: StreamBuilder<List<ProductColoursRecord>>(
                        stream: queryProductColoursRecord(
                          queryBuilder: (productColoursRecord) =>
                              productColoursRecord.where(
                            'ProductID',
                            isEqualTo: columnProductsRecord.reference.id,
                          ),
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
                          List<ProductColoursRecord>
                              containerProductColoursRecordList =
                              snapshot.data!;

                          return Container(
                            width: 325.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(14.0),
                                topRight: Radius.circular(14.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController1 ??=
                                          FormFieldController<String>(null),
                                  options: containerProductColoursRecordList
                                      .map((e) => valueOrDefault<String>(
                                            e.colour,
                                            'Brown',
                                          ))
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue1 = val),
                                  width: 325.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Colour',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: StreamBuilder<List<ProductSizeRecord>>(
                        stream: queryProductSizeRecord(
                          queryBuilder: (productSizeRecord) =>
                              productSizeRecord.where(
                            'ProductID',
                            isEqualTo: widget!.collectionDetails?.id,
                          ),
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
                          List<ProductSizeRecord>
                              containerProductSizeRecordList = snapshot.data!;

                          return Container(
                            width: 325.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<String>(null),
                                    options: containerProductSizeRecordList
                                        .map((e) => valueOrDefault<String>(
                                              e.size,
                                              '0',
                                            ))
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue2 = val),
                                    width: 325.0,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Size',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  72.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 156.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 0.0),
                                        child: Text(
                                          'Quantity',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 0.0),
                                        child: Container(
                                          width: 140.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFFA9A9A9),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 16.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 16.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            count: _model
                                                .countControllerValue ??= 0,
                                            updateCount: (count) => setState(
                                                () => _model
                                                        .countControllerValue =
                                                    count),
                                            stepSize: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var cartRecordReference =
                                      CartRecord.collection.doc();
                                  await cartRecordReference.set({
                                    ...createCartRecordData(
                                      productName: columnProductsRecord.name,
                                      quantity: _model.countControllerValue,
                                      productID:
                                          columnProductsRecord.reference.id,
                                      price: functions.increment(
                                          columnProductsRecord.price.toDouble(),
                                          _model.countControllerValue!),
                                      size: _model.dropDownValue2,
                                      colour: _model.dropDownValue1,
                                      image: columnProductsRecord.image,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_at':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.cartDoc =
                                      CartRecord.getDocumentFromData({
                                    ...createCartRecordData(
                                      productName: columnProductsRecord.name,
                                      quantity: _model.countControllerValue,
                                      productID:
                                          columnProductsRecord.reference.id,
                                      price: functions.increment(
                                          columnProductsRecord.price.toDouble(),
                                          _model.countControllerValue!),
                                      size: _model.dropDownValue2,
                                      colour: _model.dropDownValue1,
                                      image: columnProductsRecord.image,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_at': DateTime.now(),
                                      },
                                    ),
                                  }, cartRecordReference);
                                  FFAppState().sum =
                                      FFAppState().sum + _model.cartDoc!.price;
                                  FFAppState().update(() {});

                                  context.pushNamed('Cart');

                                  setState(() {});
                                },
                                child: Container(
                                  width: 165.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6C9A6C),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x411D2429),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Add to Cart',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Noto Sans JP',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
