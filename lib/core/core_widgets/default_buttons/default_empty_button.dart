import 'package:flutter/material.dart';
import 'package:restaurant/core/resources_manager/colors_manager.dart';
import 'package:restaurant/core/resources_manager/size_manager.dart';
import 'package:restaurant/core/resources_manager/style_manager.dart';

class DefaultEmptyButton extends StatefulWidget {
  const DefaultEmptyButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  State<DefaultEmptyButton> createState() => _DefaultEmptyButtonState();
}

class _DefaultEmptyButtonState extends State<DefaultEmptyButton> {
  bool tapped=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: MouseRegion(
        onHover: (mouse)
        {
          setState(() {
            tapped=true;
          });
        },
        onExit: (exit){
          setState(() {
            tapped=false;
          });
        },
        child: MaterialButton(
          onPressed: widget.onPressed,
          color: ColorsManager.white,
          hoverColor: ColorsManager.primary,
          shape: OutlineInputBorder(
              borderRadius: BorderManager.fromFieldBorderRadius,
              borderSide: const BorderSide(
                  color: ColorsManager.primary
              )
          ),
          child: Text(
            widget.text,
            style: tapped?StyleManager.textStyleDark30.copyWith(
              color: ColorsManager.white,
            ):StyleManager.textStyleDark30,
          ),
        ),
      ),
    );
  }
}
