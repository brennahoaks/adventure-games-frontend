import 'package:flutter/material.dart';
import 'main.dart';
import 'Classes/user.dart';
import 'Classes/game.dart';
import 'Classes/player.dart';
import 'gameDashboard.dart';

class createGame extends StatefulWidget {
  createGame({Key key, this.currUser}) : super(key: key);
  final user currUser;
  @override
  _createGameState createState() => _createGameState();
}

class _createGameState extends State<createGame> {
  TextEditingController locationController = TextEditingController();
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
    String text1;

    text1 = locationController.text ;
    if(text1 == '')
    {
      print('Text Field is empty, Please Fill All Data');
    }else{
      setState(() => buttonEnabled = true);
      print('Not Empty, All Text Input is Filled.');
    }

  }



  void _create() {
    print(locationController.text);
    //TODO pass the location and current user's user id (widget.currUser.userId) to the database and get a game and player back.
    //pass that game and player to the gameDashboard as currGame and currPlayer
    game currGame = game();
    player currPlayer = player();
    currPlayer.playerId = widget.currUser.userId;
    currGame.location = locationController.text;
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
                      'Create Game',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: locationController,
                    onChanged: (val) {
                      checkButtonEnabled();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Create'),
                      onPressed: checkButtonVar() ? () => _create() : null,
                    )),
              ],
            )));
  }
}