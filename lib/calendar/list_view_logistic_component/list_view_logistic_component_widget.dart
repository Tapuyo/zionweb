import '/backend/supabase/supabase.dart';
import '/calendar/list_item_logisitic/list_item_logisitic_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_view_logistic_component_model.dart';
export 'list_view_logistic_component_model.dart';

class ListViewLogisticComponentWidget extends StatefulWidget {
  const ListViewLogisticComponentWidget({
    super.key,
    required this.logisticsList,
    required this.onSelectLogistics,
  });

  final List<UsersLogisticsViewRow>? logisticsList;
  final Future Function(UsersLogisticsViewRow logisticsDetail)?
      onSelectLogistics;

  @override
  State<ListViewLogisticComponentWidget> createState() =>
      _ListViewLogisticComponentWidgetState();
}

class _ListViewLogisticComponentWidgetState
    extends State<ListViewLogisticComponentWidget> {
  late ListViewLogisticComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewLogisticComponentModel());

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
        mainAxisAlignment: MainAxisAlignment.start,
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
                  final logisticLv = widget.logisticsList!.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: logisticLv.length,
                    itemBuilder: (context, logisticLvIndex) {
                      final logisticLvItem = logisticLv[logisticLvIndex];
                      return wrapWithModel(
                        model: _model.listItemLogisiticModels.getModel(
                          logisticLvIndex.toString(),
                          logisticLvIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ListItemLogisiticWidget(
                          key: Key(
                            'Keyrmn_${logisticLvIndex.toString()}',
                          ),
                          logisticsDetail: logisticLvItem,
                          onSelectLogistics: (logisticsDetail) async {
                            await widget.onSelectLogistics?.call(
                              logisticsDetail,
                            );
                          },
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
