import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tal2a/presentation/resources/color_manager.dart';


class DrawerCatItem extends StatefulWidget {
  final String title;
  final Function()? onTap;
  final bool? isLast;
  final List<SubCatModel>? itemList;
  const DrawerCatItem(
      {required this.title,
        this.onTap,
        this.isLast = false,
        this.itemList,
      Key? key})
      : super(key: key);

  @override
  State<DrawerCatItem> createState() => _DrawerCatItemState();
}

class _DrawerCatItemState extends State<DrawerCatItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.image,
            size: 22,
            color: isExpanded ? ColorManager.white : ColorManager.offWhite,
          ),
          minLeadingWidth: 0,
          onTap: widget.onTap??()=> setState(() {
          isExpanded = !isExpanded;
          }),
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isExpanded ? ColorManager.white : ColorManager.offWhite,
            ),
          ),
          trailing: Visibility(
            visible: widget.onTap==null,
            child: IconButton(
              onPressed: () => setState(() {
                isExpanded = !isExpanded;
              }),
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_left,
                size: 22,
                color: isExpanded ? ColorManager.white : ColorManager.offWhite,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        isExpanded ?  _SubSubCatWidget(itemList: widget.itemList??[],) : const SizedBox(), //todo pass the SubCatList to _SubCatWidget()
        !widget.isLast!
            ? Container(
                margin:
                    const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
                height: 0.5,
                width: double.infinity,
                color: ColorManager.offWhite,
              )
            : const SizedBox(
                height: 0,
              )
      ],
    );
  }
}

/*class _SubCatWidget extends StatelessWidget {
  const _SubCatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ['sub1', 'sub2', 'sub3']
          .map((i) => DrawerSubCatItem(title: i))
          .toList(),
    );
  }
}

class DrawerSubCatItem extends StatefulWidget {
  final String title;

  const DrawerSubCatItem({required this.title, Key? key}) : super(key: key);

  @override
  State<DrawerSubCatItem> createState() => _DrawerSubCatItemState();
}

class _DrawerSubCatItemState extends State<DrawerSubCatItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87
            ),
          ),
          trailing: IconButton(
            onPressed: () => setState(() {
              isExpanded = !isExpanded;
            }),
            icon: Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: Colors.black54
              ,
              size: 22,
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.only(end: 20, start: 40),
        ),
        isExpanded ? const _SubSubCatWidget() : const SizedBox(), //todo pass the SubSubCatList to _SubSubCatWidget()
      ],
    );
  }
}*/

class _SubSubCatWidget extends StatelessWidget {
 final List<SubCatModel> itemList;
  const _SubSubCatWidget({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.symmetric(horizontal: 42),
      decoration: const BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              width: 2,
              color: ColorManager.offWhite
            )

          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: itemList.map((i) => DrawerSubSubCatItem(data: i)).toList(),
      ),
    );
  }
}

class DrawerSubSubCatItem extends StatelessWidget {
  final SubCatModel data;
  const DrawerSubSubCatItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.goNamed(data.location);
      },
      child: Container(
        child: Text(data.title,style:  TextStyle(color: ColorManager.white.withOpacity(0.70)),),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(top: 8,bottom: 15, left: 8,right: 8),
      ),
    );
  }
}

class SubCatModel{
  final String title,location;

  const SubCatModel({
    required this.title,
    required this.location,
  });
}
