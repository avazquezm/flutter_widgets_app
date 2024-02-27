import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'InfiniteScrollScreen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> _imagesIds = List.generate(10, (index) => index);
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent) {
        simulateLoadingImages();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreImages() {
    final lastId = _imagesIds.last;
    final newImagesIds = List.generate(10, (index) => lastId + index + 1);
    _imagesIds.addAll(newImagesIds);
  }

  void _moveScrollToBottom() {
    if (_scrollController.position.pixels + 150 <=
        _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(_scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  Future<void> simulateLoadingImages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    // Check if the widget is still mounted before updating the state (check after async operation)
    if (mounted) {
      setState(() {
        _loadMoreImages();
        _isLoading = false;
      });
    }

    _moveScrollToBottom();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    final lastImageId = _imagesIds.last;

    setState(() {
      _imagesIds.clear();
      _imagesIds.add(lastImageId);
      _loadMoreImages();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${_imagesIds[index]}/500/300',
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('Error loading image'),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: _isLoading
            ? const CircularProgressIndicator()
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
