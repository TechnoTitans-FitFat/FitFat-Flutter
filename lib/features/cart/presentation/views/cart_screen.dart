import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/cart/cubit/get_cart_cubit.dart';
import 'package:fitfat/features/cart/presentation/views/payment_screen.dart'
    show PaymentScreen;
import 'package:fitfat/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:fitfat/features/cart/presentation/widgets/cart_screen_body.dart';
import 'package:fitfat/features/cart/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCart(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: const CustomAppBarCart(title: 'Cart'),
        body: BlocBuilder<GetCartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartError) {
              return Center(child: Text('Error : ${state.message}'));
            } else if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 16, top: 6),
                child: CartScreenBody(
                  cartItems: state.cart.cartItems,
                  onItemCountChanged: () {
                    context.read<GetCartCubit>().getCart(context: context);
                  },
                ),
              );
            } else {
              return const Center(child: Text('Update cart'));
            }
          },
        ),
        bottomNavigationBar:
            BlocBuilder<GetCartCubit, CartState>(builder: (context, state) {
          if (state is CartLoaded) {
            return CartBottomBar(
              cartItems: state.cart.cartItems,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
