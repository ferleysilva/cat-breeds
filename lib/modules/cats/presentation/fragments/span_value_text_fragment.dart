import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpanValueTextFragment extends ConsumerWidget {
  final String label;
  final String value;
  final bool isLink;
  final VoidCallback? onTap;

  const SpanValueTextFragment({
    super.key,
    required this.label,
    required this.value,
    this.isLink = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: isLink ? Colors.blue : Colors.black,
              decoration: isLink ? TextDecoration.underline : TextDecoration.none,
            ),
            recognizer: isLink && onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
          ),
        ],
      ),
    );
  }
}
