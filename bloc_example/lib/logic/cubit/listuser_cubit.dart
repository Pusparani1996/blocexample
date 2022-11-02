import 'dart:convert';

import 'package:bloc_example/model/user.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'listuser_state.dart';

class ListuserCubit extends Cubit<ListuserState> {
  ListuserCubit() : super(const ListuserState(status: Status.initial));
  bool get isLoading => state.status == Status.loading;

  getData() async {
    if (isLoading) {
      return ;
      
    }

    emit(ListuserState(status: Status.loading));

    try {
      
    var raw = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(raw.statusCode == 200)
    {
      var result = jsonDecode(raw.body) as List;
      var users = result.map((e) => UserModel.fromJson(e)).toList(); 
      emit(ListuserState(status: Status.loaded, userModel:users ));
    }
    else{
      emit(ListuserState(status: Status.error));
    }

   

    } catch (e) {
      emit(ListuserState(status: Status.error));//error like page not found//like server error
    }

  }
}
