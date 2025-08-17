// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

Future<FFUploadedFile> pdfWarranty(
    List<OrderProductsStruct>? products,
    double? subtotal,
    double? tax,
    double? discount,
    double? total,
    String? oderCode) async {
  final pdf = pw.Document();

  final ByteData zionLogo =
      await rootBundle.load('assets/images/logo-zion.png');
  final Uint8List imageBytes = zionLogo.buffer.asUint8List();
  final pw.MemoryImage pwZionLogo = pw.MemoryImage(imageBytes);

  final ByteData bdoLogo =
      await rootBundle.load('assets/images/BDO_Unibank_(logo).svg.png');
  final Uint8List imageBytesdbo = bdoLogo.buffer.asUint8List();
  final pw.MemoryImage pwBdoLogo = pw.MemoryImage(imageBytesdbo);

  final ByteData unionLogo =
      await rootBundle.load('assets/images/Unionbank_2018_logo.svg.png');
  final Uint8List imageBytesUnion = unionLogo.buffer.asUint8List();
  final pw.MemoryImage pwunionLogo = pw.MemoryImage(imageBytesUnion);

  final ByteData zionbgLogo =
      await rootBundle.load('assets/images/logo-zion-20.png');
  final Uint8List imageBytesbg = zionbgLogo.buffer.asUint8List();
  final pw.MemoryImage pwbgLogo = pw.MemoryImage(imageBytesbg);

  // logo-zion-20.png

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return pw.Container(
            child: pw.Padding(
                padding: const pw.EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        width: 2.0,
                      ),
                    ),
                    child: // Generated code for this Container Widget...
                        pw.Container(
                      width: double.infinity,
                      decoration: pw.BoxDecoration(
                        // color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: pw.DecorationImage(
                          fit: pw.BoxFit.contain,
                          image: pw.Image(
                            pwbgLogo,
                          ).image,
                        ),
                      ),
                      child: pw.Padding(
                        padding:
                            pw.EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        child: pw.Column(
                            mainAxisSize: pw.MainAxisSize.max,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              // Generated code for this Row Widget...
                              pw.Row(
                                  mainAxisSize: pw.MainAxisSize.max,
                                  children: [
                                    pw.Image(
                                      pwZionLogo,
                                      width: 65,
                                      height: 65,
                                      fit: pw.BoxFit.cover,
                                    ),
                                    pw.Column(
                                        mainAxisSize: pw.MainAxisSize.max,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                            'ZION SOOTHING HAVEN INC',
                                            style: pw.TextStyle(
                                              fontSize: 18,
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                            // style: FlutterFlowTheme.of(context).headlineSmall.override(
                                            //       fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                            //       letterSpacing: 0.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       useGoogleFonts:
                                            //           !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                            //     ),
                                          ),
                                          pw.Text(
                                            'Unit 15 Arca Strip Commercial Inc. Arthur Highway Cor. \nAction Drive, Dalandanan, Valenzuela City',
                                            style: pw.TextStyle(
                                              fontSize: 10,
                                            ),
                                            // style: FlutterFlowTheme.of(context).bodySmall.override(
                                            //       fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                            //       color: FlutterFlowTheme.of(context).secondaryText,
                                            //       letterSpacing: 0.0,
                                            //       useGoogleFonts:
                                            //           !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                            //     ),
                                          ),
                                          pw.Text(
                                            'Tel No.: 09-123-456-7890',
                                            style: pw.TextStyle(
                                              fontSize: 10,
                                            ),
                                            // style: FlutterFlowTheme.of(context).bodySmall.override(
                                            //       fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                            //       color: FlutterFlowTheme.of(context).secondaryText,
                                            //       letterSpacing: 0.0,
                                            //       useGoogleFonts:
                                            //           !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                            //     ),
                                          ),
                                        ]),
                                  ]),

                              // Generated code for this Column Widget...
                              pw.Column(
                                  mainAxisSize: pw.MainAxisSize.max,
                                  children: [
                                    pw.Align(
                                      alignment: pw.AlignmentDirectional(0, -1),
                                      child: pw.Padding(
                                        padding:
                                            pw.EdgeInsetsDirectional.fromSTEB(
                                                24, 0, 24, 0),
                                        child: pw.Text(
                                          'Certificate',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                              fontSize: 20,
                                              fontWeight: pw.FontWeight.bold),
                                          // style: FlutterFlowTheme.of(context).headlineMedium.override(
                                          //       fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                          //       letterSpacing: 0.0,
                                          //       fontWeight: FontWeight.bold,
                                          //       useGoogleFonts:
                                          //           !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                          //     ),
                                        ),
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.AlignmentDirectional(0, -1),
                                      child: pw.Padding(
                                        padding:
                                            pw.EdgeInsetsDirectional.fromSTEB(
                                                24, 0, 24, 0),
                                        child: pw.Text(
                                          'Valid from Feb 27, 2025 - Mar 06, 2025',
                                          textAlign: pw.TextAlign.center,
                                          style: pw.TextStyle(
                                            fontSize: 10,
                                          ),
                                          // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //       fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                          //       color: FlutterFlowTheme.of(context).secondaryText,
                                          //       letterSpacing: 0.0,
                                          //       useGoogleFonts:
                                          //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                          //     ),
                                        ),
                                      ),
                                    ),
                                  ]),

                              // Generated code for this Column Widget...
                              pw.Column(
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Padding(
                                    padding: pw.EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: pw.Container(
                                      width: double.infinity,
                                      decoration: pw.BoxDecoration(
                                        // color: PdfColor(0, 0, 0, 0.04),
                                        borderRadius:
                                            pw.BorderRadius.circular(8),
                                      ),
                                      child: pw.Padding(
                                        padding:
                                            pw.EdgeInsetsDirectional.fromSTEB(
                                                12, 16, 12, 16),
                                        child: pw.Row(
                                          mainAxisSize: pw.MainAxisSize.max,
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            pw.Text(
                                              'Item',
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                              // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                              //     ),
                                            ),
                                            pw.Text(
                                              'Qty.',
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                              // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                              //     ),
                                            ),
                                            pw.Text(
                                              'Unit Price',
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                              // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                              //     ),
                                            ),
                                            pw.Text(
                                              'Amount',
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                                fontWeight: pw.FontWeight.bold,
                                              ),
                                              // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                              //     ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //ITEMS
                                  pw.ListView.builder(
                                    itemCount: products?.length ?? 0,
                                    itemBuilder: (context, i) {
                                      final product = products![i];
                                      return pw.Column(children: [
                                        pw.Padding(
                                          padding:
                                              pw.EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          child: pw.Divider(
                                            thickness: 1,
                                            // color: FlutterFlowTheme.of(context).alternate,
                                          ),
                                        ),
                                        pw.Padding(
                                          padding:
                                              pw.EdgeInsetsDirectional.fromSTEB(
                                                  12, 16, 12, 16),
                                          child: pw.Row(
                                            mainAxisSize: pw.MainAxisSize.max,
                                            mainAxisAlignment: pw
                                                .MainAxisAlignment.spaceBetween,
                                            children: [
                                              pw.Expanded(
                                                child: pw.Column(
                                                  mainAxisSize:
                                                      pw.MainAxisSize.max,
                                                  crossAxisAlignment: pw
                                                      .CrossAxisAlignment.start,
                                                  children: [
                                                    pw.Text(
                                                      product.name ??
                                                          'Unknown Product',
                                                      style: pw.TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    // pw.Text(
                                                    //   'FREEBIE',
                                                    //   style: pw.TextStyle(
                                                    //     fontSize: 12,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              pw.Spacer(),
                                              pw.Text(
                                                product.quantity > 0
                                                    ? product.quantity
                                                        .toString()
                                                    : '0',
                                                style: pw.TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              pw.Spacer(),
                                              pw.Text(
                                                'PHP ${product.price.toStringAsFixed(2)}',
                                                style: pw.TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              pw.Spacer(),
                                              pw.Text(
                                                product.quantity > 0
                                                    ? 'PHP ${(product.price * product.quantity).toStringAsFixed(2)}'
                                                    : 'PHP 0.00',
                                                style: pw.TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]);
                                    },
                                  ),

                                  pw.Padding(
                                    padding: pw.EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 0),
                                    child: pw.Divider(
                                      thickness: 1,
                                      // color: FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: pw.EdgeInsetsDirectional.fromSTEB(
                                        12, 16, 12, 16),
                                    child: pw.Column(
                                        mainAxisSize: pw.MainAxisSize.max,
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.end,
                                        children: [
                                          pw.Row(
                                            mainAxisSize: pw.MainAxisSize.max,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Text(
                                                  'Subtotal:',
                                                  style: pw.TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  //       fontFamily:
                                                  //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                  //       letterSpacing: 0.0,
                                                  //       useGoogleFonts:
                                                  //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                  //     ),
                                                ),
                                              ),
                                              pw.Align(
                                                alignment:
                                                    pw.AlignmentDirectional(
                                                        1, 0),
                                                child: pw.Container(
                                                  width: 150,
                                                  decoration:
                                                      pw.BoxDecoration(),
                                                  child: pw.Align(
                                                    alignment:
                                                        pw.AlignmentDirectional(
                                                            1, -1),
                                                    child: pw.Text(
                                                      subtotal != null
                                                          ? 'PHP ${subtotal.toStringAsFixed(2)}'
                                                          : 'PHP 0.00',
                                                      style: pw.TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      //       fontFamily:
                                                      //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                      //       letterSpacing: 0.0,
                                                      //       useGoogleFonts: !FlutterFlowTheme.of(context)
                                                      //           .bodyMediumIsCustom,
                                                      //     ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          pw.Row(
                                            mainAxisSize: pw.MainAxisSize.max,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Text(
                                                  'Tax (12%):',
                                                  style: pw.TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  //       fontFamily:
                                                  //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                  //       letterSpacing: 0.0,
                                                  //       useGoogleFonts:
                                                  //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                  //     ),
                                                ),
                                              ),
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Align(
                                                  alignment:
                                                      pw.AlignmentDirectional(
                                                          1, -1),
                                                  child: pw.Text(
                                                    tax != null
                                                        ? 'PHP ${(subtotal! * tax / 100).toStringAsFixed(2)}'
                                                        : 'PHP 0.00',
                                                    style: pw.TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    //       fontFamily:
                                                    //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                    //       letterSpacing: 0.0,
                                                    //       useGoogleFonts: !FlutterFlowTheme.of(context)
                                                    //           .bodyMediumIsCustom,
                                                    //     ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          pw.Row(
                                            mainAxisSize: pw.MainAxisSize.max,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Text(
                                                  'Total Discounts:',
                                                  style: pw.TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  //       fontFamily:
                                                  //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                  //       letterSpacing: 0.0,
                                                  //       useGoogleFonts:
                                                  //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                  //     ),
                                                ),
                                              ),
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Align(
                                                  alignment:
                                                      pw.AlignmentDirectional(
                                                          1, -1),
                                                  child: pw.Text(
                                                    discount != null &&
                                                            discount > 0
                                                        ? 'PHP ${discount.toStringAsFixed(2)}'
                                                        : 'PHP 0.00',

                                                    style: pw.TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    //       fontFamily:
                                                    //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                    //       letterSpacing: 0.0,
                                                    //       useGoogleFonts: !FlutterFlowTheme.of(context)
                                                    //           .bodyMediumIsCustom,
                                                    //     ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          pw.Row(
                                            mainAxisSize: pw.MainAxisSize.max,
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.end,
                                            children: [
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Text(
                                                  'Total Amount Due:',
                                                  style: pw.TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  //       fontFamily:
                                                  //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                  //       letterSpacing: 0.0,
                                                  //       fontWeight: FontWeight.w600,
                                                  //       useGoogleFonts:
                                                  //           !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                  //     ),
                                                ),
                                              ),
                                              pw.Container(
                                                width: 150,
                                                decoration: pw.BoxDecoration(),
                                                child: pw.Align(
                                                  alignment:
                                                      pw.AlignmentDirectional(
                                                          1, -1),
                                                  child: pw.Text(
                                                    total != null
                                                        ? 'PHP ${total.toStringAsFixed(2)}'
                                                        : 'PHP 0.00',
                                                    style: pw.TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            pw.FontWeight.bold),
                                                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    //       fontFamily:
                                                    //           FlutterFlowTheme.of(context).bodyMediumFamily,
                                                    //       letterSpacing: 0.0,
                                                    //       fontWeight: FontWeight.w600,
                                                    //       useGoogleFonts: !FlutterFlowTheme.of(context)
                                                    //           .bodyMediumIsCustom,
                                                    //     ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              pw.Spacer(),
                              // Generated code for this Divider Widget...
                              // Generated code for this Row Widget...
                              pw.Padding(
                                padding: pw.EdgeInsetsDirectional.fromSTEB(
                                    24, 0, 24, 0),
                                child: pw.Row(
                                    mainAxisSize: pw.MainAxisSize.max,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Column(
                                          mainAxisSize: pw.MainAxisSize.max,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                              'Payment Information',
                                              style: pw.TextStyle(
                                                fontSize: 12,
                                              ),
                                              // style: FlutterFlowTheme.of(context)
                                              //     .bodyMedium
                                              //     .override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(
                                              //                   context)
                                              //               .bodyMediumIsCustom,
                                              //     ),
                                            ),
                                            pw.SizedBox(
                                              height: 12,
                                            ),
                                            pw.Image(
                                              pwBdoLogo,
                                              width: 80,
                                              height: 40,
                                              fit: pw.BoxFit.contain,
                                            ),
                                            pw.Text(
                                              'Account No.: 011-208-000-868',
                                              style: pw.TextStyle(
                                                fontSize: 10,
                                              ),
                                              // style: FlutterFlowTheme.of(context)
                                              //     .bodySmall
                                              //     .override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodySmallFamily,
                                              //       letterSpacing: 0.0,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(
                                              //                   context)
                                              //               .bodySmallIsCustom,
                                              //     ),
                                            ),
                                            pw.Image(
                                              pwunionLogo,
                                              width: 132.2,
                                              height: 40,
                                              fit: pw.BoxFit.cover,
                                              alignment: pw.Alignment(-1, -1),
                                            ),
                                            // pw.SizedBox(height: 80, width: 40,),
                                            pw.Text(
                                              'Account No.: 000-360-014-720',
                                              style: pw.TextStyle(
                                                fontSize: 10,
                                              ),
                                              // style: FlutterFlowTheme.of(context)
                                              //     .bodySmall
                                              //     .override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodySmallFamily,
                                              //       letterSpacing: 0.0,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(
                                              //                   context)
                                              //               .bodySmallIsCustom,
                                              //     ),
                                            ),
                                          ]),
                                      pw.Column(
                                          mainAxisSize: pw.MainAxisSize.max,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            // pw.SizedBox(height: 80, width: 40,),
                                            pw.Image(
                                              pwZionLogo,
                                              width: 50,
                                              height: 50,
                                              fit: pw.BoxFit.cover,
                                            ),
                                            pw.Text(
                                              'Zion Soothing Haven Inc.',
                                              style: pw.TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      pw.FontWeight.bold),
                                              // style: FlutterFlowTheme.of(context)
                                              //     .bodyMedium
                                              //     .override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodyMediumFamily,
                                              //       letterSpacing: 0.0,
                                              //       fontWeight: FontWeight.w600,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(
                                              //                   context)
                                              //               .bodyMediumIsCustom,
                                              //     ),
                                            ),
                                            pw.Text(
                                              'Unit 15 Arca Strip Commercial Inc. \nArthur Highway Cor. Action Drive, \nDalandanan, Valenzuela City',
                                              style: pw.TextStyle(
                                                fontSize: 10,
                                              ),
                                              // style: FlutterFlowTheme.of(context)
                                              //     .bodySmall
                                              //     .override(
                                              //       fontFamily:
                                              //           FlutterFlowTheme.of(context)
                                              //               .bodySmallFamily,
                                              //       color:
                                              //           FlutterFlowTheme.of(context)
                                              //               .secondaryText,
                                              //       letterSpacing: 0.0,
                                              //       useGoogleFonts:
                                              //           !FlutterFlowTheme.of(
                                              //                   context)
                                              //               .bodySmallIsCustom,
                                              //     ),
                                            ),
                                          ]),
                                    ]),
                              )
                            ]),
                      ),
                    ))));
      }));

  final Uint8List pdfBytes = await pdf.save();
  // await Printing.sharePdf(bytes: pdfBytes, filename: 'quotation.pdf');

  final uploadedFile = FFUploadedFile(bytes: pdfBytes, name: 'quotation.pdf');

  return uploadedFile;
}
