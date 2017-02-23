# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Website")
Category.create(name: "Mobile")
Category.create(name: "Embedded")
Category.create(name: "Game")
Category.create(name: "Multi Platform")

Technique.create(skill: "Ruby on Rails")
Technique.create(skill: "PHP")
Technique.create(skill: "Java")
Technique.create(skill: "Android")
Technique.create(skill: "Pythod")
Technique.create(skill: "Javascript")
Technique.create(skill: "GitHub")
Technique.create(skill: "Design Pattern")
Technique.create(skill: "SQL")
Technique.create(skill: "Design")
Technique.create(skill: "IOS")
Technique.create(skill: "Unity")
Technique.create(skill: ".Net")

Certification.create(description: "For though result and talent add are parish valley.",
  name: "Agile")
Certification.create(description: "Cisco Certified Network Associate",
  name: "CCNA")
Certification.create(description: "Certified Information Systems Security Professional",
  name: "CISSP")
Certification.create(description: "Microsoft Certified Systems Engineer ",
  name: "MCSE")
Certification.create(description: "FTimed voice share led his widen noisy young",
  name: "CompTIA A+")

u = User.create(name: "Ky Huu Hai", email:"admin@gmail.com", user_name: "Admin",
  password: "password123", position: "PM",
  biography: "Rooms oh fully taken by worse do.Points afraid but may end law lasted.
   Was out laughter raptures returned outweigh.", phone: "01212129827")

u.add_role :admin

5.times do |e|
  TargetTechnique.create!(target_id: u.id, target_type: "User", technique_id: "#{e+1}")
  u.certificate_users.create!(user_id: u.id, certification_id: "#{e+1}")
end

30.times do |i|
  name  = "member #{i+1}"
  email = "user#{i+1}@gmail.com"
  user_name = "Username #{i+1}"
  password = "password123"
  position = "Developer"
  biography = "Rooms oh fully taken by worse do. Points afraid but may end law lasted.
  Was out laughter raptures returned outweigh."
  phone = "01212129827"

  u = User.create!(name:  name, email: email, password: password, position: position,
    biography: biography, user_name: user_name, phone: phone)

  5.times do |e|
    TargetTechnique.create!(target_id: u.id, target_type: "User", technique_id: "#{e+1}")
    u.certificate_users.create!(user_id: u.id, certification_id: "#{e+1}")
  end
end

Project.create!(name: "WSM", url: "http://wsm.framgia.vn/", description: "Managing timesheet, leave,... in a working space", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FPoll", url: "http://poll.framgia.vn/", description: "A simple poll system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id =1
p.save



Project.create!(name: "FOrder", url: "http://order.framgia.vn/", description: "Ordering foods, drinks, etc.... in a group/organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FSurvey", url: "Waiting update", description: "A simple survey system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FOrder- Android", url: "Waiting update", description: "A simple survey system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 2
p.save



Project.create!(name: "FPoll- Android", url: "Waiting update", description: "FPoll for Android", core_features: "Android", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Mobile", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 2
p.save

Project.create!(name: "CWSB", url: "Waiting update", description: "Co-working space booking system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FClub", url: "Waiting update", description: "Managing clubs in an organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FCafe", url: "Waiting update", description: "Publishing and managing coffee shops", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FDMS", url: "Waiting update", description: "Managing devices in an organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "CDTT", url: "Waiting update", description: "Publishing and managing Humanity projects", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FPortfolio", url: "http://poll.framgia.vn/", description: "Publishing portfolio of a group/organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "TMS", url: "http://education.framgia.vn/", description: "Training Management System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "iShipper", url: "http://ishipper.framgia.vn/", description: "Connect Shop and Shipper", core_features: "Android, Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FRSM", url: "Inprogress", description: "Framgia Recruitment System Management", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "MOS", url: "Inprogress", description: "Melody of Soul", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FStore", url: "Inprogress", description: "FStore providers online platform connecting consumers with store owner.", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "AC", url: "Inprogress", description: "Accounting System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "PMP", url: "Inprogress", description: "Project Management System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FEDS", url: "Inprogress", description: "Manage e-document system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save


Project.create!(name: "CRB", url: "Inprogress", description: "Calendar system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save


Project.create!(name: "CRB Android", url: "Inprogress", description: "Calendar system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save


Project.create!(name: "iMarket", url: "Inprogress", description: "Waiting update", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save


Project.create!(name: "FCSP", url: "Inprogress", description: "Framgia Code School Platform", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save


Project.create!(name: "FAsk", url: "Inprogress", description: "Online community for programmers to ask technical questions and share their knowledges", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save
