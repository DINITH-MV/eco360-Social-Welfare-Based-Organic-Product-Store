import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/instructions_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'product_fabrication_model.dart';
export 'product_fabrication_model.dart';

class ProductFabricationWidget extends StatefulWidget {
  const ProductFabricationWidget({super.key});

  @override
  State<ProductFabricationWidget> createState() =>
      _ProductFabricationWidgetState();
}

class _ProductFabricationWidgetState extends State<ProductFabricationWidget>
    with TickerProviderStateMixin {
  late ProductFabricationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFabricationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: InstructionsWidget(),
            ),
          );
        },
      );
    });

    _model.productNameTextController ??= TextEditingController();
    _model.productNameFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 4000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 14.0),
                          child: Text(
                            'Fabricate Your product',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Work Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.83,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6E7D4),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: 270.0,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFF5EA31B),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                            allowVideo: true,
                                            textColor: Colors.black,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              _model.uploadedFileUrl,
                                              'https://img.freepik.com/premium-photo/leaves-tree-are-green-color-is-beautiful-pattern_1021867-32264.jpg',
                                            ),
                                            width: 270.0,
                                            height: 300.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 90.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.white,
                                            size: 72.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Add Photo or Video',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              'Upload an image (270px * 300px) ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 7.0),
                                child: Container(
                                  width: 320.0,
                                  child: TextFormField(
                                    controller:
                                        _model.productNameTextController,
                                    focusNode: _model.productNameFocusNode,
                                    autofocus: true,
                                    autofillHints: [AutofillHints.email],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Name your product (any name)',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF4F4F4F),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFA3851B),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFFBFFED),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model
                                        .productNameTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Container(
                                width: 320.0,
                                height: 66.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 320.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFFEE),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFFA3851B),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            'Colour to get\nmanufactured\n',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFF4F4F4F),
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 6.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _colorPickedColor =
                                                await showFFColorPicker(
                                              context,
                                              currentColor: _model
                                                      .colorPicked ??=
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              showRecentColors: true,
                                              allowOpacity: true,
                                              textColor: Color(0xFF95ACBD),
                                              secondaryTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              primaryButtonBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              primaryButtonTextColor:
                                                  Colors.white,
                                              primaryButtonBorderColor:
                                                  Colors.transparent,
                                              displayAsBottomSheet:
                                                  isMobileWidth(context),
                                            );

                                            if (_colorPickedColor != null) {
                                              safeSetState(() =>
                                                  _model.colorPicked =
                                                      _colorPickedColor);
                                            }
                                          },
                                          child: Container(
                                            width: 160.0,
                                            height: 34.0,
                                            constraints: BoxConstraints(
                                              minWidth: 48.0,
                                              minHeight: 48.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                _model.colorPicked,
                                                Color(0xFFB0D489),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              border: Border.all(
                                                color: Color(0xFF717171),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 14.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.apiResult6m =
                                        await CostEstimationCall.call(
                                      imageUrl: _model.uploadedFileUrl,
                                    );

                                    if ((_model.apiResult6m?.succeeded ??
                                        true)) {
                                      await Future.wait([
                                        Future(() async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Price Received',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Color(0xFF894214),
                                                  fontSize: 19.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFFE3D196),
                                            ),
                                          );
                                        }),
                                        Future(() async {
                                          _model.soundPlayer1 ??= AudioPlayer();
                                          if (_model.soundPlayer1!.playing) {
                                            await _model.soundPlayer1!.stop();
                                          }
                                          _model.soundPlayer1!.setVolume(1.0);
                                          _model.soundPlayer1!
                                              .setAsset(
                                                  'assets/audios/level-up-191997.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer1!.play());
                                        }),
                                      ]);
                                    } else {
                                      await Future.wait([
                                        Future(() async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Try again later',
                                                style: TextStyle(
                                                  color: Color(0xFF894214),
                                                  fontSize: 19.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0xFFE3D196),
                                            ),
                                          );
                                        }),
                                        Future(() async {
                                          _model.soundPlayer2 ??= AudioPlayer();
                                          if (_model.soundPlayer2!.playing) {
                                            await _model.soundPlayer2!.stop();
                                          }
                                          _model.soundPlayer2!.setVolume(1.0);
                                          _model.soundPlayer2!
                                              .setAsset(
                                                  'assets/audios/new-message-143041.mp3')
                                              .then((_) =>
                                                  _model.soundPlayer2!.play());
                                        }),
                                      ]);
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Request the price',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 46.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFC9A344),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Color(0x00FFFFFF),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 360.0,
                                child: Divider(
                                  thickness: 3.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width: 320.0,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 320.0,
                                        height: 152.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFBFFED),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: Color(0xFFA3851B),
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            'Price Break Down',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'PT Sans',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  130.0, 80.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                CostEstimationCall.lkr(
                                                  (_model.apiResult6m
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: 'Rs: ',
                                              ),
                                              'Rs: 0.00',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFFB41C1C),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 80.0, 0.0, 0.0),
                                          child: Text(
                                            'price in LKR :',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 110.0, 0.0, 0.0),
                                          child: Text(
                                            'price in USD :',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  131.0, 110.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                CostEstimationCall.usd(
                                                  (_model.apiResult6m
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$ ',
                                              ),
                                              '\$ 0.00',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Color(0xFFB41C1C),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 50.0, 0.0, 0.0),
                                          child: Text(
                                            'product type :',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  136.0, 50.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              CostEstimationCall.pType(
                                                (_model.apiResult6m?.jsonBody ??
                                                    ''),
                                              ),
                                              'Bucket',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 11.0, 0.0, 20.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Make the Order',
                                  options: FFButtonOptions(
                                    width: 270.0,
                                    height: 46.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFA37E1A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
