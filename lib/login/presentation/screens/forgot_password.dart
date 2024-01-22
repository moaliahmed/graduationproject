import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/login/presentation/component/button_component.dart';
import 'package:graduation_project/login/presentation/component/text_form_field_component.dart';

class ForgotPasswordView extends StatefulWidget {
 const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorManager.background,elevation: 0,),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/CoinmoneyLogo.svg',
                    // Update with your actual file path
                    width: MediaQuery.of(context).size.width*.75,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  decoration:  BoxDecoration(
                    color: ColorManager.background,
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            ' Please enter your registered email\n address to recover your password',
                            style:
                                TextStyle(color: Colors.black26, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: TextFormFieldComponent(
                              title: 'Email',
                              icons: Icons.email_outlined,
                              textEditingController: emailEditingController,
                            ),
                          ),
                          ButtonComponent(title: 'Sign In', function: () {}),
                        ],
                      ),
                    ),
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
