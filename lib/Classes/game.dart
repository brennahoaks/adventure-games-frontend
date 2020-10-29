
class game {

  int gameId;
  String location;
  String startTime;
  int initialPlayerCount;
  int playersRemainingCount;
  String code;

  void setGame(Map input){
    gameId = input["gameId"];
    location = input["location"];
    startTime = input["startTime"];
    initialPlayerCount = input["initialPlayerCount"];
    playersRemainingCount = input["playersRemainingCount"];
    code = input["code"];
  }
}
