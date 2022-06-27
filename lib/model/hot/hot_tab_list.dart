class HotTabList {
  int id;
  String name;
  String apiUrl;
  int tabType;
  int nameType;
  String adTrack;

  HotTabList(
      {this.id,
        this.name,
        this.apiUrl,
        this.tabType,
        this.nameType,
        this.adTrack});

  HotTabList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    apiUrl = json['apiUrl'];
    tabType = json['tabType'];
    nameType = json['nameType'];
    adTrack = json['adTrack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['apiUrl'] = this.apiUrl;
    data['tabType'] = this.tabType;
    data['nameType'] = this.nameType;
    data['adTrack'] = this.adTrack;
    return data;
  }
}