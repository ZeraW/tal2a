import 'package:flutter/material.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';
import 'package:tal2a/presentation/resources/styles_manager.dart';

class CityCard extends StatelessWidget {
  final Function()? onTap,onEdit,onDelete;
  final String title;
  const CityCard({Key? key, required this.onTap, required this.onEdit, required this.onDelete, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),

      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 120,maxWidth: 160),
        child: IntrinsicWidth(
          child: Container(
            height: 80,
            color: ColorManager.grey3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: onTap,
                    style: ButtonStyle(overlayColor: ColorManager.materialColor(ColorManager.grey.withOpacity(0.2))),
                    child: Text(
                      title,
                      style: getBoldStyle(color: ColorManager.grey,fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(overlayColor: ColorManager.materialColor(ColorManager.green.withOpacity(0.1))),

                        onPressed: onEdit,
                        child: Text(
                          'تعديل',
                          style: getRegularStyle(color: ColorManager.green),
                        ),
                      ),
                    )
                    ,Expanded(
                      child: TextButton(
                        style: ButtonStyle(overlayColor: ColorManager.materialColor(ColorManager.error.withOpacity(0.1))),

                        onPressed: onDelete,
                        child: Text(
                          'حذف',
                          style: getRegularStyle(color: ColorManager.error),
                        ),
                      ),
                    ),
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
