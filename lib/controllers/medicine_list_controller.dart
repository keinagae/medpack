import 'package:get/get.dart';
import 'package:medpack/data/modals/medicine_tile.dart';
import 'package:medpack/data/providers/medicine.dart';

class MedicineListController extends GetxController {
  var medicines = <MedicineTile>[].obs;
  MedicineProvider provider = MedicineProvider();
  Rx<bool> loading = false.obs;
  Rx<bool> hasErroes = false.obs;
  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  Future<dynamic> fetchProducts() {
    loading.value = true;
    return provider.getMedicineTileList().then((items) {
      medicines.clear();
      loading.value = false;
      medicines.addAll(items);
    }).catchError((error) {
      hasErroes.value = true;
      loading.value = false;
    });
  }
}
