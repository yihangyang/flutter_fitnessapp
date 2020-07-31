import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class SpeechContent extends StatefulWidget {
  final String text;
  final Map<String, HighlightedWord> highlights;
  const SpeechContent({Key key, this.text, this.highlights}) : super(key: key);
  @override
  _SpeechContentState createState() => _SpeechContentState();
}

class _SpeechContentState extends State<SpeechContent> {
  

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 150),
        child: TextHighlight(
          text: widget.text,
          words: widget.highlights,
          textStyle: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w400
          )
        ),
      ),
    );
  }
}