import 'package:flutter/material.dart';
import 'Classes/user.dart';
import 'Classes/experience.dart';
import 'Classes/game.dart';
import 'Classes/player.dart';
import 'gameDashboard.dart';
import 'createGame.dart';
import 'joinGame.dart';

class userDashboard extends StatefulWidget {
  userDashboard({Key key, this.currentUser}) : super(key: key);
  final user currentUser;
  @override
  _userDashboardState createState() => _userDashboardState();
}

class _userDashboardState extends State<userDashboard> {
  List<player> playerList;
  @override
  void initState(){
    super.initState();
    init();
  }

  void init() async {
    player testPlayer = player();
    testPlayer.gameId = 1234;
    playerList = List();
    playerList.add(testPlayer);
  }

  void _gameDashboard(player currPlayer){
    //TODO pass a gameId to the database, get a game object back and pass that object to the game dashboard
    game currGame = game();
    currGame.gameId = currPlayer.gameId;
    final route = MaterialPageRoute(
      builder: (context) =>
          gameDashboard(currGame: currGame, currUser: widget.currentUser, currPlayer: currPlayer),
    );
    Navigator.push(context, route);
  }

  void _createGame(){
    final route = MaterialPageRoute(
      builder: (context) =>
          createGame(currUser: widget.currentUser),
    );
    Navigator.push(context, route);
  }

  void _joinGame(){
    final route = MaterialPageRoute(
      builder: (context) =>
          joinGame(currUser: widget.currentUser),
    );
    Navigator.push(context, route);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Dashboard'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Username: ${widget.currentUser.userId}',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Create Game'),
                      onPressed: () {
                        _createGame();
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Join Game'),
                      onPressed: () {
                        _joinGame();
                      },
                    )),
                Expanded (
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: playerList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(playerList[index].gameId.toString()),
                        onTap: () {
                          _gameDashboard(playerList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}