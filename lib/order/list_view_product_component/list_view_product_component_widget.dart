import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/list_item_product/list_item_product_widget.dart';
import 'package:flutter/material.dart';
import 'list_view_product_component_model.dart';
export 'list_view_product_component_model.dart';

class ListViewProductComponentWidget extends StatefulWidget {
  const ListViewProductComponentWidget({
    super.key,
    this.onAddProduct,
  });

  final Future Function(OrderProductsStruct selectedProductDetail)?
      onAddProduct;

  @override
  State<ListViewProductComponentWidget> createState() =>
      _ListViewProductComponentWidgetState();
}

class _ListViewProductComponentWidgetState
    extends State<ListViewProductComponentWidget> {
  late ListViewProductComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewProductComponentModel());

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
              child: FutureBuilder<List<ProductsRow>>(
                future: ProductsTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'archived',
                        false,
                      )
                      .order('name', ascending: true),
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
                  List<ProductsRow> listViewProductsRowList = snapshot.data!;

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewProductsRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewProductsRow =
                          listViewProductsRowList[listViewIndex];
                      return wrapWithModel(
                        model: _model.listItemProductModels.getModel(
                          listViewProductsRow.id.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ListItemProductWidget(
                          key: Key(
                            'Keyhu4_${listViewProductsRow.id.toString()}',
                          ),
                          productDetails: OrderProductsStruct(
                            id: listViewProductsRow.id,
                            code: listViewProductsRow.code,
                            name: listViewProductsRow.name,
                            price: listViewProductsRow.price,
                            image: listViewProductsRow.image,
                            quantity: 1,
                          ),
                          onAddProduct: (selectedProductDetail) async {
                            await widget.onAddProduct?.call(
                              selectedProductDetail,
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
