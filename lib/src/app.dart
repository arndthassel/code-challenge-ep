import 'package:challenge/src/sample_feature/data/item_model.dart';
import 'package:challenge/src/sample_feature/data/list_model.dart';
import 'package:challenge/src/sample_feature/view/details_view.dart';
import 'package:challenge/src/sample_feature/view/list_view.dart';
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
                return const SampleItemListView(
                  source: SampleListSource.network, // DEFAULT VALUE FOR LIST
                );
            }
          },
        );
      },
    );
  }
}
