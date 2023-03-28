import 'package:challenge/src/sample_feature/data/sample_item.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  /// Default const constructor.
  const SampleItemDetailsView({required this.item, super.key});

  /// The identifier of the selected item.
  final SampleItem item;

  /// Route name.
  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'avatar-${item.id}',
              child: const CircleAvatar(
                radius: 32,
                child: FlutterLogo(size: 42),
              ),
            ),
            Container(height: 16),
            Hero(
              tag: 'text-${item.id}',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  item.text,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
