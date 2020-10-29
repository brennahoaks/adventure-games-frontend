import 'package:flutter/material.dart';
import 'main.dart';
import 'Classes/user.dart';
import 'Classes/game.dart';
import 'Classes/player.dart';
import 'gameDashboard.dart';

class joinGame extends StatefulWidget {
  joinGame({Key key, this.currUser}) : super(key: key);
  final user currUser;
  @override
  _joinGameState createState() => _joinGameState();
}

class _joinGameState extends State<joinGame> {
  TextEditingController gameIdController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  bool buttonEnabled;

  @override
  void initState(){
    super.initState();
    init();
  }

  void init() async {
    buttonEnabled = false;
  }

  bool checkButtonVar () {
    return buttonEnabled;
  }


  void checkButtonEnabled() {
    String text1,text2;

    text1 = gameIdController.text ;
    text2 = codeController.text ;
    if(text1 == '' || text2 == '')
    {
      print('Text Field is empty, Please Fill All Data');
    }else{
      setState(() => buttonEnabled = true);
      print('Not Empty, All Text Input is Filled.');
    }

  }



  void _join() {
    print(codeController.text);
    //TODO pass the code and current user's user id (widget.currUser.userId) to the database and get the game and player back.
    //pass that game and player to the gameDashboard as currGame and currPlayer
    game currGame = game();
    player currPlayer = player();
    currPlayer.playerId = widget.currUser.userId;
    currGame.code = codeController.text;
    final route = MaterialPageRoute(
      builder: (context) =>
          gameDashboard(currGame: currGame, currUser: widget.currUser, currPlayer: currPlayer),
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adventure Games'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Join Game',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: gameIdController,
                    onChanged: (val) {
                      checkButtonEnabled();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Game Id',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: codeController,
                    onChanged: (val) {
                      checkButtonEnabled();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Code',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Join'),
                      onPressed: checkButtonVar() ? () => _join() : null,
                    )),
              ],
            )));
  }
}