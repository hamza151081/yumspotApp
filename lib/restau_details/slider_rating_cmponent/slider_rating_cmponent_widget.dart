import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'slider_rating_cmponent_model.dart';
export 'slider_rating_cmponent_model.dart';

class SliderRatingCmponentWidget extends StatefulWidget {
  const SliderRatingCmponentWidget({super.key});

  @override
  State<SliderRatingCmponentWidget> createState() =>
      _SliderRatingCmponentWidgetState();
}

class _SliderRatingCmponentWidgetState
    extends State<SliderRatingCmponentWidget> {
  late SliderRatingCmponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SliderRatingCmponentModel());

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
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '5',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Color(0xFFFEA500),
                  inactiveColor: Color(0x100F172A),
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue1 ??= 10.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue1 = newValue);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '4',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Color(0xFFFEA500),
                  inactiveColor: Color(0x100F172A),
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue2 ??= 4.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue2 = newValue);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '3',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Color(0xFFFEA500),
                  inactiveColor: Color(0x100F172A),
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue3 ??= 8.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue3 = newValue);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '2',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Color(0xFFFEA500),
                  inactiveColor: Color(0x100F172A),
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue4 ??= 3.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue4 = newValue);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  '1',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Slider(
                  activeColor: Color(0xFFFEA500),
                  inactiveColor: Color(0x100F172A),
                  min: 0.0,
                  max: 10.0,
                  value: _model.sliderValue5 ??= 2.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.sliderValue5 = newValue);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
