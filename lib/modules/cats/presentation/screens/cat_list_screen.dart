import 'package:catbreeds/modules/cats/presentation/fragments/cat_card_fragment.dart';
import 'package:catbreeds/modules/cats/presentation/models/cat_list_model.dart';
import 'package:catbreeds/modules/cats/presentation/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CatListScreen extends ConsumerStatefulWidget {
  const CatListScreen({super.key});

  @override
  CatListScreenState createState() => CatListScreenState();
}

class CatListScreenState extends ConsumerState<CatListScreen> {
  final scrollController = ScrollController();

  void _setupScrollListener() {
    scrollController.addListener(() async {
      final provider = ref.read(catListProvider);
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent &&
          provider.hasMoreItems &&
          !provider.isLoading) {
        await ref.read(catListProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _setupScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    final catListState = ref.watch(catListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catsbreeds'),
      ),
      body: Column(
        children: [
          _searchTextField(ref),
          Expanded(
            child: Stack(
              children: [
                catListState.catList.isEmpty
                    ? const Center(
                        child: Text(
                          'No results found',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    : _showCatListSection(ref, catListState),
                if (catListState.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _showCatListSection(WidgetRef ref, CatListModel catListState) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(catListProvider.notifier).refreshGroupList();
      },
      child: ListView.builder(
        controller: scrollController,
        itemCount: catListState.catList.length,
        itemBuilder: (context, index) {
          final cat = catListState.catList[index];
          return CatCardFragment(
            catData: cat,
            onTap: () {
              context.push('/cat-detail', extra: cat);
            },
          );
        },
      ),
    );
  }

  Widget _searchTextField(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
      child: TextField(
        onChanged: (value) {
          ref.read(catListProvider.notifier).searchCatByBreed(value);
        },
        decoration: InputDecoration(
          labelText: 'Search by breed',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
