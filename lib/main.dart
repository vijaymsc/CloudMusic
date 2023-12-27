import 'package:cloud_music/provider/firebase_provider.dart';
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
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FirebaseProvide(),
      child: MaterialApp(
        navigatorKey: navigationKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: RouterViews.generateRoute,
        home: const LoginUser(),
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
