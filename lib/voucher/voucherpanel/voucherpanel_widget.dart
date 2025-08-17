import '/backend/supabase/supabase.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/voucher/edit_voucher/edit_voucher_widget.dart';
import '/voucher/view_voucher/view_voucher_widget.dart';
import '/voucher/voucheractions/voucheractions_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'voucherpanel_model.dart';
export 'voucherpanel_model.dart';

class VoucherpanelWidget extends StatefulWidget {
  const VoucherpanelWidget({super.key});

  @override
  State<VoucherpanelWidget> createState() => _VoucherpanelWidgetState();
}

class _VoucherpanelWidgetState extends State<VoucherpanelWidget> {
  late VoucherpanelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoucherpanelModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.vouchersResult = await VouchersTable().queryRows(
        queryFn: (q) => q,
      );
      _model.voucherList = _model.vouchersResult!.toList().cast<VouchersRow>();
      _model.isLoading = false;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        if (!_model.isLoading) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (false)
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: FlutterFlowChoiceChips(
                      options: [
                        ChipData('ALL'),
                        ChipData('1D'),
                        ChipData('WTD'),
                        ChipData('MTD'),
                        ChipData('YTD')
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.dateRangerValue = val?.firstOrNull),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: Color(0x09504239),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Proxima Nova',
                                  color: FlutterFlowTheme.of(context).brown100,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                ),
                        iconColor: Color(0x00000000),
                        iconSize: 14.0,
                        elevation: 0.0,
                        borderColor: Color(0x29504239),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Proxima Nova',
                                  color: Color(0xFF504239),
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                        iconColor: Color(0x00000000),
                        iconSize: 14.0,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 0.0,
                      rowSpacing: 8.0,
                      multiselect: false,
                      initialized: _model.dateRangerValue != null,
                      alignment: WrapAlignment.start,
                      controller: _model.dateRangerValueController ??=
                          FormFieldController<List<String>>(
                        ['1D'],
                      ),
                      wrapped: false,
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).black8,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('All'),
                                    ChipData('Active'),
                                    ChipData('Claimed'),
                                    ChipData('Expired'),
                                    ChipData('Archive')
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(() => _model.statusesValue =
                                        val?.firstOrNull);
                                    _model.isLoading = true;
                                    safeSetState(() {});
                                    await _model.filterVoucher(
                                      context,
                                      filter: _model.statusesValue,
                                    );
                                    safeSetState(() {});
                                    _model.isLoading = false;
                                    safeSetState(() {});
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xFFB19341),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    iconSize: 16.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 16.0,
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  chipSpacing: 8.0,
                                  rowSpacing: 8.0,
                                  multiselect: false,
                                  initialized: _model.statusesValue != null,
                                  alignment: WrapAlignment.start,
                                  controller: _model.statusesValueController ??=
                                      FormFieldController<List<String>>(
                                    ['All'],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    width: 294.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () async {},
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        hintText: 'Search for voucher name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .brown16,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        prefixIcon: Icon(
                                          Icons.search_sharp,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final voucherTable = _model.voucherList.toList();
                        if (voucherTable.isEmpty) {
                          return EmptyListWidget();
                        }

                        return FlutterFlowDataTable<VouchersRow>(
                          controller: _model.paginatedDataTableController,
                          data: voucherTable,
                          columnsBuilder: (onSortChanged) => [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'Voucher ID',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Proxima Nova',
                                        color: FlutterFlowTheme.of(context)
                                            .brown100,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              onSort: onSortChanged,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Voucher Code / Voucher Type',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Proxima Nova',
                                          color: FlutterFlowTheme.of(context)
                                              .brown100,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              fixedWidth: 200.0,
                              onSort: onSortChanged,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Amount',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Proxima Nova',
                                          color: FlutterFlowTheme.of(context)
                                              .brown100,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              fixedWidth: 200.0,
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Usage Quantity',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .brown100,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelLargeIsCustom,
                                        ),
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
                                    'Expiry Date',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelLargeIsCustom,
                                        ),
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
                                    'Status',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelLargeIsCustom,
                                        ),
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
                                    'Action',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelLargeIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          dataRowBuilder: (voucherTableItem, voucherTableIndex,
                                  selected, onSelectChanged) =>
                              DataRow(
                            color: WidgetStateProperty.all(
                              voucherTableIndex % 2 == 0
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : Color(0x00F1F4F8),
                            ),
                            cells: [
                              Text(
                                valueOrDefault<String>(
                                  voucherTableItem.id.toString(),
                                  'id',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Clipboard.setData(ClipboardData(
                                            text: voucherTableItem.code!));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Voucher code cpied to your clipboard',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          voucherTableItem.code,
                                          'name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        voucherTableItem.type,
                                        'name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                voucherTableItem.amount
                                                    ?.toString(),
                                                'name',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            voucherTableItem.type == 'Off'
                                                ? '%'
                                                : 'Php',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    voucherTableItem.quantity?.toString(),
                                    '0',
                                  )} / ${valueOrDefault<String>(
                                    voucherTableItem.limit?.toString(),
                                    '0',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                        "yMMMd", voucherTableItem.expiry),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: voucherTableItem.active!
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      voucherTableItem.active!
                                          ? 'Active'
                                          : 'Archived',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: voucherTableItem.active!
                                                ? FlutterFlowTheme.of(context)
                                                    .success
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
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
                                        targetAnchor:
                                            AlignmentDirectional(-1.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: VoucheractionsWidget(
                                              isactive:
                                                  voucherTableItem.active!,
                                              voucher: voucherTableItem,
                                              actionRefresh: (edit) async {
                                                if (edit == 'edit') {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child:
                                                            EditVoucherWidget(
                                                          voucher:
                                                              voucherTableItem,
                                                          action: () async {
                                                            _model.resv =
                                                                await VouchersTable()
                                                                    .queryRows(
                                                              queryFn: (q) => q,
                                                            );
                                                            _model.voucherList =
                                                                _model.resv!
                                                                    .toList()
                                                                    .cast<
                                                                        VouchersRow>();
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else if (edit == 'view') {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child:
                                                            ViewVoucherWidget(
                                                          voucher:
                                                              voucherTableItem,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else if (edit == 'delete') {
                                                  _model.resdelete =
                                                      await VouchersTable()
                                                          .queryRows(
                                                    queryFn: (q) => q,
                                                  );
                                                  _model.voucherList = _model
                                                      .resdelete!
                                                      .toList()
                                                      .cast<VouchersRow>();
                                                  safeSetState(() {});
                                                } else if (edit == 'activate') {
                                                  _model.resact =
                                                      await VouchersTable()
                                                          .queryRows(
                                                    queryFn: (q) => q,
                                                  );
                                                  _model.voucherList = _model
                                                      .resact!
                                                      .toList()
                                                      .cast<VouchersRow>();
                                                  safeSetState(() {});
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      );

                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.ellipsisV,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ].map((c) => DataCell(c)).toList(),
                          ),
                          emptyBuilder: () => EmptyListWidget(),
                          onSortChanged: (columnIndex, ascending) async {},
                          paginated: true,
                          selectable: false,
                          hidePaginator: false,
                          showFirstLastButtons: false,
                          headingRowHeight: 40.0,
                          dataRowHeight: 80.0,
                          columnSpacing: 10.0,
                          headingRowColor: FlutterFlowTheme.of(context).brown4,
                          sortIconColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(8.0),
                          addHorizontalDivider: true,
                          addTopAndBottomDivider: true,
                          hideDefaultHorizontalDivider: true,
                          horizontalDividerColor:
                              FlutterFlowTheme.of(context).alternate,
                          horizontalDividerThickness: 1.0,
                          addVerticalDivider: false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Loading...',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
          );
        }
      },
    );
  }
}
