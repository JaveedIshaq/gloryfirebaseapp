import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gloryfirebaseapp/home_page.dart';
import 'package:gloryfirebaseapp/login_widget.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppAuth extends StatelessWidget {
  const AppAuth({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginWidget();
            }
          },
        ),
      );
}
