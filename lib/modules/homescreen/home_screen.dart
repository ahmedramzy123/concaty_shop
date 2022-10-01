import 'package:carousel_slider/carousel_slider.dart';
import 'package:concaty_shop/cubit/cubits/ShopAppCubit.dart';
import 'package:concaty_shop/cubit/states/ShopAppState.dart';
import 'package:concaty_shop/model/model_home.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return  Scaffold(
            appBar: AppBar(),
            body:ConditionalBuilder(
              condition: ShopAppCubit.get(context).homeModel!=null,
              builder: (context)=>prodactBuilder(ShopAppCubit.get(context).homeModel!),
              fallback:(context)=>Center(child: CircularProgressIndicator()) ,
            )
        );
      },

    );
  }
}
Widget prodactBuilder(ModelHome model)=>Column(
  children: [
   CarouselSlider(items: model.data!.banners.map((e) =>
       Image(image: NetworkImage("${e.image}"),
       width: double.infinity,
         fit: BoxFit.cover,
       )).toList(),
       options: CarouselOptions(
     height: 250,
     initialPage: 0,
     autoPlayInterval: Duration(seconds: 3),
     autoPlayAnimationDuration: Duration(seconds: 1),
     enableInfiniteScroll: true,
     reverse: false,
     autoPlay: true
   )),
    SizedBox(height: 20,),

  ]
);

