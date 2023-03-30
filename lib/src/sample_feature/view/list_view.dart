import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/item_model.dart';
import 'package:challenge/src/sample_feature/data/list_repo.dart';
import 'package:challenge/src/sample_feature/view/details_view.dart';
import 'package:flutter/material.dart';

/// Displays a list of [SampleItem]s.
class SampleItemListView extends StatefulWidget {
  /// Default const constructor.
  const SampleItemListView({required this.source, super.key});

  /// The source to load the data.
  final SampleListSource source; //This is an emum type used in the switch below

  /// Route name.
  static const routeName = '/'; // How does is this routeName used?

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  final SampleItemList items = <SampleItem>[];

  @override
  void initState() {
    super.initState();
    switch (widget.source) {
      case SampleListSource.small:
        items.addAll(smallSampleList);
        break;
      case SampleListSource.long:
        items.addAll(longSampleList);
        break;
      case SampleListSource.network:
        loadNetworkSampleList(kDynamicListSize).then(
          (value) {
            setState(() => items.addAll(value)); // ADDED SETSTATE HERE
          },
        );
        break;
      case SampleListSource.stream:
        streamSampleList(kDynamicListSize).listen(
          (value) {
            setState(() => items.add(value)); // ADDED SETSTATE HERE
          },
        ); // REMOVED ONDONE AND SETSTATE HERE
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Items')),
      body: items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              // CHANGED TO BUILDER
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ListTile(
                  key: ValueKey(item),
                  title: Text(item.text),
                  leading: const CircleAvatar(child: FlutterLogo()),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                      arguments: item,
                    );
                  },
                );
              },
              // PRE-CHANGE TO BUILDER
              /* children: items.map(
                (SampleItem item) {
                  return ListTile(
                    key: ValueKey(item),
                    title: Text(item.text),
                    leading: const CircleAvatar(child: FlutterLogo()),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SampleItemDetailsView.routeName,
                        arguments: item,
                      );
                    },
                  );
                },
              ).toList(), */
            ),
    );
  }
}
