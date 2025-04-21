//SelectionPopupModel is commmon model
///used for setting data into drowdowns


//ignore_for_file: must_be_immutable
class SelectionPopupModel<T> {
  SelectionPopupModel({this.id, required this.title, this.value, this.isSelected = false});

  final int? id;
  final String title;
  final T? value;
  final bool isSelected;

  SelectionPopupModel<T> copyWith({
    int? id,
    String? title,
    T? value,
    bool? isSelected,
  }) {
    return SelectionPopupModel<T>(
      id: id ?? this.id,
      title: title ?? this.title,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectionPopupModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              value == other.value &&
              isSelected == other.isSelected;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ value.hashCode ^ isSelected.hashCode;
}
