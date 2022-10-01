import 'package:concaty_shop/model/model_login.dart';
import 'package:concaty_shop/modules/login/cubit/states/states.dart';
import 'package:concaty_shop/shared/constant/constants.dart';
import 'package:concaty_shop/shared/network/dio/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(InitialState());
 static LoginCubit get(context)=> BlocProvider.of(context);
  LoginModel? model;
  void userLogin({
  required String email,
  required dynamic password,
})
 {
   DioHelper.postData(
       url: "login",
       data: {
         "email":email,
         "password":password
       }).then((value)
   {
     model = LoginModel.fromJson(value.data);
     print(model!.data!.token);
     emit(LoginSuccessState(model!));
   }).catchError((error)
   {

     print(error.toString());
     emit(LoginErrorState());
   });
 }
  bool obscure = true;
  IconData suffix = Icons.visibility;
  void changeObscure()
  {
    obscure = !obscure;
    suffix =obscure?Icons.visibility: Icons.visibility_off;
    emit(ChangeObscureSuccessState());
  }

  // void userSignUP({
  //   required String email,
  //   required dynamic phone,
  //   required String name,
  //   required dynamic password,
  // })
  // {
  //   DioHelper.postData(
  //       url: "register",
  //       data: {
  //         "email":email,
  //         "password":password,
  //         "name":name,
  //         "phone":phone,
  //       }).then((value)
  //   {
  //     emit(SignupSuccessState());
  //   }).catchError((error)
  //   {
  //     print(error.toString());
  //     emit(SignupErrorState());
  //   });
  // }
}