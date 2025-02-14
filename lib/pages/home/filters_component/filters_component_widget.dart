import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'filters_component_model.dart';
export 'filters_component_model.dart';

class FiltersComponentWidget extends StatefulWidget {
  const FiltersComponentWidget({super.key});

  @override
  State<FiltersComponentWidget> createState() => _FiltersComponentWidgetState();
}

class _FiltersComponentWidgetState extends State<FiltersComponentWidget> {
  late FiltersComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.restaurantsSpecialties =
          FFAppState().filterRestaurantSpecialities.toList().cast<String>();
      _model.typevalue = FFAppState().filterRestaurantType;
      _model.rating = FFAppState().filterRating;
      safeSetState(() {});
    });

    _model.switchValue = FFAppState().filterRrestaurantOpen != '';
    _model.switchfavorisValue = FFAppState().filterOnlyFavoris != '';
    _model.switchHalalValue = FFAppState().filterHalal;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Container(
                  width: 80.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: Color(0x63D9D9D9),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'Filter',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: Text(
                                'Restaurant Found ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Text(
                              '1004',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0x12000000),
              ),
              Container(
                width: 355.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Actuellement ouvert',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue = newValue);
                        if (newValue) {
                          _model.restaurantOpen = 'yes';
                          safeSetState(() {});
                        } else {
                          _model.restaurantOpen = null;
                          safeSetState(() {});
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primaryBtnText,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity8,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity30,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0x12000000),
              ),
              Container(
                width: 355.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Afficher que les favoris ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchfavorisValue!,
                      onChanged: (newValue) async {
                        safeSetState(
                            () => _model.switchfavorisValue = newValue);
                        if (newValue) {
                          if (!loggedIn) {
                            context.pushNamed('LoginPage');
                          }
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primaryBtnText,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity8,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity30,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0x12000000),
              ),
              Container(
                width: 355.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Afficher que les restaurants Halal',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchHalalValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchHalalValue = newValue);
                      },
                      activeColor: FlutterFlowTheme.of(context).primaryBtnText,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity8,
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).praimaryWithOpcity30,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                  child: Text(
                    'Types',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.typevalue = '';
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 110.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.typevalue == null ||
                                    _model.typevalue == ''
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: Color(0x19000000),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Tout',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: _model.typevalue == null ||
                                            _model.typevalue == ''
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.typevalue = 'Sucré';
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 110.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _model.typevalue == 'Sucré'
                                ? FlutterFlowTheme.of(context).primaryText
                                : Color(0x0DBC2B5D),
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: _model.typevalue == 'Sucré'
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : Color(0x99BC2B5D),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/marker_sucre.png',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Opacity(
                                opacity: 0.4,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Sucré',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: valueOrDefault<Color>(
                                              _model.typevalue == 'Sucré'
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.typevalue = 'Salé';
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 110.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: valueOrDefault<Color>(
                              _model.typevalue == 'Salé'
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context)
                                      .praimaryWithOpcity8,
                              FlutterFlowTheme.of(context).praimaryWithOpcity8,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: _model.typevalue == 'Salé'
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : Color(0x992D5646),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/marker_sale.png',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Opacity(
                                opacity: 0.4,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Salé',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: valueOrDefault<Color>(
                                              _model.typevalue == 'Salé'
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Divider(
                      thickness: 1.0,
                      color: Color(0x12000000),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Évaluation du restaurant',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Wrap(
                            spacing: 16.0,
                            runSpacing: 16.0,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 0.0;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 0.0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context)
                                          .praimaryWithOpcity8,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Tout',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: valueOrDefault<Color>(
                                              _model.rating == 0.0
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .praimaryWithOpcity30,
                                              FlutterFlowTheme.of(context)
                                                  .praimaryWithOpcity30,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 4.7;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 4.7
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context)
                                          .praimaryWithOpcity8,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.star_outline,
                                          color: valueOrDefault<Color>(
                                            _model.rating == 4.7
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .praimaryWithOpcity30,
                                          ),
                                          size: 14.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          ' 4.7 Étoiles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: valueOrDefault<Color>(
                                                  _model.rating == 4.7
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .praimaryWithOpcity30,
                                                  FlutterFlowTheme.of(context)
                                                      .praimaryWithOpcity30,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 4.6;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 4.6
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.star_outline,
                                          color: valueOrDefault<Color>(
                                            _model.rating == 4.6
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          size: 14.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          ' 4.6 Étoiles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: valueOrDefault<Color>(
                                                  _model.rating == 4.6
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .praimaryWithOpcity30,
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 4.5;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 4.5
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context)
                                          .praimaryWithOpcity8,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.star_outline,
                                          color: valueOrDefault<Color>(
                                            _model.rating == 4.5
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .praimaryWithOpcity30,
                                          ),
                                          size: 14.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          ' 4.5 Étoiles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: valueOrDefault<Color>(
                                                  _model.rating == 4.5
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .praimaryWithOpcity30,
                                                  FlutterFlowTheme.of(context)
                                                      .praimaryWithOpcity30,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 4.3;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 4.3
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context)
                                          .praimaryWithOpcity8,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.star_outline,
                                          color: valueOrDefault<Color>(
                                            _model.rating == 4.3
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .praimaryWithOpcity30,
                                          ),
                                          size: 14.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '4.3 Étoiles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: valueOrDefault<Color>(
                                                  _model.rating == 4.3
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .praimaryWithOpcity30,
                                                  FlutterFlowTheme.of(context)
                                                      .praimaryWithOpcity30,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.rating = 4.0;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 105.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      _model.rating == 4.0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .praimaryWithOpcity8,
                                      FlutterFlowTheme.of(context)
                                          .praimaryWithOpcity8,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.star_outline,
                                          color: valueOrDefault<Color>(
                                            _model.rating == 4.0
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .praimaryWithOpcity30,
                                          ),
                                          size: 14.0,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '4 Étoiles',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: valueOrDefault<Color>(
                                                  _model.rating == 4.0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .praimaryWithOpcity30,
                                                  FlutterFlowTheme.of(context)
                                                      .praimaryWithOpcity30,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0x12000000),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                      child: Text(
                        'Spécialité du restaurant',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  if (!_model.seeMoreSpecialities)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.seeMoreSpecialities = true;
                            safeSetState(() {});
                          },
                          child: Text(
                            'Voir plus',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  if (_model.seeMoreSpecialities)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.seeMoreSpecialities = false;
                            safeSetState(() {});
                          },
                          child: Text(
                            'Voir moins',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              FutureBuilder<List<RestaurantSpecialitiesRow>>(
                future: RestaurantSpecialitiesTable().queryRows(
                  queryFn: (q) => q,
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
                  List<RestaurantSpecialitiesRow>
                      containerRestaurantSpecialitiesRowList = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final specialities = (_model.seeMoreSpecialities
                                ? containerRestaurantSpecialitiesRowList
                                : containerRestaurantSpecialitiesRowList
                                    .take(6)
                                    .toList())
                            .toList();

                        return Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(specialities.length,
                              (specialitiesIndex) {
                            final specialitiesItem =
                                specialities[specialitiesIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.restaurantsSpecialties
                                    .contains(specialitiesItem.name)) {
                                  _model.removeFromRestaurantsSpecialties(
                                      specialitiesItem.name!);
                                  safeSetState(() {});
                                } else {
                                  _model.addToRestaurantsSpecialties(
                                      specialitiesItem.name!);
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                width: 112.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.restaurantsSpecialties
                                            .contains(specialitiesItem.name)
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .praimaryWithOpcity8,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    specialitiesItem.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            _model.restaurantsSpecialties
                                                    .contains(
                                                        specialitiesItem.name)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .praimaryWithOpcity30,
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
              if (false)
                Divider(
                  thickness: 1.0,
                  color: Color(0x12000000),
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Distance',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      inactiveColor: FlutterFlowTheme.of(context).tertiary,
                      min: 2.0,
                      max: 20.0,
                      value: _model.sliderValue ??=
                          FFAppState().distanceFilterKm.toDouble(),
                      onChanged: (newValue) {
                        newValue = double.parse(newValue.toStringAsFixed(0));
                        safeSetState(() => _model.sliderValue = newValue);
                      },
                    ),
                  ),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.directions_walk_outlined,
                          color: Color(0x660F172A),
                          size: 20.0,
                        ),
                        Text(
                          (double var1) {
                            return var1.toInt().toString().padLeft(2, '0');
                          }(_model.sliderValue!),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Text(
                            ' km',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    FFAppState().filterRestaurantType = _model.typevalue!;
                    FFAppState().distanceFilterKm =
                        (_model.sliderValue!).toInt();
                    FFAppState().filterRestaurantSpecialities =
                        _model.restaurantsSpecialties.toList().cast<String>();
                    safeSetState(() {});
                    if (_model.restaurantOpen != null &&
                        _model.restaurantOpen != '') {
                      FFAppState().filterRrestaurantOpen =
                          _model.restaurantOpen!;
                      safeSetState(() {});
                    } else {
                      FFAppState().filterRrestaurantOpen = '';
                      safeSetState(() {});
                    }

                    if (_model.switchfavorisValue!) {
                      FFAppState().filterOnlyFavoris = 'yes';
                      safeSetState(() {});
                    } else {
                      FFAppState().filterOnlyFavoris = '';
                      safeSetState(() {});
                    }

                    if (_model.switchHalalValue!) {
                      FFAppState().filterHalal = true;
                      safeSetState(() {});
                    } else {
                      FFAppState().filterHalal = true;
                      safeSetState(() {});
                    }

                    FFAppState().horizontalListVisibleOnMap = false;
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  text: 'Appliquer',
                  options: FFButtonOptions(
                    width: 357.0,
                    height: 56.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
