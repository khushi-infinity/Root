# ROOTS
## Build. Grow. Together.

You are the principal game engineer, Flutter engineer, Serverpod engineer, technical artist, gameplay programmer, UI designer, QA engineer and release engineer for this project.

You are working inside an EXISTING Serverpod App Studio project.

DO NOT create a separate Flutter project.
DO NOT create another Serverpod project.
DO NOT replace the existing project architecture.
Inspect the current repository first and work inside it.

This is a HACKATHON BUILD.

TIME IS EXTREMELY LIMITED.

The goal is not to build a giant farming game.

The goal is to build one extremely polished, visually impressive, playable, persistent, real-time multiplayer 3D experience that can be demonstrated in under two minutes.

Take ownership of implementation decisions.

Do not stop after writing scaffolding.

Do not merely explain what needs to be done.

IMPLEMENT IT.

Run the application repeatedly.
Inspect logs.
Inspect browser output.
Fix compilation errors.
Fix runtime errors.
Test interactions.
Keep going until the Definition of Done at the bottom of this file is satisfied.

If something in this specification conflicts with the current APIs of Serverpod, Flutter, Dart or flutter_scene, inspect the installed agent skills and current official documentation and use the CURRENT supported API instead of inventing an API.

==================================================
1. PRODUCT
==================================================

PROJECT NAME:

ROOTS

TAGLINE:

Build. Grow. Together.

ROOTS is a visually high-fidelity 3D cooperative homestead-building and farming game.

The player begins with a beautiful but mostly untouched piece of countryside.

They can:

- explore the world
- prepare farmland
- plant crops
- water crops
- watch crops grow
- harvest crops
- gather basic resources
- place structures
- construct a farmhouse
- place fences
- place paths
- build a well
- upgrade the homestead
- gradually transform an empty landscape into a thriving farm

The important differentiator is that the world is PERSISTENT and SHARED.

Two browser windows connected to the same world must see each other's meaningful actions in real time through Serverpod.

Example:

Player A places a farmhouse.

Player B sees the farmhouse appear without refreshing.

Player B plants wheat.

Player A sees the crop appear.

Player A waters it.

Both clients see its state change.

The crop grows.

Both clients see the same growth stage.

One client harvests it.

The crop disappears or resets on both clients and the shared resources/world state update.

ROOTS should feel like the beginning of a real multiplayer farming game rather than a CRUD application with a 3D view.

==================================================
2. PRIMARY EXPERIENCE
==================================================

When the app opens, show a cinematic view of the farm.

Do NOT open on a dashboard.

The 3D world should occupy almost the entire screen.

The player should immediately see:

- realistic grassy terrain
- farmland area
- several trees
- rocks
- a river, pond or visible water feature
- atmospheric lighting
- a small initial homestead area
- crop plots
- environmental vegetation
- distant environmental dressing
- a sky/background environment

The camera should slowly move or breathe subtly before interaction so the world immediately feels alive.

The visual impression should be:

premium
warm
natural
peaceful
realistic
cinematic
high fidelity

Reference feeling:

modern cozy farming game
realistic architectural visualization
premium indie game
cinematic countryside
not a children's mobile game
not a generic dashboard
not Minecraft
not intentionally blocky
not low-poly unless used only as a fallback

The project should LOOK much more expensive than it actually is.

==================================================
3. VISUAL TARGET
==================================================

TARGET:

High-fidelity realistic / AAA-inspired presentation within the limitations of a web hackathon prototype.

Do not claim actual photorealism if the runtime cannot support it, but visually push the scene as far as reasonably possible.

Use flutter_scene.

The current flutter_scene ecosystem should be treated as the primary 3D engine.

Before implementation:

1. inspect the project's Flutter version
2. inspect the latest compatible flutter_scene version
3. install flutter_scene correctly
4. run its initialization/setup command if required
5. install/read its agent skills if available
6. verify a minimal scene renders successfully
7. only then build the full environment

Do not guess old flutter_scene APIs.

Use the current agent skills/documentation.

PRIMARY TARGET:

Flutter Web / Chrome

Secondary:

native support may remain available, but do not sacrifice the web demo for native functionality.

==================================================
4. GRAPHICS
==================================================

Use as many of the following as are reliably supported by the current flutter_scene version:

- physically based rendering
- PBR materials
- image-based lighting
- directional sunlight
- realistic soft shadows
- ambient/environment lighting
- realistic roughness
- normal maps
- subtle atmospheric fog
- subtle bloom
- depth of field only if it looks correct
- color grading if supported
- realistic water
- sky/environment lighting
- environmental reflections
- particles
- gentle wind motion
- subtle foliage movement
- high quality anti-aliasing
- soft contact shadows
- tasteful post-processing

Do NOT enable effects merely because they exist.

The world must remain readable and performant.

Avoid excessive bloom.
Avoid cyberpunk colors.
Avoid neon.
Avoid over-saturation.

Natural palette:

grass greens
earth browns
warm wooden structures
stone greys
golden sunlight
blue water
warm sunset
soft nighttime blue

==================================================
5. ASSETS
==================================================

Prefer quality over quantity.

If internet access is available, you may research and obtain a SMALL number of lightweight, legally reusable assets.

Strongly prefer:

