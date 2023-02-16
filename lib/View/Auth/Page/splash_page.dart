import 'package:coursia/View//Auth/Page/login_page.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/button_design.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  // final gmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      //appBar: AppBar(title: const Text('Hello')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            'images/CoursiaLogo.png',
            height: 50.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
      //  bottomNavigationBar: const CustomButton(text: 'Get Started'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Material(
          color: AppTheme.black,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: CustomButton(
                    text: 'Get Started',
                    onTap: () {
                      CustomFunction.navigatePage(const LoginPage(), context);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
