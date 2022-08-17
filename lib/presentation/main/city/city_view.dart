import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../../common/cards.dart';
import '../../models/models.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Location? location = context.watch<Location?>();

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
                child: location!=null?Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: location.allCities!.entries.map((e) => CityCard(onTap: (){
                    context.go('/all-cities/${e.key}/all-areas');
                  }, onEdit: (){}, onDelete: (){}, title: e.key)).toList().cast<Widget>(),
                ):const SizedBox()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
