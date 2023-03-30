import 'package:challenge/src/constants.dart';
import 'package:challenge/src/sample_feature/data/item_model.dart';
import 'package:challenge/src/sample_feature/data/list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SampleItem', () {
    test('id is assigned', () {
      const id = 32;
      const item = SampleItem(id);
      expect(id, equals(item.id));
    });
  });

  group('SampleListSource', () {
    test('length', () {
      expect(SampleListSource.values.length, equals(4));
    });

    test('values', () {
      expect(
        SampleListSource.values.any((source) => source.name == 'small'),
        isTrue,
      );
      expect(
        SampleListSource.values.any((source) => source.name == 'long'),
        isTrue,
      );
      expect(
        SampleListSource.values.any((source) => source.name == 'network'),
        isTrue,
      );
      expect(
        SampleListSource.values.any((source) => source.name == 'stream'),
        isTrue,
      );
    });
  });

  group('SampleItemList ', () {
    test('typedef', () {
      expect(SampleItemList, equals(List<SampleItem>));
    });

    test('small', () {
      expect(smallSampleList.length, equals(kSmallListSize));
    });

    test('long', () {
      expect(longSampleList.length, equals(kLongListSize));
    });

    test('network', () {
      expect(
        loadNetworkSampleList(kSmallListSize).then((list) {
          expect(list.length, equals(kSmallListSize));
        }),
        completes,
      );
    });

    test('stream', () {
      expect(
        streamSampleList(kSmallListSize),
        emitsInOrder([
          const SampleItem(0),
          const SampleItem(1),
          const SampleItem(2),
          const SampleItem(3),
          const SampleItem(4),
          emitsDone,
        ]),
      );
    });

    test('network item', () {
      expect(
        loadNetworkSampleItem(kDynamicListSize).then((item) {
          expect(item.id, equals(kDynamicListSize));
        }),
        completes,
      );
    });
  });
}
