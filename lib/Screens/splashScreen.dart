import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/loginProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    callFunction();
  }

  callFunction() {
    Provider.of<GoogleSignInProvider>(context, listen: false)
        .getsharedpref(context);
  }

  _buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoActivityIndicator(
                  radius: 25,
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context);

    return Scaffold(
        backgroundColor: Colors.greenAccent[100], body: _buildBody());
  }
}
