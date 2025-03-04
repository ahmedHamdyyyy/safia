import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/core/recourses/color_manager/color_manager.dart';
import 'package:safiaa/core/recourses/styles_manger/styles_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLine,
      this.suffixIcon,
      this.width,
      this.obscureText,
      this.validator,
      this.controller,
      this.type,
      this.boarderColor,
      this.hintText,
      this.onSaved,
      this.prefixIcon,
      this.hight});

  final TextInputType? type;
  final bool? obscureText;
  final String? hintText;
  final IconData? suffixIcon;
  final Color? boarderColor;
  final double? hight;
  final double? width;

  final Widget? prefixIcon;

  final int? maxLine;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
          onSaved: widget.onSaved,
          validator: widget.validator,
          maxLines: widget.maxLine ?? 1,
          controller: widget.controller,
          keyboardType: widget.type,
          style: getSemiBoldStyle(
            color: MyColors.black,
            fontSize: 16.sp,
          ),
          obscureText: _obscureText,
          decoration: InputDecoration(
              // fillColor: MyColors.grayscale150,
              // filled: true,
              contentPadding: EdgeInsetsDirectional.symmetric(
                vertical: widget.hight ?? 20,
              ),
              hintText: widget.hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: widget.prefixIcon,
              ),
              hintStyle:
                  getBoldStyle(color: MyColors.grayscale400, fontSize: 12.sp),
              suffixIcon: widget.suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        widget.suffixIcon,
                        color: MyColors.grayscale400,
                        size: 26,
                      ),
                      onPressed: _toggleObscureText,
                    )
                  : null,
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder())),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: widget.boarderColor??MyColors.grayscale200,
      ),
    );
  }
}
