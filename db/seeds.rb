# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

skill_names = [
  "Data structures and algorithms",
  "Integrated development environments (IDEs)",
  "Cloud computing",
  "Web development",
  "Containers",
  "Text editors",
  "Git",
  "Object-Oriented Design (OOD)",
  "Software Testing and Debugging",
  "Problem Solving and Logical Thinking",
  "Python",
  "C",
  "C++",
  "Java",
  "C#",
  "Visual Basic",
  "JavaScript",
  "SQL",
  "NoSQL",
  "Assembly",
  "PHP",
  "Swift",
  "Go",
  "R",
  "Classic Visual Basic",
  "MATLAB",
  "Ruby",
  "Delphi/Object Pascal",
  "Rust",
  "Perl",
  "Scratch",
  "(Visual) FoxPro",
  "SAS",
  "Objective-C",
  "Lua",
  "Kotlin",
  "Ada",
  "Fortran",
  "Lisp",
  "Julia",
  "Transact-SQL",
  "COBOL",
  "Scala",
  "F#",
  "Logo",
  "TypeScript",
  "Groovy",
  "Bash",
  "Dart",
  "RPG",
  "PL/SQL",
  "PowerShell",
  "Awk",
  "Prolog",
  "CFML",
  "Haskell",
  "D",
  "LabVIEW",
  "Scheme",
  "ABAP",
  "OCaml",
  "Communication (verbal and written)",
  "Teamwork and conflict resolution",
  "Problem solving",
  "Empathy",
  "Patience",
  "Curiosity",
  "Adaptability",
  "Accountability",
  "Time management",
]

interest_names = [
  "Reading",
  "Martial Arts",
  "Jewelry Making",
  "Woodworking",
  "Gardening",
  "Video Games",
  "Fishing",
  "Team Sports",
  "Walking",
  "Yoga",
  "Traveling",
  "Golf",
  "Watching Sports",
  "Playing Cards",
  "Board Games",
  "Eating Out",
  "Writing",
  "Running",
  "Tennis",
  "Volunteer Work",
  "Dancing",
  "Painting",
  "Cooking",
  "Bicycling",
  "Housework",
  "Movie Watching",
  "Genealogy",
  "Church Activities",
  "Calligraphy",
  "Podcasts",
  "Television",
  "Collecting",
  "Music",
  "Skiing & Snowboarding",
  "Shopping",
  "Socializing",
  "Quilting",
]

skill_names.each do |skill_name|
  unless Skill.where(name: skill_name).exists?
    Skill.create(name: skill_name)
  end
end

interest_names.each do |interest_name|
  unless Interest.where(name: interest_name).exists?
    Interest.create(name: interest_name)
  end
end

200.times do
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
  )

  random_skills = Skill.all.sample(5)
  random_interests = Interest.all.sample(2)

  user.skills = random_skills
  user.interests = random_interests
end
