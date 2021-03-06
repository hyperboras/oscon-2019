import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/common.dart';
import 'package:web_app/db.dart';

const buttonTextStyle = TextStyle(
  fontFamily: 'Raleway',
  color: Colors.black,
  fontSize: 24,
);

const labelTextStyle = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w900,
  color: Colors.black,
  fontSize: 32,
);

class SimpleVotingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VotingLabel('Haberdashery Voter!'),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              BlueVotingButton(),
              GreenVotingButton(),
              RedVotingButton(),
              YellowVotingButton(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: CountdownClock(
            styling: labelTextStyle,
          ),
        ),
      ],
    );
  }
}

class VotingLabel extends StatelessWidget {
  const VotingLabel(this.label);
  final String label;

  @override
  Widget build(BuildContext context) => Text(label, style: labelTextStyle);
}

class BlueVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlueVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(notifier);
    });
  }
}

class GreenVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GreenVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(notifier);
    });
  }
}

class RedVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RedVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(notifier);
    });
  }
}

class YellowVotingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<YellowVoteNotifier>(builder: (context, notifier, _) {
      return VotingButton(notifier);
    });
  }
}

/// Styling for color voting buttons
class VotingButton extends StatelessWidget {
  VotingButton(this.votes);
  final VoteNotifier votes;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: votes.color,
      child: Text('${votes.value}', style: buttonTextStyle),
      onPressed: () => votes.vote(),
    );
  }
}
