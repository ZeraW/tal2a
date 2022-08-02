// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/common/text_field.dart';

import '../provider/auth_provider.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class RegisterAdminView extends StatefulWidget {
  const RegisterAdminView({Key? key}) : super(key: key);

  @override
  _RegisterAdminViewState createState() => _RegisterAdminViewState();
}

class _RegisterAdminViewState extends State<RegisterAdminView> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<RegisterAdminProvider>();

    return Card(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          provider.validate();

                        },
                        style: correctStyle(),
                        child: Row(
                          children: const [
                            Icon(Icons.check_outlined),
                            SizedBox(
                              width: AppSize.s8,
                            ),
                            Text('حفظ'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: wrongStyle(),
                        child: Row(
                          children: const [
                            Icon(Icons.close),
                            SizedBox(
                              width: AppSize.s8,
                            ),
                            Text('إلغاء'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                    color: Colors.black12, indent: 0, endIndent: 0, height: 0),

                FormBuilder(
      key: provider.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormBuilder(
                      controller: provider.name,
                      errorText: "هذا الحقل مطلوب",
                      hint: 'الاسم',
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormBuilder(
                      controller: provider.email,
                      errorText: 'هذا الحقل مطلوب',
                      hint: 'البريد الالكتروني',
                      isRequired: true,
                    ),
                  ),
                ],
          ),
          const SizedBox(
                height: 10,
          ),
          Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormBuilder(
                      controller: provider.phoneNumber,
                      errorText: 'هذا الحقل مطلوب',
                      hint: 'رقم الهاتف',
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormBuilder(
                      controller: provider.password,
                      isPassword: true,
                      errorText: 'هذا الحقل مطلوب',
                      hint: 'كلمة المرور',
                      isRequired: true,
                    ),
                  ),
                ],
          ),
          const SizedBox(
                height: 10,
          ),
          Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormBuilder(
                      controller: provider.confirmPassword,
                      isPassword: true,
                      errorText: 'هذا الحقل مطلوب',
                      hint: 'تأكيد كلمة المرور',
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
          ),
        ]),
      ),
    ),
              ],
            )));
  }
}
