part of 'cv_creator_cubit.dart';

abstract class CvCreatorState extends Equatable {
  const CvCreatorState();
}

class CvCreatorInitial extends CvCreatorState {
  @override
  List<Object> get props => [];
}

class CvCreatorLoading extends CvCreatorState {
  @override
  List<Object> get props => [];
}

class CvCreatorLoaded extends CvCreatorState {

  const CvCreatorLoaded({this.appBarTitle = 'Create your CV'});

  final String appBarTitle;
  @override
  List<Object> get props => [appBarTitle];

  CvCreatorLoaded copyWith({
    String? appBarTitle,
  }) {
    return CvCreatorLoaded(
      appBarTitle: appBarTitle ?? this.appBarTitle,
    );
  }
}

class CvCreatorError extends CvCreatorState {
  final String message;

  const CvCreatorError(this.message);

  @override
  List<Object> get props => [message];
}