import 'package:ecommerce_shop/ui/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_shop/ui/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(create: (context) {
      var cartBloc = CartBloc();
      cartBloc.stream.forEach((state) {
if (state is CartCheckOytSuccess) {
  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ProfileScreen(),));
}else if (state is CartEror){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.appException.exceptionMessage)));
}

       });
      cartBloc.add(CartStarted());
      return cartBloc;
    },
    child: Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) {
          return current is CartEror||
          current is CartSuccess ;
        },
        builder: (context, state) { 
          return SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)),
                    Text('Cart'),
                    SizedBox(width: 10,),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3,
                  color:  Colors.black,
                  child: ListView.builder(
                    itemCount: ,
                    itemBuilder: (context, index) {
                    
                  },),
                )
              ],
            )
          
            );
        },
      ),
    ),
    );
  }
}