def fake_category
  [
    'Action',
    'Adventure',
    'Biography',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
  ]
end

def avatar_emails
  [
    'ben@ben.com',
    'david@hey.com',
    'adrian@adrianthedev.com',
    'david@ideasmen.com.au'
  ]
end


def email_domain
  [
    'gmail.com',
    'outlook.com',
    'yahoo.com',
    'hotmail.com',
    'aol.com',
    'mail.com',
  ].sample
end

def common_names
  [
    'Ben',
    'John',
    'James',
    'Robert',
    'Michael',
    'William',
    'Mary',
    'Patricia',
    'Linda',
    'Barbara',
    'Elizabeth',
    'Jennifer',
    'Maria',
    'Susan',
  ]
end

def fake_title
  [
    'Fundamentals of Wavelets',
    'Data Smart',
    'God Created the Integers',
    'Superfreakonomics',
    'Orientalism',
    'Nature of Statistical Learning Theory',
    'Integration of the Indian States',
    'Image Processing & Mathematical Morphology',
    'How to Think Like Sherlock Holmes',
    'Data Scientists at Work',
    'Slaughterhouse Five',
    'Birth of a Theorem',
    'Structure & Interpretation of Computer Programs',
    'Age of Wrath',
    'Trial',
    'Data Mining Handbook',
    'New Machiavelli',
    'Physics & Philosophy',
    'Making Software',
    'Analysis',
    'Machine Learning for Hackers',
    'Signal and the Noise',
    'Python for Data Analysis',
    'Introduction to Algorithms',
    'Beautiful and the Damned',
    'Outsider',
    'Complete Sherlock Holmes',
    'Complete Sherlock Holmes',
    'Wealth of Nations',
    'Pillars of the Earth',
    'Mein Kampf',
    'Tao of Physics',
    'Farewell to Arms',
    'Veteran',
    'False Impressions',
    'Last Lecture',
    'Return of the Primitive',
    'Jurassic Park',
    'Russian Journal',
    'Tales of Mystery and Imagination',
    'Freakonomics',
    'Hidden Connections',
    'Story of Philosophy',
    'Asami Asami',
    'Journal of a Novel',
    'Once There Was a War',
    'Moon is Down',
    'Brethren',
    'In a Free State',
    'Catch 22',
    'Complete Mastermind',
    'Dylan on Dylan',
    'Soft Computing & Intelligent Systems',
    'Textbook of Economic Theory',
    'Econometric Analysis',
    'Learning OpenCV',
    'Data Structures Using C & C++',
    'Computer Vision',
    'Principles of Communication Systems',
    'Let Us C',
    'Amulet of Samarkand',
    'Crime and Punishment',
    'Angels & Demons',
    'Argumentative Indian',
    'Sea of Poppies',
    'Idea of Justice',
    'Raisin in the Sun',
    'Prisoner of Birth',
    'Scoop!',
    'Ahe Manohar Tari',
    'Last Mughal',
    'Social Choice & Welfare',
    'Radiowaril Bhashane & Shrutika',
    'Gun Gayin Awadi',
    'Aghal Paghal',
    'Beyond Degrees',
    'Manasa',
    'India from Midnight to Milennium',
    'Great Indian Novel',
    'O Jerusalem!',
    'City of Joy',
    'Freedom at Midnight',
    'Winter of Our Discontent',
    'On Education',
    'Free Will',
    'Bookless in Baghdad',
    'Case of the Lame Canary',
    'Theory of Everything',
    'New Markets & Other Essays',
    'Electric Universe',
    'Hunchback of Notre Dame',
    'Burning Bright',
    'Age of Discontuinity'
  ].sample
end

User.find_or_create_by(email: "admin@admin.com") do |user|
  user.name = 'Admin'
  user.password = 'password'
  user.role = :admin
end

common_names.each do |first_name|
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: first_name.downcase, domain: email_domain)
  User.create!(name: "#{first_name} #{last_name}", email: email, password: 'password', role: :user)
end

avatar_emails.each do |email|
  first_name = email.split('@').first
  last_name = Faker::Name.last_name
  User.create!(name: "#{first_name} #{last_name}", email: email, password: 'password', role: :user)
end
# bio: Faker::Lorem.words(number: 5).join(' ')

fake_category.each do |category|
  Category.create!(title: category, description: Faker::Lorem.sentence)
end

40.times do
  Post.create!(title: fake_title,
                    content: Faker::Lorem.sentences(number: 5).join('<br />'),
                    published: Faker::Boolean.boolean(true_ratio: 0.6),
                    category: Category.all.sample,
                    user: User.all.sample)
end

# 200.times do
#   Product.create!(
#     name: Faker::Name.name,
#     quantity: Faker::Number.number(digits: 2),
#     price: Faker::Number.decimal(l_digits: 4),
#     author: Author.all.sample
#   )
# end
