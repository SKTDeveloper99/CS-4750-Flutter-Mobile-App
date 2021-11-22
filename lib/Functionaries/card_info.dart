class GetCardInfo {
  String id;
  String name;
  String score;
  String team;
  String trait1;
  String trait2;
  String trait3;
  String trait4;
  String year;
  String owner;
  String pictureLink;

  GetCardInfo({required this.id,required this.name,required this.score,required this.team,required this.trait1,required this.trait2,required this.trait3,
    required this.trait4,required this.year,required this.owner,required this.pictureLink});

  factory GetCardInfo.fromRTDB(Map<String, dynamic> data ) {
    return GetCardInfo(id: data['ID'],name: data['Name'], score: data['Score']
        ,team: data['Team'], trait1: data['Trait 1'], trait2: data['Trait 2'], trait3: data['Trait 3']
        , trait4: data['Trait 4'], year: data['Year'],owner: data['owner'],pictureLink: data['pictureLink']);
  }
}

