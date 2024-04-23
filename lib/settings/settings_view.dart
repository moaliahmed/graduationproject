import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduation_project/core/color_manger.dart';
import 'package:graduation_project/core/constants_manager.dart';

import '../login/presentation/screens/login_screen.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool buttonTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white38,
        elevation: 0,
        actions: const [
          Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Card(
                  child: ListTile(
                    title: Text('mohamed'),
                    subtitle: Text('to***@gmail.com'),
                  ),
                ),
                const Text(
                  'privacy',
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('profile'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      ),
                      Divider(indent: 40, endIndent: 30),
                      ListTile(
                        leading: Icon(Icons.verified_user_outlined),
                        title: Text('Security'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      )
                    ],
                  ),
                ),
                const Text('Finance'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.list_alt_outlined),
                        title: Text('History'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      ),
                      Divider(indent: 40, endIndent: 30),
                      ListTile(
                        leading: Icon(Icons.incomplete_circle_rounded),
                        title: Text('Limits'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      )
                    ],
                  ),
                ),
                const Text('Account'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.image_outlined),
                        title: const Text('Theme'),
                        trailing: Switch(
                          onChanged: (value) {
                            buttonTheme = value;
                            setState(() {});
                          },
                          value: buttonTheme,
                        ),
                      ),
                      const Divider(indent: 40, endIndent: 30),
                      const ListTile(
                        leading: Icon(Icons.notifications_none_outlined),
                        title: Text('Notifications'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      )
                    ],
                  ),
                ),
                const Text('more'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        // todo change this icon
                        leading: Icon(Icons.chair_alt),
                        title: Text('My bonus'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      ),
                      Divider(indent: 40, endIndent: 30),
                      ListTile(
                        leading: Icon(Icons.person_add_alt),
                        title: Text('Share With friends'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      ),
                      Divider(indent: 40, endIndent: 30),
                      ListTile(
                        leading: Icon(Icons.contact_support),
                        title: Text('Support'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: AppConstants.arrowIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const SignInView(),)),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: ColorManager.primary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18))),
                    child: const Center(child: Text('LogOut')),
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
