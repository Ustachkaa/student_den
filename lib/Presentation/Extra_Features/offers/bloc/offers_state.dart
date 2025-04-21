part of 'offers_bloc.dart';

abstract class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

class OffersLoading extends OffersState {}

class OffersLoaded extends OffersState {
  final List<Offer> allOffers;

  const OffersLoaded({required this.allOffers});

  @override
  List<Object> get props => [allOffers];
}

class OffersError extends OffersState {
  final String errorMessage;

  const OffersError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}