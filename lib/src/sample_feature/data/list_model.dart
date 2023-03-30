import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/item_model.dart';

/// Alias to represent a [List] of [SampleItem].
typedef SampleItemList = List<SampleItem>;

/// The source of the data to be loaded.
enum SampleListSource {
  /// A small set of items.
  small,

  /// A long set of items.
  long,

  /// Mock items loaded, fetched once at a time.
  network,

  /// Mock items load, yielded once at a time.
  stream,
}

/// Returns the default, small sample list.
final SampleItemList smallSampleList =
    List<SampleItem>.generate(kSmallListSize, SampleItem.new);

/// Returns a very long generated sample list.
final SampleItemList longSampleList =
    List<SampleItem>.generate(kLongListSize, SampleItem.new);

/// Fakes loading the sample list from the network.
Future<SampleItemList> loadNetworkSampleList(int size) async {
  final list = <SampleItem>[];
  for (var i = 0; i < size; i++) {
    list.add(await loadNetworkSampleItem(i));
  }
  return list;
}

/// Fakes loading the sample list using a stream that yields each value after
/// it's loaded
Stream<SampleItem> streamSampleList(int size) async* {
  for (var i = 0; i < size; i++) {
    yield await loadNetworkSampleItem(i);
  }
}

/// Fakes fetching a single sample item from the network;
Future<SampleItem> loadNetworkSampleItem(int id) async {
  return Future<SampleItem>.delayed(
    const Duration(seconds: kFetchSeconds),
    () => SampleItem(id),
  );
}
