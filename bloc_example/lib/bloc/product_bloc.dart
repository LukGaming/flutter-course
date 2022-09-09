// import 'dart:html';

// import 'package:bloc/bloc.dart';
// import 'package:bloc_example/domains/models/product.dart';
// import 'package:meta/meta.dart';

// part 'product_event.dart';
// part 'product_state.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   ProductBloc() : super(ProductInitial());
//   Product _product = Product.empty();

//   @override
//   Stream<ProductState> mapEventToState(ProductEvent productEvent) async* {
//     if (productEvent is ProductEventUpdate) {
//       yield ProductDefaultState(product: _product);
//     }
//   }
// }
