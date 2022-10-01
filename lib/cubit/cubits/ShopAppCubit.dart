import 'package:bloc/bloc.dart';
import 'package:concaty_shop/cubit/states/ShopAppState.dart';
import 'package:concaty_shop/model/model_home.dart';
import 'package:concaty_shop/modules/categoresscreen/categoress_screen.dart';
import 'package:concaty_shop/modules/favoret_screen/favoritscreen.dart';
import 'package:concaty_shop/modules/homescreen/home_screen.dart';
import 'package:concaty_shop/modules/login/login_screen/login_screen.dart';
import 'package:concaty_shop/shared/constant/constants.dart';
import 'package:concaty_shop/shared/network/dio/dio_helper.dart';
import 'package:concaty_shop/shared/network/sharedprefrance/sharedprafrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/settingscreen/setting_screen.dart';

class ShopAppCubit extends Cubit<ShopAppStates>
{
  ShopAppCubit():super(InitialShopAppState());
 static ShopAppCubit get(context)=>BlocProvider.of(context);
  ModelHome? homeModel ;
  void getData()
  {
    emit(GetDataLoadingState());

    DioHelper.getData(
      url: "home",
      token: token
    ).then((value)
    {
      homeModel = ModelHome.fromJson(value.data);
      print(homeModel!.data!.banners[0].image);
      print(homeModel!.data!.banners[0].id);
      emit(GetDataSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(GetDataErrorState());
    });
  }
  int Currentindex =0;
  void Changeindex(index)
  {
    Currentindex=index;
    emit(ChangeIndexSuccess());
  }
  List<Widget> bodyScreen=
  [
    HomeScreen(),
    CategoresScreen(),
    Favoritscreen(),
    SettingScreen()
  ];
  void submit(context)
  {
    CatchHelper.saveData(key: "Layout",value: true).then((value)
    {
      if(value==true){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
     print("successful");
      }
    });
  }
}
