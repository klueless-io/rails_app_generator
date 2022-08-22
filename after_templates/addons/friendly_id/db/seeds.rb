posts = [
  'can ruby on rails run on windows',
  'can ruby on rails be used for mobile apps',
  'does ruby on rails have a future',
  'what does ruby on rails do',
  'how does ruby on rails work',
  'what is rails ruby',
  'where ruby on rails',
  'what ruby on rails is used for',
  'where ruby on rails active record',
  'where ruby on rails performance',
  'which companies use ruby on rails',
  'what is ruby on rails developer',
  'who created ruby on rails',
  'what is ruby on rails good for',
  'is ruby on rails worth learning',
  'is ruby on rails hard to learn',
  'is ruby on rails backend or frontend',
  'is ruby on rails a programming language',
  'is ruby on rails easy to learn',
  'who uses ruby on rails',
  'who created ruby on rails',
  'is ruby rails dead',
  'what is rails ruby',
  'when to use ruby on rails',
  'why ruby on rails is good',
  'where ruby on rails is used',
  'where ruby on rails',
  'where ruby on rails active record',
  'where ruby on rails performance',
  'query where ruby on rails'
]

categories = [
  'ruby',
  'rails',
  'ruby on rails',
  'ror',
  'rails 7',
  'full stack',
  'web',
  'web app'
]

posts.each do |post|
  Post.create(title: post.capitalize, category: categories.sample, body: Faker::Lorem.paragraphs(number: 20).join(' '))
end
