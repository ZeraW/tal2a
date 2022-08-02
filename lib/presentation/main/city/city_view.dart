import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/styles_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../../common/cards.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: ElevatedButton(
                  onPressed: () {
                    context.goNamed('add-city');
                  },
                  child: const Text('إضافة مدينة')),
            ),
            const Divider(color: ColorManager.grey3, height: AppSize.s0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Wrap(
                  children: [
                    CityCard(
                        onTap: () {},
                        onEdit: () {},
                        onDelete: () {},
                        title: 'الجيزة')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
