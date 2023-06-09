class Student {
  final String id;
  final String ip;
  final String name;
  final String deviceName;

  Student(this.id, this.ip, this.name, this.deviceName);

  factory Student.fromJson(Map<String, dynamic> json) =>
      Student(json['id'], json['ip'], json['name'], json['deviceName']);

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'ip':ip,
      'name':name,
      'deviceName':deviceName,
    };
  }

}
