import 'package:flutter/material.dart';

class ButtonCustomTransparent extends StatelessWidget {
  final Function function;
  final Widget child;
  final EdgeInsets padding, margin;
  final double sizeRadius, borderWidth;
  final double? width, height;
  final Color color, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final bool bgInside;
  final Alignment? align;

  const ButtonCustomTransparent(this.function, this.child,
      {this.padding = EdgeInsets.zero, this.sizeRadius = 0.0, this.margin = EdgeInsets.zero,
        this.color = Colors.transparent, this.borderColor = Colors.transparent,
        this.borderRadius, this.borderWidth = 2, this.border, Key? key,
        this.bgInside = false, this.width, this.height, this.align}) : super(key:key);

  @override
  Widget build(BuildContext context) => Material(
      color: bgInside ? Colors.transparent : color,
      borderRadius: borderRadius??BorderRadius.circular(sizeRadius),
      child: InkWell(
          borderRadius: BorderRadius.circular(sizeRadius),
          onTap: () => function(),
          child: Container(width: width, height: height, decoration: BoxDecoration(
              color: bgInside ? color : Colors.transparent,
              borderRadius: border != null ? BorderRadius.circular(sizeRadius) : null,
              border: border??Border(bottom: BorderSide(color: borderColor, width: borderWidth))
          ),padding: padding, child: child, margin: margin, alignment: align)));
}
