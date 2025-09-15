import 'package:flutter/material.dart';

class PageViewDifferentPages extends StatefulWidget {
  const PageViewDifferentPages({super.key});

  @override
  State<PageViewDifferentPages> createState() => _PageViewDifferentPagesState();
}

class _PageViewDifferentPagesState extends State<PageViewDifferentPages> {
  final PageController _controller = PageController();
  int currentPage = 0;

  // 👇 yahan alag alag pages banaye
  final List<Widget> pages = [
    Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          "Welcome to My App 👋",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          "Here you can learn Flutter 🚀",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
    Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          "Get Started Today! 🎉",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView with Different Pages")),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return pages[index]; // 👈 har page alag widget hai
              },
            ),
          ),
          // page indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
