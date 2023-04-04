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
// OPTION 1: SUBSTITUTE LOADING METHOD FOR EACH SINGLE ITEM WITH NON-DELAYED METHOD
/*   final list = <SampleItem>[];
  for (var i = 0; i < size; i++) {
    // size is 10 (kDynamicListSize)
    list.add(await instantLoadNetworkSampleItem(
        i)); // CHANGED TO INSTANT LOAD METHOD
  }
  return list;
} */

// OPTION 2: SUBSTITUTE WITH LIST.GENERATE (NOT ASYNC)
/*   final list = SampleItemList.generate(kDynamicListSize, SampleItem.new);
  return list; */

// OPTION 3: FUTURE.WAIT
  final intList = List<int>.generate(kDynamicListSize, (index) => index);
  final futures = <Future<SampleItem>>[];
  for (var index in intList) {
    futures.add(loadNetworkSampleItem(index));
  }
  final list = Future.wait(futures);
  return list;
}

Stream<SampleItem> streamSampleList(int size) async* {
  for (var i = 0; i < size; i++) {
    yield await loadNetworkSampleItem(i);
  }
}

Future<SampleItem> loadNetworkSampleItem(int id) async {
  return Future<SampleItem>.delayed(
    const Duration(seconds: kFetchSeconds), // 1 second
    () => SampleItem(id),
  );
}

// NEW FOR OPTION 1: INSTANT LOAD METHOD FOR
Future<SampleItem> instantLoadNetworkSampleItem(int id) async {
  return Future<SampleItem>.delayed(
    Duration.zero, // 1 second
    () => SampleItem(id),
  );
}
