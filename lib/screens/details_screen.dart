import 'package:flutter/material.dart';
import 'package:recipe_book_app/main.dart';
import '../models/recipe.dart';

class DetailsScreen extends StatefulWidget {
  final Recipe recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _fadeAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.oliveGreen,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'recipe_image_${recipe.name}',
                child: Image.asset(
                  recipe.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnim,
                  child: SlideTransition(
                    position: _slideAnim,
                    child: child,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.espresso,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                    ),
                    const SizedBox(height: 24),
                    _Section(
                      title: 'Ingredients',
                      icon: Icons.restaurant,
                      color: AppColors.terracotta,
                      children: recipe.ingredients
                          .map((i) => _IngredientItem(text: i))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                    _Section(
                      title: 'Instructions',
                      icon: Icons.menu_book,
                      color: AppColors.oliveGreen,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.warmWhite,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.terracotta.withValues(alpha: 0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          recipe.instructions,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.espresso,
                                height: 1.6,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget>? children;
  final Widget? child;

  const _Section({
    required this.title,
    required this.icon,
    required this.color,
    this.children,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (children != null)
          ...children!
        else if (child != null)
          child!,
      ],
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final String text;

  const _IngredientItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.terracotta,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.espresso,
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
