import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';

import '../../resources/values_manager.dart';
import 'row_cat_item.dart';

class SideMenu extends StatelessWidget {
  final String? title;
  final int? check;

  const SideMenu({this.title, this.check, Key? key}) : super(key: key);

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
              width: 90,
              height: 90,
            ),
            const SizedBox(
              height: 25,
            ),
            const DrawerCatItem(title: 'المستخدمين'),



            DrawerListTile(
              title: "لوحة التحكم",
              check: check == 1,
              press: () {
                context.goNamed('control-panel');
              },
            ),
            DrawerListTile(
              title: "بيك اب",
              check: check == 2,
              press: () {
                context.goNamed('pickup');
              },
            ),
            DrawerListTile(
              title: "اضافة شحنات",
              check: check == 3,
              press: () {
                context.goNamed('add-shipments');
              },
            ),
            DrawerListTile(
              title: "شحناتي",
              check: check == 4,
              press: () {},
            ),
            DrawerListTile(
              title: "سجلات السداد",
              check: check == 5,
              press: () {},
            ),
            DrawerListTile(
              title: "التقارير",
              check: check == 6,
              press: () {},
            ),
            DrawerListTile(
              title: "تسجيل عميل جديد",
              check: check == 7,
              press: () {
                context.goNamed('register-client');
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
    this.check = false,
    required this.press,
  }) : super(key: key);

  final String title;
  final bool? check;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        Icons.view_headline_rounded,
        color: check! ? ColorManager.white : ColorManager.offWhite,
        size: AppSize.s18,
      ),
      title: Text(
        title,
        style: check!
            ? Theme.of(context).textTheme.bodyMedium
            : Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