- CC0
- public domain
- clearly permissive assets

Possible categories:

- grass/ground PBR texture
- dirt/soil PBR texture
- wood PBR texture
- stone PBR texture
- roof texture
- one HDRI/environment map
- a few high-quality trees
- rocks
- basic farmhouse assets

Do not spend significant hackathon time browsing for assets.

HARD RULE:

Asset hunting must not block development.

If external assets cannot be obtained quickly or their licensing is unclear, create acceptable geometry procedurally.

Record every external asset and its source/license inside:

ATTRIBUTIONS.md

Do not use an asset with uncertain licensing.

Keep assets reasonably small so Flutter web loading remains practical.

Prefer compressed textures and sensible resolutions.

Do not download hundreds of megabytes of unnecessary content.

==================================================
6. ENVIRONMENT
==================================================

Build ONE beautiful farm environment.

Do not build multiple maps.

The farm should contain:

TERRAIN
- main grassy playable area
- subtle height variation if practical
- dirt paths
- cultivated soil plots
- edge dressing so it does not look like a rectangle floating in space

WATER
- pond or narrow river
- visible reflections/specular response if practical
- mild movement

NATURE
- trees
- bushes
- grasses
- flowers
- rocks
- reeds around water where practical

FARM
- farmhouse area
- crop field
- well
- fences
- dirt paths
- storage area or small barn only if core work is complete

BACKGROUND
- distant terrain, fog or environmental masking so the edge of the world is not visually obvious

ENVIRONMENTAL LIFE
Only after the core game works:

- butterflies
- birds
- floating pollen
- chimney smoke
- fireflies at night
- leaf particles

==================================================
7. CAMERA AND CONTROLS
==================================================

Make the game instantly understandable on desktop web.

Prefer an elevated third-person / farm-builder camera that shows the environment beautifully.

Recommended controls:

WASD or arrow keys:
pan/move

mouse drag:
rotate camera

mouse wheel:
zoom

click:
interact/select/place

ESC:
cancel build placement

The camera must:

- have sensible limits
- not clip through the ground
- not become inverted
- not disappear beneath terrain
- frame the farm attractively
- remain easy to control

If implementing full character movement would significantly reduce reliability, prioritize the farm-builder camera rather than forcing a third-person character system.

A playable farm matters more than an unnecessary character controller.

==================================================
8. USER INTERFACE
==================================================

The UI must be minimal.

The 3D world is the main interface.

Do not create a large SaaS dashboard.

TOP LEFT:

ROOTS
small tagline or world name

TOP CENTER or TOP RIGHT:

Day/time
weather
connection status

Example:

DAY 01   08:42 AM    SUNNY    LIVE ●

RESOURCE BAR:

Wood
Stone
Seeds
Wheat
Coins

Use tasteful icons and compact numbers.

BOTTOM CENTER:

minimal action/build toolbar.

Possible buttons:

FARM
BUILD
HARVEST / INTERACT
RESET DEMO

When BUILD is selected, show:

HOUSE
FIELD
FENCE
PATH
WELL

Do not show complicated menus.

Use:

glass-like subtle panels
soft translucency
rounded corners
high-quality typography
small shadows

Avoid:

large gradients
generic admin cards
dense sidebars
table layouts
cyberpunk HUD styling

==================================================
9. DEMO MODE
==================================================

This is a hackathon.

The game must be enjoyable immediately.

Do NOT make judges grind for resources.

Start the demonstration world with enough resources to perform meaningful actions.

Example initial resources:

Wood: 80
Stone: 50
Seeds: 20
Coins: 100

The player must be able to:

- plant something immediately
- construct something immediately
- harvest within seconds
- see progression quickly

All timings should be compressed for demo purposes.

==================================================
10. FARMING LOOP
==================================================

Implement ONE crop perfectly before adding more.

PRIMARY CROP:

Wheat

Required interaction:

1. select FARM mode
2. choose/place farm plot if required
3. till soil or use an existing prepared field
4. plant wheat
5. crop appears as a seed/small sprout
6. water crop
7. crop progresses through visually different stages
8. crop becomes mature
9. mature wheat looks visibly harvestable
10. player harvests it
11. rewards/resources update
12. state persists through Serverpod
13. every connected client sees the same crop state

Target accelerated growth:

Stage 0:
seed / planted

after approximately 4-6 seconds:
sprout

after approximately another 4-6 seconds:
young crop

after approximately another 4-6 seconds:
mature wheat

Total target:

roughly 12-20 seconds

Do not require real-world farming times.

Maturity should have a subtle visual reward:

- slightly brighter wheat
- small particles
- gentle sway
- highlight on hover
- tasteful "Ready to Harvest" indication

==================================================
11. OPTIONAL CROPS
==================================================

ONLY after wheat works perfectly:

Carrot
Pumpkin

Do not build additional crops before:

- wheat planting works
- watering works
- growth works
- harvesting works
- persistence works
- multiplayer synchronization works

==================================================
12. BUILDING SYSTEM
==================================================

Implement a simple placement system.

Required placeable objects:

FARMHOUSE
FIELD
FENCE
PATH
WELL

When an item is selected:

show a semi-transparent ghost preview.

Valid placement:
green/neutral preview.

Invalid placement:
red preview.

