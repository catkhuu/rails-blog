# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

hamilton = User.create(username: 'treasurer', email: 'alexhamilton@example.com', password: 'Password1!')
burr = User.create(username: 'burrSir', email: 'aaronburr@example.com', password: 'Password1!')
lafayette = User.create(username: 'ouiLafayette', email: 'lafayette@example.com', password: 'Password1!')


election = Post.create(title: "What is wrong with this country's voters?!?!", content: "Watching the fallout from this year's election is rough. It's like...the saga continues...part I, II, III, IV and until infinity.", user: lafayette)
hillary = Post.create(title: "Seeing Hillary being OK makes me feel better", content: "That picture of HRC walking her dog in upstate NY post-election brings me some peace of mind. She is being strong and has moved on.", user: hamilton)

Comment.create(body: 'I like this. Kind words are what we need right now. 👍🏼', post: hillary, user_id: 2)
Comment.create(body: 'As they say in France, "love trumps hate"...or something to that effect', post: hillary, user_id: 3)
