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
            const DrawerCatItem(title: 'المستخدمين', itemList: [
              SubCatModel(title: 'ادمن', location: 'admins'),
              SubCatModel(title: 'عميل', location: 'clients'),
              SubCatModel(title: 'سائق', location: 'drivers')
            ],),

            const DrawerCatItem(title: 'الاعدادات', itemList: [
              SubCatModel(title: 'المدن', location: 'all-cities'),
            ],),

            DrawerCatItem(
                title: 'لوحة التحكم',
                selected: check == 1,
                onTap: () {
                  context.goNamed('control-panel');
                }),
            DrawerCatItem(
                title: "بيك اب",
                selected: check == 2,
                onTap: () {
                  context.goNamed('pickup');
                }),

            DrawerCatItem(
                title: "اضافة شحنات",
                selected: check == 3,
                onTap: () {
                  context.goNamed('add-shipments');
                }),

            DrawerCatItem(
                title: "شحناتي",
                selected: check == 4,
                onTap: () {
                }),
            DrawerCatItem(
                title: "سجلات السداد",
                selected: check == 5,
                onTap: () {
                }),
            DrawerCatItem(
                title: "التقارير",
                selected: check == 6,
                isLast: true,
                onTap: () {
                }),

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
