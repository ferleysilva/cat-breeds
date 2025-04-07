import 'package:catbreeds/modules/cats/presentation/fragments/span_value_text_fragment.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('renders label and value correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SpanValueTextFragment(
              label: 'Country',
              value: 'Egypt',
            ),
          ),
        ),
      ),
    );

    final richText = tester.widget<RichText>(find.byType(RichText));
    final rootSpan = richText.text as TextSpan;

    expect(rootSpan.text, 'Country: ');
    expect((rootSpan.children!.first as TextSpan).text, 'Egypt');
  });

  testWidgets('renders as link when isLink is true', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SpanValueTextFragment(
              label: 'Wikipedia',
              value: 'Click here',
              isLink: true,
            ),
          ),
        ),
      ),
    );

    final richText = tester.widget<RichText>(find.byType(RichText));
    final textSpan = richText.text as TextSpan;
    final valueSpan = textSpan.children!.first as TextSpan;

    // Verifica que el valor tenga color azul y subrayado
    expect(valueSpan.style!.color, Colors.blue);
    expect(valueSpan.style!.decoration, TextDecoration.underline);
  });

  testWidgets('calls onTap when value is tapped', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SpanValueTextFragment(
              label: 'Link',
              value: 'Tap me',
              isLink: true,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      ),
    );

    // Simula el tap en el texto
    final gestureRecognizer = tester.widget<RichText>(find.byType(RichText)).text as TextSpan;
    final recognizer = (gestureRecognizer.children!.first as TextSpan).recognizer;

    expect(recognizer, isNotNull);

    // Simula un tap manualmente
    (recognizer as TapGestureRecognizer).onTap!();
    expect(tapped, isTrue);
  });
}
