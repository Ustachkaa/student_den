import 'package:equatable/equatable.dart';
import 'chipviewdigital_item_model.dart';

/// This class defines the variables used in the [person_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class PersonModel extends Equatable {
  PersonModel({this.chipviewdigitalItemList = const []});

  List<ChipviewdigitalItemModel> chipviewdigitalItemList;

  PersonModel copyWith(
      {List<ChipviewdigitalItemModel>? chipviewdigitalItemList}) {
    return PersonModel(
      chipviewdigitalItemList:
      chipviewdigitalItemList ?? this.chipviewdigitalItemList,
    );
  }

  @override
  List<Object?> get props => [chipviewdigitalItemList];
}