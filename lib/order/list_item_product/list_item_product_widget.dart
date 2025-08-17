import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_item_product_model.dart';
export 'list_item_product_model.dart';

class ListItemProductWidget extends StatefulWidget {
  const ListItemProductWidget({
    super.key,
    required this.productDetails,
    this.onAddProduct,
  });

  final OrderProductsStruct? productDetails;
  final Future Function(OrderProductsStruct selectedProductDetail)?
      onAddProduct;

  @override
  State<ListItemProductWidget> createState() => _ListItemProductWidgetState();
}

class _ListItemProductWidgetState extends State<ListItemProductWidget> {
  late ListItemProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemProductModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: 66.0,
            decoration: BoxDecoration(
              color: _model.isHovered ? Color(0x0B151006) : Color(0x00000000),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.productDetails?.image != null &&
                              widget.productDetails?.image != ''
                          ? widget.productDetails!.image
                          : 'https://isxrwikfznijgmlgvtws.supabase.co/storage/v1/object/public/zion/Products/1744275267104000.png',
                      width: 64.0,
                      height: 64.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.productDetails?.code,
                            'Zion Code',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 10.24,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.productDetails?.name,
                            'Product name',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.2,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.productDetails?.price.toString(),
                            'Price',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.8,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ],
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).black4,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).black100,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await widget.onAddProduct?.call(
                        widget.productDetails!,
                      );
                    },
                  ),
                ]
                    .divide(SizedBox(width: 8.0))
                    .addToStart(SizedBox(width: 8.0))
                    .addToEnd(SizedBox(width: 8.0)),
              ),
            ),
          ),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          _model.isHovered = true;
          safeSetState(() {});
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          _model.isHovered = false;
          safeSetState(() {});
        }),
      ),
    );
  }
}
