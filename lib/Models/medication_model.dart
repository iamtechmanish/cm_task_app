class MedicationModel {
  List<Data>? data;

  MedicationModel({this.data});

  MedicationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? drugClass;
  String? brand;
  String? code;
  String? type;
  String? strength;
  String? from;
  String? rOA;
  String? dose;
  String? doseType;
  String? frequency;
  String? frequencyType;
  String? dosingHours;
  String? dosingTime;
  String? instructions;
  String? reason;
  String? dateAdded;
  String? lastModified;

  Data(
      {this.name,
        this.drugClass,
        this.brand,
        this.code,
        this.type,
        this.strength,
        this.from,
        this.rOA,
        this.dose,
        this.doseType,
        this.frequency,
        this.frequencyType,
        this.dosingHours,
        this.dosingTime,
        this.instructions,
        this.reason,
        this.dateAdded,
        this.lastModified});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    drugClass = json['drug_class'];
    brand = json['brand'];
    code = json['code'];
    type = json['type'];
    strength = json['strength'];
    from = json['from'];
    rOA = json['rOA'];
    dose = json['dose'];
    doseType = json['dose_type'];
    frequency = json['frequency'];
    frequencyType = json['frequency_type'];
    dosingHours = json['dosing_hours'];
    dosingTime = json['dosing_time'];
    instructions = json['instructions'];
    reason = json['reason'];
    dateAdded = json['date_added'];
    lastModified = json['last_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['drug_class'] = this.drugClass;
    data['brand'] = this.brand;
    data['code'] = this.code;
    data['type'] = this.type;
    data['strength'] = this.strength;
    data['from'] = this.from;
    data['rOA'] = this.rOA;
    data['dose'] = this.dose;
    data['dose_type'] = this.doseType;
    data['frequency'] = this.frequency;
    data['frequency_type'] = this.frequencyType;
    data['dosing_hours'] = this.dosingHours;
    data['dosing_time'] = this.dosingTime;
    data['instructions'] = this.instructions;
    data['reason'] = this.reason;
    data['date_added'] = this.dateAdded;
    data['last_modified'] = this.lastModified;
    return data;
  }
}