Click:
confirm placement.

ESC/right click:
cancel.

Use grid snapping or sensible snapping to simplify implementation.

Do not create a complex free-form architecture editor.

==================================================
13. FARMHOUSE
==================================================

The farmhouse is the emotional centerpiece of the scene.

It must look better than the other structures.

It should have:

- believable proportions
- windows
- wooden/stone materials
- roof
- door
- small porch if feasible
- chimney if feasible

When construction occurs, avoid having it simply pop into existence if an easy animation is possible.

Preferred construction effect:

foundation appears
then walls
then roof
then small dust/wood particles
then completion

This can be a fast 1-2 second animation.

If building animation threatens stability, use a good dissolve/scale/fade placement effect instead.

==================================================
14. HOUSE UPGRADE
==================================================

Only if the core build is stable:

Allow farmhouse Level 1 → Level 2.

The upgrade should visibly improve the structure.

Possible additions:

larger footprint
porch
second roof section
chimney
garden
warm window lighting

Upgrade must require resources.

Do not implement more than two house levels.

==================================================
15. RESOURCE GATHERING
==================================================

Keep gathering extremely simple.

Trees can supply wood.

Rocks can supply stone.

Interaction:

click/select resource
perform Gather
small animation
resource count increases

Do not implement full axe/pickaxe combat animations unless trivial.

A tree or rock does not need to permanently disappear if implementing regeneration is expensive.

==================================================
16. WORLD LIFE SYSTEM
==================================================

The world should visually improve as players care for it.

Maintain:

World Life

Example scoring:

Plant crop:
+2

Harvest crop:
+1

Place tree:
+3

Build well:
+5

Build farmhouse:
+10

Upgrade farmhouse:
+10

At thresholds, subtly enrich the environment.

Example:

0-24:
normal/basic landscape

25:
more flowers

50:
more vegetation
butterflies if implemented

75:
richer lighting/environment
more decorative life

100:
WORLD BLOOM moment

The WORLD BLOOM moment should be visually satisfying:

- flowers become visible
- environment becomes slightly more vibrant
- sunlight improves
- foliage appears richer
- particle effect
- brief tasteful UI message

Do NOT rebuild the whole scene.

Achieve it through staged objects/material parameters/particles.

==================================================
17. DAY / NIGHT
==================================================

DAY/NIGHT IS POLISH, NOT CORE.

Implement only after core gameplay and Serverpod synchronization work.

If implemented:

One full cycle should be around 90-150 seconds.

Stages:

morning
day
sunset
night

Change:

- sun direction
- light intensity
- sky/environment
- ambient tone

At night:

- farmhouse windows glow
- environment remains playable
- optional fireflies

Do not make night so dark that the demo becomes unreadable.

==================================================
18. WEATHER
==================================================

OPTIONAL after core completion.

Implement:

SUNNY
RAIN

Rain should:

- create visible rainfall
- slightly darken environment
- optionally water crops automatically

Weather should be world state controlled by the server.

All connected clients must see the same weather.

Do not implement storms, snow, seasons or complicated meteorology.

==================================================
19. SERVERPOD IS MANDATORY
==================================================

This is a Serverpod hackathon.

Serverpod MUST perform meaningful work.

Do NOT implement the game entirely on the client and use Serverpod as decorative storage.

Use the existing Serverpod 4 backend.

Use generated typed clients.

Use Serverpod ORM/database.

Use Serverpod streaming.

Use the embedded PostgreSQL development setup supplied by the project unless the existing App Studio project uses another supported local configuration.

The server should be authoritative for important shared state.

==================================================
20. SERVERPOD DATA MODEL
==================================================

Keep the schema small and robust.

Create models conceptually equivalent to:

WORLD

id
name
life
dayTime
weather
createdAt
updatedAt

PLAYER

id
worldId
displayName
x
y
z
lastSeenAt

WORLD OBJECT

id
worldId
ownerId optional
type
positionX
positionY
positionZ
rotationY
scaleX optional
scaleY optional
scaleZ optional
state
cropStage optional
isWatered optional
plantedAt optional
createdAt
updatedAt

RESOURCE STATE

Either store resources on a Player model or a small dedicated structure.

Required:

wood
stone
seeds
wheat
coins

WORLD EVENT

Create a serializable event structure for streaming.

Possible event kinds:

playerJoined
playerMoved
objectPlaced
objectRemoved
cropPlanted
cropWatered
cropStageChanged
cropHarvested
resourceChanged
houseUpgraded
worldLifeChanged
weatherChanged
worldReset

Follow current Serverpod model syntax.

Do not invent unsupported YAML types.

Run code generation/migrations using the current Serverpod 4 workflow.

==================================================
21. SERVERPOD ENDPOINTS
==================================================

Implement only the endpoints required for the demo.

Conceptually:

getOrCreateDemoWorld()

getWorldSnapshot(worldId)

joinDemoWorld(worldId, displayName)

placeWorldObject(...)

removeWorldObject(...)

plantCrop(...)

waterCrop(...)

harvestCrop(...)

gatherResource(...)

upgradeHouse(...)

resetDemoWorld(...)

streamWorldEvents(worldId)

Optional:

updatePlayerPresence(...)

Use current Serverpod endpoint conventions.

