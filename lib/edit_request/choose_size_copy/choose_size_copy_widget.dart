import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_size_copy_model.dart';
export 'choose_size_copy_model.dart';

class ChooseSizeCopyWidget extends StatefulWidget {
  const ChooseSizeCopyWidget({
    Key? key,
    required this.aptType,
    bool? edit,
    this.ref,
  })  : this.edit = edit ?? false,
        super(key: key);

  final DocumentReference? aptType;
  final bool edit;
  final RequestsRecord? ref;

  @override
  _ChooseSizeCopyWidgetState createState() => _ChooseSizeCopyWidgetState();
}

class _ChooseSizeCopyWidgetState extends State<ChooseSizeCopyWidget> {
  late ChooseSizeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseSizeCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    FFIcons.karrowBackOutline,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Объем',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<SizesRecord>>(
            future: querySizesRecordOnce(
              parent: widget.aptType,
              queryBuilder: (sizesRecord) => sizesRecord.orderBy('cost'),
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
              List<SizesRecord> columnSizesRecordList = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(columnSizesRecordList.length, (columnIndex) {
                  final columnSizesRecord = columnSizesRecordList[columnIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().totalPrice =
                              FFAppState().totalPrice + columnSizesRecord.cost;
                        });
                        if (widget.aptType?.id == 'Z3sYDNdXnLQD0ggwfnkM') {
                          context.pushNamed(
                            'EditPage',
                            queryParameters: {
                              'aptType': serializeParam(
                                widget.aptType,
                                ParamType.DocumentReference,
                              ),
                              'aptSize': serializeParam(
                                columnSizesRecord.reference,
                                ParamType.DocumentReference,
                              ),
                              'ref': serializeParam(
                                widget.ref,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'ref': widget.ref,
                            },
                          );
                        } else {
                          context.pushNamed(
                            'AdditionalCopy',
                            queryParameters: {
                              'aptType': serializeParam(
                                widget.aptType,
                                ParamType.DocumentReference,
                              ),
                              'aptSize': serializeParam(
                                columnSizesRecord.reference,
                                ParamType.DocumentReference,
                              ),
                              'ref': serializeParam(
                                widget.ref,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'ref': widget.ref,
                            },
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 6.0, 12.0, 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    columnSizesRecord.size,
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  Text(
                                    'От ${formatNumber(
                                      columnSizesRecord.cost,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.automatic,
                                    )} ₸ ',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
