import 'package:domain/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/thank_you_page/thank_you_page.dart';
import 'package:presentation/utils/extentions/my_extentions.dart';

import '../utils/base/BasePage.dart';
import 'controller/details_controller.dart';

class DetailsPage extends BasePageScreen {
  final int id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends BasePageScreenState<DetailsPage> {
  final DetailsPageController mainPageController = Get.put(DetailsPageController());

  @override
  void initState() {
    super.initState();
    mainPageController.getDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _buildWidget(mainPageController.details.value)),
      ),
    );
  }

  Widget _buildWidget(ImageModel? details) {
    if (details != null) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage(details.imageUrl),
            _buildTitle(details.nameDevice),
            _buildDescription(details.description),
            _buildBuyButton(details.imageUrl, details.nameDevice),
          ],
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget _buildImage(String imageUrl) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        description,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildBuyButton(String image, String nameDevice) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, createRoute(ThankYouPage(imageUrl: image, nameDevice: nameDevice)));
        },
        child: Text('Купить', style: MyTextStyle.semiBoldStyle(14)),
        style: MyElevatedStyle.blackButtonStyle(),
      ),
    );
  }

  @override
  void dispose() {
    mainPageController.onClose();
    super.dispose();
  }
}