Do not build REST endpoints manually unless absolutely required.

Use the generated Dart client.

==================================================
22. REAL-TIME MULTIPLAYER
==================================================

This is one of the key technical demo moments.

Use Serverpod's CURRENT supported streaming mechanism.

Open two separate browser windows.

Both join the same demo world.

When Browser A performs an important action:

Browser B must update without refreshing.

Required synchronized actions:

- world object placed
- crop planted
- crop watered
- crop growth stage changes
- crop harvested
- farmhouse placement/upgrade
- world life changes

If implementing full player transform replication is reliable, add simple presence.

Do NOT stream client movement 60 times per second.

If presence is implemented:

send at a sensible low frequency
interpolate locally

Game state correctness is more important than perfect player networking.

==================================================
23. CROP GROWTH ON SERVER
==================================================

Crop progression should be server authoritative.

Preferred implementation:

Serverpod scheduling / FutureCalls if the current Serverpod API makes this straightforward.

Example:

plant wheat
→ persist planted crop
→ schedule first growth
→ update stage
→ persist
→ broadcast
→ schedule next growth
→ broadcast
→ mature

This showcases real backend capability.

However:

DO NOT spend excessive time fighting scheduling infrastructure.

Fallback:

persist authoritative timestamps on the server and calculate/validate the stage from server time whenever clients fetch/interact, while broadcasting meaningful changes.

Reliability wins over architectural perfection.

==================================================
24. PERSISTENCE
==================================================

The world must survive browser refresh.

Required test:

1. place farmhouse
2. plant wheat
3. refresh browser
4. farmhouse remains
5. crop remains in correct state

The database must be the source of persistent world state.

Do not silently reconstruct everything from hardcoded local data after refresh.

==================================================
25. DEMO RESET
==================================================

Hackathon demos fail when state is messy.

Create a discrete RESET DEMO action.

It should restore:

initial world
initial resources
initial farm state
life score
weather/time if necessary

Protect accidental clicking with a tiny confirmation.

This allows repeated video recordings.

==================================================
26. SOUND
==================================================

Only if easy and legally safe.

Small sound effects can dramatically improve polish:

placement
watering
harvest
construction complete
birds/wind
water

Keep volume subtle.

Do not delay core functionality for sound.

==================================================
27. PERFORMANCE
==================================================

Target a smooth Chrome demo on a Mac.

Aim for:

60 FPS if practical.

A stable 30+ FPS with excellent visuals is preferable to unstable 60 FPS.

Use sensible optimizations:

- avoid huge texture files
- reuse geometry/materials
- use instancing where current flutter_scene APIs support it
- avoid thousands of individually expensive grass nodes
- use LOD where valuable
- reuse crop meshes
- reuse fence meshes
- avoid excessive dynamic lights
- avoid unnecessary shadow casters
- profile obvious bottlenecks

Do not optimize prematurely.

Get the core scene working first.

==================================================
28. RESPONSIVENESS
==================================================

Primary demo resolution:

desktop browser
16:9
roughly 1440p/1080p layout

Still behave acceptably at smaller desktop widths.

Do not spend time perfecting phone controls during the hackathon.

==================================================
29. ERROR HANDLING
==================================================

Do not allow user actions to crash the game.

Provide quiet UI feedback when:

- server disconnected
- not enough resources
- invalid placement
- action failed
- crop not ready
- object cannot be placed

If the server reconnects, refresh/reconcile world state.

==================================================
30. DESIGN QUALITY
==================================================

Avoid "AI generated app" visual patterns.

DO NOT:

- use huge gradient headings
- use random glowing cards
- fill the screen with text
- show five dashboards around the world
- use excessive glass panels
- use emoji as final production icons everywhere
- use inconsistent spacing
- use default Flutter Material appearance without customization

Make it feel like a game.

The environment is the product.

==================================================
31. TECHNICAL ARCHITECTURE
==================================================

Desired high-level architecture:

Flutter Web
    |
    | generated Serverpod client
    |
Serverpod 4
    |
    +-- typed endpoints
    +-- world logic
    +-- crop logic
    +-- streaming
    +-- scheduling if used
    |
PostgreSQL

Flutter side:

UI layer
3D rendering layer
input/controller layer
game state layer
Serverpod client/repository layer

Keep modules separated enough to debug them quickly.

Do not build unnecessary abstractions.

==================================================
32. CODE QUALITY
==================================================

Use:

clear names
small focused files
typed models
proper formatting
current Dart conventions
current Flutter conventions
current Serverpod conventions

Avoid:

one 3,000-line widget
dead code
duplicate logic
hardcoded network URLs scattered everywhere
unused dependencies
warning spam
print-debugging left throughout production code

Run:

dart format

flutter analyze

relevant Serverpod tests / Dart tests

Fix meaningful warnings and all errors.

==================================================
33. AGENT BEHAVIOR
==================================================

BEFORE CHANGING CODE:

Read:

AGENTS.md
knowledge.md
pubspec files
server configuration
current folder structure
existing generated files
any Serverpod skills
any Flutter skills

After flutter_scene installation/setup:

read its installed skills.

Do not modify generated Serverpod client files manually if Serverpod is expected to regenerate them.

