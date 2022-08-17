import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../../common/cards.dart';
import '../../models/models.dart';
import '../../resources/styles_manager.dart';
import 'dart:convert' show utf8;

class AreaScreen extends StatelessWidget {
 final String route;
  const AreaScreen({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Location? location = context.watch<Location?>();

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Card(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row
                (
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.go('${GoRouter.of(context).location}/add-area',extra: route);
                      }, child: const Text('إضافة منطقة')),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  ElevatedButton(
                      style: btnStyle(color: ColorManager.orange),
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('عودة')),
                ],
              ),
            ),
            const Divider(color: ColorManager.grey3, height: AppSize.s0),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: location!=null?Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: location.allAreas!.entries.map((e) {

                      Area area = e.value;

                     return area.cityId == route
                          ? CityCard(
                          onTap: null, onEdit: () {}, onDelete: () {}, title: e
                          .key) : const SizedBox();
                    }
                    ).toList().cast<Widget>(),
                  ):const SizedBox()
              ),
            ),
          ],
        )),
    );
  }




}