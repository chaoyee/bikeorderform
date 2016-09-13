# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Model.delete_all
Size.delete_all
Color.delete_all

Model.create([
    {name: "PINEROLO AL SE 0.2 TIG welded Sora 18 Carbon/Alloy Fork", price: 365.42},
    {name: "PINEROLO AL SE 0.4  TIG welded 105 22 speed Carbon Fork", price: 483.35},
    {name: "PINEROLO AL SE 0.3  TIG welded Tiagra 20 speed Carbon Fork", price: 401.46},
    {name: "PINEROLO AL SE 0.2  TIG welded Sora 18 Carbon/Alloy Fork", price: 365.42},
    {name: "PINEROLO AL SE 0.1  TIG welded Claris 16 Carbon/Alloy Fork", price: 287.68}
  ])

Size.create([
    {name: "700C x 44cm" },
    {name: "700C x 46cm" },
    {name: "700C x 47cm" },
    {name: "700C x 48cm" },
    {name: "700C x 49cm" },
    {name: "700C x 50cm" },
    {name: "700C x 51cm" },
    {name: "700C x 51.5cm" },
    {name: "700C x 52cm" },
    {name: "700C x 52.5cm" },
    {name: "700C x 53cm" },
    {name: "700C x 54cm" },
    {name: "700C x 54.5cm" },
    {name: "700C x 55cm" },
    {name: "700C x 56cm" },
    {name: "700C x 56.5cm" },
    {name: "700C x 58cm" },
    {name: "700C x 59cm" },
    {name: "700C x 60cm" }
  ])
Color.create([
    {name: "Gloss Black" },
    {name: "Gloss Sky Blue" },
    {name: "Gloss Red" },
    {name: "Gloss White" },
    {name: "Gloss White/Black/Red" },
    {name: "Black/Blue " },
    {name: "Black/Neon Green" },
    {name: "Black/White" },
    {name: "Black/Red" },
    {name: "Neon Green" },
    {name: "Gray" },
    {name: "Silver" },
    {name: "Matt Black / Gloss Black" },
    {name: "Black-Gray" },
    {name: "Red" },
    {name: "Black-Blue" },
    {name: "Black-Blue" }
  ])
























