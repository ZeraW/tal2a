import 'package:flutter/material.dart';
import 'package:tal2a/presentation/common/mold/side_menu.dart';
import '../../resources/responsive.dart';
import '../../resources/values_manager.dart';
import 'admin_logout.dart';

class MoldView extends StatelessWidget {
  final String title;
  final int? check;
  final Widget child;

  MoldView({required this.title,this.check=0, required this.child, Key? key})
      : super(key: key);
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black12,
      drawerEdgeDragWidth: 0,
      drawer: SideMenu(title: title,check:check),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          Responsive.isDesktop(context)
              ? SideMenu(
                  title: title,
                  check: check,
                )
              : const SizedBox(),

          Expanded(
              // It takes 5/6 part of the screen
              flex: 6,
              child: Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    leading: Responsive.isDesktop(context)
                        ? null
                        : IconButton(
                            onPressed: () {
                              _globalKey.currentState!.openDrawer();
                            },
                            icon: const Icon(Icons.menu)),
                    title: Text(title),
                    centerTitle: false,
                    actions: [
                      AdminLogOut(),
                      const SizedBox(
                        width: 50,
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p4),
                        child: child),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
