import 'dart:async';
import 'package:events/Services/auth_services.dart';
import 'package:events/provider/userProvider.dart';
import 'package:events/routes.dart';
import 'package:events/screens/authentication/signin_screen.dart';
import 'package:events/screens/homewrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    //TODO  Add Event Provider And Other Providers Here
  ], child: const MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().checkUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var prefsData = prefs.data;
          return MaterialApp(
              title: 'Evento',
              color: Colors.white,
              onGenerateRoute: Routes.onGenerateRoute,
              debugShowCheckedModeBanner: false,
              home: prefsData?.getString('token') != null &&
                      prefsData?.getString('token') != ''
                  ? Container(
                      color: Colors.white,
                      child: const SafeArea(
                        maintainBottomViewPadding: true,
                        child: HomeWrapper(),
                      ),
                    )
                  : const SafeArea(
                      bottom: true,
                      top: false,
                      child: SignInScreen(),
                    ));
        });
  }
}
