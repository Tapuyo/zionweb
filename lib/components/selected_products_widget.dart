import '/backend/supabase/supabase.dart';
import '/components/order_breakdown_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'selected_products_model.dart';
export 'selected_products_model.dart';

class SelectedProductsWidget extends StatefulWidget {
  const SelectedProductsWidget({
    super.key,
    this.onAddProduct,
    required this.onUpdateQuantity,
  });

  final Future Function(ProductsRow orderProducts)? onAddProduct;
  final Future Function(int qty)? onUpdateQuantity;

  @override
  State<SelectedProductsWidget> createState() => _SelectedProductsWidgetState();
}

class _SelectedProductsWidgetState extends State<SelectedProductsWidget> {
  late SelectedProductsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedProductsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final producstLv = _model.products.toList();

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: producstLv.length,
          itemBuilder: (context, producstLvIndex) {
            final producstLvItem = producstLv[producstLvIndex];
            return wrapWithModel(
              model: _model.orderBreakdownComponentModels.getModel(
                producstLvItem.id.toString(),
                producstLvIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: OrderBreakdownComponentWidget(
                key: Key(
                  'Keyvkq_${producstLvItem.id.toString()}',
                ),
                productDetails: producstLvItem,
                onUpdateQuantity: (qty, price, prod) async {
                  await widget.onUpdateQuantity?.call(
                    qty,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
