part of 'listuser_cubit.dart';

enum Status {
  initial,
  loading,
  loaded,
  error
}

 class ListuserState extends Equatable {
  const ListuserState({required this.status, this.userModel});
  final Status status;
  final List<UserModel>? userModel;

  @override
  List<Object?> get props => [status,userModel];
}


