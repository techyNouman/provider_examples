import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_count/provider/favorite_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites Example"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 100, itemBuilder: (ctx, index) {
              return 
                Consumer<FavoriteProvider>(builder: (ctx, value, child){
                  return ListTile(
                    onTap: (){
                      if( value.selectedItem.contains(index)){
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }
                    },
                    title: Text("Item $index"),
                    trailing: value.selectedItem.contains(index) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
                  );
                });

            }),
          )
        ],
      ),
    );
  }
}