Do not manually edit generated database migration output unless current Serverpod documentation requires it.

Do not blindly upgrade Flutter.

Do not switch Flutter channels.

Do not destroy the App Studio environment.

Do not run destructive Git commands.

Do not delete existing configuration without understanding it.

==================================================
34. DEVELOPMENT LOOP
==================================================

Use this loop throughout the build:

inspect
→ implement small vertical slice
→ run
→ inspect errors
→ fix
→ interact with actual UI
→ continue

DO NOT write the entire application without running it.

Use browser testing when available.

Actually click buttons.

Actually place objects.

Actually plant crops.

Actually reload.

Actually open two clients.

Do not declare something working based only on compilation.

==================================================
35. BUILD ORDER
==================================================

Follow this order unless current repository state gives a compelling reason not to.

PHASE A — BOOT

Goal:
Prove Flutter + flutter_scene works.

- inspect repo
- inspect versions
- install compatible flutter_scene
- initialize it correctly
- run web app
- render one lit 3D object
- verify browser output

Do not continue until this renders.

PHASE B — BEAUTIFUL WORLD

- terrain
- sky/environment
- sunlight
- shadows
- water
- trees
- rocks
- field
- farmhouse placeholder
- camera controls

Goal:

Within the first major milestone, there must already be a visually attractive interactive 3D environment.

PHASE C — FARMING

Implement:

- field selection
- planting wheat
- watering
- crop stages
- maturity
- harvest
- resources

Verify locally.

PHASE D — BUILDING

Implement:

- build mode
- ghost preview
- house
- fence
- path
- well
- placement
- resource deduction

PHASE E — SERVERPOD

Implement:

- persistent world
- models
- endpoints
- migrations
- database
- typed client

Reload test.

PHASE F — MULTIPLAYER

Implement stream.

Run two clients.

Verify:

A places object
B sees object

B plants crop
A sees crop

A waters
B sees state

Crop progresses
both match

PHASE G — WOW

Only after A-F work:

- construction animation
- world life progression
- day/night
- environmental particles
- polish
- sound
- optional weather

PHASE H — RELEASE

- analyze
- format
- tests
- fix runtime errors
- remove debug clutter
- final browser test
- two-client test
- production web build
- prepare deployment

==================================================
36. HARD TIME-SCOPE RULE
==================================================

CORE FEATURES ALWAYS WIN OVER BONUS FEATURES.

If time becomes constrained, cut features in THIS order:

animals
fishing
interior house
extra crops
weather
day/night
sounds
house upgrade
player avatar
world bloom

DO NOT CUT:

3D world
wheat farming
building placement
farmhouse
Serverpod persistence
Serverpod streaming
two-client synchronization
basic visual polish

==================================================
37. DO NOT BUILD
==================================================

Do NOT add:

LLM chatbot
Gemini
OpenAI
AI NPCs
authentication
payments
marketplace
complex inventory grids
quests
combat
enemies
large open world
procedural infinite terrain
complex crafting tree
ten crops
animal breeding
vehicle system
character customization
social feed
leaderboard
mobile-specific UI
admin dashboard

unless the complete Definition of Done is already achieved.

==================================================
38. README
==================================================

Create/update README.md.

It should contain:

ROOTS

Build. Grow. Together.

Short explanation:

ROOTS is a persistent cooperative 3D homestead game built with Flutter, flutter_scene and Serverpod.

Explain:

- gameplay loop
- why Serverpod is important
- real-time multiplayer
- persistence
- crop scheduling
- technology stack
- architecture
- how to run
- how to deploy
- hackathon demo instructions

Include a compact architecture diagram.

Mention any external assets with reference to ATTRIBUTIONS.md.

Do not write an enormous README.

==================================================
39. DEMO SCRIPT SUPPORT
==================================================

Design the product so this exact demonstration is possible:

0:00
Show cinematic farm.

0:05
Rotate/pan camera to prove it is fully 3D.

0:10
Open second browser window beside first.

0:15
Browser A places farm plot / farmhouse.

0:20
Object appears in Browser B immediately.

0:25
Browser B plants wheat.

0:30
Wheat appears in Browser A.

0:35
Browser A waters wheat.

0:40
Both watch crop progress through growth stages.

0:50
Harvest wheat.

0:55
Build or complete farmhouse.

1:05
Show improved farm/world.

1:15
Quickly show refresh persistence.

1:25
Explain Serverpod:
database + typed endpoints + streaming + crop scheduling.

1:40
End on beautiful cinematic farm shot.

The demo should be understandable with very little narration.

==================================================
40. HACKATHON STORY
==================================================

The product story is:

Most farming games are either isolated single-player experiences or massive games requiring specialized engines and infrastructure.

ROOTS demonstrates that Flutter and Serverpod can power a beautiful persistent multiplayer 3D world.

Flutter/flutter_scene renders the world.

Serverpod makes the world real:

- persistent
- authoritative
- synchronized
- shared

Core pitch:

"ROOTS is a shared 3D homestead where everything you plant and build becomes part of a persistent world that grows with you."

==================================================
41. QUALITY BAR
==================================================

Before calling the project complete, ask:

Does opening the URL immediately look impressive?

Would someone know this is a game without explanation?

Does the world feel alive?

Does the camera feel pleasant?

