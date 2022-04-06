
import 'dart:async';
import 'dart:convert';

import 'package:care_monitor/Models/medication_model.dart';
import 'package:care_monitor/Utils/config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MedicationController extends GetxController{

 var medicationsdata = MedicationModel().obs;
 var isLoading = true.obs;

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMedications();
    // startTime();
  }

 void addnew(Data item){
   medicationsdata.value.data!.add(item);
   medicationsdata.refresh();
  }
 void updateitem(int index , Data item){
   medicationsdata.value.data![index]=item;
   medicationsdata.refresh();
 }

 void deleteItem(int index){
   medicationsdata.value.data!.removeAt(index);
   medicationsdata.refresh();
 }


 // startTime() async {
 //   var _duration = Duration(seconds: 3);
 //   return Timer(_duration, fetchMedications());
 // }

 fetchMedications() async {
   isLoading= true.obs;
   Map<String, String> data = {
     "userid": "1"
   };
    var result =  await GetMedications(data);
    if(result!=null){
      medicationsdata.value = result;
    }

    isLoading.value = false;

 }
}