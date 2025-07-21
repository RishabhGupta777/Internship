import 'package:flutter/material.dart';

class Task2Screen extends StatelessWidget {
  final products = List.generate(6, (index) => {
    "title": "Product ${index + 1}",
    "price": "\$${(index + 1) * 10}",
    "image": "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcThVI3Fq_78K1NXzX098JrVdMssZqALyrTBLAIaEyo2W2Inyd4TyS5hTQByrcVOzo7df9Li2oYlYx4QvM5qY-47s5168PcPmO3FKcUOxLunHsOzkw9cNZvr0_3E1hoW4PF34BkrxIY&usqp=CAc"
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(products[index]['image']!, height: 80),
              SizedBox(height: 10),
              Text(products[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(products[index]['price']!),
            ],
          ),
        ),
      ),
    );
  }
}
