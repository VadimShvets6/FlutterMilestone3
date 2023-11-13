import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/details_page/details_page.dart';
import 'package:presentation/main_page/controller/main_controller.dart';
import 'package:presentation/main_page/widget/image_tile.dart';

import '../utils/base/BasePage.dart';

class MyHomePage extends BasePageScreen {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends BasePageScreenState<MyHomePage> {
  final MainPageController mainPageController = Get.put(MainPageController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    mainPageController.getListImage(mainPageController.currentPage);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      mainPageController.getMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => _buildList()),
      ),
    );
  }

  Widget _buildList() {
    if (mainPageController.list.isNotEmpty && !mainPageController.loading) {
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              itemCount: mainPageController.list.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                if (index < mainPageController.list.length) {
                  final item = mainPageController.list[index];
                  return InkWell(
                    onTap: () => Navigator.push(context, createRoute(DetailsPage(id: item.id))),
                    child: CustomListTile(imageUrl: item.imageUrl, title: item.nameDevice, description: item.description),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  void dispose() {
    mainPageController.onClose();
    super.dispose();
  }
}
