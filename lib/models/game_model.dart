class Game {
  final int id;
  final String title;
  final String image;
  final String shortDescription;


 Game(
     {required this.id,
   required this.title,
   required this.image,
   required this.shortDescription,
 });

 factory Game.fromJson(Map<String, dynamic> json) {
   return Game(
     id : json['id'],
     title : json['title'],
     image : json['thumbnail'],
     shortDescription : json['short_description'],
   );
 }

}
