import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../privacy_policy/privacy_policy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(40, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(-40, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'settings'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (Theme.of(context).brightness == Brightness.light)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('SETTINGS_PAGE_isLightMode_ON_TAP');
                      logFirebaseEvent('isLightMode_Set-Dark-Mode-Settings');
                      setDarkModeSetting(context, ThemeMode.dark);
                      logFirebaseEvent('isLightMode_Widget-Animation');
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        setState(() => hasContainerTriggered2 = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation2']!
                                .controller
                                .forward(from: 0.0));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Switch to Dark Mode',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.nights_stay,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.85, 0),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x430B0D0F),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation1']!,
                                        hasBeenTriggered:
                                            hasContainerTriggered1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (Theme.of(context).brightness == Brightness.dark)
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent('SETTINGS_PAGE_isDarkMode_ON_TAP');
                      logFirebaseEvent('isDarkMode_Set-Dark-Mode-Settings');
                      setDarkModeSetting(context, ThemeMode.light);
                      logFirebaseEvent('isDarkMode_Widget-Animation');
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        setState(() => hasContainerTriggered1 = true);
                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'containerOnActionTriggerAnimation1']!
                                .controller
                                .forward(from: 0.0));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Switch to Light Mode',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 2, 0, 0),
                                      child: Icon(
                                        Icons.wb_sunny_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.9, 0),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x430B0D0F),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ).animateOnActionTrigger(
                                        animationsMap[
                                            'containerOnActionTriggerAnimation2']!,
                                        hasBeenTriggered:
                                            hasContainerTriggered2),
                                  ),
                                ],
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
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                    child: Text(
                      'Account Settings',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x3416202A),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Privacy Policy',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.9, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'SETTINGS_PAGE_Icon_lufonsh9_ON_TAP');
                                logFirebaseEvent('Icon_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: PrivacyPolicyWidget(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('SETTINGS_PAGE_EXIT_BTN_ON_TAP');
                        logFirebaseEvent('Button_Close-Dialog,-Drawer,-Etc');
                        Navigator.pop(context);
                      },
                      text: 'EXIT',
                      options: FFButtonOptions(
                        width: 90,
                        height: 40,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyText2
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                        elevation: 1,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
