import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/sample_item.dart';
import 'package:challenge/src/sample_feature/data/sample_item_list.dart';
import 'package:challenge/src/sample_feature/view/sample_item_details_view.dart';
import 'package:flutter/material.dart';

/// Displays a list of [SampleItem]s.
class SampleItemListView extends StatefulWidget {
  /// Default const constructor.
  const SampleItemListView({required this.source, super.key});

  /// The source to load the data.
  final SampleListSource source;

  /// Route name.
  static const routeName = '/';

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
        loadNetworkSampleList(kDynamicListSize).then(items.addAll);
        break;
      case SampleListSource.stream:
        streamSampleList(kDynamicListSize)
            .listen(items.add)
            .onDone(() => setState(() {}));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Items')),
      body: items.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: items.map(
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
              ).toList(),
            ),
    );
  }
}
