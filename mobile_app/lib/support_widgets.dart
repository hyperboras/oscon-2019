import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fireworks/fireworks.dart';

class BasicImageButton extends StatelessWidget {
  BasicImageButton(
      {this.fontSize: 30,
      this.fontColor = Colors.black,
      this.background,
      this.text,
      this.onPressed,
      this.animation});
  final Color fontColor;
  final double fontSize;
  final VoidCallback onPressed;
  final String text;
  final Widget background;
  final Widget animation;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          background,
          Text(text,
              style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize)),
          animation ?? Container(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              onLongPress: onPressed,
            ),
          )
        ],
      ),
    );
  }
}

class BasicButton extends StatelessWidget {
  BasicButton(
      {this.fontSize: 30,
      this.fontColor = Colors.black,
      this.backgroundColor,
      this.onPressed,
      this.body});
  final Color fontColor;
  final Color backgroundColor;
  final double fontSize;
  final VoidCallback onPressed;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        onLongPress: onPressed,
        child: Center(
          child: body,
        ),
      ),
    );
  }
}

class RainbowButton extends StatelessWidget {
  RainbowButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BasicImageButton(
      fontColor: Colors.grey[800],
      background: Image.asset('assets/diagonal_rainbow_gradient.jpg',
          fit: BoxFit.fill, height: 400),
      onPressed: onPressed,
      text: text,
    );
  }
}

class SparkleButton extends StatelessWidget {
  SparkleButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    var sparkleStar = SpinKitPulse(
      itemBuilder: (_, __) => Icon(Icons.star, color: Colors.white),
    );

    return BasicImageButton(
      fontColor: Colors.white,
      background: Opacity(
          opacity: .7,
          child: Image.asset('assets/snow_sparkle.jpg',
              fit: BoxFit.fill, height: 400)),
      onPressed: onPressed,
      text: text,
      animation: Fireworks.only(
        numberOfExplosions: 16,
        child: sparkleStar,
        maxHeight: 200,
        maxWidth: 200,
      ),
    );
  }
}

class TwinkleButton extends StatelessWidget {
  TwinkleButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    // var twinkleAnimation = SpinKitFadingFour(
    //   itemBuilder: (_, __) => Icon(FontAwesomeIcons.solidCircle, size: 10),
    // );
    return BasicImageButton(
      fontColor: Colors.black,
      background: Opacity(
          opacity: .5,
          child: Image.asset(
            'assets/colorful_lights.jpg',
            fit: BoxFit.cover,
            height: 400,
          )),
      onPressed: onPressed,
      text: text,
    );
  }
}

// Note: the kerning will not be quite like normal text, alas!
/*class SpellOut extends StatefulWidget {
  SpellOut({this.text, this.duration})
      : characters = List.generate(text.length,
            (i) => AnimatedOpacity(opacity: 0, child: Text(text[i])));
  final String text;
  final Duration duration;
  final List<Text> characters;

  @override
  _SpellOutState createState() => _SpellOutState();
}

class _SpellOutState extends State<SpellOut> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      // TODO: key
      child: Text(widget.text),
    );
  }
}

class Character extends StatefulWidget {
  Character(this.character);
  String character;
  double _opacity = 0;
  makeVisible() => _opacity = 1;
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration ,
        opacity: widget._opacity, child: Text(widget.character));
  }
}*/
// TODO
/*class AnimatedGradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}*/

class ColorFillButton extends StatelessWidget {
  ColorFillButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BasicButton(
        onPressed: onPressed,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey[600], Colors.grey[800]])),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}

class ShimmerButton extends StatelessWidget {
  ShimmerButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BasicButton(
      onPressed: onPressed,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[600], Colors.grey[800]])),
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.yellow[100],
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MeteorButton extends StatelessWidget {
  MeteorButton({this.onPressed, this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BasicButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xff8162f4),
      body: Stack(
        children: <Widget>[
          Positioned(bottom: 1, left: 20, child: Meteor(size: Size(20, 5))),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

// Code adjusted from https://github.com/nhancv/nc_flutter_util/
class Meteor extends StatefulWidget {
  final Size size;

  Meteor({Key key, @required this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MeteorState();
  }
}

class _MeteorState extends State<Meteor> with TickerProviderStateMixin {
  AnimationController animationController;
  final particleSystem = <Particle>[];

  @override
  void initState() {
    super.initState();

    //Generate particles
    List.generate(100, (i) {
      particleSystem.add(Particle(widget.size));
    });

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            for (int i = 0; i < particleSystem.length; i++) {
              // Move particle
              particleSystem[i].move();

              // Restored particle
              if (particleSystem[i].remainingLife < 0 ||
                  particleSystem[i].radius < 0) {
                particleSystem[i] = Particle(widget.size);
              }
            }
          })
          ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => CustomPaint(
              size: widget.size,
              painter: _MeteorPainter(
                  Size(
                    widget.size.width,
                    widget.size.height,
                  ),
                  particleSystem),
            ),
      ),
    );
  }
}

class _MeteorPainter extends CustomPainter {
  final List<Particle> particleSystem;
  final Size size;

  _MeteorPainter(this.size, this.particleSystem);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particleSystem) {
      particle.display(canvas);
    }
  }

  @override
  bool shouldRepaint(_MeteorPainter oldDelegate) => true;
}

class Particle {
  Offset speed;
  Offset location;
  double radius;
  double life;
  Color color;
  double opacity;

  double remainingLife;
  Size screenSize;
  var palette = <Color>[];

  Particle(Size screenSize) {
    Random rd = Random();

    this.screenSize = screenSize;
    this.speed = Offset(5 + rd.nextDouble() * 10, -15.0 + rd.nextDouble() * 10);
    this.location =
        Offset(this.screenSize.width / 2, this.screenSize.height / 3 * 2);
    this.radius = 1 + rd.nextDouble() * 13;
    this.life = 20 + rd.nextDouble() * 10;
    this.remainingLife = this.life;

    for (int i = 70; i < 100; i++) {
      palette.add(HSLColor.fromAHSL(1.0, 253, .26, i / 100).toColor());
    }

    this.color = palette[0];
  }

  move() {
    this.remainingLife--;
    this.radius--;
    this.location = this.location + this.speed;
    int colorI = palette.length -
        (this.remainingLife / this.life * palette.length).round();
    if (colorI >= 0 && colorI < palette.length) {
      this.color = palette[colorI];
    }
  }

  display(Canvas canvas) {
    this.opacity = (this.remainingLife / this.life * 100).round() / 100;
    var gradient = RadialGradient(
      colors: [
        Color.fromRGBO(
            this.color.red, this.color.green, this.color.blue, this.opacity),
        Color.fromRGBO(
            this.color.red, this.color.green, this.color.blue, this.opacity),
        Color.fromRGBO(this.color.red, this.color.green, this.color.blue, 0.0)
      ],
      stops: [0.0, 0.5, 1.0],
    );

    Paint painter = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(
          Rect.fromCircle(center: this.location, radius: this.radius));

    canvas.drawCircle(this.location, this.radius, painter);
  }
}
