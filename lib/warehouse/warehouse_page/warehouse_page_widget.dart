import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/side_nav/side_nav_widget.dart';
import '/warehouse/add_new_warehouse_modal/add_new_warehouse_modal_widget.dart';
import '/warehouse/warehouse_options/warehouse_options_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'warehouse_page_model.dart';
export 'warehouse_page_model.dart';

class WarehousePageWidget extends StatefulWidget {
  const WarehousePageWidget({super.key});

  static String routeName = 'WarehousePage';
  static String routePath = '/warehousePage';

  @override
  State<WarehousePageWidget> createState() => _WarehousePageWidgetState();
}

class _WarehousePageWidgetState extends State<WarehousePageWidget>
    with TickerProviderStateMixin {
  late WarehousePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WarehousePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.warehouseInitList = await WarehouseTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'deleted',
          false,
        ),
      );
      _model.whList = _model.warehouseInitList!.toList().cast<WarehouseRow>();
      safeSetState(() {});
      _model.isArchived = false;
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
                                              mainAxisSize: MainAxisSize.max,
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
                                                            'Proxima Nova',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                                  AddNewWarehouseModalWidget(),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: 'Add New Warehouse',
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).black100,
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
                                                                  GetWarehouseCountCall
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
                                                                final columnGetWarehouseCountResponse =
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
                                                                                'Total Warehouses',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Proxima Nova',
                                                                                      color: FlutterFlowTheme.of(context).black50,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetWarehouseCountResponse.jsonBody,
                                                                                  r'''$.total_count''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).black100,
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
                                                                                'Archived Warehouses',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).black50,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetWarehouseCountResponse.jsonBody,
                                                                                  r'''$.total_count_deleted''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).black100,
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
                                                                                'New Warehouses',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).black50,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  columnGetWarehouseCountResponse.jsonBody,
                                                                                  r'''$.total_count_recently_created''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Proxima Nova',
                                                                                      color: FlutterFlowTheme.of(context).black100,
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      lineHeight: 1.2,
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
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
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
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                  ),
                                                                                              unselectedLabelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
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
                                                                                                    _model.warehouseActiveList = await WarehouseTable().queryRows(
                                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                                        'deleted',
                                                                                                        false,
                                                                                                      ),
                                                                                                    );
                                                                                                    // SetTheValueToPageState
                                                                                                    _model.whList = _model.warehouseActiveList!.toList().cast<WarehouseRow>();
                                                                                                    safeSetState(() {});

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  () async {
                                                                                                    // Active Tab Setting
                                                                                                    _model.isArchived = true;
                                                                                                    safeSetState(() {});
                                                                                                    _model.warehouseArchiveList = await WarehouseTable().queryRows(
                                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                                        'deleted',
                                                                                                        true,
                                                                                                      ),
                                                                                                    );
                                                                                                    _model.whList = _model.warehouseArchiveList!.toList().cast<WarehouseRow>();
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
                                                                                                      final whDtable = _model.whList.toList();

                                                                                                      return FlutterFlowDataTable<WarehouseRow>(
                                                                                                        controller: _model.paginatedDataTableController1,
                                                                                                        data: whDtable,
                                                                                                        columnsBuilder: (onSortChanged) => [
                                                                                                          DataColumn2(
                                                                                                            label: DefaultTextStyle.merge(
                                                                                                              softWrap: true,
                                                                                                              child: Text(
                                                                                                                'Warehouse ID',
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Proxima Nova',
                                                                                                                      color: FlutterFlowTheme.of(context).brown100,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            fixedWidth: 150.0,
                                                                                                          ),
                                                                                                          DataColumn2(
                                                                                                            label: DefaultTextStyle.merge(
                                                                                                              softWrap: true,
                                                                                                              child: Text(
                                                                                                                'Warehouse Name',
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Proxima Nova',
                                                                                                                      color: FlutterFlowTheme.of(context).brown100,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          DataColumn2(
                                                                                                            label: DefaultTextStyle.merge(
                                                                                                              softWrap: true,
                                                                                                              child: Text(
                                                                                                                'Warehouse Location',
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Proxima Nova',
                                                                                                                      color: FlutterFlowTheme.of(context).brown100,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
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
                                                                                                                        color: FlutterFlowTheme.of(context).brown100,
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
                                                                                                        dataRowBuilder: (whDtableItem, whDtableIndex, selected, onSelectChanged) => DataRow(
                                                                                                          color: WidgetStateProperty.all(
                                                                                                            whDtableIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : Color(0x00F1F4F8),
                                                                                                          ),
                                                                                                          cells: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                whDtableItem.id.toString(),
                                                                                                                'id',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).black100,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                whDtableItem.name,
                                                                                                                'name',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).black100,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Icon(
                                                                                                                  Icons.location_on_outlined,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  size: 15.0,
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    whDtableItem.address,
                                                                                                                    'address',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).black100,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
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
                                                                                                                            child: WarehouseOptionsWidget(
                                                                                                                              warehouseId: valueOrDefault<int>(
                                                                                                                                whDtableItem.id,
                                                                                                                                1,
                                                                                                                              ),
                                                                                                                              warehouseStatus: whDtableItem.deleted!,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.ellipsisV,
                                                                                                                    color: FlutterFlowTheme.of(context).black100,
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
                                                                                                        dataRowHeight: 48.0,
                                                                                                        columnSpacing: 10.0,
                                                                                                        headingRowColor: FlutterFlowTheme.of(context).brown4,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        addHorizontalDivider: true,
                                                                                                        addTopAndBottomDivider: true,
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
                                                                                                            final whDtable = _model.whList.toList();

                                                                                                            return FlutterFlowDataTable<WarehouseRow>(
                                                                                                              controller: _model.paginatedDataTableController2,
                                                                                                              data: whDtable,
                                                                                                              columnsBuilder: (onSortChanged) => [
                                                                                                                DataColumn2(
                                                                                                                  label: DefaultTextStyle.merge(
                                                                                                                    softWrap: true,
                                                                                                                    child: Text(
                                                                                                                      'Warehouse ID',
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
                                                                                                                      'Warehouse Name',
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
                                                                                                                      'Warehouse Location',
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
                                                                                                              dataRowBuilder: (whDtableItem, whDtableIndex, selected, onSelectChanged) => DataRow(
                                                                                                                color: WidgetStateProperty.all(
                                                                                                                  whDtableIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : Color(0x00F1F4F8),
                                                                                                                ),
                                                                                                                cells: [
                                                                                                                  Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      whDtableItem.id.toString(),
                                                                                                                      'id',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      whDtableItem.name,
                                                                                                                      'name',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      whDtableItem.address,
                                                                                                                      'address',
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
                                                                                                                                  child: WarehouseOptionsWidget(
                                                                                                                                    warehouseId: valueOrDefault<int>(
                                                                                                                                      whDtableItem.id,
                                                                                                                                      1,
                                                                                                                                    ),
                                                                                                                                    warehouseStatus: whDtableItem.deleted!,
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
                                                                                                              dataRowHeight: 48.0,
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
                                                                                                  ],
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
                                                                                                _model.searchWarehouse = await WarehouseTable().queryRows(
                                                                                                  queryFn: (q) => q
                                                                                                      .ilike(
                                                                                                        'name',
                                                                                                        '%${_model.textController.text}%',
                                                                                                      )
                                                                                                      .eqOrNull(
                                                                                                        'deleted',
                                                                                                        _model.isArchived,
                                                                                                      ),
                                                                                                );
                                                                                                _model.whList = _model.searchWarehouse!.toList().cast<WarehouseRow>();
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
                                                                                              hintText: 'Search for  Warehouse',
                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).brown100,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).brown16,
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
                                                                                                  fontFamily: 'Proxima Nova',
                                                                                                  letterSpacing: 0.0,
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
