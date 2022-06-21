import 'package:flutter/material.dart';
import 'package:tal2a/presentation/common/mold/main_mold.dart';
import 'package:tal2a/presentation/resources/assets_manager.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

import '../resources/styles_manager.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            width: 500,
            height: 270,
            child: ControlPanelCard(
              title: 'أدارة الزفت ',
              color: ColorManager.darkGrey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ControlPanelCardContent(
                            title: 'الاجمالي',
                            textColor: Colors.amber,
                            image: ImageAssets.accounts,
                            value: '1000', cardColor: Colors.amber[100]!,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: ControlPanelCardContent(
                            title: 'الاجمالي',
                            textColor: Colors.amber,
                            image: ImageAssets.accounts,
                            value: '1000', cardColor: Colors.amber[100]!,
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: ControlPanelCardContent(
                            title: 'الاجمالي',
                            textColor: Colors.amber,
                            image: ImageAssets.accounts,
                            value: '1000', cardColor: Colors.amber[100]!,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: ControlPanelCardContent(
                            title: 'الاجمالي',
                            textColor: Colors.amber,
                            image: ImageAssets.accounts,
                            value: '1000', cardColor: Colors.amber[100]!,
                          )),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class ControlPanelCard extends StatelessWidget {
  final String title;
  final Color color;
  final Widget child;

  const ControlPanelCard(
      {Key? key, required this.title, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: AppSize.s80,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppSize.s8)),
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          Positioned(
              top: AppSize.s50,
              left: AppSize.s40,
              right: AppSize.s40,
              bottom: AppSize.s40,
              child: Container(
                color: Colors.transparent,
                child: child,
              ))
        ],
      ),
    );
  }
}

class ControlPanelCardContent extends StatelessWidget {
  final String image, value, title;
  final Color textColor, cardColor;

  const ControlPanelCardContent(
      {Key? key,
        required this.image,
        required this.value,
        required this.title,
        required this.textColor,
        required this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s80,
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(AppSize.s8)),
      child: Row(
        children: [
          const SizedBox(
            width: AppSize.s16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  maxLines: 2,
                  style: getSemiBoldStyle(
                      color: ColorManager.darkGrey, fontSize: AppSize.s12),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  title,
                  maxLines: 1,
                  style:
                  getRegularStyle(color: textColor, fontSize: AppSize.s12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Image.asset(
              image,
              height: AppSize.s60,
            ),
          ),
        ],
      ),
    );
  }
}
