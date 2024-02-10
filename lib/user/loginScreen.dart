import 'dart:ui';

import 'package:applicationflutter/widgets/clippers.dart';
import 'package:applicationflutter/widgets/feild_widget.dart';
import 'package:applicationflutter/widgets/show_up_animation.dart';
import 'package:applicationflutter/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  bool _isBottomSheetExpanded = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(1, 20, 20, 24),
      // ),
      body: Column(
        children: [
          ClipPath(
            //Custom Clipper
            clipper: CustomUpClip(),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: height * 0.3,
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColorLight),
              alignment: Alignment.center,
              child: InkWell(
                //Using Ink well to change the isLogin value
                onTap: () {
                  setState(() {
                    isLogin = false;
                  });
                },

                child: TextUtil(
                  text: "Sign-up",
                  size: 30,
                ),
              ),
            ),

            // U can add images t
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom FieldWidget
                const FieldWidget(
                  title: "Email",
                  icon: Icons.mail,
                ),
                const FieldWidget(
                  title: "Password",
                  icon: Icons.key,
                ),
                const FieldWidget(
                  title: "Confirm Password",
                  icon: Icons.key,
                ),
                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorLight),
                    onPressed: () {},
                    child: TextUtil(
                      text: 'Sign-Up',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: ClipPath(
        // Custom Clipper
        clipper: CustomBottomClip(),

        //Using gesture detector to change the isLogic value
        child: GestureDetector(
          onTap: () {
            setState(() {
              isLogin = true;
            });
          },

          // AnimatedContainer to handle animation
          child: AnimatedContainer(
            //Duration
            duration: const Duration(milliseconds: 400),
            //Curve
            curve: Curves.decelerate,
            color: Theme.of(context).primaryColor,

            ///changing the height of bottom sheet with animation using animatedContaineer
            height: isLogin ? height * 0.8 : height * 0.1,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///AnimatedContainer to handle animation of size of the container basically height only
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: isLogin ? 100 : 50,
                  //height: _isBottomSheetExpanded ? height * 0.8 : height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: TextUtil(
                    text: "Login",
                    size: 30,
                  ),
                ),
                Expanded(
                  child: isLogin
                      ? ShowUpAnimation(
                          delay: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Custom FieldWidget
                                const FieldWidget(
                                  title: "Email",
                                  icon: Icons.email,
                                ),
                                const FieldWidget(
                                    title: "Password", icon: Icons.key),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .primaryColorLight),
                                    onPressed: () {},
                                    child: TextUtil(text: 'Login'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
