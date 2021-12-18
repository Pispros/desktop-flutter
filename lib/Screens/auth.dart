import 'package:demo_app/constants/environnement.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: appViewPort(context).width,
        height: appViewPort(context).height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: appViewPort(context).width / 1.5,
                height: appViewPort(context).height / 1.6,
                child: Image(
                  image: AssetImage('images/welcome.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: appViewPort(context).width / 2,
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Saisir votre Licence",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("welcome");
                },
                child: Text(
                  "Continuer",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 19),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
