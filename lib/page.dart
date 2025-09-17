import 'package:flutter/material.dart';

class Pagee extends StatelessWidget {
  Pagee({super.key});

  final PageController controller = PageController();
  final List<String> text = ['Page 1', 'Page 2', 'Page 3'];
  final List<Color> colors = [Colors.red, Colors.amber, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageView.builder Example")),
      body: PageView.builder(
        controller: controller,
        itemCount: text.length,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            child: Center(
              child: index == text.length - 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text[index], // text bhi show hoga
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text("Go to Home"),
                        ),
                      ],
                    )
                  : Text(
                      text[index],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: const Center(
        child: Text(
          "Welcome to Home Page 🎉",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
