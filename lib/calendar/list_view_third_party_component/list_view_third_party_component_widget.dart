import '/backend/supabase/supabase.dart';
import '/calendar/list_item_third_party/list_item_third_party_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_view_third_party_component_model.dart';
export 'list_view_third_party_component_model.dart';

class ListViewThirdPartyComponentWidget extends StatefulWidget {
  const ListViewThirdPartyComponentWidget({
    super.key,
    required this.thirdPartyList,
    required this.onSelectThirdParty,
  });

  final List<ThirdPartyCourierRow>? thirdPartyList;
  final Future Function(ThirdPartyCourierRow thirdPartyDetail)?
      onSelectThirdParty;

  @override
  State<ListViewThirdPartyComponentWidget> createState() =>
      _ListViewThirdPartyComponentWidgetState();
}

class _ListViewThirdPartyComponentWidgetState
    extends State<ListViewThirdPartyComponentWidget> {
  late ListViewThirdPartyComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewThirdPartyComponentModel());

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
                  final thirdPartyLv = widget.thirdPartyList!.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: thirdPartyLv.length,
                    itemBuilder: (context, thirdPartyLvIndex) {
                      final thirdPartyLvItem = thirdPartyLv[thirdPartyLvIndex];
                      return wrapWithModel(
                        model: _model.listItemThirdPartyModels.getModel(
                          thirdPartyLvIndex.toString(),
                          thirdPartyLvIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ListItemThirdPartyWidget(
                          key: Key(
                            'Key8w9_${thirdPartyLvIndex.toString()}',
                          ),
                          thirdPartyDetail: thirdPartyLvItem,
                          onSelectThirdParty: (thirdPartyDetail) async {
                            await widget.onSelectThirdParty?.call(
                              thirdPartyDetail,
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
