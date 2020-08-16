import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trustfall/theme.dart';
import 'package:trustfall/widgets/form_input.dart';
import 'package:trustfall/widgets/primary_button.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:trustfall/screens/signup/signup_controller.dart';

class SignupView {
  Scaffold get(SignupPageState signupPageState){
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox.fromSize(
                        size: Size(56, 56), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent, // button color
                            child: InkWell(
                              splashColor: Colors.black26, // splash color
                              onTap: () {
                                SystemNavigator.pop();
                              }, // button pressed
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xff09090B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        "Let's Get Started",
                        style: new TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff09090B)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        "Create and account to TrustFall to get all features",
                        style: new TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff09090B).withOpacity(0.5)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: <Widget>[
                        IconFormInput(
                            hint: "Your Name",
                            icon: OMIcons.people,
                            onChanged: (text) => signupPageState.username = text
                        ),
                        IconFormInput(
                            hint: "Mobile No",
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            icon: OMIcons.call,
                            onChanged: (text) => signupPageState.mobile = text
                        ),
                        IconFormInput(
                            hint: "Your Password",
                            icon: OMIcons.lock,
                            maxLength: 10,
                            obscureText: true,
                            onChanged: (text) => signupPageState.password = text
                        ),
                        IconFormInput(
                            hint: "Emergency Contact No",
                            icon: OMIcons.howToReg,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            onChanged: (text) => signupPageState.emergency_contact = text
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        PrimaryButton(
                          text: "Sign up",
                          isLoading: signupPageState.isSignUpLoading,
                          onClick: () => signupPageState.createUserc(context),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: ThemeColors().black.withOpacity(0.6)
                              )
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: (){
                                signupPageState.openLogin();
                              },
                              child: Text(
                                "Login here".toUpperCase(),
                                style: TextStyle(
                                  color: ThemeColors().dark_yellow,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}