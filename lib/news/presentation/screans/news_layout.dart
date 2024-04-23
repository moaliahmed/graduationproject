import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/news/presentation/screans/web_view.dart';

import '../controller/news_cubit.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['All', 'Crypto', 'gold', 'stocks'];
    return BlocProvider(
      create: (context) => NewsCubit()..getAllNews()..getGoldNews()..getStocksNews()..getCryptoNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return DefaultTabController(
            initialIndex: 0,
            length: tabs.length,
            child: Scaffold(
              extendBodyBehindAppBar: false,
              body: ListView(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.black,
                    tabs: tabs
                        .map((e) => Tab(
                                icon: Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )))
                        .toList(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        ItemCard(item: cubit.allNews),
                        ItemCard(item: cubit.cryptoNews),
                        ItemCard(item: cubit.goldNews),
                        ItemCard(item: cubit.stocksNews),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  final EdgeInsets? padding;

  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  const ImageContainer({
    super.key,
    this.height = 120,
    this.borderRadius = 20,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      child: child,
    );
  }
}

class ItemCard extends StatelessWidget {
  final List item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewPage(apiUrl: item[index]['url']),
              )),
          child: Row(
            children: [
              ImageContainer(
                width: 80,
                height: 80,
                imageUrl: item[index]['urlToImage'] ??
                    'https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/74da74505d42cc8690edf4c4ec7d55db.jpg',
                margin: const EdgeInsets.all(10),
                borderRadius: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item[index]['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                              '${DateTime.now().difference(DateTime.parse(item[index]['publishedAt'] ?? '2024-02-18T16:08:11Z')).inDays} hours ago'),
                        Expanded(child: Text('${item[index]['source']['name']}',textAlign: TextAlign.end,))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: item.length,
    );
  }
}
