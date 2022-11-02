
import 'package:bloc_example/logic/cubit/listuser_cubit.dart';
import 'package:bloc_example/model/user.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfUser extends StatefulWidget {
  const ListOfUser({Key? key}) : super(key: key);

  @override
  State<ListOfUser> createState() => _ListOfUserState();
}

class _ListOfUserState extends State<ListOfUser> {

  @override
  void initState() {
  context.read<ListuserCubit>().getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final c = context.watch<ListuserCubit>();
   final status = c.state.status;
   final data = c.state.userModel;

   switch (status) {
     
     case Status.initial:
       return Center(
        child: CircularProgressIndicator(),
       );
     case Status.loading:
     return Center(
        child: CircularProgressIndicator(),
       );
     case Status.loaded:
       return _build(data!);
     case Status.error:
       return Center(
        child: CircularProgressIndicator(),
       );
   }
   
  }
  _build(List<UserModel> data){
     return Scaffold(
      appBar: AppBar(
        title: Text("List of users"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].name),
            subtitle: Text(data[index].email),
          );
        },
      ),
    );
  }
}
