import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/ims/add_new_product_modal/add_new_product_modal_widget.dart';
import '/ims/product_options/product_options_widget.dart';
import '/pages/side_nav/side_nav_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ims_page_model.dart';
export 'ims_page_model.dart';

class ImsPageWidget extends StatefulWidget {
  const ImsPageWidget({super.key});

  static String routeName = 'ImsPage';
  static String routePath = '/imsPage';

  @override
  State<ImsPageWidget> createState() => _ImsPageWidgetState();
}

class _ImsPageWidgetState extends State<ImsPageWidget>
    with TickerProviderStateMixin {
  late ImsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isArchived = false;
      safeSetState(() {});
      _model.productsInitList = await ProductsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'archived',
          _model.isArchived,
        ),
      );
      _model.productList =
          _model.productsInitList!.toList().cast<ProductsRow>();
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: wrapWithModel(
                                    model: _model.sideNavModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SideNavWidget(
                                      setActiveTab:
                                          'zionweb://zionweb.com${GoRouterState.of(context).uri.toString()}',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.67),
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.67),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/839/600',
                                                      width: 32.0,
                                                      height: 32.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 16.0,
                                                  height: 0.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                Text(
                                                  'Salesman Dela Cruz',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFB19341),
                                                    Color(0xFFECDDAD)
                                                  ],
                                                  stops: [0.6, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, 1.0),
                                                  end: AlignmentDirectional(
                                                      0, -1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Builder(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 6.0, 16.0, 6.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child:
                                                                  AddNewProductModalWidget(
                                                                updateStep: 1,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: 'Add New Product',
                                                    icon: Icon(
                                                      Icons.add,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0x004B39EF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 280.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child: Text(
                                                                    'Summary',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                FlutterFlowChoiceChips(
                                                                  options: [
                                                                    ChipData(
                                                                        'ALL'),
                                                                    ChipData(
                                                                        '1D'),
                                                                    ChipData(
                                                                        'WTD'),
                                                                    ChipData(
                                                                        'MTD'),
                                                                    ChipData(
                                                                        'YTD')
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.choiceChipsValue =
                                                                              val?.firstOrNull),
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0x09504239),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Proxima Nova',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).brown100,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        14.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderColor:
                                                                        Color(
                                                                            0x29504239),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Proxima Nova',
                                                                          color:
                                                                              Color(0xFF504239),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    iconSize:
                                                                        14.0,
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  chipSpacing:
                                                                      0.0,
                                                                  rowSpacing:
                                                                      8.0,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      _model.choiceChipsValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  controller: _model
                                                                          .choiceChipsValueController ??=
                                                                      FormFieldController<
                                                                          List<
                                                                              String>>(
                                                                    ['1D'],
                                                                  ),
                                                                  wrapped:
                                                                      false,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future:
                                                                  GetProductCountCall
                                                                      .call(),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnGetProductCountResponse =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Total Products',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetProductCountResponse.jsonBody,
                                                                                  r'''$.total_count''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Sold Products',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetProductCountResponse.jsonBody,
                                                                                  r'''$.total_count_sold''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                'Archive Products',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetProductCountResponse.jsonBody,
                                                                                  r'''$.total_count_archived''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 4.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          16.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Column(
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: Alignment(-1.0, 0),
                                                                                                child: TabBar(
                                                                                                  isScrollable: true,
                                                                                                  labelColor: Color(0xFFB19341),
                                                                                                  unselectedLabelColor: FlutterFlowTheme.of(context).brown100,
                                                                                                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.2,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                      ),
                                                                                                  unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        lineHeight: 1.2,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                      ),
                                                                                                  indicatorColor: Color(0xFFB19341),
                                                                                                  tabs: [
                                                                                                    Tab(
                                                                                                      text: 'Active',
                                                                                                    ),
                                                                                                    Tab(
                                                                                                      text: 'Archived',
                                                                                                    ),
                                                                                                  ],
                                                                                                  controller: _model.tabBarController,
                                                                                                  onTap: (i) async {
                                                                                                    [
                                                                                                      () async {
                                                                                                        // Active Tab Setting
                                                                                                        _model.isArchived = false;
                                                                                                        safeSetState(() {});
                                                                                                        // GetActiveWarehouse
                                                                                                        _model.productActiveList = await ProductsTable().queryRows(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'archived',
                                                                                                            _model.isArchived,
                                                                                                          ),
                                                                                                        );
                                                                                                        // SetTheValueToPageState
                                                                                                        _model.productList = _model.productActiveList!.toList().cast<ProductsRow>();
                                                                                                        safeSetState(() {});

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      () async {
                                                                                                        // Active Tab Setting
                                                                                                        _model.isArchived = true;
                                                                                                        safeSetState(() {});
                                                                                                        _model.productArchiveList = await ProductsTable().queryRows(
                                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                                            'archived',
                                                                                                            _model.isArchived,
                                                                                                          ),
                                                                                                        );
                                                                                                        _model.productList = _model.productArchiveList!.toList().cast<ProductsRow>();
                                                                                                        safeSetState(() {});

                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                    ][i]();
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: TabBarView(
                                                                                                  controller: _model.tabBarController,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final productDtable = _model.productList.toList();

                                                                                                          return FlutterFlowDataTable<ProductsRow>(
                                                                                                            controller: _model.paginatedDataTableController1,
                                                                                                            data: productDtable,
                                                                                                            columnsBuilder: (onSortChanged) => [
                                                                                                              DataColumn2(
                                                                                                                label: DefaultTextStyle.merge(
                                                                                                                  softWrap: true,
                                                                                                                  child: Text(
                                                                                                                    'Product ID',
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).brown100,
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                fixedWidth: 150.0,
                                                                                                                onSort: onSortChanged,
                                                                                                              ),
                                                                                                              DataColumn2(
                                                                                                                label: DefaultTextStyle.merge(
                                                                                                                  softWrap: true,
                                                                                                                  child: Text(
                                                                                                                    'Product Name',
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).brown100,
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              DataColumn2(
                                                                                                                label: DefaultTextStyle.merge(
                                                                                                                  softWrap: true,
                                                                                                                  child: Text(
                                                                                                                    'Product Price',
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).brown100,
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              DataColumn2(
                                                                                                                label: DefaultTextStyle.merge(
                                                                                                                  softWrap: true,
                                                                                                                  child: Text(
                                                                                                                    'Product Sold',
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                          fontSize: 14.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              DataColumn2(
                                                                                                                label: DefaultTextStyle.merge(
                                                                                                                  softWrap: true,
                                                                                                                  child: Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Actions',
                                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                            fontSize: 14.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                fixedWidth: 70.0,
                                                                                                              ),
                                                                                                            ],
                                                                                                            dataRowBuilder: (productDtableItem, productDtableIndex, selected, onSelectChanged) => DataRow(
                                                                                                              color: WidgetStateProperty.all(
                                                                                                                productDtableIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : Color(0x00F1F4F8),
                                                                                                              ),
                                                                                                              cells: [
                                                                                                                Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    productDtableItem.code,
                                                                                                                    'code',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                        lineHeight: 1.2,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 64.0,
                                                                                                                      height: 64.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        border: Border.all(
                                                                                                                          width: 1.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsets.all(2.0),
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          child: Image.network(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              productDtableItem.image,
                                                                                                                              'https://picsum.photos/seed/512/600',
                                                                                                                            ),
                                                                                                                            width: 200.0,
                                                                                                                            height: 200.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        productDtableItem.name,
                                                                                                                        'name',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'PHP ',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        productDtableItem.price?.toString(),
                                                                                                                        '100',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    productDtableItem.sold?.toString(),
                                                                                                                    '100',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Builder(
                                                                                                                    builder: (context) => InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        await showAlignedDialog(
                                                                                                                          context: context,
                                                                                                                          isGlobal: false,
                                                                                                                          avoidOverflow: false,
                                                                                                                          targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                          followerAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                                                          builder: (dialogContext) {
                                                                                                                            return Material(
                                                                                                                              color: Colors.transparent,
                                                                                                                              child: GestureDetector(
                                                                                                                                onTap: () {
                                                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                },
                                                                                                                                child: ProductOptionsWidget(
                                                                                                                                  id: productDtableItem.id,
                                                                                                                                  status: productDtableItem.archived!,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        );
                                                                                                                      },
                                                                                                                      child: FaIcon(
                                                                                                                        FontAwesomeIcons.ellipsisV,
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].map((c) => DataCell(c)).toList(),
                                                                                                            ),
                                                                                                            paginated: true,
                                                                                                            selectable: false,
                                                                                                            hidePaginator: false,
                                                                                                            showFirstLastButtons: false,
                                                                                                            headingRowHeight: 40.0,
                                                                                                            dataRowHeight: 80.0,
                                                                                                            columnSpacing: 10.0,
                                                                                                            headingRowColor: FlutterFlowTheme.of(context).brown4,
                                                                                                            sortIconColor: FlutterFlowTheme.of(context).alternate,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                            addHorizontalDivider: true,
                                                                                                            addTopAndBottomDivider: false,
                                                                                                            hideDefaultHorizontalDivider: true,
                                                                                                            horizontalDividerColor: FlutterFlowTheme.of(context).alternate,
                                                                                                            horizontalDividerThickness: 1.0,
                                                                                                            addVerticalDivider: false,
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                            child: Builder(
                                                                                                              builder: (context) {
                                                                                                                final producDtable = _model.productList.toList();

                                                                                                                return FlutterFlowDataTable<ProductsRow>(
                                                                                                                  controller: _model.paginatedDataTableController2,
                                                                                                                  data: producDtable,
                                                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          'Product ID',
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      fixedWidth: 150.0,
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          'Product Name',
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          'Product Sold',
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'Actions',
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      fixedWidth: 70.0,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                  dataRowBuilder: (producDtableItem, producDtableIndex, selected, onSelectChanged) => DataRow(
                                                                                                                    color: WidgetStateProperty.all(
                                                                                                                      producDtableIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : Color(0x00F1F4F8),
                                                                                                                    ),
                                                                                                                    cells: [
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          producDtableItem.code,
                                                                                                                          'code',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 64.0,
                                                                                                                            height: 64.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                                                              border: Border.all(
                                                                                                                                width: 1.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(2.0),
                                                                                                                              child: ClipRRect(
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                child: Image.network(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    producDtableItem.image,
                                                                                                                                    'https://picsum.photos/seed/512/600',
                                                                                                                                  ),
                                                                                                                                  width: 200.0,
                                                                                                                                  height: 200.0,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              producDtableItem.name,
                                                                                                                              'name',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ].divide(SizedBox(width: 8.0)),
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                          producDtableItem.sold?.toString(),
                                                                                                                          '100',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Builder(
                                                                                                                          builder: (context) => InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              await showAlignedDialog(
                                                                                                                                context: context,
                                                                                                                                isGlobal: false,
                                                                                                                                avoidOverflow: false,
                                                                                                                                targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                followerAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                                                                builder: (dialogContext) {
                                                                                                                                  return Material(
                                                                                                                                    color: Colors.transparent,
                                                                                                                                    child: GestureDetector(
                                                                                                                                      onTap: () {
                                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                      },
                                                                                                                                      child: ProductOptionsWidget(
                                                                                                                                        id: producDtableItem.id,
                                                                                                                                        status: producDtableItem.archived!,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              );
                                                                                                                            },
                                                                                                                            child: FaIcon(
                                                                                                                              FontAwesomeIcons.ellipsisV,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                                                  ),
                                                                                                                  paginated: true,
                                                                                                                  selectable: false,
                                                                                                                  hidePaginator: false,
                                                                                                                  showFirstLastButtons: false,
                                                                                                                  headingRowHeight: 40.0,
                                                                                                                  dataRowHeight: 80.0,
                                                                                                                  columnSpacing: 10.0,
                                                                                                                  headingRowColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  addHorizontalDivider: true,
                                                                                                                  addTopAndBottomDivider: false,
                                                                                                                  hideDefaultHorizontalDivider: true,
                                                                                                                  horizontalDividerColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                  horizontalDividerThickness: 1.0,
                                                                                                                  addVerticalDivider: false,
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(height: 1.0)),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              width: 294.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.textController,
                                                                                                focusNode: _model.textFieldFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.textController',
                                                                                                  Duration(milliseconds: 2000),
                                                                                                  () async {
                                                                                                    _model.searchProduct = await ProductsTable().queryRows(
                                                                                                      queryFn: (q) => q
                                                                                                          .ilike(
                                                                                                            'name',
                                                                                                            '%${_model.textController.text}%',
                                                                                                          )
                                                                                                          .eqOrNull(
                                                                                                            'archived',
                                                                                                            _model.isArchived,
                                                                                                          ),
                                                                                                    );
                                                                                                    _model.productList = _model.searchProduct!.toList().cast<ProductsRow>();
                                                                                                    safeSetState(() {});

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                      ),
                                                                                                  hintText: 'Search for Product',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  prefixIcon: Icon(
                                                                                                    Icons.search,
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.textControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)).addToStart(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
