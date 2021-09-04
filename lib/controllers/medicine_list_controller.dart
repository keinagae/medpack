import 'package:get/get.dart';
import 'package:medpack/data/modals/medicine_tile.dart';
import 'package:medpack/data/providers/medicine.dart';

class MedicineListController extends GetxController{
  var medicines=[].obs;
  MedicineProvider provider=MedicineProvider();
  @override
  void onInit() {
    super.onInit();
    provider.getMedicineTileList().then((items){
      medicines.clear();
      medicines.addAll(items);
    });
  }
}