import '/backend/supabase/supabase.dart';
import '/calendar/list_item_warehouse/list_item_warehouse_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_view_warehouse_component_model.dart';
export 'list_view_warehouse_component_model.dart';

class ListViewWarehouseComponentWidget extends StatefulWidget {
  const ListViewWarehouseComponentWidget({
    super.key,
    required this.warehouseList,
    required this.onSelectWarehouse,
  });

  final List<WarehouseRow>? warehouseList;
  final Future Function(WarehouseRow warehouseDetails)? onSelectWarehouse;

  @override
  State<ListViewWarehouseComponentWidget> createState() =>
      _ListViewWarehouseComponentWidgetState();
}

class _ListViewWarehouseComponentWidgetState
    extends State<ListViewWarehouseComponentWidget> {
  late ListViewWarehouseComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewWarehouseComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
              child: Builder(
                builder: (context) {
                  final warehouseLv = widget.warehouseList!.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: warehouseLv.length,
                    itemBuilder: (context, warehouseLvIndex) {
                      final warehouseLvItem = warehouseLv[warehouseLvIndex];
                      return Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: wrapWithModel(
                          model: _model.listItemWarehouseModels.getModel(
                            warehouseLvIndex.toString(),
                            warehouseLvIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: ListItemWarehouseWidget(
                            key: Key(
                              'Keyagk_${warehouseLvIndex.toString()}',
                            ),
                            warehouseDetail: warehouseLvItem,
                            onSelectWarehouse: (warehouseDetails) async {
                              await widget.onSelectWarehouse?.call(
                                warehouseDetails,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
