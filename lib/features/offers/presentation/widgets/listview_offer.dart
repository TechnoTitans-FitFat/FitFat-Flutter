import 'package:fitfat/features/offers/data/offer_cubit/offer_cubit.dart';
import 'package:fitfat/features/offers/presentation/widgets/listview_offer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListviewOffer extends StatelessWidget {
  const ListviewOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state is OfferLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OfferFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is OfferSucess) {
          final offers = state.data;

          return ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ListviewOfferItem(item: offers[index]),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
