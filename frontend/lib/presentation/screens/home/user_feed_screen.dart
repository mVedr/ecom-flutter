import 'package:cached_network_image/cached_network_image.dart';
import 'package:frontend/core/ui.dart';
import 'package:frontend/logic/cubits/product_cubit/product_cubit.dart';
import 'package:frontend/logic/cubits/product_cubit/product_state.dart';
import 'package:frontend/logic/services/formatter.dart';
import 'package:frontend/presentation/screens/product/product_details_screen.dart';
import 'package:frontend/presentation/widgets/gap_widget.dart';
import 'package:frontend/presentation/widgets/product_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoadingState && state.products.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ProductErrorState && state.products.isEmpty) {
        return Center(
          child: Text(state.message),
        );
      }

      return ProductListView(products: state.products);
    });
  }
}
