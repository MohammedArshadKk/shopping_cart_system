import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_system/controller/cubit/cubit_get_product/product_cubit_cubit.dart';
import 'package:shopping_cart_system/model/product_model.dart';
import 'package:shopping_cart_system/views/products/widgets/actions_cart_button_widget.dart';
import 'package:shopping_cart_system/views/products/widgets/error_widget.dart';
import 'package:shopping_cart_system/views/products/widgets/grid_widget.dart';
import 'package:shopping_cart_system/views/products/widgets/no_data_widget.dart';
import 'package:shopping_cart_system/views/utils/colors.dart';
import 'package:shopping_cart_system/views/utils/loading_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductCubitCubit>().fetchproductdataCubit();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ActionsCartButtonWidget(),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocBuilder<ProductCubitCubit, ProductCubitState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return LoadingWidget();
                  } else if (state is NoDataState) {
                    return NoDataWidget();
                  } else if (state is DataLoadedState) {
                    return GridWidget(products: state.products);
                  } else if (state is ErrorState) {
                    return ErrorWidgetData(error: state.error);
                  }
                  return NoDataWidget();
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.favorite, color: AppColors.background),
      ),
    );
  }
}
