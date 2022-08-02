import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class HoveredText extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final int maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;
  final MouseCursor? cursor;
  final Color textColor, hoverColor;

  HoveredText(this.text,
      {this.maxLines = 1,
      this.textAlign,
      this.style,
      this.textColor = ColorManager.black,
      this.hoverColor = ColorManager.primary,
      this.cursor,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  _HoveredTextState createState() => _HoveredTextState();
}

class _HoveredTextState extends State<HoveredText> {
  bool hov = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (h) {
        setState(() {
          hov = h;
        });
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onTap ?? () {},
      child: MouseRegion(
        cursor:
            widget.cursor != null ? widget.cursor! : SystemMouseCursors.click,
        child: Text(
          widget.text,
          maxLines: widget.maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: widget.textAlign,
          style: widget.style != null
              ? widget.style!.copyWith(
                  color: hov ? widget.hoverColor : widget.textColor,
                )
              : TextStyle(
                  color: hov ? widget.hoverColor : widget.textColor,
                ),
        ),
      ),
    );
  }
}

class HoveredIcon extends StatefulWidget {
  final IconData icon;
  final Function()? onTap;
  final double? size;
  final MouseCursor? cursor;
  final Color iconColor, hoverColor;

  HoveredIcon(this.icon,
      {this.size,
      this.iconColor = ColorManager.black,
      this.hoverColor = ColorManager.primary,
      this.cursor,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  _HoveredIconState createState() => _HoveredIconState();
}

class _HoveredIconState extends State<HoveredIcon> {
  bool hov = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (h) {
        setState(() {
          hov = h;
        });
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onTap ?? () {},
      child: MouseRegion(
        cursor:
            widget.cursor != null ? widget.cursor! : SystemMouseCursors.click,
        child: Icon(
          widget.icon,
          color: hov ? widget.hoverColor : widget.iconColor,
          size: widget.size,
        ),
      ),
    );
  }
}

class HoveredTextButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final int maxLines;
  final double? height, width;
  final EdgeInsetsGeometry? padding;

  final Color? color;

  final TextStyle? style;
  final MouseCursor? cursor;

  HoveredTextButton(this.text,
      {this.maxLines = 1,
      this.height,
      this.width,
      this.padding,
      this.color = ColorManager.white,
      this.style,
      this.cursor,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  _HoveredTextButtonState createState() => _HoveredTextButtonState();
}

class _HoveredTextButtonState extends State<HoveredTextButton> {
  bool hov = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        borderRadius: BorderRadius.circular(2),
        onHover: (h) {
          /* setState(() {
            hov = h;
          });*/
        },
        hoverColor: Colors.white12,
        onTap: widget.onTap ?? () {},
        child: MouseRegion(
          cursor:
              widget.cursor != null ? widget.cursor! : SystemMouseCursors.click,
          child: IntrinsicWidth(
            child: Container(
              height: widget.height,
              padding: widget.padding,
              alignment: Alignment.center,
              child: Text(
                widget.text,
                maxLines: widget.maxLines,
                overflow: TextOverflow.ellipsis,
                style: widget.style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HoveredWithSplash extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final MouseCursor? cursor;
  final Color splashColor;

  const HoveredWithSplash(
      {required this.child,
      this.splashColor = Colors.black12,
      this.onTap,
      this.cursor,
      Key? key})
      : super(key: key);

  @override
  _HoveredWithSplashState createState() => _HoveredWithSplashState();
}

class _HoveredWithSplashState extends State<HoveredWithSplash> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      onHover: (h) {
        hovered = h;
        setState(() {});
      },
      child: MouseRegion(
        cursor:
            widget.cursor != null ? widget.cursor! : SystemMouseCursors.click,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: widget.child,
            ),
            Visibility(
                visible: hovered,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: widget.splashColor,
                ))
          ],
        ),
      ),
    );
  }
}

class HoveredWithBorder extends StatefulWidget {
  final Function() onTap;
  final Widget child;
  final Color normalColor, hoverColor;

  HoveredWithBorder(
      {required this.onTap,
      this.hoverColor = ColorManager.primary,
      this.normalColor = Colors.transparent,
      required this.child,
      Key? key})
      : super(key: key);

  @override
  _HoveredWithBorderState createState() => _HoveredWithBorderState();
}

class _HoveredWithBorderState extends State<HoveredWithBorder> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorManager.white,
        child: InkWell(
          hoverColor: Colors.transparent,
          onHover: (h) {
            setState(() {
              hovered = h;
            });
          },
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: hovered ? widget.hoverColor : widget.normalColor,
                  width: 0.95),
            ),
            child: widget.child,
          ),
        ));
  }
}
