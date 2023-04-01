import 'package:flutter/material.dart';
import 'package:interactive_choices/story_brain.dart';

void main() => runApp(Storyapp());

StoryBrain storyBrain = StoryBrain();

class Storyapp extends StatelessWidget {
  //sagt nur aus, dass es interaktiv und nicht statisch ist
  Widget build(BuildContext context) {
    //die statische Bausteine, die nicht geändert werden müssen (nimmt dem Aufbau der App Arbeit ab und macht den Prozess schneller beim refreshen)
    return MaterialApp(
      // MaterialApp ist das Paket, das mir all diese shortcuts ermöglicht wie zum beispiel elevated button
      theme: ThemeData
          .dark(), // packet, dass Farben verändert--dark, light vibes...so nen bissl wie dark mode für design
      home: StoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
} //Home ist auch interaktiv. Wichtig.

class _StoryPageState extends State<StoryPage> {
  // overwrite Storypage with storypagestate. Andere Formulierung für...ist nicht statisch, warum musste es nochmal geschriben werden? Der interaktive state wurde doch eigentlich schon vorher festgelegt,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // alles ist dauerhaft im Container und Scaffold
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/background.jpg'), // 23-2 7 legen Hintergrungbild fest- hinterlegt in yaml und dem images directory
            fit: BoxFit.cover,
          ),
        ),
        //als nächstes kommt das Textfeld, also brauche ich SafeArea, padding,
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 25,
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(storyBrain.getchoice1()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                  },
                  child: Text(storyBrain.getchoice2()),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
