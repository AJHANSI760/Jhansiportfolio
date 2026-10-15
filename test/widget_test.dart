import 'package:flutter_test/flutter_test.dart';
import 'package:jhansi_portfolio_new/main.dart';

void main() {
  testWidgets('Portfolio displays the application title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    expect(find.text('A JHANSI'), findsOneWidget);
    expect(find.text('HELLO, WORLD! I AM'), findsOneWidget);
  });

  testWidgets('Portfolio displays its introduction and sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    expect(
      find.text('Computer Science Student  |  AI & Software Development'),
      findsOneWidget,
    );
    expect(find.text('01 / ABOUT ME'), findsOneWidget);
  });
}
