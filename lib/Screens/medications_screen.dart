import 'dart:math';

import 'package:care_monitor/Controllers/medication_controller.dart';
import 'package:care_monitor/widgets/custome_expansion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/custome_dialog.dart';
import 'add_new_medications.dart';

class MedicationScreen extends StatefulWidget {
  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  final MedicationController _medicationController = Get.put(MedicationController());

  bool isExpanded = false;
  int expandedIndex = -1;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10, right: 5, left: 5),
          child: Column(
      children: [
          Obx((){
              if(_medicationController.isLoading.value)
                return
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CircularProgressIndicator(),
                  ));
              else
                return
              Expanded(
                child: ListView.builder(
                    key: Key('builder ${expandedIndex.toString()}'),
                    shrinkWrap: true,
                    itemCount:
                    _medicationController.medicationsdata.value.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: index == 0
                                ? true
                                : (_medicationController.medicationsdata.value
                                .data![index].frequencyType
                                .toString() !=
                                _medicationController.medicationsdata
                                    .value.data![index - 1].frequencyType
                                    .toString()
                                ? true
                                : false),
                            child: Padding(
                              padding:
                              EdgeInsets.only(top: 8.0, left: 20, bottom: 5),
                              child: Text(
                                _medicationController.medicationsdata.value
                                    .data![index].frequencyType
                                    .toString(),
                                style:
                                TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: (isExpanded&&(expandedIndex==index))
                                      ? Colors.blue
                                      : Colors.white,
                                  width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 3.0,
                                  offset: Offset(0, 0),
                                  spreadRadius: 3.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ExpansionTile(
                              key:  new GlobalKey(),
                              backgroundColor: Colors.white,
                            // key: Key(index.toString()),
                            initiallyExpanded: index == expandedIndex,
                              onExpansionChanged: (bool expanding) {
                                if(expanding){
                                  setState(() {
                                    isExpanded = expanding;
                                    expandedIndex = index;
                                  });
                                }
                                else {
                                  setState(() {
                                    expandedIndex = -1;
                                  });
                                }

                              },
                              tilePadding: EdgeInsets.symmetric(horizontal: 10),
                              title: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                        width: 60,
                                        height: 60,
                                        child: Image.asset(index == 0
                                            ? "assets/images/sample_medicine.png"
                                            : "assets/images/medicine.png")),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            _medicationController.medicationsdata
                                                .value.data![index].name!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            _medicationController.medicationsdata
                                                .value.data![index].frequency!,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 10),
                                  child: Column(
                                    children: [
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Drug Class",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .drugClass
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Drug Code",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .code
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "From",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .from
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Strength",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .strength
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Dosing Hours",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .dosingHours
                                                    .toString() + " "+ _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .dosingTime
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Date Added",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .dateAdded
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Drug Brand",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .brand
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Drug Type",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .type
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Route of Administration",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .rOA
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Dose",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .dose
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Frequency",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .frequency
                                                    .toString() + " a "+  _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .frequencyType
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Last Updated",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .lastModified
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Instructions",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .instructions
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Resons for Presciption",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                _medicationController
                                                    .medicationsdata
                                                    .value
                                                    .data![index]
                                                    .reason
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(),
                                      Text(
                                        "Medication Added by you",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18.0, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(AddNewMedicatinos("Edit",_medicationController.medicationsdata.value.data![index], index ));
                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) => CustomDialog(
                                                    showBtns: true,
                                                    image: "assets/images/delete.png",
                                                    title: "Delete Medication",
                                                    description:
                                                    "Do you want to delete this medication ?",
                                                    positiveBtnTxt: "Delete",
                                                    negativeBtnTxt: "Cancel",
                                                    onClick: (){


                                                      setState(() {
                                                        Navigator.pop(context);
                                                        _medicationController.deleteItem(index);
                                                        expandedIndex = -1;
                                                      });
                                                    },
                                                    onCancel: (){
                                                      Navigator.pop(context);
                                                    },

                                                    onDialogClose: (){
                                                      Navigator.pop(context);
                                                    },

                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              );
          }),


      ],
    ),
        ));
  }
}
