import 'package:flutter_test/flutter_test.dart';
import 'package:jhansi_portfolio_new/main.dart';

void main() {
  testWidgets('Portfolio displays the introduction', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    expect(find.text('A JHANSI'), findsOneWidget);
    expect(find.text('HELLO, WORLD! I AM'), findsOneWidget);
    expect(
      find.text('Computer Science Student  |  AI & Software Development'),
      findsOneWidget,
    );
  });

  testWidgets('Portfolio displays project cards', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    expect(find.text('V2V Vehicle Collision Alert'), findsOneWidget);
    expect(find.text('Digital Certificate Verification'), findsOneWidget);
    expect(find.text('Mini E-Commerce Web Project'), findsOneWidget);
    expect(find.text('Android Dice Roller'), findsOneWidget);
  });

  testWidgets('Portfolio displays contact options', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    await tester.ensureVisible(find.text('LinkedIn'));
    await tester.pumpAndSettle();

    expect(find.text('Let’s build something meaningful.'), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
  });

  testWidgets('Portfolio displays education and skills', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JhansiPortfolio());

    expect(find.text('02 / EDUCATION'), findsOneWidget);
    expect(
      find.text('B.Tech — Computer Science & Engineering'),
      findsOneWidget,
    );
    expect(find.text('Intermediate — MPC'), findsOneWidget);
    expect(find.text('03 / SKILLS'), findsOneWidget);
    expect(find.text('Programming'), findsOneWidget);
    expect(find.text('Web Development'), findsOneWidget);
  });
}