part of 'liked_bloc.dart';

/// Represents the state of Liked in the application.

// ignore_for_file: must_be_immutable
class LikedState extends Equatable {
  LikedState({this.searchtwoController, this.likedModelObj});

  TextEditingController? searchtwoController;

  LikedModel? likedModelObj;

  @override
  List<Object?> get props => [searchtwoController, likedModelObj];

  LikedState copyWith({
    TextEditingController? searchtwoController,
    LikedModel? likedModelObj,
  }) {
    return LikedState(
      searchtwoController: searchtwoController ?? this.searchtwoController,
      likedModelObj: likedModelObj ?? this.likedModelObj,
    );
  }
}
