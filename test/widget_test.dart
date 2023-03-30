import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/list_repo.dart';
import 'package:challenge/src/sample_feature/view/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SampleItemListView', () {
    testWidgets('load small list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SampleItemListView(
            source: SampleListSource.small,
          ),
        ),
      );

      expect(find.byType(ListTile), findsNWidgets(kSmallListSize));
    });

    testWidgets('load network list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SampleItemListView(
            source: SampleListSource.network,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListTile), findsNWidgets(kDynamicListSize));
    });

    testWidgets('load stream list', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SampleItemListView(
            source: SampleListSource.stream,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(ListTile), findsNWidgets(kDynamicListSize));
    });
  });
}
