import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/widgets/cache_network_image_adaptive.dart';
import 'package:vshop/screens/search/search_page.dart';

import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    return Hero(
      tag: widget.product.id,
      child: InkWell(
        onTap: () {
          context.push('/detail', extra: widget.product);
          SearchPage.addToRecentViewList(widget.product);
        },
        borderRadius: defaultBorderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.7,
              child: CacheNetworkImageAdaptive(
                imageUrl: "${widget.product.images?.first['imagesUrl'][0]}",
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.product.name}',
                    style: textStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "${widget.product.price}",
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
