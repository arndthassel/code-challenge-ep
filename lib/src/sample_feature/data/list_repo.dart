import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/item_model.dart';

/// Alias to represent a [List] of [SampleItem].
typedef SampleItemList = List<SampleItem>;

enum SampleListSource {
  small,
  long,
  network,
  stream,
}

// SMALL AND LONG LIST
final SampleItemList smallSampleList =
    List<SampleItem>.generate(kSmallListSize, SampleItem.new);

final SampleItemList longSampleList =
    List<SampleItem>.generate(kLongListSize, SampleItem.new);

// FUTURE (LIST)
Future<SampleItemList> loadNetworkSampleList(int size) async {
  final list = <SampleItem>[];
  for (var i = 0; i < size; i++) {
    // size is 10 (kDynamicListSize)
    list.add(await loadNetworkSampleItem(i));
  }
  return list;
}

// STREAM (ITEM)
Stream<SampleItem> streamSampleList(int size) async* {
  for (var i = 0; i < size; i++) {
    yield await loadNetworkSampleItem(i);
  }
}

// HELPER FUNCTION
Future<SampleItem> loadNetworkSampleItem(int id) async {
  return Future<SampleItem>.delayed(
    const Duration(seconds: kFetchSeconds), // 1 second
    () => SampleItem(id),
  );
}
