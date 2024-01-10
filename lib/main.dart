import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cloud_music/core/baseWidget.dart';
import 'package:cloud_music/provider/firebase_provider.dart';
import 'package:cloud_music/widgets/custom_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'Route_page/route_constant.dart';
import 'Route_page/route_setup.dart';
import 'UI/login_register/login_view.dart';
import 'UI/shared_prefrance/shared_preference_const.dart';
import 'UI/shared_prefrance/shared_prefrance_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  @override
  Widget build(BuildContext context) {
    // final _auth = FirebaseAuth.instance.currentUser;
    return ChangeNotifierProvider(
      create: (context) => FirebaseProvide(),
      child: MaterialApp(
        navigatorKey: navigationKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: RouterViews.generateRoute,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool userLoginStatus = false;
  @override
  void initState() {
    checkUserLogin();
    var duration = const Duration(seconds: 4);
    Timer(duration, () {
      _navigateScreen();
    });
    // TODO: implement initState
    super.initState();
  }

  checkUserLogin() async {
    userLoginStatus =
        await PreferenceHelper.getBool(PreferenceConstant.userLoginStatus);
  }

  _navigateScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => userLoginStatus ? const HomeScreen() : const LoginUser(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/splashScreen.json',
              fit: BoxFit.fitHeight,
            ),
          ],
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
  Random random = Random();
  FirebaseProvide? _firebaseProvide;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<FirebaseProvide>(
        model: FirebaseProvide(),
        onModelReady: (model) {
          model.getAllGroupList();
        },
        builder: (context, model, child) {
          _firebaseProvide = model;
          return Scaffold(
            appBar: AppBar(
              title: const Text("welcome"),
            ),
            drawer: Drawer(
              child: SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        btnText: 'LogOut',
                        btnClick: () async {
                          bool status = await model.logOut();
                          if (status && mounted) {
                            showSnackBarNew(context, "LogOut Successfully");
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.loginUser);
                          } else {
                            showSnackBarNew(context, "LogOut Failed");
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                ListView.builder(
                    itemCount: model.getGroupData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Text("${model.getGroupData[index].groupName}");
                    })
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var groupId = randomGroupId();
                // await  Provider.of<FirebaseProvide>(context,listen: false).createGroup(
                //     adminName: 'vijay',groupName:"music freek" ,userId:"lingesh",groupId: groupId );
                //  await  Provider.of<FirebaseProvide>(context,listen: false).addMemberInGroup( grpDocumentId: 'B7dU3C1aOf3sppzqncDY',userId:"siva" );
                //  await  Provider.of<FirebaseProvide>(context,listen: false).getMemberLis(grpDocumentId: "B7dU3C1aOf3sppzqncDY",fieldId: "members");
                model.getAllGroupList();
                //  value.getCollectionDocIds();
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  randomGroupId() {
    List<int> value = List.generate(5, (index) => random.nextInt(255));
    List<String> a = base64Encode(value).split('');
    a.shuffle();
    var data = a.join('');
    return data;
  }
}
