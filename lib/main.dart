import 'package:concaty_shop/cubit/cubits/ShopAppCubit.dart';
import 'package:concaty_shop/layout/layout_app.dart';
import 'package:concaty_shop/layout/layout_screen.dart';
import 'package:concaty_shop/modules/login/login_screen/login_screen.dart';
import 'package:concaty_shop/shared/bloc_observer.dart';
import 'package:concaty_shop/shared/constant/constants.dart';
import 'package:concaty_shop/shared/network/dio/dio_helper.dart';
import 'package:concaty_shop/shared/network/sharedprefrance/sharedprafrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CatchHelper.initial();
  BlocOverrides.runZoned(()=>ShopAppCubit()..getData(),blocObserver: MyBlocObserver());
  bool? onBoard =CatchHelper.getData(key: "Layout");
  print(onBoard);
  token = CatchHelper.getData(key: "token");
  print(token);
  Widget widget;
  if(onBoard !=null )
    {
      if(token != null) widget = LayoutScreen();
      else widget = LoginScreen();
    }else
    {
      widget = LayoutApp();
    }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
final Widget startWidget;
MyApp(this.startWidget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopAppCubit()..getData() ,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
            color: Colors.white,
              elevation: .1,
          )
        ),
        home:startWidget,
      ),
    );
  }
}
