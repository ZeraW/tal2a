import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/values_manager.dart';

class TextWithGreenBack extends StatelessWidget {
  final String text;

  const TextWithGreenBack({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      color: ColorManager.green,
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p8),
    );
  }
}
