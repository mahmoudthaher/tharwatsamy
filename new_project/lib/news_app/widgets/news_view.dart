import 'package:flutter/material.dart';
import 'package:new_project/news_app/models/article_model.dart';

class NewsViews extends StatelessWidget {
  const NewsViews({required this.articless, super.key});
  final Articless articless;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        articless.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  articless.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  'https://via.placeholder.com/300',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
        SizedBox(height: 7),
        Text(
          articless.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),
        articless.description != null
            ? Text(
                articless.description!,
                style: TextStyle(fontSize: 15, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : Text('Erro')
      ],
    );
  }
}
