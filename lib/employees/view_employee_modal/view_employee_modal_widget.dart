import '/backend/supabase/supabase.dart';
import '/components/roles_widget.dart';
import '/employees/employee_basic_detail/employee_basic_detail_widget.dart';
import '/employees/employee_detail/employee_detail_widget.dart';
import '/employees/update_employee_modal/update_employee_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'view_employee_modal_model.dart';
export 'view_employee_modal_model.dart';

class ViewEmployeeModalWidget extends StatefulWidget {
  const ViewEmployeeModalWidget({
    super.key,
    this.employeeId,
    required this.viewType,
  });

  final int? employeeId;
  final String? viewType;

  @override
  State<ViewEmployeeModalWidget> createState() =>
      _ViewEmployeeModalWidgetState();
}

class _ViewEmployeeModalWidgetState extends State<ViewEmployeeModalWidget> {
  late ViewEmployeeModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewEmployeeModalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.viewType == 'archive') {
        _model.startPage = 1;
        safeSetState(() {});
      } else if (widget.viewType == 'restore') {
        _model.startPage = 3;
        safeSetState(() {});
      } else {
        _model.startPage = 0;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      height: 470.0,
      constraints: BoxConstraints(
        minHeight: 300.0,
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List<EmployeeviewRow>>(
          future: EmployeeviewTable().querySingleRow(
            queryFn: (q) => q.eqOrNull(
              'id',
              widget.employeeId,
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
            List<EmployeeviewRow> columnEmployeeviewRowList = snapshot.data!;

            final columnEmployeeviewRow = columnEmployeeviewRowList.isNotEmpty
                ? columnEmployeeviewRowList.first
                : null;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.rolesModel,
                      updateCallback: () => safeSetState(() {}),
                      child: RolesWidget(
                        role: valueOrDefault<String>(
                          columnEmployeeviewRow?.type,
                          'Role',
                        ),
                        isArchived: columnEmployeeviewRow!.deleted!,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.viewPageController ??= PageController(
                          initialPage: max(
                              0,
                              min(
                                  valueOrDefault<int>(
                                    _model.startPage,
                                    0,
                                  ),
                                  5))),
                      scrollDirection: Axis.vertical,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.employeeDetailModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: EmployeeDetailWidget(
                                  employeeDetail: columnEmployeeviewRow,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.viewPageController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Archive',
                                      icon: Icon(
                                        Icons.u_turn_right_rounded,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).red4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .red100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child:
                                                    UpdateEmployeeModalWidget(
                                                  id: widget.employeeId!,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'Update Employee',
                                        icon: FaIcon(
                                          FontAwesomeIcons.edit,
                                          size: 16.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .black100,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white100,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Are you sure you want to archive this employee?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 31.25,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              wrapWithModel(
                                model: _model.employeeDetailModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: EmployeeDetailWidget(
                                  employeeDetail: columnEmployeeviewRow,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      icon: Icon(
                                        Icons.close,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).black4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await UsersTable().update(
                                          data: {
                                            'deleted': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.employeeId,
                                          ),
                                        );
                                        await _model.viewPageController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Yes, archive it!',
                                      icon: FaIcon(
                                        FontAwesomeIcons.edit,
                                        size: 16.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).red100,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.employeeBasicDetailModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: EmployeeBasicDetailWidget(
                                  image: columnEmployeeviewRow.image,
                                  id: columnEmployeeviewRow.id,
                                  firstName: columnEmployeeviewRow.firstName,
                                  lastName: columnEmployeeviewRow.lastName,
                                  daysRegistered: columnEmployeeviewRow
                                      .daysSinceRegistration,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 64.0,
                                            ),
                                            Text(
                                              'Employee has bee archived!',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    fontSize: 20.0,
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
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Continue',
                                icon: Icon(
                                  Icons.check,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).black100,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .white100,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.employeeDetailModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: EmployeeDetailWidget(
                                  employeeDetail: columnEmployeeviewRow,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await _model.viewPageController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Restore Employee',
                                      icon: Icon(
                                        Icons.refresh,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).green4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .green100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Are you sure you want to restore this employee?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 31.25,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              wrapWithModel(
                                model: _model.employeeDetailModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: EmployeeDetailWidget(
                                  employeeDetail: columnEmployeeviewRow,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      icon: Icon(
                                        Icons.close,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).black4,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await UsersTable().update(
                                          data: {
                                            'deleted': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            widget.employeeId,
                                          ),
                                        );
                                        await _model.viewPageController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Yes, restore it!',
                                      icon: FaIcon(
                                        FontAwesomeIcons.edit,
                                        size: 16.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .green100,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white100,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.employeeBasicDetailModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: EmployeeBasicDetailWidget(
                                image: columnEmployeeviewRow.image,
                                id: columnEmployeeviewRow.id,
                                firstName: columnEmployeeviewRow.firstName,
                                lastName: columnEmployeeviewRow.lastName,
                                daysRegistered: columnEmployeeviewRow
                                    .daysSinceRegistration,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            size: 64.0,
                                          ),
                                          Text(
                                            'Employee has bee restored!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 20.0,
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
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Continue',
                              icon: Icon(
                                Icons.check,
                                size: 16.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).black100,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color:
                                          FlutterFlowTheme.of(context).white100,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
