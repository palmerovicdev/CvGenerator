part of 'cv_generator_cubit.dart';

abstract class CvGeneratorState extends Equatable {
  const CvGeneratorState();
}

class CvGeneratorLoading extends CvGeneratorState {
  @override
  List<Object> get props => [];
}

class CvGeneratorLoaded extends CvGeneratorState {
  @override
  List<Object> get props => [];
}

class CvGeneratorError extends CvGeneratorState {
  final String message;

  const CvGeneratorError(this.message);

  @override
  List<Object> get props => [message];
}