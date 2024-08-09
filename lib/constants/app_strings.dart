import '../core/models/certificates_model.dart';
import '../core/models/education_model.dart';
import '../core/models/experience_model.dart';

class Content {
  static String name = 'Olewuezi Marvellous';
  static String email = 'olewuezimarvellous@gmail.com';
  static String introduction =
      "I am a mobile app developer specializing in Flutter development. With an intermediate level of expertise, I've honed my skills in creating cross-platform mobile applications that run seamlessly on both iOS and Android devices. My passion for mobile technology and user-centric design drives me to continuously improve my Flutter proficiency and stay updated with the latest trends in app development.";
  static String introHeader = "Hi, I'm Olewuezi Marvellous";
  static String location = "Lagos,Nigeria";
  static String availability = 'Available for new projects';
  static String aboutMeIntro = 'Curious about me? Here you have it:';
  static String aboutMe =
      '''I'm Olewuezi Marvellous, a passionate and results-driven Mobile Developer based in Lagos, Nigeria. With a strong foundation in Computer Science and a keen interest in mobile application development, I specialize in creating innovative and user-friendly apps using Flutter and Dart.\n\nAs a recent graduate from Caleb University with a Bachelor's degree in Computer Science (CGPA: 4.04), I've honed my skills in various programming languages and technologies. My expertise spans Dart, Flutter, Java, Python, C++, and Firebase, allowing me to develop robust and efficient cross-platform mobile applications.\n\nI pride myself on writing clean, readable, and testable code. My approach to development is characterized by analytical thinking, problem-solving skills, and meticulous attention to detail. I thrive both independently and in team settings, always striving to apply the highest quality standards to create, grow, and maintain mobile app platforms.\n\nI have experience working with RESTful APIs. My knowledge extends to Android app development, and I'm well-versed in Firebase for backend solutions.\n\nContinuously eager to learn and grow, I've supplemented my formal education with various certifications from Google, including courses in Python, Cloud Computing, and Digital Marketing.\n\nI'm excited about the ever-evolving world of mobile technology and am committed to staying at the forefront of industry trends. My goal is to contribute my skills and passion to creating innovative mobile solutions that make a positive impact on users' lives.''';

// LINKS
  static final Uri cvLink = Uri.parse(
      'https://drive.google.com/file/d/17tkOyPl30fP3-muALqLrhkuSAEp2klhn/view?usp=drive_link');
  static final Uri githubLink = Uri.parse('https://github.com/Marvyoha');
  static final Uri linkedinLink =
      Uri.parse('https://www.linkedin.com/in/marvellous-olewuezi-9a9244321/');
  static final Uri emailLink = Uri.parse('olewuezimarvellous@gmail.com');

// CERTIFICATES
  static final Uri certDigitalMarketing = Uri.parse(
      'https://drive.google.com/file/d/1XN17s0A6ls3TU058xM4VM7nMBMkMJZIs/view?usp=drive_link');
  static final Uri certCrashCourseOnPython = Uri.parse(
      'https://drive.google.com/file/d/1Ts6FJ1y1C1Ej43LZFDWMT9pNfD1h6a9A/view?usp=drive_link');
  static final Uri certIntroToCloudComputing = Uri.parse(
      'https://drive.google.com/file/d/1b952OZ3yGAQJz5rpnAnDeviv_Omi6cS6/view?usp=drive_link');
  static final Uri certIntroToWebDev = Uri.parse(
      'https://drive.google.com/file/d/1XDZEADiB94Nr4zM3gpPYuUt8tRbJZ06u/view?usp=drive_link');
  static final Uri certUsingPythonToInteractWithOS = Uri.parse(
      'https://drive.google.com/file/d/1c5S3F_rr6sbxZLVLrId9qoEJIDed0p74/view?usp=drive_link');

// IMAGES
  static String profile = 'lib/assets/profile.webp';
  static String profile2 = 'lib/assets/profile2.webp';
  static String cmsLogo = 'lib/assets/cms_logo.webp';
  static String calebLogo = 'lib/assets/caleb_uni_logo.webp';
  static String googleLogo = 'lib/assets/google_logo.webp';
  static String ibmLogo = 'lib/assets/ibm_logo.webp';
  static String exolveTechLogo = 'lib/assets/exolve_tech_logo.webp';

  // QUALIFICATIONS CONTENT
  static List<EducationModel> educationList = [
    EducationModel(
        image: Content.calebLogo,
        degree:
            'Bachelor of Computer Science: College of Pure and Applied Sciences',
        school: 'Caleb University',
        timeRange: '2020 - 2024',
        location: 'Imota, Lagos, Nigeria'),
    EducationModel(
        image: Content.cmsLogo,
        degree: 'WASSCE',
        school: 'CMS Grammar School',
        timeRange: '2013 - 2019',
        location: 'Bariga, Lagos, Nigeria'),
  ];
  static List<ExperienceModel> experienceList = [
    ExperienceModel(
        image: Content.exolveTechLogo,
        jobTitle: 'Mobile App Developer Intern',
        jobDescription:
            '''• Collaborated with senior developers to design, develop, and
maintain mobile applications for both Android and iOS
platforms.
• Conducted thorough testing on new applications, identifying
and resolving bugs to improve app functionality and reliability.
• Assisted in the development of cross-platform solutions using
Flutter, enabling consistent user experiences across multiple
devices.
• Worked closely with the UX and UI design team to ensure app
designs were both attractive and intuitive for the end-user.''',
        timeRange: '05/2023 - 11/2023')
  ];
  static List<CertificatesModel> certificatesList = [
    CertificatesModel(
        issuedBy: 'Google',
        viewCredential: Content.certDigitalMarketing,
        image: Content.googleLogo,
        course: 'Introduction to Digital Marketing'),
    CertificatesModel(
        issuedBy: 'Google',
        viewCredential: Content.certCrashCourseOnPython,
        image: Content.googleLogo,
        course: 'Crash Course on Python'),
    CertificatesModel(
        issuedBy: 'Google',
        viewCredential: Content.certUsingPythonToInteractWithOS,
        image: Content.googleLogo,
        course: 'Python with the Operating System'),
    CertificatesModel(
        issuedBy: 'IBM',
        viewCredential: Content.certIntroToWebDev,
        image: Content.ibmLogo,
        course: 'Introduction to Web Development'),
    CertificatesModel(
        issuedBy: 'IBM',
        viewCredential: Content.certIntroToCloudComputing,
        image: Content.ibmLogo,
        course: 'Introduction to Cloud Computing'),
  ];
}
