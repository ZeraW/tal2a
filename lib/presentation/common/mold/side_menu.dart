import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';

import '../../resources/values_manager.dart';

class SideMenu extends StatelessWidget {
 final String? title;
  const SideMenu({this.title,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s200,
      child: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/splash_logo.png",
              width: 135,
              height: 135,
            ),
            const SizedBox(
              height: 25,
            ),
            DrawerListTile(
              title: "لوحة التحكم",
              check:title,
              press: () {

              },
            ),
            DrawerListTile(
              title: "بيك اب",
              check:title,
              press: () {

              },
            ),
            DrawerListTile(
              title: "اضافة شحنات",
              check:title,
              press: () {

              },
            ),
            DrawerListTile(
              title: "شحناتي",
              check:title,
              press: () {

              },
            ),
            DrawerListTile(
              title: "سجلات السداد",
              check:title,
              press: () {

              },
            ),
            DrawerListTile(
              title: "التقارير",
              check:title,
              press: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    this.check,
    required this.press,
  }) : super(key: key);

  final String title;
  final String? check;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading:  Icon(
        Icons.view_headline_rounded,
        color:check == title ? ColorManager.white:ColorManager.offWhite,
        size: AppSize.s18,
      ),
      title: Text(
        title,
        style: check == title ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
