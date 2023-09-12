import 'package:jessy_mall/injection_container/cart_injection.dart';
import 'package:jessy_mall/injection_container/delivery_injection.dart';
import 'package:jessy_mall/injection_container/global_injection.dart';
import 'package:jessy_mall/injection_container/invest_store_option_injection.dart';
import 'package:jessy_mall/injection_container/warehouse_orders_injection.dart';

import 'auth_injection.dart';
import 'dio_init_client.dart';
import 'home_injection.dart';
import 'edit_store_injection.dart';
import 'favorite_injection.dart';
import 'home_search_injection.dart';
import 'income_outcome_injection.dart';
import 'profile_injection.dart';
import 'upload_excel_file_injection.dart';
import 'warehouse_extra_space_requests_injection.dart';
import 'warehouse_products_injection.dart';

Future<void> initInjection() async {
  await dioInjection();
  await globalInjection();
  await authInjection();
  await profileInjection();
  await homeInjection();
  await editStoreInjection();
  await incomeOutcomeInjection();
  await favoriteInjection();
  await investStoreOptionInjection();
  await warehouseProductsInjection();
  await dileveryInjection();
  await warehouseExtraSpaceRequestsInjection();
  await warehouseOrdersInjection();
  await cartInjection();
  await homeSearchInjection();

  await uploadExcelFileInjection();
}
