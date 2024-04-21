import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/presentation/app/view/app.dart';
import 'package:frontend/presentation/counter/view/counter_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
