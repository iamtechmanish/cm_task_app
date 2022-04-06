import 'package:care_monitor/Controllers/medication_controller.dart';
import 'package:care_monitor/Models/medication_model.dart';
import 'package:care_monitor/widgets/customer_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/config.dart';
import '../widgets/base_form_field.dart';
import '../widgets/custome_dialog.dart';
import 'package:intl/intl.dart';

class AddNewMedicatinos extends StatefulWidget {
 String action ;
 Data medicationItem;
 int editIndex =-1;

 AddNewMedicatinos(this.action, this.medicationItem, this.editIndex);


  @override
  _AddNewMedicatinosState createState() => _AddNewMedicatinosState();
}

class _AddNewMedicatinosState extends State<AddNewMedicatinos> {

  var dosetypes = [
    'Capsules',
    'Tablets',
    'Syrip',
    'Cream',
  ];

  var frequencies = [
    'Once',
    'Twice',
    'Thrice',
  ];

  var frequencytypes = [
    'Day',
    'Week',
    'Month',
    'Year',
  ];

  var times = [
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
  ];

  List<bool> isSelectedAm = [true, false];
  String timing = "AM";



  bool autoValidate = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
        title: Text(
          widget.action=="Add"?"Add New Medication":"Edit Medication",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Medication Name",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.name.toString()=="null"?"":widget.medicationItem.name.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.name = value.toString() + "";
                    },
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Drug Class",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.drugClass.toString()=="null"?"":widget.medicationItem.drugClass.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.drugClass = value.toString() + "";
                    },
                    color: Colors.blueGrey.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Drug Brand",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.brand.toString()=="null"?"":widget.medicationItem.brand.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.brand = value.toString() + "";
                    },
                    color: Colors.blueGrey.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Drug Code (GCN)",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.code.toString()=="null"?"":widget.medicationItem.code.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.code = value.toString() + "";
                    },
                    color: Colors.blueGrey.withOpacity(0.7),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Drug Type",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: BaseFormField(
                              initialValue: widget.medicationItem.type.toString()=="null"?"":widget.medicationItem.type.toString(),
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },

                              // controller: ,
                              onChange: (value) {
                                widget.medicationItem.type = value.toString() + "";
                              },
                              color: Colors.blueGrey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Strength",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: BaseFormField(
                              initialValue: widget.medicationItem.strength.toString()=="null"?"":widget.medicationItem.strength.toString(),
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },

                              // controller: ,
                              onChange: (value) {
                                widget.medicationItem.strength = value.toString() + "";
                              },
                              color: Colors.blueGrey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: BaseFormField(
                              initialValue: widget.medicationItem.from.toString()=="null"?"":widget.medicationItem.from.toString(),
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },

                              // controller: ,
                              onChange: (value) {
                                widget.medicationItem.from = value.toString() + "";
                              },
                              color: Colors.blueGrey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Route of Administration",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: BaseFormField(
                              initialValue: widget.medicationItem.rOA.toString()=="null"?"":widget.medicationItem.rOA.toString(),
                              validation: (String? value) {
                                if (value!.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },

                              // controller: ,
                              onChange: (value) {
                                widget.medicationItem.rOA = value.toString() + "";
                              },
                              color: Colors.blueGrey.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "Dose",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BaseFormField(
                          initialValue: widget.medicationItem.dose.toString()=="null"?"":widget.medicationItem.dose.toString(),
                          validation: (String? value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          // controller: ,
                          onChange: (value) {
                            widget.medicationItem.dose = value.toString() + "";
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomeContainer(
                        color: Colors.white,
                        bottomMargin: 10,
                        widget: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            // Initial Value
                            value: widget.medicationItem.doseType.toString()=="null"?"Capsules":widget.medicationItem.doseType.toString(),

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: dosetypes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.medicationItem.doseType =
                                    newValue.toString() + "";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Frequency",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomeContainer(
                        color: Colors.white,
                        bottomMargin: 10,
                        widget: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            // Initial Value
                            value: widget.medicationItem.frequency.toString()=="null"?'Once':widget.medicationItem.frequency.toString(),

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: frequencies.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.medicationItem.frequency =
                                    newValue.toString() + "";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomeContainer(
                        color: Colors.white,
                        bottomMargin: 10,
                        widget: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            // Initial Value
                            value: widget.medicationItem.frequencyType.toString()=="null"?'Day':widget.medicationItem.frequencyType.toString(),

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: frequencytypes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.medicationItem.frequencyType =
                                    newValue.toString() + "";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Dosing Hours",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomeContainer(
                          color: Colors.white,
                          bottomMargin: 0,
                          widget: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // Initial Value
                              value: widget.medicationItem.dosingHours.toString()=="null"?'08:00':widget.medicationItem.dosingHours.toString(),

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: times.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  widget.medicationItem.dosingHours =
                                      newValue.toString() + "";
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: ToggleButtons(
                          borderColor: Colors.grey,
                          fillColor: Colors.blueGrey.withOpacity(0.5),
                          borderWidth: 1,
                          selectedBorderColor: Colors.black,
                          selectedColor: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(5),
                          children: <Widget>[
                            Text(
                              'AM',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'PM',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < isSelectedAm.length; i++) {
                                isSelectedAm[i] = i == index;
                              }
                              if (isSelectedAm[0]) {
                                timing = "AM";
                                widget.medicationItem.dosingTime = "AM" + "";
                              } else {
                                timing = "PM";
                                widget.medicationItem.dosingTime = "PM" + "";
                              }
                            });
                          },
                          isSelected: widget.medicationItem.dosingTime.toString()=="null"?isSelectedAm:(widget.medicationItem.dosingTime.toString()=="AM"?isSelectedAm:[false, true]),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Instructions",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.instructions.toString()=="null"?"":widget.medicationItem.instructions.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.instructions = value.toString() + "";
                    },
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Reason for Presciption:",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BaseFormField(
                    initialValue: widget.medicationItem.reason.toString()=="null"?"":widget.medicationItem.reason.toString(),
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    // controller: ,
                    onChange: (value) {
                      widget.medicationItem.reason = value.toString() + "";
                    },
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if(_formKey.currentState!.validate()){
                              final DateTime now = DateTime.now();
                              final DateFormat formatter = DateFormat('yyyy-MM-dd');
                              final String formatted = formatter.format(now);
                              widget.medicationItem.dateAdded = widget.medicationItem.dateAdded=="null"?formatted:widget.medicationItem.dateAdded.toString();
                              widget.medicationItem.lastModified = formatted;

                              if (isSelectedAm[0]) {
                                if(widget.medicationItem.dosingTime != "AM")
                                  widget.medicationItem.dosingTime = "PM" + "";
                                else{
                                  widget.medicationItem.dosingTime = "AM";
                                }
                              }
                              else{
                                widget.medicationItem.dosingTime = "PM";
                              }

                              widget.medicationItem.doseType = widget.medicationItem.doseType.toString()=="null"?'Capsules':widget.medicationItem.doseType.toString();
                              widget.medicationItem.frequency = widget.medicationItem.frequency.toString()=="null"?'Once':widget.medicationItem.frequency.toString();
                              widget.medicationItem.frequencyType = widget.medicationItem.frequencyType.toString()=="null"?'Day':widget.medicationItem.frequencyType.toString();
                              widget.medicationItem.dosingHours = widget.medicationItem.dosingHours.toString()=="null"?'08:00':widget.medicationItem.dosingHours.toString();

                              final medicationController = Get.find<MedicationController>();
                              if(widget.editIndex>-1){
                                medicationController.updateitem(widget.editIndex,widget.medicationItem);
                              }
                              else {
                                medicationController.addnew(widget.medicationItem);
                              }

                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => CustomDialog(
                                  showBtns: false,
                                  image: "assets/images/done.png",
                                  title: "Success",
                                  description:widget.action=="Add"?
                                  "You have sucessfully added the medication" : "Medication Updated Successfully",
                                  positiveBtnTxt: "Delete",
                                  negativeBtnTxt: "Cancel",
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                  onCancel: () {
                                    Navigator.pop(context);
                                  },
                                  onDialogClose: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            }
                          });

                          // widget.medicationItem.name = "today";
                          // widget.medicationItem.drugClass = "today";
                          // widget.medicationItem.brand = "today";
                          // widget.medicationItem.code = "today";
                          // widget.medicationItem.type = "today";
                          // widget.medicationItem.strength = "today";
                          // widget.medicationItem.from = "today";
                          // widget.medicationItem.rOA = "today";
                          // widget.medicationItem.dose = "today";
                          // widget.medicationItem.doseType = "today";
                          // widget.medicationItem.frequency = "today";
                          // widget.medicationItem.frequencyType = "today";
                          // widget.medicationItem.dosingHours = "today";
                          // widget.medicationItem.dosingTime = "today";
                          // widget.medicationItem.instructions = "today";
                          // widget.medicationItem.reason = "today";
                        },
                        child: Text(widget.action=="Add"?"Save":"Update")),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
