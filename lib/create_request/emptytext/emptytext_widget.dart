import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptytext_model.dart';
export 'emptytext_model.dart';

class EmptytextWidget extends StatefulWidget {
  const EmptytextWidget({Key? key}) : super(key: key);

  @override
  _EmptytextWidgetState createState() => _EmptytextWidgetState();
}

class _EmptytextWidgetState extends State<EmptytextWidget> {
  late EmptytextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptytextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Запросов от исполнителей нет',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
