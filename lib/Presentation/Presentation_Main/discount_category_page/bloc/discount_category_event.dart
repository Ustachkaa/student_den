part of 'discount_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// DiscountCategory widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DiscountCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the DiscountCategory widget is first created.
class DiscountCategoryInitialEvent extends DiscountCategoryEvent {
  @override
  List<Object?> get props => [];
}
