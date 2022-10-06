import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordGenPageWidget extends StatefulWidget {
  const PasswordGenPageWidget({Key? key}) : super(key: key);

  @override
  _PasswordGenPageWidgetState createState() => _PasswordGenPageWidgetState();
}

class _PasswordGenPageWidgetState extends State<PasswordGenPageWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'passwordGenPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF0B100B),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('PASSWORD_GEN_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Oryx Password Generator',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 21,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(PasswordgeneratorCall.call()))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: SpinKitChasingDots(
                          color: Color(0xFF063932),
                          size: 50,
                        ),
                      ),
                    );
                  }
                  final listViewPasswordgeneratorResponse = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () async {
                      logFirebaseEvent(
                          'PASSWORD_GEN_ListView_dwgk1ztk_ON_PULL_T');
                      logFirebaseEvent('ListView_Refresh-Database-Request');
                      setState(() => _apiRequestCompleter = null);
                      await waitForApiRequestCompleter();
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://images.unsplash.com/photo-1530075288903-69b220251c3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZnVsbCUyMGhkJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-0.3, -0.65),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                              child: Stack(
                                children: [
                                  Text(
                                    getJsonField(
                                      listViewPasswordgeneratorResponse
                                          .jsonBody,
                                      r'''$.random_password''',
                                    ).toString(),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
