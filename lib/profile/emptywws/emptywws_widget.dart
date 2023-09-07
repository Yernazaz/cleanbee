import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emptywws_model.dart';
export 'emptywws_model.dart';

class EmptywwsWidget extends StatefulWidget {
  const EmptywwsWidget({Key? key}) : super(key: key);

  @override
  _EmptywwsWidgetState createState() => _EmptywwsWidgetState();
}

class _EmptywwsWidgetState extends State<EmptywwsWidget> {
  late EmptywwsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptywwsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 400.0,
      height: 400.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Нет завершенных заказов',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
