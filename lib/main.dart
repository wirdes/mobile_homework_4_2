import 'dart:developer';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: 'Name Generator',
        home: RandomWords(),
      );
}

class RandomWordsState extends State<RandomWords> {
  final wordList = <WordPair>[];
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return const Divider(
              height: 10,
            );
          }
          final index = i ~/ 2;
          if (index >= wordList.length) {
            wordList.addAll(generateWordPairs().take(15));
            log(wordList.length.toString());
          }
          return listItem(wordList[index], index);
        });
  }

  Widget listItem(WordPair pair, int index) {
    return Container(
      height: 55,
      child: Center(
        child: Text(
          pair.asPascalCase,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => RandomWordsState();
}
