import 'package:equatable/equatable.dart';

/// A placeholder class that represents an entity or model.
class SampleItem extends Equatable {
  /// Default const constructor.
  const SampleItem(this.id);

  /// The id of the item.
  final int id;

  /// Returns a readable representation of the item.
  String get text => 'SampleItem $id';

  @override
  List<Object> get props => <Object>[id];
}
