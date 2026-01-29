import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: FutureBuilder(
        future:  ApiService().getProducts(),
       builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
       print(snapshot.error); 
  return Center(
    child: Text('Error: ${snapshot.error}'),
  );
}

    
    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No products found'));
    }
         return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(snapshot.data![index].thumbnail, width: 50),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text('\$${snapshot.data![index].price}'),
            );
          },
         );
       },
       ),
    );
  }
}