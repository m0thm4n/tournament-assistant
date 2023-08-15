import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote/vote.dart';
import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:io';

class RCV {
  static void getRCVTenMan() async {
    List<RankedBallot> ballots = [];
    String username = 'nathan.moritz@duocore.dev';
    String password = 'B@bycakes15!';

    final smtpServer = SmtpServer('box.duocore.space', username: username, password: password, allowInsecure: true, ignoreBadCertificate: true);

    // final smtpServer = gmail(username, password);

    CollectionReference<Map<String, dynamic>> players = FirebaseFirestore.instance.collection('players');



    // // Get docs from collection reference
    QuerySnapshot querySnapshot = await players.get();
    //
    // // Get data from docs and convert map to List
    final List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) => <String, dynamic>{'Player1': doc['Player1'], 'Player2': doc['Player2'], 'Player3': doc['Player3'], 'Player4': doc['Player4'], 'Player5': doc['Player5'], 'Player6': doc['Player6'], 'Player7': doc['Player7'], 'Player8': doc['Player8'], 'Player9': doc['Player9'], 'Player10': doc['Player10']}).toList();

    print(data);

    for (var i = 0; i < data.length; i++) {
      final player1 = data[i]["Player1"];
      final player2 = data[i]["Player2"];
      final player3 = data[i]["Player3"];
      final player4 = data[i]["Player4"];
      final player5 = data[i]["Player5"];
      final player6 = data[i]["Player6"];
      final player7 = data[i]["Player7"];
      final player8 = data[i]["Player8"];
      final player9 = data[i]["Player9"];
      final player10 = data[i]["Player10"];

      ballots.add(RankedBallot([
        player1,
        player2,
        player3,
        player4,
        player5,
        player6,
        player7,
        player8,
        player9,
        player10
      ]));
    }



    final irvElection = IrvElection(ballots);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Assistant')
      ..recipients.add('nathan.moritz@protonmail.com')
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Tournament Teams'
      ..text = irvElection.places.toString();
      // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  static void getRCVWingman() async {
    List<RankedBallot> ballots = [];
    String username = 'nathan.moritz@duocore.dev';
    String password = 'B@bycakes15!';

    final smtpServer = SmtpServer('box.duocore.space', username: username, password: password, allowInsecure: true, ignoreBadCertificate: true);

    var players = FirebaseFirestore.instance.collection('players');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await players.get();

    // Get data from docs and convert map to List
    final List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) => <String, dynamic>{'Player1': doc['Player1'], 'Player2': doc['Player2'], 'Player3': doc['Player3'], 'Player4': doc['Player4'], 'Player5': doc['Player5'], 'Player6': doc['Player6'], 'Player7': doc['Player7'], 'Player8': doc['Player8'], 'Player9': doc['Player9'], 'Player10': doc['Player10'], 'Player11': doc['Player11'], 'Player12': doc['Player12'], 'Player13': doc['Player13'], 'Player14': doc['Player14'], 'Player15': doc['Player15'], 'Player16': doc['Player16']}).toList();

    print(data);

    for (var i = 0; i < data.length; i++) {
      final player1 = data[i]["Player1"];
      final player2 = data[i]["Player2"];
      final player3 = data[i]["Player3"];
      final player4 = data[i]["Player4"];
      final player5 = data[i]["Player5"];
      final player6 = data[i]["Player6"];
      final player7 = data[i]["Player7"];
      final player8 = data[i]["Player8"];
      final player9 = data[i]["Player9"];
      final player10 = data[i]["Player10"];
      final player11 = data[i]["Player11"];
      final player12 = data[i]["Player12"];
      final player13 = data[i]["Player13"];
      final player14 = data[i]["Player14"];
      final player15 = data[i]["Player15"];
      final player16 = data[i]["Player16"];


      ballots.add(RankedBallot([
        player1,
        player2,
        player3,
        player4,
        player5,
        player6,
        player7,
        player8,
        player9,
        player10,
        player11,
        player12,
        player13,
        player14,
        player15,
        player16,
      ]));
    }

    final irvElection = IrvElection(ballots);

    print(irvElection.places.toString());

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Assistant')
      ..recipients.add('nathan.moritz@protonmail.com')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Tournament Teams'
      ..text = irvElection.places.toString();
    // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
