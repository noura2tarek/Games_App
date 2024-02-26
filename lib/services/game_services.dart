import '../models/game_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiServices {
   //https://www.mmobomb.com/api1/games
   List<Game> games =[];

    Future<List<Game>?> fetchGames () async{
      var url = Uri.https('www.mmobomb.com', '/api1/games');  // or Uri.parse(apiLink)

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
         var bodyList =
         convert.jsonDecode(response.body) as List<dynamic>;  //
         var itemCount = bodyList.length;
         print("number of games is $itemCount");
         for(var item in bodyList){
            games.add(Game.fromJson(item));
         }
         return games;

      } else {
         print('Request failed with status: ${response.statusCode}.');
      }
      return null;
   }


}