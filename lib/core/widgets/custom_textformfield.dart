import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required TextEditingController? controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.initialValue,
    this.hint = '',
    this.labelText = '',
    this.color,
    this.contentPadding,
    this.minLines,
    this.maxLines = 1,
    this.isExpanded = false,
    this.maxLength,
    this.prefixText,
    this.prefixIcon,
    this.suffixIcon,
    this.showSuffixIcon = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.border,
    super.key,
  }) : _controller = controller;
  final TextEditingController? _controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final void Function(String)? onFieldSubmitted;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showSuffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Color? color;
  final String? initialValue;
  final String? hint;
  final String labelText;
  final bool readOnly;
  final bool isExpanded;
  final bool autoFocus;
  final TextAlign textAlign;
  final InputBorder? border;
  final TextStyle? style;
  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListen() => setState(() {});
  @override
  void initState() {
    widget._controller!.addListener(_onListen);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller!.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.labelText.isNotEmpty)
            Text(
              widget.labelText,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          if (widget.labelText.isNotEmpty) const SizedBox(height: 2),
          TextFormField(
            initialValue: widget.initialValue,
            controller: widget._controller,
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType == TextInputType.number
                ? const TextInputType.numberWithOptions(decimal: true)
                : widget.maxLines! > 1
                    ? TextInputType.multiline
                    : widget.keyboardType ?? TextInputType.text,
            textInputAction: widget.maxLines! > 1
                ? TextInputAction.newline
                : widget.textInputAction ?? TextInputAction.next,
            autofocus: widget.autoFocus,
            textAlign: widget.textAlign,
            onChanged: widget.onChanged,
            minLines: widget.isExpanded ? widget.maxLines : widget.minLines,
            maxLines: widget.isExpanded
                ? widget.maxLines
                : (widget._controller!.text.isEmpty)
                    ? 1
                    : widget.maxLines,
            maxLength: widget.maxLength,
            style: widget.style,
            validator: (String? value) =>
                widget.validator == null ? null : widget.validator!(value),
            onFieldSubmitted: widget.onFieldSubmitted,
            cursorColor: Theme.of(context).colorScheme.secondary,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              // filled: true,
              // fillColor: widget.color ??
              //     Theme.of(context)
              //         .textTheme
              //         .bodyLarge!
              //         .color!
              //         .withOpacity(0.05),
              hintText: widget.hint,
              prefixText:
                  widget.prefixText == null ? null : '${widget.prefixText!} ',
              prefixIcon: widget.prefixIcon,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              suffixIcon: widget.suffixIcon ??
                  ((widget._controller!.text.isEmpty ||
                          !widget.showSuffixIcon ||
                          widget.showSuffixIcon == false ||
                          widget.readOnly)
                      ? null
                      : IconButton(
                          splashRadius: 16,
                          onPressed: () => setState(() {
                            widget._controller!.clear();
                          }),
                          icon: const Icon(CupertinoIcons.clear, size: 18),
                        )),
              focusColor: Theme.of(context).primaryColor,
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(4.0),
              ),
              border: widget.border ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
