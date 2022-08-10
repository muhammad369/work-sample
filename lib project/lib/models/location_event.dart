import 'package:eq_works_task/util/serialization/serialization_lib.dart';

class LocationEvent extends Serializable{
  double? lat;
  double? lon;
  int? time;
  String? ext;

  LocationEvent({this.lat, this.lon, this.time, this.ext, });

  @override
  void fromMap(Map<String, dynamic> map) {
    lat = map['lat'];
    lon = map['lon'];
    time = map['time'];
    ext = map['ext'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['time'] = this.time;
    data['ext'] = this.ext;
    return data;
  }
}

// {"lat":0.0, "lon":0.0, "time":123456,"ext":""}