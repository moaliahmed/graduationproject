import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/core/routes_manager.dart';
import 'package:graduation_project/login/presentation/component/button_component.dart';
import 'package:graduation_project/login/presentation/component/text_form_field_component.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * .05,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/CoinmoneyLogo.svg',
                      // Update with your actual file path
                      width: MediaQuery.of(context).size.width * .75,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: height * .1),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.background,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: ColorManager.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextFormFieldComponent(
                            title: 'Full Name',
                            icons: Icons.person_2_outlined,
                            textEditingController: nameController,
                          ),
                          TextFormFieldComponent(
                            title: 'Email',
                            icons: Icons.email_outlined,
                            textEditingController: emailController,
                          ),
                          TextFormFieldComponent(
                            title: 'phone',
                            icons: Icons.email_outlined,
                            textEditingController: phoneController,
                          ),
                          TextFormFieldComponent(
                            hide: true,
                            title: 'password',
                            icons: Icons.lock_outline_rounded,
                            textEditingController: passwordController,
                          ),
                          ButtonComponent(
                            title: 'Sign Up',
                            function: () {
                              print('sign Up');
                            },
                          ),
                          SizedBox(height: height * .05),
                          const Text(
                            textAlign: TextAlign.center,
                            'or sign In using',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff266ad1),
                                    ),
                                    child: const Text(
                                      'Facebook',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffd14426),
                                    ),
                                    child: const Text(
                                      'Google',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            textAlign: TextAlign.center,
                            'By creating an account, you are agree to our Terms',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don’t have an account?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.signIn);
                                  },
                                  child: Text('Sign In',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorManager.primary)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
