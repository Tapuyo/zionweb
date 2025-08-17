import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_item_payment_method_model.dart';
export 'list_item_payment_method_model.dart';

class ListItemPaymentMethodWidget extends StatefulWidget {
  const ListItemPaymentMethodWidget({
    super.key,
    this.onSelect,
    required this.paymentMethod,
  });

  final Future Function(PaymentMethodRow paymentMethod)? onSelect;
  final PaymentMethodRow? paymentMethod;

  @override
  State<ListItemPaymentMethodWidget> createState() =>
      _ListItemPaymentMethodWidgetState();
}

class _ListItemPaymentMethodWidgetState
    extends State<ListItemPaymentMethodWidget> {
  late ListItemPaymentMethodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListItemPaymentMethodModel());

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
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.onSelect?.call(
                widget.paymentMethod!,
              );
            },
            child: Container(
              height: 41.0,
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
                    Icon(
                      Icons.payments_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.paymentMethod?.method,
                        'payment method',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ]
                      .divide(SizedBox(width: 8.0))
                      .addToStart(SizedBox(width: 8.0))
                      .addToEnd(SizedBox(width: 8.0)),
                ),
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
