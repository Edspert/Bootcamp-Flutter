import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String iconAsset;
  final Color textColor;
  final Color backgroundColor;
  final Color? outlineBorderColor;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.iconAsset,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.outlineBorderColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: outlineBorderColor != null
                ? Border.all(
                    color: outlineBorderColor!,
                  )
                : null,
          ),
          child: Row(
            children: [
              Image.asset(
                iconAsset,
                height: 26,
                width: 26,
              ),
              const SizedBox(width: 24),
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
