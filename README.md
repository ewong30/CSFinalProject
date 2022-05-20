Group name: Wallcrashers
Members: Kate Alvarez and Ethan Wong

Brief Project description (1 paragraph summary). [Put this in your repo's README also]

  We want to recreate Fireboy and Watergirl in Processing. The original Fireboy and Watergirl game involves two players working together to escape a room. In our version, Fireboy and Watergirl will be different objects that move using WASD and arrow keys, respectively. Each character will be programmed under a Character class, which has a jump feature and a die feature. We will have puzzles and platforms as well as pools of lava/water that can kill either one/both, a “death” screen, and a “level completed” screen. With extra time, this puzzle aspect will include levers and buttons that open doors and with time, it will have easy, medium, and hard levels. Additionally, we could create add-ons like power ups and different additions to the puzzles like push-able boxes.

Expanded Description:

Critical features (Minimum Viable Product):

	We want our minimum viable product to have three completed levels. Within these levels, each character (fireboy and watergirl) will have a basic design and will be able to move left and right and jump. There should be some platforms for the characters to jump on to act like a platformer as well as a door that signals the completion of a level. Once both characters enter the door, a dropdown screen should appear, saying “LEVEL COMPLETED.” This will also have buttons to go back to the main menu or retry. The game should have a dark green brick wall and should be distinct from the light green platforms. We also wanted to add in gems to collect that will help to calculate a “score” for that level.

Nice to have features:

	Some features that would be nice to have are a variety of obstacles. The most important obstacles are pools of lava and water, which kill Waterboy and Firegirl, respectively. Other obstacles are buttons and levers that can open barriers and manipulate the map to create a puzzle element to the game, and even a time limit on the level (or a time counter to make a high score counter). These would also require screens for “YOU DIED” and “TIMER EXPIRED.” Visually, we want to have different walking and jumping designs for the characters so that the characters look more refined and realistic, and we also wanted to add in animations, so that the characters could swap between three sprites to make it look a bit more dynamic.

Outline of how you intend to design your project and how methods/classes will fit together:

	To start, we considered placing all of these functions inside of processing, where the main tab “game.pde” would call on other tabs. We broke these up into “background,” “character,” “platforms,” and “obstacles.” In the background methods, we will include the border design, the plants and back wall, as well as decorations into a setup and draw feature to fit different ‘map’ settings. This will also contain a “you died” and “level finished” dropdown that will darken the screen and show the popup for the respective outcome.
	As for the “character” tab, this would be what Fireboy and Watergirl are—they will most likely be different tabs, due to the difference in their properties, however both of them would have a jump method that sends them up and doesn’t let them jump again unless they’re touching the floor. We also would need to add a death sound, as well as a moving command that is either associated with keydown tests. This motion also apparently has a very slight acceleration factor in the game, which we will try to simulate as well. We will also need to apply gravity to them.
	For the platforms, the idea was to use these objects as a way to detect if Fireboy and Watergirl are currently standing on the floor. This would stop downwards movement to prevent falling through the floor, and also allows for us to make this more of a platformer as fireboy and watergirl ascends in most levels. We will also most likely add a ‘move’ function for moving platforms of this type.
	Finally, for the obstacles, our first conclusion was to make and design a display for the pools of water and lava, which don’t collide with fireboy and watergirl but do kill their respective counterparts. We also wanted to try to include levers and buttons, that will connect to a door object and can collide with the character. With time, we also wanted to add things like boxes, gems, and other obstacles that you can find in the fireboy and watergirl games. To follow the physics of fireboy and watergirl, we could also make some of these give resistance to movement until a certain amount of velocity or weight is put onto the button.

UML Diagram:
https://lucid.app/lucidchart/62595c03-9842-4ee0-bf49-40cb249def50/edit?invitationId=inv_53d0df63-a152-4eed-b2ab-93f281f96b59

Development Phases/Stages
Proof of Concept
- Character design and movement
◦ Each character looking to the side
◦ Make characters move across the floor
◦ Gravity
◦ Make characters jump (not affected by holding down a key)
- Platforms
◦ Draw method that creates the rectangle
◦ Method that acts as a barrier

Minimum Viable Project

- Ending
◦ Door method in obstacle class
◦ LEVEL COMPLETED and YOU DIED in pop-up class
◦ Movement and reactions triggered by an in-game action
◦ Three levels designed and complete

Final Goal

- Better graphics
◦ More detailed background
◦ More detailed door design
◦ Walking and jumping animations
◦ Timer at the top
- Pools of water/lava
◦ Pools method in obstacle class
- Death
◦ YOU DIED in pop-up class
- Animate pop-ups in game
- Obstacles + Items
	◦ Boxes and buttons
	◦ Other obstacles from the game
	◦ gems to calculate score


Images
(Please see physical copy)
