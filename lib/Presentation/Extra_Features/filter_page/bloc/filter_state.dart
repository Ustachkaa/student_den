part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final String radioGroup;
  final String radioGroup1;
  final String radioGroup2;
  final String radioGroup3;
  final String sortOptions;
  final String timePreferences;

  const FilterState({
    this.radioGroup = "",
    this.radioGroup1 = "",
    this.radioGroup2 = "",
    this.radioGroup3 = "",
    this.sortOptions = "",
    this.timePreferences = "",
  });

  FilterState copyWith({
    String? radioGroup,
    String? radioGroup1,
    String? radioGroup2,
    String? radioGroup3,
    String? sortOptions,
    String? timePreferences,
  }) {
    return FilterState(
      radioGroup: radioGroup ?? this.radioGroup,
      radioGroup1: radioGroup1 ?? this.radioGroup1,
      radioGroup2: radioGroup2 ?? this.radioGroup2,
      radioGroup3: radioGroup3 ?? this.radioGroup3,
      sortOptions: sortOptions ?? this.sortOptions,
      timePreferences: timePreferences ?? this.timePreferences,
    );
  }

  @override
  List<Object?> get props => [
    radioGroup,
    radioGroup1,
    radioGroup2,
    radioGroup3,
    sortOptions,
    timePreferences,
  ];
}