Does soil look different from grass?

Does water look like water?

Do crops visibly change?

Does building placement feel satisfying?

Does the farmhouse look like the visual centerpiece?

Can two browser windows genuinely modify the same world?

Does refresh preserve the world?

Does Serverpod perform real backend work?

Does it run without obvious errors?

Could this be demonstrated confidently in two minutes?

If any core answer is NO, continue fixing it.

==================================================
42. FALLBACK STRATEGY
==================================================

If hyper-realistic external models/assets create technical problems:

DO NOT abandon the project.

Fallback progressively:

Level 1:
retain high-quality textures + PBR + procedural geometry.

Level 2:
simplify geometry while preserving excellent materials/lighting.

Level 3:
use stylized-realistic geometry with strong environmental polish.

Never fall back to:

blank colored cubes
debug primitives
flat default materials
unfinished placeholders

The game should always remain visually coherent.

==================================================
43. DEFINITION OF DONE
==================================================

The project is DONE only when all of these work:

[ ] App launches successfully in Chrome.

[ ] A real flutter_scene 3D scene renders.

[ ] Camera can navigate the farm.

[ ] Farm visually contains terrain, nature, field and water.

[ ] Lighting/materials look intentionally designed.

[ ] Wheat can be planted.

[ ] Wheat can be watered.

[ ] Wheat visibly grows through stages.

[ ] Wheat can be harvested.

[ ] Resources change correctly.

[ ] A farmhouse can be placed/built.

[ ] At least fences OR well OR paths can also be placed.

[ ] Invalid build placement is handled.

[ ] Serverpod persists the world.

[ ] Refreshing the browser retains placed objects/crops.

[ ] Serverpod uses a real database model and generated client.

[ ] Two browser clients can join the same world.

[ ] Object placement from one client appears in the other without refresh.

[ ] Crop changes propagate to the other client.

[ ] No obvious compilation errors.

[ ] No obvious runtime crashes during demo flow.

[ ] flutter analyze has no blocking issues.

[ ] README explains the project and Serverpod architecture.

[ ] ATTRIBUTIONS.md exists for any third-party assets.

[ ] There is a reset-demo mechanism.

[ ] Production web build succeeds.

==================================================
44. FINAL INSTRUCTION
==================================================

Start by inspecting the current repository.

Do not respond with a long implementation plan and then stop.

You may briefly establish your internal implementation order, but immediately begin making changes.

Use parallel/sub-agents where helpful, but do not allow multiple agents to make conflicting architectural changes.

Continuously run and inspect the real application.

Research current official APIs when uncertain.

Prefer working software over theoretical perfection.

Prefer one exceptional scene over many mediocre screens.

Prefer one perfect crop over ten broken crops.

Prefer one working multiplayer world over many fake features.

Do not stop at scaffolding.

Build ROOTS into the strongest working hackathon prototype possible with the available time.


# ADDITIONAL FINAL REQUIREMENTS

These requirements are mandatory additions to the existing ROOTS specification.

The judging criteria place the greatest weight on whether the application actually works.

Therefore:

WORKING GAMEPLAY > NUMBER OF FEATURES

RELIABILITY > EXPERIMENTAL FEATURES

FINISHED CORE LOOP > LARGE SCOPE

The final result must feel like a COMPLETE SMALL GAME, not a technology demo.

==================================================
45. ZERO EXTERNAL API DEPENDENCIES
==================================================

ROOTS should require ZERO external application API keys.

Do not integrate:

- OpenAI
- Gemini
- Claude API
- OpenRouter
- Replicate
- Stability API
- external weather APIs
- external map APIs
- external game APIs
- remote music APIs

unless explicitly instructed later.

The entire game should function using:

Flutter
Dart
flutter_scene
Serverpod
PostgreSQL
local bundled assets
local bundled audio

External downloadable assets may be used only if their license allows it.

After downloading them, bundle them locally into the application.

The final deployed game should not depend on a third-party API being online.

==================================================
46. COMPLETE GAME FEEL
==================================================

ROOTS must not feel like a technical proof-of-concept.

Even though its scope is intentionally small, the player should experience:

ENTER WORLD
↓
explore farm
↓
plant crop
↓
water crop
↓
watch crop grow
↓
harvest crop
↓
gain resources
↓
construct farmhouse / structures
↓
improve the farm
↓
see persistent progress

There should be no obvious dead-end after one interaction.

Every core action should have:

visual feedback
sound feedback where appropriate
state change
clear result

The player should understand what to do without documentation.

==================================================
47. MUSIC AND AUDIO
==================================================

Music is part of the experience.

Add one high-quality peaceful farming/countryside background track.

Desired feeling:

warm
calm
hopeful
cinematic
natural
cozy

Avoid:

arcade music
8-bit music
aggressive electronic music
generic corporate music
overly loud music

Use only:

CC0
public domain
or otherwise clearly reusable/licensed audio

Bundle the audio locally inside the Flutter project.

Document its source/license in ATTRIBUTIONS.md.

Do NOT stream music from an external website.

IMPORTANT FOR FLUTTER WEB:

Browsers may block autoplay.

Therefore:

The title screen should initially be silent.

When the user clicks:

ENTER WORLD

initialize audio and begin background music.

