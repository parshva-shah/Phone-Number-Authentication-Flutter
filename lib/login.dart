import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/otp.dart';
import 'package:phone_auth_project/theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // key: loginStore.loginScaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 240,
                                constraints:
                                    const BoxConstraints(maxWidth: 600),
                                margin: const EdgeInsets.only(top: 50),
                                decoration: const BoxDecoration(
                                    color: MyColors.primaryBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                            Center(
                              child: Container(
                                  constraints:
                                      const BoxConstraints(maxHeight: 300),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset(
                                    'assets/1.png',
                                    color: MyColors.primaryPink,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text('GetVerified',
                              style: TextStyle(
                                  color: MyColors.primaryBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          // constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'We will send you an ',
                                  style: TextStyle(
                                      color: MyColors.primaryBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                              TextSpan(
                                  text: 'One Time Password ',
                                  style: TextStyle(
                                      color: MyColors.primaryPink,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900)),
                              TextSpan(
                                  text: 'on this mobile number ',
                                  style: TextStyle(
                                      color: MyColors.primaryBlue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                            ]),
                          )),
                      Container(
                        height: 40,
                        constraints: const BoxConstraints(maxWidth: 500),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CupertinoTextField(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          controller: phoneController,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 18),
                          maxLength: 10,
                          placeholder: 'Enter your Number',
                          prefix: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              "+91",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: RaisedButton(
                          color: MyColors.primaryBlue,
                          onPressed: () {
                            if (phoneController.text.length == 10) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      OTPScreen(phoneController.text)));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Please enter a valid number",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "Accept",
                                              style: TextStyle(fontSize: 17),
                                            )),
                                      ],
                                    );
                                  });
                            }
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'Confirm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(9),
                                  // decoration: const BoxDecoration(
                                  //   borderRadius: const BorderRadius.all(
                                  //       Radius.circular(20)),
                                  //   color: MyColors.primaryBlue,
                                  // ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
