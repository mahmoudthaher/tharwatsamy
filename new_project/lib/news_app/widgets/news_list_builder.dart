import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/news_app/block/news_bloc/news_bloc.dart';
import 'package:new_project/news_app/widgets/news_list.dart';

class ListNewsBuilder extends StatefulWidget {
  const ListNewsBuilder({super.key});

  @override
  State<ListNewsBuilder> createState() => _ListNewsBuilderState();
}

class _ListNewsBuilderState extends State<ListNewsBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetNews());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewsSuccess) {
          return NewsList(
              articless: BlocProvider.of<NewsBloc>(context).articless!);
        }
        return const SliverToBoxAdapter(
          child: Text('oops  was an error, try later'),
        );
      },
    );

    // FutureBuilder<List<Articless>>(
    //   future: future,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return SliverToBoxAdapter(
    //         child: Center(child: CircularProgressIndicator()),
    //       );
    //     } else if (snapshot.hasData) {
    //       return NewsList(articless: snapshot.data!);
    //     } else if (snapshot.hasError) {
    //       return const SliverToBoxAdapter(
    //         child: Text('oops  was an error, try later'),
    //       );
    //     }
    //     return SliverToBoxAdapter(
    //       child: Center(child: CircularProgressIndicator()),
    //     );
    //   },
    // );
  }
}
