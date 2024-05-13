//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(appWidget());
}

class appWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.black, 
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.blue), 
            bodyText2: TextStyle(
                color: Colors.blue),
          ),
        ),
        home: Scaffold(
          body: HomePage(),
          bottomNavigationBar: creditos(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Conversor Monetário',
              style: TextStyle(
                  color: const Color.fromARGB(255, 7, 230, 255),
                  decoration: TextDecoration.none),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: realController,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                        labelText: 'REAIS',
                        labelStyle: TextStyle(color: Colors.blue),
                        prefixText: 'R\$', 
                        prefixStyle: TextStyle(color: Colors.blue)),
                    onChanged: (value) {
                      double realValue = double.tryParse(value) ?? 0.0;
                      double dollarValue = realValue /
                          5.20; 
                      double euroValue = realValue /
                          5.55;
                      dollarController.text = dollarValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: dollarController,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                        labelText: 'DÓLARES',
                        labelStyle: TextStyle(color: Colors.blue),
                        prefixText: 'U\$',
                        prefixStyle: TextStyle(color: Colors.blue)),
                    onChanged: (value) {
                      double dollarValue = double.tryParse(value) ?? 0.0;
                      double realValue = dollarValue *
                          5.20; 
                      double euroValue = realValue /
                          5.55;
                      realController.text = realValue.toStringAsFixed(2);
                      euroController.text = euroValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: euroController,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                        labelText: 'EUROS',
                        labelStyle: TextStyle(color: Colors.blue),
                        prefixText: '€U',
                        prefixStyle: TextStyle(color: Colors.blue)),
                    onChanged: (value) {
                      double euroValue = double.tryParse(value) ?? 0.0;
                      double realValue =
                          euroValue * 5.55;
                      double dollarValue = realValue /
                          5.20; 
                      realController.text = realValue.toStringAsFixed(2);
                      dollarController.text = dollarValue.toStringAsFixed(2);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 40.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Por: Sarah Kristiny'));
  }
}
