class TVShow {
  final String title;
  final String thumbnail;
  final int? totalSeasons;
  final String imdbID;
  final String genre;
  final List<String> actors;
  final String description;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String type;

  const TVShow(
    this.thumbnail, 
    this.imdbID, 
    this.genre, 
    this.actors,
    this.type,
    {
    required this.title,
    required this.description,
    required this.startedAt,
    this.totalSeasons,
    this.endedAt
  });

  factory TVShow.fromJson(Map<String, dynamic> json) {
    var dates = json['Year'].toString().split('–');


    DateTime s = DateTime(int.parse(dates[0]));
    DateTime? e;


    if(dates.length > 1 && dates[1].trim() != "") {
      e = DateTime(int.parse(dates[1]));
    }

    return TVShow(     
      json['Poster'],
      json['imdbID'],
      json['Genre'],
      json['Actors'].toString().split(','),
      json['Type'],
      title: json['Title'], 
      description: json['Plot'],
      startedAt: s,
      totalSeasons: json['Type'] == 'series' ? int.parse(json['totalSeasons']) : null,
      endedAt: e,
    );
  }
}