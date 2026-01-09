class ProjectModel {
  final String projectTitle;
  final String projectDescription;
  final List<String> projectStack;
  final List<String> projectImage;
  final String? projectLink;
  final String? storeLink;
  ProjectModel({
    required this.projectTitle,
    required this.projectDescription,
    required this.projectStack,
    required this.projectImage,
    this.projectLink = '',
    this.storeLink = '',
  });
}
