import 'package:flutter/material.dart';
import 'Classes/user.dart';
import 'Classes/experience.dart';
import 'Classes/game.dart';
import 'Classes/player.dart';

class gameDashboard extends StatefulWidget {
  gameDashboard({Key key, this.currGame, this.currUser, this.currPlayer}) : super(key: key);
  final game currGame;
  final user currUser;
  final player currPlayer;
  @override
  _gameDashboardState createState() => _gameDashboardState();
}

class _gameDashboardState extends State<gameDashboard> {
  String targetId;
  @override
  void initState(){
    super.initState();
    init();
  }

  void init() async {
    targetId = widget.currPlayer.targetId;
  }

  void _killTarget() {
    String newTargetId = "new target";
    //TODO pass the current player id (widget.currPlayer.playerId) to the database and get a new target playerId back.
    setState(() =>{
      targetId = newTargetId
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Game Dashboard'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Game: ${widget.currGame.gameId}',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Kill Target'),
                      onPressed: () {
                        _killTarget();
                      },
                    )),
              ],
            )));
  }
}