import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.title,
    required this.isLoading,
    required this.onTap,
    this.isDisable = false,
    this.prefix,
    this.mWidth,
    this.margin,
    this.padding,
    this.bgColor,
    this.borderRadius,
    this.border,
    this.textStyle,
    this.textColor,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final bool isDisable;
  final bool isLoading;
  final double? mWidth;
  final Widget? prefix;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final Color bgColorCore = isDisable
        ? Theme.of(context).dividerColor
        : bgColor ?? Theme.of(context).primaryColor;
    return isLoading
        ? const SizedBox(
            width: 30,
            height: 30,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : Container(
            margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
            // constraints: BoxConstraints(maxWidth: mWidth ?? maxWidth),
            decoration: BoxDecoration(
              color: bgColorCore,
              borderRadius: borderRadius ?? BorderRadius.circular(4),
              border: border,
            ),
            child: Material(
              borderRadius: borderRadius ?? BorderRadius.circular(4),
              color: bgColorCore,
              child: InkWell(
                borderRadius: borderRadius ?? BorderRadius.circular(4),
                onTap: isDisable ? null : onTap,
                child: Padding(
                  padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (prefix != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: prefix!,
                        ),
                      Text(
                        title,
                        style: textStyle ??
                            TextStyle(
                              color: bgColor == Colors.transparent
                                  ? null
                                  : textColor ?? Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
