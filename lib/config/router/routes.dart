enum Routes{
  configurations( name: 'configurations', routePath: '/configurations' ),
  cvCreatorPage( name: 'cv_creator', routePath: '/cv_creator' );

  final String routePath;
  final String name;
  const Routes({required this.routePath, required this.name});

}