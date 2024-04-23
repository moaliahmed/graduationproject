import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/login/presentation/component/button_component.dart';
import 'package:graduation_project/login/presentation/component/text_form_field_component.dart';

import '../../../core/assets_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/string_manager.dart';

class SignInView extends StatefulWidget {
 const  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();
@override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
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
                  height: height*.05,
                ),
                  Center(
                    child: SvgPicture.asset(
                      ImageAssets.coinMoneyLogo,
                      // Update with your actual file path
                      width: MediaQuery.of(context).size.width*.75,
                      fit: BoxFit.fill,
                    ),
                  ), SizedBox(
                    height: height*.1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.background,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppString.loginToYourAccount,
                                style: TextStyle(
                                    fontSize: 21,
                                    color: ColorManager.secondary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        TextFormFieldComponent(
                          title: AppString.email,
                          icons: Icons.email_outlined,
                          textEditingController: emailEditingController,
                        ),
                        TextFormFieldComponent(
                          hide: true,
                          title: AppString.password,
                          icons: Icons.lock_outline_rounded,
                          textEditingController: passwordEditingController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppString.forgotPassword,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              InkWell(
                                onTap: () => Navigator.pushNamed(context, Routes.forgotPassword),
                                child: Text(
                                  textAlign: TextAlign.right,
                                  AppString.clickHere,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ButtonComponent(
                            title: AppString.signIn,
                            function: () {
                              // todo write Navigator go home screen
                              Navigator.pushReplacementNamed(context, Routes.home);
                            },),
                         SizedBox(
                          height: height*.05,
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          AppString.orSignInUsing,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 3,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff266ad1)),
                                child: const Text(
                                  AppString.facebook,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 3,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffd14426),
                                ),
                                child: const Text(
                                  AppString.google,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          textAlign: TextAlign.center,
                          AppString.byCreatingAnAccount,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don’t ${AppString.haveAnAccount}'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.signUp);
                                },
                                child: Text(
                                  AppString.signUp,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
