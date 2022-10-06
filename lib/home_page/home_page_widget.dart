import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF063932),
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
            logFirebaseEvent('HOME_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_Navigate-Back');
            context.pop();
          },
        ),
        title: Text(
          'Oryx',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.istockphoto.com%2Fphotos%2Fhd-wallpaper-for-mobile-phones-picture-id1257005098%3Fb%3D1%26k%3D20%26m%3D1257005098%26s%3D170667a%26w%3D0%26h%3Dje8sgDZ9o62xavDKDHVSaAE4M6wug7Yt5vOaPI0VHFo%3D&imgrefurl=https%3A%2F%2Funsplash.com%2Fwallpapers&tbnid=qRDj4KAGl-t8HM&vet=12ahUKEwjs9rWG5Mr6AhUTGRoKHaovDPQQMygQegUIARD8AQ..i&docid=wRD7XSpyxLvVhM&w=311&h=553&q=beautiful%20wallpapers&ved=2ahUKEwjs9rWG5Mr6AhUTGRoKHaovDPQQMygQegUIARD8AQ',
                    ).image,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    Image.network(
                      'https://images.unsplash.com/photo-1497250681960-ef046c08a56e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZnVsbCUyMGhkJTIwd2FsbHBhcGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.45),
                      child: FutureBuilder<ApiCallResponse>(
                        future: RandomwordCall.call(),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitDoubleBounce(
                                  color: Color(0xFF063932),
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          final textRandomwordResponse = snapshot.data!;
                          return Text(
                            getJsonField(
                              textRandomwordResponse.jsonBody,
                              r'''$.word''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w800,
                                    ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
