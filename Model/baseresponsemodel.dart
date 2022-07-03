class BaseResponceModel {
  bool status = false;
  bool isActive = false;
  String? message;
  dynamic data;

  BaseResponceModel({
    this.status = false,
    this.isActive = false,
    this.message,
    this.data,
  });

  BaseResponceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isActive = json['isActive'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsondata = <String, dynamic>{};
    jsondata['status'] = status;
    jsondata['isActive'] = isActive;
    jsondata['message'] = message;
    jsondata['data'] = data;
    return jsondata;
  }
}
