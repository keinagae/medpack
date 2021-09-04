import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/medicine_list_controller.dart';
import 'package:medpack/data/modals/medicine_tile.dart';
import 'package:medpack/pages/medicine_detail_page.dart';
import 'package:medpack/widgets/cards.dart';
import 'package:medpack/widgets/hero.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller=Get.put(MedicineListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Entypo.menu),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.bagPage);
                    },
                    icon: Icon(Entypo.bag),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            MDPCard(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      child: Text("Looking for medicine",style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 24),)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:10),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        // isCollapsed: true,
                          isDense: true,
                        hintText: "Search",
                        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        prefixIcon: Icon(Entypo.search)
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Obx(()=>ListView.separated(
                    itemBuilder: (ctx,index)=>MedicineListCard(medicine: controller.medicines[index],),
                    separatorBuilder: (ctx,index)=>Container(),
                    itemCount: controller.medicines.length
                )))
          ],
        ),
      ),
    );
  }
}

class MedicineListCard extends StatelessWidget {
  final MedicineTile medicine;
  MedicineListCard({Key? key,required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDPLightCard(
      child: ListTile(
        onTap: (){
          Get.to(()=>MedicineDetailPage(),arguments: {"medicine":medicine},);
        },
        leading: MDPHero(
          tag: "medicine_image_${medicine.id}",
          child: CircleAvatar(
            backgroundImage: NetworkImage(medicine.image??"",),
          ),
        ),

        title: MDPHero(
          tag: "medicine_title_${medicine.id}",
          color: Theme.of(context).canvasColor,
          child: Text(medicine.title??""),
        ),
        subtitle: MDPHero(

          tag: "medicine_description_${medicine.id}",
          child: Container(
            constraints: BoxConstraints(
                maxHeight: 100
            ),
            child: Text(medicine.description??"",overflow: TextOverflow.ellipsis,),
          ),
        ),
        trailing: TextButton(onPressed: () {  },child: Icon(Entypo.bag),),
      ),
    );
  }
}

