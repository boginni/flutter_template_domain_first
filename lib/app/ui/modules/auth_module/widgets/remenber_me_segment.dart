import 'package:flutter/material.dart';

/// DISCARDED FOR NOW BECAUSE I WAS LAZY TO IMPLEMENT
class RememberMeSegment extends StatelessWidget {
  const RememberMeSegment({
    super.key,
    required this.termsAccepted,
    required this.onChanged,
  });

  final bool termsAccepted;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: termsAccepted,
          groupValue: true,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 8,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I agree to the ',
                style: context.textTheme.labelSmall,
              ),
              TextSpan(
                text: 'Terms of Service',
                onEnter: (event) {},
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              TextSpan(
                text: ' and ',
                style: context.textTheme.labelSmall,
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
