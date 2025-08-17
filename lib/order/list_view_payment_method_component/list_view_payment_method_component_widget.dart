import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/list_item_payment_method/list_item_payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'list_view_payment_method_component_model.dart';
export 'list_view_payment_method_component_model.dart';

class ListViewPaymentMethodComponentWidget extends StatefulWidget {
  const ListViewPaymentMethodComponentWidget({
    super.key,
    this.onSelect,
  });

  final Future Function(PaymentMethodRow paymentMethod)? onSelect;

  @override
  State<ListViewPaymentMethodComponentWidget> createState() =>
      _ListViewPaymentMethodComponentWidgetState();
}

class _ListViewPaymentMethodComponentWidgetState
    extends State<ListViewPaymentMethodComponentWidget> {
  late ListViewPaymentMethodComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewPaymentMethodComponentModel());

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
              child: FutureBuilder<List<PaymentMethodRow>>(
                future: PaymentMethodTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'active',
                    true,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<PaymentMethodRow> listViewPaymentMethodRowList =
                      snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewPaymentMethodRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewPaymentMethodRow =
                          listViewPaymentMethodRowList[listViewIndex];
                      return wrapWithModel(
                        model: _model.listItemPaymentMethodModels.getModel(
                          listViewPaymentMethodRow.id.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ListItemPaymentMethodWidget(
                          key: Key(
                            'Key8kl_${listViewPaymentMethodRow.id.toString()}',
                          ),
                          paymentMethod: listViewPaymentMethodRow,
                          onSelect: (paymentMethod) async {
                            await widget.onSelect?.call(
                              listViewPaymentMethodRow,
                            );
                            Navigator.pop(context);
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
