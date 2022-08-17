import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/main/area/add_area_view.dart';
import 'package:tal2a/presentation/main/area/area_view.dart';
import 'package:tal2a/presentation/main/city/add_city_view.dart';
import 'package:tal2a/presentation/main/city/city_view.dart';
import 'package:tal2a/presentation/register/register_client_view.dart';
import 'package:tal2a/presentation/register/register_delivery_view.dart';

import '../common/mold/main_mold.dart';
import '../main/add_pickup_view.dart';
import '../main/add_shipment_view.dart';
import '../main/add_shipments_preview_view.dart';
import '../main/control_panel.dart';
import '../main/import_excel_view.dart';
import '../main/pickup_view.dart';
import '../main/users/all_admins_view.dart';
import '../main/users/all_clients_view.dart';
import '../main/users/all_delivery_view.dart';
import '../provider/add_shipment_provider.dart';
import '../provider/auth_provider.dart';
import '../register/register_admin_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static final routes = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
          name: 'control-panel',
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'لوحة التحكم', check: 1, child: const ControlPanel())),
          routes: []),
      GoRoute(
          name: 'pickup',
          path: '/pickup',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'بيك اب', check: 2, child: const PickUpScreen())),
          routes: [
            GoRoute(
                name: 'add-pickup',
                path: 'add-pickup',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'أضافة بيك اب',
                        check: 2,
                        child: const AddPickUpScreen())),
                routes: [])
          ]),
      GoRoute(
          name: 'clients',
          path: '/clients',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'العملاء',
                  check: 2,
                  child: const AllClientsScreen())),
          routes: [
            GoRoute(
                name: 'register-client',
                path: 'register-client',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'تسجيل عميل جديد',
                        check: 3,
                        child: ChangeNotifierProvider.value(
                            value: RegisterClientProvider(),
                            child: const RegisterClientView()))),
                routes: [])
          ]),
      GoRoute(
          name: 'drivers',
          path: '/drivers',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'السائقين',
                  check: 2,
                  child: const AllDeliveryScreen())),
          routes: [
            GoRoute(
                name: 'register-delivery',
                path: 'register-delivery',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'تسجيل سائق جديد',
                        check: 3,
                        child: ChangeNotifierProvider.value(
                            value: RegisterDeliveryProvider(),
                            child: const RegisterDeliveryView()))),
                routes: [])
          ]),
      GoRoute(
          name: 'admins',
          path: '/admins',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'طاقم العمل',
                  check: 2,
                  child: const AllAdminsScreen())),
          routes: [
            GoRoute(
                name: 'register-admin',
                path: 'register-admin',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'تسجيل ادمن جديد',
                        check: 3,
                        child: ChangeNotifierProvider.value(
                            value: RegisterAdminProvider(),
                            child: const RegisterAdminView()))),
                routes: [])
          ]),
      GoRoute(
          name: 'add-shipments',
          path: '/add-shipments',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'اضافة شحنات',
                  check: 3,
                  child: const AddShipmentsPreviewScreen())),
          routes: [
            GoRoute(
                name: 'import-excel',
                path: 'import-excel',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'تصدير شيت اكسل',
                        check: 3,
                        child: ImportExcelScreen())),
                routes: []),
            GoRoute(
                name: 'new-shipment',
                path: 'new-shipment',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'اضافة شحنات',
                        check: 3,
                        child: ChangeNotifierProvider.value(
                            value: AddShipmentProvider(),
                            child:  AddNewShipmentScreen()))),
                routes: []),
          ]),
      GoRoute(
          name: 'all-cities',
          path: '/all-cities',
          pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: MoldView(
                  title: 'المدن', check: 3, child: const CityScreen())),
          routes: [
            GoRoute(
                name: 'add-city',
                path: 'add-city',
                pageBuilder: (context, state) => MaterialPage(
                    key: state.pageKey,
                    child: MoldView(
                        title: 'إضافة مدينة',
                        check: 3,
                        child: AddCityScreen())),
                routes: []),
            GoRoute(
                name: 'all-areas',
                path: ':fid/all-areas',
                pageBuilder: (context, state) {
                  print('haha ${state.location}');

                  String id = state.params['fid']!;
                  print('haha ${id}');

                  return MaterialPage(
                      key: state.pageKey,
                      child: MoldView(
                          title: 'المناطق',
                          check: 3,
                          child:  AreaScreen(route: id,)));
                },
                routes: [
                  GoRoute(
                      name: 'add-area',
                      path: 'add-area',
                      pageBuilder: (context, state) {
                        print('haha ${state.location}');
                        return MaterialPage(
                          key: state.pageKey,
                          child: MoldView(
                              title: 'إضافة منطقة',
                              check: 3,
                              child: AddAreaScreen(route: state.extra! as String,)));},
                      routes: []),
                ]),
          ]),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const E404(),
    ),
  );
}

class E404 extends StatelessWidget {
  const E404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404'),
      ),
    );
  }
}
