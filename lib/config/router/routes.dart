enum Routes{
  cvGeneratotPage( name: 'cv_generator', routePath: '/cv_generator' ),
  configurations( name: 'configurations', routePath: '/configurations' );

  final String routePath;
  final String name;
  const Routes({required this.routePath, required this.name});

}