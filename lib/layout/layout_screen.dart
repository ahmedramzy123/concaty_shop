import 'package:concaty_shop/cubit/cubits/ShopAppCubit.dart';
import 'package:concaty_shop/cubit/states/ShopAppState.dart';
import 'package:concaty_shop/shared/constant/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener:(context,state){},
      builder:(context,state){
        return   Scaffold(
          appBar: AppBar(
            title: Text("Concaty",style: TextStyle(fontSize: 20,color: Colors.black),),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              ShopAppCubit.get(context).getData();
            },
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.deepOrange,
            index: ShopAppCubit.get(context).Currentindex,
            onTap: (index)
            {
              ShopAppCubit.get(context).Changeindex(index);
            },
            items:
            [
              Icon(Icons.home),
              Icon(Icons.apps),
              Icon(Icons.favorite),
              Icon(Icons.settings),
            ],
          ),
        body:  ShopAppCubit.get(context).bodyScreen[ShopAppCubit.get(context).Currentindex],
        );
      },

    );
  }
}
