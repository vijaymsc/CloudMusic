import 'package:cloud_music/provider/firebase_provider.dart';
import 'package:cloud_music/shared_prefrance/shared_preference_const.dart';
import 'package:cloud_music/shared_prefrance/shared_prefrance_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Route_page/route_setup.dart';
import 'firebase_options.dart';
import 'login_register/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  bool userLoginStatus = false;

  checkUserLogin() async {
    print(userLoginStatus);
    userLoginStatus =
        await PreferenceHelper.getBool(PreferenceConstant.userLoginStatus);
    print('userLoginStatus::${ await PreferenceHelper.getBool(PreferenceConstant.userLoginStatus)}');
  }

  @override
  void initState() {
    // TODO: implement initState
    //checkUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final _auth = FirebaseAuth.instance.currentUser;

    return ChangeNotifierProvider(
      create: (context) => FirebaseProvide(),
      child: MaterialApp(
        navigatorKey: navigationKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: RouterViews.generateRoute,
        home: userLoginStatus ? const HomeScreen() : const LoginUser(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseProvide>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFecfefa),
        appBar: AppBar(
          title: const Text("welcome"),
        ),
        body: Column(
          children: const [],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // await  Provider.of<FirebaseProvide>(context,listen: false).createGroup("music_freek","vijay");
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
