import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_profile_card.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Profile/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppTheme.black,
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: CustomFunction.customBody(context,
            isProfile: true, columnData: bodyData(context)));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          CustomFunction.customSpace(height: 40),
          CustomText(
            text: 'Arkar Min Myat',
            textColor: AppTheme.black,
            size: 17.sp,
          ),
          CustomFunction.customSpace(height: 10),
          CustomText(
            text: 'dev_op@apple.tv',
            textColor: AppTheme.blackLight,
            size: 12.sp,
          ),
          CustomFunction.customSpace(height: 15),
          CustomButton(
              bgcolor: AppTheme.orange,
              text: 'Edit Profile',
              fontSize: 12.sp,
              onTap: () {
                CustomFunction.navigatePage(EditProfilePage(), context);
              },
              width: 90.w,
              height: 25.h,
              borderRadius: 20.r),
          CustomFunction.customSpace(height: 10),
          customCard('P U R C H A S E'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.shopping_cart,
              text: 'Cart',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.favorite,
              text: 'Wishlist',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          customCard('L E A R N I N G / A C H I E V E M E N T'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.auto_stories,
              text: 'My Learning',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.pie_chart,
              text: 'My Achievement',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.assignment,
              text: 'My Certificate',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          customCard('S E T T I N G'),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.article,
              text: 'Term and Policy',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.auto_awesome_mosaic,
              text: 'Version',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.notifications_active,
              text: 'Notification',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
          CustomFunction.customSpace(height: 15),
          CustomProfileCard(
              onTap: () {},
              prefixIcon: Icons.logout,
              text: 'Sign Out',
              surffixIcon: Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }

  Container customCard(String? text) {
    return Container(
      width: double.infinity,
      height: 25.h,
      decoration: const BoxDecoration(color: AppTheme.greyLight),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: CustomText(
          text: text!,
          size: 12,
          textAlign: TextAlign.left,
          textColor: AppTheme.greyDark,
        ),
      ),
    );
  }
}
