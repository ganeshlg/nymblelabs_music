import '../../status.dart';

class DetailsState {
  const DetailsState({this.status = Status.initial});

  final String status;

  DetailsState copyWith({String? status}) {
    return DetailsState(
      status: status ?? this.status,
    );
  }
}
