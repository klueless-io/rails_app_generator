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

60.times do
  Author.create!(name: Faker::Name.name, bio: Faker::Lorem.words(number: 5).join(' '), email: Faker::Internet.email)
end

fake_category.each do |category|
  Category.create!(title: category, description: Faker::Lorem.sentence)
end

100.times do |i|
  Post.create!(title: fake_title,
                    content: "This is the body of post #{i}",
                    published: Faker::Boolean.boolean(true_ratio: 0.6),
                    author: Author.all.sample)
end

200.times do
  Product.create!(
    name: Faker::Name.name,
    quantity: Faker::Number.number(digits: 2),
    price: Faker::Number.decimal(l_digits: 4)
  )
end
