# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do | blog |
  Blog.create!(
  title: "Sample Blog Post #{blog+1}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras posuere maximus libero sit amet scelerisque.
           Etiam molestie in ante vitae faucibus. Fusce in mi diam. Etiam pulvinar tellus egestas, maximus diam a,
           elementum turpis. Etiam in purus lacinia, euismod risus commodo, porta turpis. In sodales malesuada est non
           consequat. Phasellus urna felis, ultrices id dictum in, suscipit vitae est. Etiam sagittis elementum mi et
           ultrices.

          Phasellus lobortis tortor et nunc rutrum, quis aliquam nulla cursus. Ut commodo ligula nec tincidunt suscipit.
          Vestibulum eget ex leo. Nulla quis quam sollicitudin, maximus elit vitae, vulputate erat. Curabitur mollis est
          id est semper."
  )
end

puts "3 blog posts created."

skills = [
  { title: 'Ruby on Rails', percent: 75 },
  { title: 'Javascript', percent: 75 },
  { title: 'Typescript', percent: 20 },
  { title: 'Angular', percent: 15 },
  { title: 'React', percent: 5 },
  { title: 'HTML', percent: 5 }
]
skills.map do |skill|
  Skill.create!(title: skill[:title], percent_utilized: skill[:percent])
end

puts "6 skills created"

6.times do |project|
  Project.create!(
    title: "Sample Project #{project+1}",
    subtitle: "Subtitle",
    body: "Phasellus lobortis tortor et nunc rutrum, quis aliquam nulla cursus. Ut commodo ligula nec tincidunt suscipit.
          Vestibulum eget ex leo. Nulla quis quam sollicitudin, maximus elit vitae, vulputate erat. Curabitur mollis est
          id est semper.",
    main_image: "https://dummyimage.com/600x400/e319e3/208fd4.png&text=Project+#{project+1}",
    thumb_image: "https://dummyimage.com/300x200/e319e3/208fd4.png&text=Project+#{project+1}"
  )
end

puts "6 projects created."
