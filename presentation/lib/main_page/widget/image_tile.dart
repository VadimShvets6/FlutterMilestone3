import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  CustomListTile({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: _buildLeadingImage(),
        title: _buildTitle(),
        subtitle: _buildIcons(),
      ),
    );
  }

  Widget _buildLeadingImage() {
    return Container(
      child: Image.network(
        imageUrl,
        width: 60,
        fit: BoxFit.fitHeight,
      ),
      height: double.infinity,
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildIcons() {
    return Row(
      children: [
        _buildFavoriteIcon(),
        SizedBox(width: 8),
        _buildShoppingCartIcon(),
      ],
    );
  }

  Widget _buildFavoriteIcon() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.favorite, color: Colors.red),
        onPressed: () {},
      ),
    );
  }

  Widget _buildShoppingCartIcon() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.blue),
        onPressed: () {},
      ),
    );
  }
}
