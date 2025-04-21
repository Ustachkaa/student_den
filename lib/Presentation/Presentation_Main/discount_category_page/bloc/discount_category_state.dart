part of 'discount_category_bloc.dart';

/// Represents the state of DiscountCategory in the application.

// ignore_for_file: must_be_immutable
class DiscountCategoryState extends Equatable {
  DiscountCategoryState({this.discountCategoryModelObj});

  DiscountCategoryModel? discountCategoryModelObj;

  @override
  List<Object?> get props => [discountCategoryModelObj];

}