Music should:

loop continuously
fade in rather than start harshly if practical
stay at subtle background volume
not restart every time a widget rebuilds

Add a small audio control.

Example:

🔊
🔇

Allow:

mute
unmute

If practical, remember volume during the current session.

==================================================
48. SOUND EFFECTS
==================================================

After background music works, add lightweight sound effects.

Priority:

1. planting
2. watering
3. harvest
4. building placement
5. construction completion
6. resource collection

Optional:

birds
wind
water ambience
night insects

Sound effects should be short and subtle.

Do not layer so many sounds that the game becomes noisy.

Music must automatically remain quieter than important interaction effects.

==================================================
49. TITLE / ENTRY EXPERIENCE
==================================================

Before loading directly into gameplay, create a simple cinematic entry screen.

Show:

ROOTS

Build. Grow. Together.

Beautiful live or gently animated background of the farm if practical.

Primary button:

ENTER WORLD

Secondary small text can say:

A shared world powered by Serverpod

When ENTER WORLD is pressed:

- initialize game
- initialize music
- connect/join shared Serverpod world
- transition smoothly into the farm

Do not build a complicated authentication system.

Use generated guest identity / simple display name.

==================================================
50. RELIABILITY PRIORITY
==================================================

A feature cannot be considered implemented merely because code exists.

It is implemented only when it has been manually tested in the running application.

Before adding bonus features, verify all of these:

GAME BOOT:
- game opens
- scene renders
- no blank canvas
- no critical console errors

CAMERA:
- rotate works
- zoom works
- camera cannot become unusable

FARMING:
- plant works
- water works
- growth works
- harvest works
- reward works

BUILDING:
- placement mode works
- preview works
- valid placement works
- cancel works
- resources deduct correctly

SERVER:
- backend starts
- database connects
- endpoints work

PERSISTENCE:
- place structure
- refresh page
- structure still exists

MULTIPLAYER:
- open Browser A
- open Browser B
- A modifies world
- B updates without refresh
- B modifies world
- A updates without refresh

AUDIO:
- click ENTER WORLD
- music begins
- music loops
- mute works

DEPLOYMENT:
- production build runs
- deployed URL loads
- server connection works

Only after this may optional polish continue.

==================================================
51. GRACEFUL FEATURE DEGRADATION
==================================================

If any ambitious graphical feature causes instability:

remove or simplify it.

For example:

If realistic dynamic water breaks Web rendering:
use a simpler animated water shader/material.

If thousands of grass instances reduce FPS:
reduce density.

If complex shadows cause crashes:
reduce shadow quality.

If realistic character animation takes too long:
remove the character and retain farm-builder interaction.

If physics introduces bugs:
use deterministic placement instead.

Never sacrifice the working game for a single visual feature.

==================================================
52. REALISM TARGET
==================================================

The visual direction remains realistic / high fidelity.

However:

The target is NOT literal AAA photorealism.

The target is:

"surprisingly realistic for a Flutter web game."

Achieve this mainly using:

- high-quality PBR materials
- strong lighting
- realistic scale
- good shadows
- environmental detail
- atmospheric depth
- quality water
- restrained post-processing
- high-quality textures
- well-composed camera

Realism comes from consistency and lighting more than polygon count.

Do not produce ugly high-poly assets with poor lighting.

==================================================
53. SCREENSHOT CAPTURE
==================================================

Once the application is genuinely working, create final screenshots from the ACTUAL RUNNING GAME.

Do not fabricate screenshots.

Do not create mock UI screenshots.

Capture at least:

docs/screenshots/01-hero-farm.png

A beautiful wide view showing the complete farm.

docs/screenshots/02-farming.png

Player planting/watering/growing wheat.

docs/screenshots/03-building.png

Building placement or completed farmhouse.

docs/screenshots/04-multiplayer.png

Two connected game clients or evidence of synchronized shared world state.

docs/screenshots/05-night-or-polish.png

Best visual polish shot if day/night is implemented.

If only four great screenshots exist, use four rather than inventing a fifth.

Prefer:

16:9
high resolution
clean UI state
no debug panels
no browser developer tools
no error overlays

The hero screenshot should be visually exceptional.

==================================================
54. README QUALITY
==================================================

README.md is part of the submission quality and must be detailed and polished.

It must NOT be written until the major implementation is sufficiently complete that it can describe what ACTUALLY EXISTS.

Do not document imaginary features.

README structure:

# ROOTS

**Build. Grow. Together.**

Immediately show the best actual screenshot.

Then include:

## What is ROOTS?

Explain the product clearly in approximately 2-3 concise paragraphs.

Explain that ROOTS is a persistent cooperative 3D farming and homestead game.

## The Experience

Explain:

- planting
- watering
- growing
- harvesting
- building
- persistent farm
- shared world

## Why We Built It

Explain the idea:

Many web applications feel transactional.

ROOTS explores whether Flutter and Serverpod can create something that feels alive, spatial and shared.

## Demo

Add the deployed application link when available.

Add demo video link placeholder until final URL exists.

## Screenshots

Show the actual captured screenshots.

Use descriptive captions.

Recommended:

### Build Your Homestead
image

### Grow Your Farm
image

### A Shared Persistent World
image

### The World Comes Alive
image

