import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'back_button_component_model.dart';
export 'back_button_component_model.dart';

class BackButtonComponentWidget extends StatefulWidget {
  const BackButtonComponentWidget({super.key});

  @override
  State<BackButtonComponentWidget> createState() =>
      _BackButtonComponentWidgetState();
}

class _BackButtonComponentWidgetState extends State<BackButtonComponentWidget> {
  late BackButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackButtonComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 0.0, 20.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.safePop();
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).backButtonBackGround,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 0.5,
            ),
          ),
          child: Icon(
            Icons.chevron_left_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 26.0,
          ),
        ),
      ),
    );
  }
}
