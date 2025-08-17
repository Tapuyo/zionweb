import '/backend/supabase/supabase.dart';
import '/calendar/list_item_truck/list_item_truck_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_view_truck_component_model.dart';
export 'list_view_truck_component_model.dart';

class ListViewTruckComponentWidget extends StatefulWidget {
  const ListViewTruckComponentWidget({
    super.key,
    required this.truckList,
    required this.onSelectTruck,
  });

  final List<TruckRow>? truckList;
  final Future Function(TruckRow truckDetail)? onSelectTruck;

  @override
  State<ListViewTruckComponentWidget> createState() =>
      _ListViewTruckComponentWidgetState();
}

class _ListViewTruckComponentWidgetState
    extends State<ListViewTruckComponentWidget> with TickerProviderStateMixin {
  late ListViewTruckComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewTruckComponentModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Container(
            width: 385.0,
            height: 400.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.2,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      unselectedLabelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      labelColor: FlutterFlowTheme.of(context).brown100,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).brown100,
                      backgroundColor: Color(0x0B504239),
                      borderColor: Color(0x28504239),
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      elevation: 0.0,
                      tabs: [
                        Tab(
                          text: 'Metro Manila',
                        ),
                        Tab(
                          text: 'Regional',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Builder(
                          builder: (context) {
                            final truckLv = widget.truckList!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(truckLv.length,
                                    (truckLvIndex) {
                                  final truckLvItem = truckLv[truckLvIndex];
                                  return wrapWithModel(
                                    model: _model.listItemTruckModels1.getModel(
                                      truckLvIndex.toString(),
                                      truckLvIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListItemTruckWidget(
                                      key: Key(
                                        'Keybhc_${truckLvIndex.toString()}',
                                      ),
                                      truckDetail: truckLvItem,
                                      onSelectTruck: (truckDetail) async {
                                        await widget.onSelectTruck?.call(
                                          truckDetail,
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                        Builder(
                          builder: (context) {
                            final truckLvRegional = widget.truckList!.toList();

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(truckLvRegional.length,
                                    (truckLvRegionalIndex) {
                                  final truckLvRegionalItem =
                                      truckLvRegional[truckLvRegionalIndex];
                                  return wrapWithModel(
                                    model: _model.listItemTruckModels2.getModel(
                                      truckLvRegionalIndex.toString(),
                                      truckLvRegionalIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: ListItemTruckWidget(
                                      key: Key(
                                        'Keyliq_${truckLvRegionalIndex.toString()}',
                                      ),
                                      truckDetail: truckLvRegionalItem,
                                      onSelectTruck: (truckDetail) async {
                                        await widget.onSelectTruck?.call(
                                          truckDetail,
                                        );
                                      },
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
