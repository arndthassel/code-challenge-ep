import 'package:challenge/src/sample_feature/data/sample_item.dart';
import 'package:challenge/src/sample_feature/data/sample_item_list.dart';
import 'package:challenge/src/sample_feature/view/sample_item_details_view.dart';
import 'package:challenge/src/sample_feature/view/sample_item_list_view.dart';
import 'package:flutter/material.dart';

/// The Widget that configures your application.
class ChallengeApp extends StatelessWidget {
  /// Default const constructor.
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SampleItemDetailsView.routeName:
                return SampleItemDetailsView(
                  item: routeSettings.arguments! as SampleItem,
                );
              case SampleItemListView.routeName:
              default:
                return const SampleItemListView(source: SampleListSource.small);
            }
          },
        );
      },
    );
  }
}
