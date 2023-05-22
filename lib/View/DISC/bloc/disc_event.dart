part of 'disc_bloc.dart';

abstract class DISCEvent extends Equatable {
  const DISCEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends DISCEvent {
  // final bool? onTap;
  final int? onTapIndex;
  // const OnTapEvent({required this.onTapIndex, this.onTap});
  const OnTapEvent({required this.onTapIndex});
}

class GetDISCTypeEvent extends DISCEvent {
  const GetDISCTypeEvent();
}

class GetDISCQuestionListEvent extends DISCEvent {
  const GetDISCQuestionListEvent();
}