## Key Features

Include only working functionality.

Examples:

- interactive 3D farm
- crop planting
- crop watering
- real-time crop growth
- harvesting
- resource economy
- building placement
- farmhouse construction
- persistent world state
- Serverpod multiplayer streaming
- music and environmental audio
- day/night only if implemented

## The Multiplayer Moment

Explain the strongest technical demonstration:

Player A plants/builds.

Serverpod persists the change.

Serverpod broadcasts it.

Player B sees it instantly without refreshing.

## How Serverpod Powers ROOTS

This section is extremely important for hackathon judging.

Explain specifically:

### Typed Client-Server Communication

Flutter communicates with Serverpod using generated type-safe clients.

### Persistent World

Farm objects and crop state are persisted using Serverpod's ORM and PostgreSQL.

### Real-Time Multiplayer

Serverpod streaming distributes world events to all connected players.

### Server-Authoritative Game State

Important shared actions are validated and persisted on the server.

### Crop Progression

Explain Serverpod scheduling/timestamp-based crop progression depending on actual implementation.

Do not write generic sponsor praise.

Explain real technical usage.

## Architecture

Include an ASCII or Mermaid diagram such as:

Flutter Web / flutter_scene
        |
        | Generated Serverpod Client
        v
     Serverpod
    /    |     
World  Streams  Game Logic
State     |        |
    \     |       /
      PostgreSQL

Use actual final architecture.

## Technology Stack

Flutter
Dart
flutter_scene
Serverpod 4
PostgreSQL
audio library actually used

Only list libraries actually included.

## Game Loop

Explain:

Explore
→ Plant
→ Water
→ Grow
→ Harvest
→ Build
→ Improve
→ Repeat

## Running Locally

Provide accurate commands.

Do not guess them.

Verify commands before documenting them.

Include:

prerequisites
server startup
Flutter startup
database/migration steps if required

## Project Structure

Briefly explain:

server
generated client
Flutter game
assets
screenshots

## Hackathon Scope

Be transparent that this is a focused playable prototype.

Explain that scope was intentionally kept compact so the complete game loop and real-time backend work reliably.

This actually supports the "Does it work?" judging criterion.

## AI-Assisted Development

The hackathon permits AI-assisted development.

Disclose Freebuff and any other coding agents that were genuinely used.

Do not claim tools that were not used.

## Assets & Attribution

Point to:

ATTRIBUTIONS.md

## What We'd Build Next

Keep short.

Examples:

animals
larger shared worlds
cooperative quests
seasons
more crops
farm customization

Do not make this section longer than the actual product description.

## Built For

Build Something Real: The Serverpod Hackathon

==================================================
55. README IMAGE RULES
==================================================

The README should visually open with the strongest screenshot.

Example Markdown structure:

# ROOTS

> Build. Grow. Together.

![ROOTS Farm](docs/screenshots/01-hero-farm.png)

Then text.

Do not put ten images consecutively.

Distribute screenshots throughout the README near the relevant sections.

At the end, include a small visual gallery.

Example:

## Gallery

| Farming | Building |
|---|---|
| screenshot | screenshot |

| Shared World | Night |
|---|---|
| screenshot | screenshot |

Only use screenshots that exist.

==================================================
56. README VALIDATION
==================================================

Before completion:

Open README rendering if possible.

Verify:

- every image path works
- no broken screenshot links
- no placeholder deployment URL remains accidentally
- no fake feature is mentioned
- commands have been tested
- architecture matches implementation
- technology names are correct
- markdown formatting renders properly

==================================================
57. MUSIC ATTRIBUTION
==================================================

ATTRIBUTIONS.md must include for every third-party audio file:

Name
Creator
Source
License

Also do this for:

textures
HDRI
3D models
sound effects

Do not rely on comments buried inside source files.

==================================================
58. FINAL "DOES IT WORK?" TEST
==================================================

Before polishing anything else, perform this exact end-to-end test:

1. Start backend.

2. Start Flutter web.

3. Open Browser A.

4. Click ENTER WORLD.

5. Confirm music begins.

6. Plant wheat.

7. Water wheat.

8. Confirm visible growth stages.

9. Harvest wheat.

10. Confirm resources change.

11. Build farmhouse.

12. Refresh Browser A.

13. Confirm farm persists.

14. Open Browser B.

15. Join same world.

16. Place an object from Browser A.

17. Confirm Browser B receives it without refresh.

18. Plant/water from Browser B.

19. Confirm Browser A updates.

20. Test mute button.

21. Test invalid placement.

22. Test demo reset.

23. Refresh both clients.

24. Verify synchronized valid state.

25. Run production build.

If ANY required step fails, fixing it has higher priority than adding another visual or gameplay feature.

==================================================
59. FINAL SUBMISSION QUALITY

The final project must communicate three things immediately:

1. THIS IS A REAL GAME.

The player can interact with it and has a complete gameplay loop.

2. THIS IS ACTUALLY 3D.

The world, camera, environment and structures are spatial and interactive.

3. SERVERPOD ACTUALLY MATTERS.

Without Serverpod, the persistent synchronized multiplayer world would not exist.

Do not finish the project merely because the code compiles.

Finish it when the core gameplay can be demonstrated repeatedly without breaking.