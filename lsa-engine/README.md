# Features

- Persistent units
- Capture mechanics
- User settings
- Perimeter defense units (CA)
- Patrolling perimeter units
- Passing days, seasons, time and weather
- Lives system with rolling window
- Carrier delayed re-spawn system
- Side lock
- CSAR
- Bombers
- Tankers (basket and boom)
- Auto-move garrison units
- Supply based logistics (done)
- F10 map deployment commands (done)
- Enforce re-arm and refuel at specific location (done)
- Set all FC3 first waypoint to bulls of coalition (done)
- Setup the start time of mission (done)
  - multiple of 2 mission is 07:00 - 13:00,
  - multiple of 3 mission is 13:00 - 21:00
  - everything else 12:00 - 18:00
- Setup weather themes (bad and good) (done)
- Create polygon with trigger zones to create an ocean area where carriers can move (movement outside is denied) (done)
- Create mechanics for bombers, tankers and awacs (done)
- Create system to auto recover and load last mission in case of server crash (done)
- CSAR (done)

# Roadmap
- Rolling window play time
- Enforce no taxiway takeoffs
- Use IADS with SAMs (deployed)
- Bases with lighter defenses designed for low level, high-drag bombing (cold war style)
- Add beacons with morse code to the FARPs (and non-airfield bases)
- Move bulls by a command
- Make units move if smoke is nearby
- Request FAC for illumination bombs at a target location (spawn an aircraft to go drop it)
- Allow player to ask for an altitude and speed to the tanker (this will need to be between a certain threshold speed: 300 - 315; alt: 21 - 25)
- Announce tanker/bomber on mission start in SRS
- Announce FAC targets in SRS
- Feature (optional) to force players to return to base of origin (affects only return of lives)

- Create a drone FAC (allow F10 marks and BDA of bases)
- Add recon airplane dispatching (much like bombers), should provide same features as drone
  - UK Tornado (special recce variant with internal cameras)
  - German Tornado (Recce pod)
  - Tomcat (TARPS pod)
  - Viggen (special recce variant with internal cameras)
  - MiG-25 (special recce variant with internal cameras)
- Create "Compile mission" option
  - Sets FC3 bulls
  - Sets briefing information
    - Carriers freq, tacan, icls, acls, etc...
    - Tankers freq, tacan
    - other...
  - Sets options (no external views, no F10 icon, etc...)
  - remove zones
  - serialize compact


- Allow CSAR only after a certain time has passed in the flight
- Allow a player to issue orders to an assault group (2 MBT, 2 IFV, 2 AAA, 1 IRSAM)
- Allow a player to deploy and issue orders to an artillery group (with point fire) (4 Arty, 2 AAA, 1 IRSAM)