import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:presentation/utils/extentions/my_extentions.dart';

import '../utils/base/BasePage.dart';

class ThankYouPage extends BasePageScreen {
  final String imageUrl;
  final String nameDevice;

  const ThankYouPage({Key? key, required this.imageUrl, required this.nameDevice}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends BasePageScreenState<ThankYouPage> {
  final confetti = ConfettiController();

  @override
  void initState() {
    super.initState();
    _setConfetti();
  }

  _setConfetti() async {
    confetti.play();
    await Future.delayed(Duration(seconds: 2));
    confetti.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          body: _buildContent(),
        ),
        ConfettiWidget(
          confettiController: confetti,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          gravity: 0.3,
          numberOfParticles: 50,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildThankYouText(),
          _buildProductImage(),
          _buildProductName(),
          _buildBackButton(),
        ],
      ),
    );
  }

  Widget _buildThankYouText() {
    return Text(
      "Cпасибо за покупку!",
      style: MyTextStyle.titleStyle(textSize: 24),
    );
  }

  Widget _buildProductImage() {
    return Image.network(
      widget.imageUrl,
      height: 400,
    );
  }

  Widget _buildProductName() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        widget.nameDevice,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Назад',
          style: MyTextStyle.titleStyle(color: Colors.white),
        ),
        style: MyElevatedStyle.blackButtonStyle(),
      ),
    );
  }

  @override
  void dispose() {
    confetti.dispose();
    super.dispose();
  }
}
