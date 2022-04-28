import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../multi_language.dart';
import '../ecommerce_style.dart';

class Theme3TextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final IconData icon;
  final String hint, font;
  final TextInputAction action;
  final TextInputType type;
  final bool password;
  final double? fontSize;
  final Function? funDone;
  const Theme3TextField(this.controller, this.focus, this.icon, this.hint,
      {this.action = TextInputAction.next, this.type = TextInputType.text, this.password = false,
        this.font = 'Segoe UI', this.fontSize, this.funDone, Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) => SizedBox(
    child: TextField(
        onSubmitted: (value) { if (funDone != null) funDone!(); },
        style: TextStyle(fontSize: fontSize??14.sp, fontFamily: font),
        controller: controller,
        focusNode: focus,
        textInputAction: action,
        keyboardType: type,
        obscureText: password,
        inputFormatters: type == TextInputType.phone ? [
          FilteringTextInputFormatter.digitsOnly
        ] : [],
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Segoe UI'),
            hintText: MultiLanguage.get(hint),
            prefixIcon: Icon(icon, color: const Color(0xFF333333), size: 16.sp),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(right: 16.sp),
            enabled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(200),
                borderSide: BorderSide(color: ECommerceStyle.primaryColor, width: 1)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(200),
                borderSide: BorderSide(color: ECommerceStyle.primaryColor, width: 1)
            )
        )
    ),
  );
}