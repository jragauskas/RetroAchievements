// ~Hack~ Crystal Clear
// #ID = 13389

// $C101: Music ID (keep in mind custom music)
// $C1C9: SFX - 9c = Get Badge
// $C2D8: current town/route/location index
// $C41A: Voltorb Flip Level (Unstable Eslewhere)
// $C6FD: Battle Win Flag (unstable elsewhere)
// $C70A: Slots Bet amnt
// $C711: slots payout (byte 2)
// $C712: slots payout
// $D206: Enemy Species ID
// $D213: Enemy Level
// $D22D: battle type (01 wild, 02 trainer)
//        active after battle transition
//        ends on fade to ow
// $D22E: opposing pokemon in wild battle
// $D22F: trainer battling against
// $D472: Player gender - 0=male, 1=female, 2=none
// $D4E6: actual x position
// $D857: Badges (Johto)
// $D858: Badges (Kanto)
// $D958: Current Radio
// $D95E: HoF wins
// $D9FB: 01 = Pokemon Center Healing
// $DA03: current following pokemon
// $DA0E: Pokedex Caught Start
// $DA2D: Pokedex Caught End (0x07 = full)
// $DA2F: Home - 0=Johto, 1=Kanto 2=undecided
// $DA3A: Map Bank
// $DA3B: Sub-Map
// $DA48: Disable Music
// $DA50: Gym rechallenge set number
// $DA51: Gym rechallenge gym number
// $DA52: 01 = rechallenge in progress
// $DA7B: bit 2 = Old Amber
//        bit 7 = Bill's Eevee
// $DA94: bit 7 = SS Final
// $DA9B: bit 6 = DV Vision
// $DA9E: bit 0 = Pigy battled
// $DADF: bit1 = SS's PC
// $DAE4: bit2=PickUpSword
// $DB32: bit4 = Yellow
// $DB5C: bit1=RedScale
// $DB5F: bit5=ness
// $DB61: bit4=border npc
// $DBF5: Strengh active = 01
// $DC4B: Buena's Password Points
// $DCB7: Current map position (row)
// $DCB8: Current map position (column)
// $DCD7: party size
// $DCD8: party start (1)
// $DCDD: party end (6)
// $DCDF: Pokemon 1 index
// $DCE1: Pokemon 1 Move 1
// $DCE2: Pokemon 1 Move 2
// $DCE3: Pokemon 1 Move 3
// $DCE4: Pokemon 1 Move 4
// $DCF4: Pokemon 1 upper4=atk dvs lower4=def dvs
// $DCF5: Pokemon 1 upper4=spe dvs lower4=spc dvs
// $DCFA: Pokemon 1 Happiness + (if egg) time left to hatch
// $DD02: Pokemon 1 Current HP
// $DD0F: Pokemon 2 index
// $DD24: Pokemon 2 DVs
// $DD25: Pokemon 2 DVs
// $DD2A: Pokemon 2 Happiness + (if egg) time left to hatch
// $DD3F: Pokemon 3 index
// $DD54: Pokemon 3 DVs
// $DD55: Pokemon 3 DVs
// $DD5A: Pokemon 3 Happiness + (if egg) time left to hatch
// $DD6F: Pokemon 4 index
// $DD84: Pokemon 4 DVs
// $DD85: Pokemon 4 DVs
// $DD8A: Pokemon 4 Happiness + (if egg) time left to hatch
// $DD9F: Pokemon 5 index
// $DDB4: Pokemon 5 DVs
// $DDB5: Pokemon 5 DVs
// $DDBA: Pokemon 5 Happiness + (if egg) time left to hatch
// $DDCF: Pokemon 6 index
// $DDE4: Pokemon 6 DVs
// $DDE5: Pokemon 6 DVs
// $DDEA: Pokemon 6 Happiness + (if egg) time left to hatch
// $DECB: bit 6 - Mew
// $DED9: Unown Entry 1
// $DEF2: Unown Entry 26


function currentMusicId() => byte(0x00C101)
function currentSFX() => byte(0x00C1C9)
function currentLocation() => byte(0x00C2D8)
function currentMap() => word(0x00DA3A)

function isCurrentMap(mapId) => currentMap() == mapId

characterCreationMusicId = 147
introMusicId = 93

achievement(
    title = "Welcome to the World of Pokemon", points = 1,
    description = "Sit through ShockSlayer's optional intro speech. (It's a lot of text)",
    id = 83687, badge = "91067", published = "9/18/2019 2:36:53 PM", modified = "1/10/2020 4:52:27 PM",
    trigger = once(prev(currentMusicId()) == characterCreationMusicId) && once(prev(currentMusicId()) == introMusicId) && once(prev(currentMusicId()) == 0) &&
              never(currentMusicId() == characterCreationMusicId) && never(currentMusicId() == 167)
)

// Ticket 78701: Beat Whitney as first gym and achievement didn't trigger
//               
//               RetroAchievements Hash: 02aef2b6042393f5e117dd4a4a638100
//               Emulator: RetroArch
//               Emulator Version: 1.1.0.0

jhotoBadges = 0x00D857
kantoBadges = 0x00D858

function jhotoBadgeCount() => bitcount(jhotoBadges)
function kantoBadgeCount() => bitcount(kantoBadges)

function badgeObtainedSFX() => once(byte(0x00C1C9) == 156)

function badgeObtained(badgeCount) {
    return once(badgeObtainedSFX() && (prev(jhotoBadgeCount()) + prev(kantoBadgeCount())) == badgeCount - 1 &&
        (jhotoBadgeCount() + kantoBadgeCount()) == badgeCount)  
}

achievement(
    title = "First of Many", points = 5, type="progression",
    description = "Obtain your first gym badge.",
    id = 83633, badge = "90837", published = "9/16/2019 8:18:57 PM", modified = "3/10/2020 11:33:46 PM",
    trigger = badgeObtained(1)
)

achievement(
    title = "Another One", points = 5, type="progression",
    description = "Obtain your second gym badge.",
    id = 83634, badge = "90838", published = "9/16/2019 8:19:02 PM", modified = "3/10/2020 11:33:55 PM",
    trigger = badgeObtained(2)
)

achievement(
    title = "Three's Company", points = 5, type="progression",
    description = "Obtain your third gym badge.",
    id = 83635, badge = "90839", published = "9/16/2019 8:19:10 PM", modified = "3/10/2020 11:33:58 PM",
    trigger = badgeObtained(3)
)

achievement(
    title = "The Fourth Awakens", points = 5, type="progression",
    description = "Obtain your fourth gym badge.",
    id = 83636, badge = "90841", published = "9/16/2019 8:19:15 PM", modified = "3/10/2020 11:34:02 PM",
    trigger = badgeObtained(4)
)

achievement(
    title = "Mambo Number Five", points = 5, type="progression",
    description = "Obtain your fifth gym badge.",
    id = 83637, badge = "90847", published = "9/16/2019 8:19:21 PM", modified = "3/10/2020 11:34:06 PM",
    trigger = badgeObtained(5)
)

achievement(
    title = "Number of the Beast", points = 5, type="progression",
    description = "Obtain your sixth gym badge.",
    id = 83638, badge = "90855", published = "9/16/2019 8:19:25 PM", modified = "3/10/2020 11:34:10 PM",
    trigger = badgeObtained(6)
)

achievement(
    title = "Lucky Number", points = 5, type="progression",
    description = "Obtain your seventh gym badge.",
    id = 83639, badge = "90861", published = "9/16/2019 8:19:31 PM", modified = "3/10/2020 11:34:14 PM",
    trigger = badgeObtained(7)
)

achievement(
    title = "Ready for the League! ...Right?", points = 5, type="progression",
    description = "Obtain your eighth gym badge.",
    id = 83640, badge = "90873", published = "9/16/2019 8:19:36 PM", modified = "3/10/2020 11:34:18 PM",
    trigger = badgeObtained(8)
)

achievement(
    title = "Running In The Nines", points = 10, type="progression",
    description = "Obtain your ninth gym badge.",
    id = 83641, badge = "103945", published = "9/16/2019 8:19:41 PM", modified = "3/10/2020 11:34:24 PM",
    trigger = badgeObtained(9)
)

achievement(
    title = "Double Digits", points = 10, type="progression",
    description = "Obtain your tenth gym badge.",
    id = 83642, badge = "103946", published = "9/16/2019 8:19:46 PM", modified = "3/10/2020 11:34:28 PM",
    trigger = badgeObtained(10)
)

achievement(
    title = "Seven Eleven", points = 10, type="progression",
    description = "Obtain your eleventh gym badge.",
    id = 83643, badge = "103947", published = "9/16/2019 8:19:52 PM", modified = "3/10/2020 11:34:33 PM",
    trigger = badgeObtained(11)
)

achievement(
    title = "I'm Running Out Of Ideas", points = 10, type="progression",
    description = "Obtain your twelfth gym badge",
    id = 83644, badge = "152506", published = "9/16/2019 8:19:57 PM", modified = "1/5/2021 6:57:01 AM",
    trigger = badgeObtained(12)
)

achievement(
    title = "Unlucky Number", points = 10, type="progression",
    description = "Obtain your thirteenth gym badge.",
    id = 83645, badge = "152510", published = "9/16/2019 8:20:01 PM", modified = "1/5/2021 6:59:06 AM",
    trigger = badgeObtained(13)
)

achievement(
    title = "Are We There Yet?", points = 10, type="progression",
    description = "Obtain your fourteenth gym badge",
    id = 83647, badge = "152509", published = "9/16/2019 8:20:07 PM", modified = "1/5/2021 6:56:59 AM",
    trigger = badgeObtained(14)
)

achievement(
    title = "Nearly There", points = 10, type="progression",
    description = "Obtain your fifteenth gym badge",
    id = 83648, badge = "152508", published = "9/16/2019 8:20:13 PM", modified = "1/5/2021 6:56:57 AM",
    trigger = badgeObtained(15)
)

achievement(
    title = "Completionist", points = 10, type="progression",
    description = "Obtain your sixteenth and final gym badge.",
    id = 83649, badge = "152507", published = "9/16/2019 8:20:18 PM", modified = "1/5/2021 6:56:55 AM",
    trigger = badgeObtained(16)
)

Falkner = "Falkner"
Bugsy = "Bugsy"
Whitney = "Whitney"
Morty = "Morty"
Chuck = "Chuck"
Jasmine = "Jasmine"
Pryce = "Pryce"
Clair = "Clair"
Brock = "Brock"
Misty = "Misty"
Surge = "Surge"
Erika = "Erika"
Sabrina = "Sabrina"
Janine = "Janine"
Blaine = "Blaine"
Blue = "Blue"

gymNumber = "gymNumber"
trainerId = "trainerId"

gymTrainers = {
  Falkner: { gymNumber: 1, trainerId: 1 },
  Bugsy: { gymNumber: 2, trainerId: 3 },
  Whitney: { gymNumber: 3, trainerId: 2 },
  Morty: { gymNumber: 4, trainerId: 4 },
  Chuck: { gymNumber: 6, trainerId: 7 },
  Jasmine: { gymNumber: 5, trainerId: 6 },
  Pryce: { gymNumber: 7, trainerId: 5 },
  Clair: { gymNumber: 8, trainerId: 8 },
  Brock: { gymNumber: 9, trainerId: 16 },
  Misty: { gymNumber: 16, trainerId: 17 },
  Surge: { gymNumber: 17, trainerId: 18 },
  Erika: { gymNumber: 18, trainerId: 20 },
  Sabrina: { gymNumber: 19, trainerId: 33 },
  Janine: { gymNumber: 20, trainerId: 25 },
  Blaine: { gymNumber: 21, trainerId: 43 },
  Blue: { gymNumber: 22, trainerId: 59 }
}

function allGymsBeaten() => (jhotoBadgeCount() + kantoBadgeCount()) == 16
function rechallengeInProgress() => byte(0x00DA52) == 1
function rechallengeGymNumber(gym) => byte(0x00DA51) == gym
function isSetSixteenRechallenge() => byte(0x00DA50) == 16
function isTrainerBattle() => byte(0x00D22D) == 2
function trainerBattlingAgainst(trainer) => byte(0x00D22F) == trainer
function battleWon() {
    return (prev(byte(0x00C6FD)) == 0 && byte(0x00C6FD) == 1)
}

function winBattleAgainstTrainer(trainer) {
    return isTrainerBattle() && trainerBattlingAgainst(trainer) && battleWon()
}

function setSixteenRechallenge(trainer) {
    return once((allGymsBeaten() &&
        rechallengeInProgress() &&
        rechallengeGymNumber(gymTrainers[trainer][gymNumber]) &&
        isSetSixteenRechallenge() &&
        isTrainerBattle() &&
        trainerBattlingAgainst(gymTrainers[trainer][trainerId])) &&
        battleWon())
}

achievement(
    title = "Chicken Fried", points = 10,
    description = "Rematch Falkner on Set 16.",
    id = 83650, badge = "152528", published = "9/16/2019 8:20:24 PM", modified = "1/5/2021 7:18:22 AM",
    trigger = setSixteenRechallenge(Falkner)
)

achievement(
    title = "Bugs Squashed", points = 10,
    description = "Rematch Bugsy on Set 16.",
    id = 83651, badge = "152527", published = "9/16/2019 8:20:29 PM", modified = "1/5/2021 7:17:41 AM",
    trigger = setSixteenRechallenge(Bugsy)
)

achievement(
    title = "Crybaby Cried", points = 10,
    description = "Rematch Whitney on Set 16.",
    id = 83652, badge = "152512", published = "9/16/2019 8:20:34 PM", modified = "1/5/2021 7:00:02 AM",
    trigger = setSixteenRechallenge(Whitney)
)

achievement(
    title = "Ghosts Busted", points = 10,
    description = "Rematch Morty on Set 16.",
    id = 83653, badge = "152526", published = "9/16/2019 8:20:40 PM", modified = "1/5/2021 7:17:13 AM",
    trigger = setSixteenRechallenge(Morty)
)

achievement(
    title = "Punches Dodged", points = 10,
    description = "Rematch Chuck on Set 16.",
    id = 83654, badge = "152525", published = "9/16/2019 8:20:45 PM", modified = "1/5/2021 7:15:31 AM",
    trigger = setSixteenRechallenge(Chuck)
)

achievement(
    title = "Iron Smelted", points = 10,
    description = "Rematch Jasmine on Set 16.",
    id = 83655, badge = "152523", published = "9/16/2019 8:20:50 PM", modified = "1/5/2021 7:14:50 AM",
    trigger = setSixteenRechallenge(Jasmine)
)

achievement(
    title = "Ice Broken", points = 10,
    description = "Rematch Pryce on Set 16.",
    id = 83656, badge = "152522", published = "9/16/2019 8:20:55 PM", modified = "1/5/2021 7:14:05 AM",
    trigger = setSixteenRechallenge(Pryce)
)

achievement(
    title = "Dragons Slain", points = 10,
    description = "Rematch Clair on Set 16.",
    id = 83657, badge = "152521", published = "9/16/2019 8:21:05 PM", modified = "1/5/2021 7:13:31 AM",
    trigger = setSixteenRechallenge(Clair)
)

achievement(
    title = "Rocks Smashed", points = 10,
    description = "Rematch Brock on Set 16.",
    id = 83658, badge = "152520", published = "9/16/2019 8:21:11 PM", modified = "1/5/2021 7:12:12 AM",
    trigger = setSixteenRechallenge(Brock)
)

achievement(
    title = "Water Boiled", points = 10,
    description = "Rematch Misty on Set 16.",
    id = 83659, badge = "152519", published = "9/16/2019 8:21:16 PM", modified = "1/5/2021 7:11:40 AM",
    trigger = setSixteenRechallenge(Misty)
)

achievement(
    title = "Earth Quaked", points = 10,
    description = "Rematch Lt. Surge on Set 16.",
    id = 83660, badge = "152518", published = "9/16/2019 8:21:22 PM", modified = "1/5/2021 7:10:30 AM",
    trigger = setSixteenRechallenge(Surge)
)

achievement(
    title = "Forest Fired", points = 10,
    description = "Rematch Erika on Set 16.",
    id = 83661, badge = "152517", published = "9/16/2019 8:21:28 PM", modified = "1/5/2021 7:08:58 AM",
    trigger = setSixteenRechallenge(Erika)
)

achievement(
    title = "Mind Blown", points = 10,
    description = "Rematch Sabrina on Set 16.",
    id = 83662, badge = "152516", published = "9/16/2019 8:21:32 PM", modified = "1/5/2021 7:07:30 AM",
    trigger = setSixteenRechallenge(Sabrina)
)

achievement(
    title = "Toxic Stalled", points = 10,
    description = "Rematch Janine on Set 16.",
    id = 83663, badge = "152515", published = "9/16/2019 8:21:38 PM", modified = "1/5/2021 7:03:06 AM",
    trigger = setSixteenRechallenge(Janine)
)

achievement(
    title = "Fire Extinguished", points = 10,
    description = "Rematch Blaine on Set 16.",
    id = 83664, badge = "152514", published = "9/16/2019 8:21:43 PM", modified = "1/5/2021 7:02:28 AM",
    trigger = setSixteenRechallenge(Blaine)
)

achievement(
    title = "Blue... Blew", points = 10,
    description = "Rematch Blue on Set 16.",
    id = 83665, badge = "152513", published = "9/16/2019 8:21:48 PM", modified = "1/5/2021 7:01:19 AM",
    trigger = setSixteenRechallenge(Blue)
)

achievement(
    title = "League Simulator", points = 5,
    description = "Defeat all Battle Sim trainers. (Don't leave building, use Center, or deposit_withdraw on PC)",
    id = 83964, badge = "152533", published = "9/21/2019 10:30:11 PM", modified = "1/5/2021 7:25:24 AM",
    trigger = once(winBattleAgainstTrainer(10)) &&
        once(winBattleAgainstTrainer(14)) &&
        once(winBattleAgainstTrainer(12)) &&
        once(winBattleAgainstTrainer(13)) &&
        once(winBattleAgainstTrainer(15)) &&
        never(byte(0x00D9FB) == 1) && never(byte(0x00DCD7) != prev(byte(0x00DCD7))) &&
        never(byte(0x00C1C9) == 154) && never(currentLocation() != 90)
)

// FIXME: Wrong map for v2.5.10
achievement(
    title = "We Are The Champions", points = 10, type="win_condition",
    description = "Enter the Hall of Fame for the first time.",
    id = 83965, badge = "152532", published = "9/21/2019 10:30:16 PM", modified = "1/5/2021 7:24:19 AM",
    trigger = never(currentMap() != 2064) && repeated(5, byte(0x00D95E) == 0) && prev(byte(0x00D95E)) == 0 &&
              byte(0x00D95E) == 1
)

// FIXME: Wrong map for v2.5.10
achievement(
    title = "Now Do That 198 More Times", points = 25,
    description = "Enter the Hall of Fame again.",
    id = 83966, badge = "152531", published = "9/21/2019 10:30:22 PM", modified = "1/5/2021 7:22:52 AM",
    trigger = never(currentMap() != 2064) && never(byte(0x00D95E) <= 1) && prev(byte(0x00D95E)) < byte(0x00D95E)
)

// Ticket 36820: Achievement triggers when defeating Ethan, but doesn't trigger when defeating Crystal, despite both
//               fights triggering the end screen.
//               MD5: 02aef2b6042393f5e117dd4a4a638100
//               Emulator: RetroArch (Gambette)
achievement(
    title = "Journey Has Ended", points = 10,
    description = "Defeat ??? at Mt. Silver.",
    id = 84028, badge = "152530", published = "9/22/2019 4:20:52 PM", modified = "5/6/2021 8:01:08 PM",
    trigger = never(currentMap() != 19459) && currentMusicId() == 50 &&
              ((byte(0x00D472) == 0 && byte(0x00DA2F) == 0 && repeated(5, byte(0x00D22F) == 58)) ||
               (byte(0x00D472) == 0 && byte(0x00DA2F) == 1 && repeated(5, byte(0x00D22F) == 62)) ||
               ((byte(0x00D472) == 1 || byte(0x00D472) == 2) && byte(0x00DA2F) == 0 && repeated(5, byte(0x00D22F) == 64)) ||
               ((byte(0x00D472) == 1 || byte(0x00D472) == 2) && byte(0x00DA2F) == 1 && repeated(5, byte(0x00D22F) == 63)))
)

rechallengeCount = 0

achievement(
    title = "Legendary Sweep", points = 50,
    description = "Defeat all Gyms (R16) and then E4 (Rematch) with one Pokemon. [1 session | no dying | music not disabled]",
    id = 94406, badge = "152529", published = "1/12/2020 8:36:32 PM", modified = "1/5/2021 7:20:21 AM",
    trigger = word(0x00D857) == 65535 &&
              measured(tally(17,
              setSixteenRechallenge(Falkner),
              setSixteenRechallenge(Bugsy),
              setSixteenRechallenge(Whitney),
              setSixteenRechallenge(Morty),
              setSixteenRechallenge(Chuck),
              setSixteenRechallenge(Jasmine),
              setSixteenRechallenge(Pryce),
              setSixteenRechallenge(Clair),
              setSixteenRechallenge(Brock),
              setSixteenRechallenge(Misty),
              setSixteenRechallenge(Surge),
              setSixteenRechallenge(Erika),
              setSixteenRechallenge(Sabrina),
              setSixteenRechallenge(Janine),
              setSixteenRechallenge(Blaine),
              setSixteenRechallenge(Blue),
              once(currentMap() == 2064 && byte(0x00D95E) > 1 && currentMusicId() == 19))) &&
              never(byte(0x00DCD7) > 1) && never(word(0x00DCF4) != prev(word(0x00DCF4))) && never(byte(0x00DA48) == 1) &&
              never((byte(0x00DD01) == 0 && byte(0x00DD02) == 0))
)

achievement(
    title = "Bad Time", points = 5,
    description = "Defeat ??? in Slowpoke Well.",
    id = 83684, badge = "91076", published = "9/18/2019 4:58:47 AM", modified = "1/10/2020 4:52:20 PM",
    trigger = never(currentMap() != 10499) && repeated(5, bit5(0x00DB5F) == 0) && prev(bit5(0x00DB5F)) == 0 &&
              bit5(0x00DB5F) == 1
)

achievement(
    title = "Top Percent", points = 5,
    description = "Defeat Youngster Joey after getting all 16 Badges.",
    id = 83685, badge = "90933", published = "9/18/2019 5:43:04 AM", modified = "1/12/2020 8:54:23 AM",
    trigger = never(currentMap() != 282) && once(allGymsBeaten() && byte(0x00D206) == 19 && byte(0x00D213) == 100 &&
              never(byte(0x00D22D) != 2)) && repeated(5, byte(0x00C6FD) == 0) && prev(byte(0x00C6FD)) == 0 &&
              byte(0x00C6FD) == 1
)

achievement(
    title = "Hidden Grotto", points = 5,
    description = "Find and defeat Yellow in her secret fishing spot.",
    id = 84027, badge = "152534", published = "9/22/2019 4:20:48 PM", modified = "1/5/2021 7:26:27 AM",
    trigger = never(currentMap() != 4634) && repeated(5, bit4(0x00DB32) == 0) && prev(bit4(0x00DB32)) == 0 &&
              bit4(0x00DB32) == 1
)

achievement(
    title = "The Birds", points = 10,
    description = "Catch Articuno, Zapdos, and Moltres.",
    id = 94150, badge = "152535", published = "1/10/2020 4:38:13 PM", modified = "1/5/2021 7:27:49 AM",
    trigger = (prev(bit7(0x00DA1F)) + prev(bit0(0x00DA20)) + prev(bit1(0x00DA20))) == 2 &&
              (bit7(0x00DA1F) + bit0(0x00DA20) + bit1(0x00DA20)) == 3 && unless(byte(0x00D22D) != 1)
)

achievement(
    title = "The Not Dogs", points = 10,
    description = "Catch Raikou, Entei, and Suicune",
    id = 94151, badge = "152536", published = "1/10/2020 4:38:17 PM", modified = "1/5/2021 7:28:44 AM",
    trigger = (prev(bit2(0x00DA2C)) + prev(bit3(0x00DA2C)) + prev(bit4(0x00DA2C))) == 2 &&
              (bit2(0x00DA2C) + bit3(0x00DA2C) + bit4(0x00DA2C)) == 3 && unless(byte(0x00D22D) != 1)
)

achievement(
    title = "The Clone", points = 5,
    description = "Catch Mewtwo.",
    id = 94152, badge = "152537", published = "1/10/2020 4:38:23 PM", modified = "1/5/2021 7:29:58 AM",
    trigger = never(currentMap() != 5127) && repeated(5, bit5(0x00DA20) == 0) && prev(bit5(0x00DA20)) == 0 &&
              bit5(0x00DA20) == 1
)

achievement(
    title = "The Box Art", points = 10,
    description = "Catch Ho-Oh and Lugia.",
    id = 94153, badge = "152538", published = "1/10/2020 4:38:27 PM", modified = "1/5/2021 7:31:16 AM",
    trigger = (prev(bit0(0x00DA2D)) + prev(bit1(0x00DA2D))) == 1 && (bit0(0x00DA2D) + bit1(0x00DA2D)) == 2 &&
              unless(byte(0x00D22D) != 1)
)

achievement(
    title = "The Mythical Monsters", points = 10,
    description = "Catch Mew and Celebi.",
    id = 94154, badge = "152539", published = "1/10/2020 4:38:31 PM", modified = "1/5/2021 7:31:53 AM",
    trigger = (prev(bit6(0x00DA20)) + prev(bit2(0x00DA2D))) == 1 && (bit6(0x00DA20) + bit2(0x00DA2D)) == 2 &&
              unless(byte(0x00D22D) != 1)
)

function pokedexCount()
{
   count = 0
    for address in range(0x00DA0E, 0x00DA2C) {
        count = count + bitcount(address)
    }
    count = count + sum_of(range(0,6), b => bit(b, 0x00DA2C))
    return count
}

achievement(
    title = "Gotta Catch 'em All - Crystal Clear", points = 50,
    description = "Catch all 251 Pokemon. Yes, all of them.",
    id = 83802, badge = "91068", published = "9/19/2019 8:13:11 PM", modified = "1/20/2020 6:13:41 PM",
    trigger = never(pokedexCount() < 251) &&
              once(prev(pokedexCount()) < 251 &&
              pokedexCount() == 251) &&
              never(prev(byte(0x00DA2D)) == 0)
)

achievement(
    title = "Gotta Spell 'em All", points = 10,
    description = "Catch every variant of Unown.",
    id = 84197, badge = "152540", published = "9/26/2019 7:40:53 PM", modified = "1/5/2021 7:35:49 AM",
    trigger = (byte(0x00DED9) + byte(0x00DEDA) + byte(0x00DEDB) + byte(0x00DEDC) + byte(0x00DEDD) + byte(0x00DEDE) +
              byte(0x00DEDF) + byte(0x00DEE0) + byte(0x00DEE1) + byte(0x00DEE2) + byte(0x00DEE3) + byte(0x00DEE4) +
              byte(0x00DEE5) + byte(0x00DEE6) + byte(0x00DEE7) + byte(0x00DEE8) + byte(0x00DEE9) + byte(0x00DEEA) +
              byte(0x00DEEB) + byte(0x00DEEC) + byte(0x00DEED) + byte(0x00DEEE) + byte(0x00DEEF) + byte(0x00DEF0) +
              byte(0x00DEF1) + byte(0x00DEF2)) == 351 &&
              (byte(0x00DEF2) > prev(byte(0x00DEF2)) && prev(byte(0x00DED9)) != 0)
)

function subMap() => byte(0x00DA3B)
function isCurrentSubMap(subMapId) => subMap() == subMapId

achievement(
    title = "He Follows You Around!", points = 1,
    description = "Why doesn't every Pokemon game have this?",
    id = 83681, badge = "91112", published = "9/17/2019 8:22:07 AM", modified = "1/10/2020 4:52:11 PM",
    trigger = never(isCurrentMap(0)) && never(isCurrentSubMap(0)) && never(byte(0x00DA3A) != prev(byte(0x00DA3A))) &&
              never(byte(0x00DA3B) != prev(byte(0x00DA3B))) && repeated(10, byte(0x00DA3A) == prev(byte(0x00DA3A))) &&
              repeated(10, byte(0x00DA3B) == prev(byte(0x00DA3B))) && once(byte(0x00DA03) >= 1 && byte(0x00DA03) <= 6 &&
              prev(byte(0x00DA03)) == 0 && byte(0x00DA03) > 0)
)

achievement(
    title = "Technology is Amazing", points = 1,
    description = "Change yourself. (After having started the game)",
    id = 83682, badge = "91121", published = "9/17/2019 8:45:34 AM", modified = "1/10/2020 4:52:15 PM",
    trigger = byte(0x00DA3A) == 3 && byte(0x00DA3B) == 55 && byte(0x00DCB7) == 7 && byte(0x00DCB8) == 6 &&
              byte(0x00C1C9) == 84
)

achievement(
    title = "A Whole New (Open) World", points = 1,
    description = "Walk through the border along Route 27 for the first time.",
    id = 83799, badge = "91073", published = "9/19/2019 8:12:52 PM", modified = "1/10/2020 5:52:08 PM",
    trigger = never(currentMap() != 536) && repeated(5, bit4(0x00DB61) == 0) && prev(bit4(0x00DB61)) == 0 &&
              bit4(0x00DB61) == 1
)

achievement(
    title = "Are You Proud of Yourself?", points = 1, type="missable",
    description = "Obtain the Old Amber without asking for it.",
    id = 83800, badge = "91071", published = "9/19/2019 8:12:57 PM", modified = "1/10/2020 4:52:38 PM",
    trigger = never((currentMap() != 526 && word(0x00DCB7) != 4870)) && bit2(0x00DA7B) == 1 && byte(0x00C1C9) == 159
)

achievement(
    title = "Hack the Planet", points = 1,
    description = "Obtain the DV Viewer upgrade.",
    id = 83801, badge = "91069", published = "9/19/2019 8:13:05 PM", modified = "1/10/2020 4:52:42 PM",
    trigger = never(currentMap() != 1286) && repeated(5, bit6(0x00DA9B) == 0) && prev(bit6(0x00DA9B)) == 0 &&
              bit6(0x00DA9B) == 1
)

// Ticket 78727: Getting the red scale before getting three badges doesn't unlock the achievement I only had 1 badge
//               for Whitney which I also never got the achievement for
//               
//               RetroAchievements Hash: 02aef2b6042393f5e117dd4a4a638100
//               Emulator: RetroArch (RAVBA)
//               Emulator Version: 1.1.0.0
// Ticket 71944: I have two badges and I captured the magicarp and got the red scale but the achievement\r\n didn\'t
//               appear.\r\nI used cheat for money in the beginning but I have been disabled since then.
//               RetroAchievements Hash: 02aef2b6042393f5e117dd4a4a638100
achievement(
    title = "Golden Karp", points = 1, type="missable",
    description = "Get the Red Scale at the Lake of Rage with 3 or less badges.",
    id = 84024, badge = "152541", published = "9/22/2019 4:20:34 PM", modified = "1/5/2021 7:36:32 AM",
    trigger = (bit0(0x00D857) + bit1(0x00D857) + bit2(0x00D857) + bit3(0x00D857) + bit4(0x00D857) + bit5(0x00D857) +
              bit6(0x00D857) + bit7(0x00D857) + bit0(0x00D858) + bit1(0x00D858) + bit2(0x00D858) + bit3(0x00D858) +
              bit4(0x00D858) + bit5(0x00D858) + bit6(0x00D858) + bit7(0x00D858)) <= 3 &&
              repeated(5, bit1(0x00DB5C) == 0) && prev(bit1(0x00DB5C)) == 0 && bit1(0x00DB5C) == 1 &&
              never(currentMap() != 1545)
)

achievement(
    title = ":pigdab:", points = 1,
    description = "Find a picture of the Pokemon so rare, it's not in the dex.",
    id = 84025, badge = "91594", published = "9/22/2019 4:20:39 PM", modified = "1/10/2020 4:53:09 PM",
    trigger = never(currentMap() != 3354) && repeated(5, bit1(0x00DADF) == 0) && prev(bit1(0x00DADF)) == 0 &&
              bit1(0x00DADF) == 1
)

achievement(
    title = "It's Too Dangerous To Go Alone...", points = 1,
    description = "Have SS forge you a sword.",
    id = 84026, badge = "152543", published = "9/22/2019 4:20:43 PM", modified = "1/5/2021 7:38:09 AM",
    trigger = never(currentMap() != 4378) && repeated(5, bit2(0x00DAE4) == 0) && prev(bit2(0x00DAE4)) == 0 &&
              bit2(0x00DAE4) == 1
)

// Ticket 25694: I got Pay Day Tutor Move in Pokemon Slot 1 called Meowth in Gen 1 Kanto.<br>MD5:
//               02aef2b6042393f5e117dd4a4a638100<br>Emulator: RAVBA
achievement(
    title = "RetroAchievement for Free ~Points~ Money", points = 1,
    description = "Teach a Pokemon in slot 1 Pay Day from the Gen 1 Move Tutor in Kanto.",
    id = 84036, badge = "152544", published = "9/22/2019 9:18:33 PM", modified = "1/5/2021 7:39:11 AM",
    trigger = never(currentMap() != 3858) &&
              ((repeated(5, byte(0x00DCE1) != 6) && prev(byte(0x00DCE1)) != 6 && byte(0x00DCE1) == 6) ||
               (repeated(5, byte(0x00DCE2) != 6) && prev(byte(0x00DCE2)) != 6 && byte(0x00DCE2) == 6) ||
               (repeated(5, byte(0x00DCE3) != 6) && prev(byte(0x00DCE3)) != 6 && byte(0x00DCE3) == 6) ||
               (repeated(5, byte(0x00DCE4) != 6) && prev(byte(0x00DCE4)) != 6 && byte(0x00DCE4) == 6))
)

achievement(
    title = "No Stadium Required", points = 1,
    description = "Teach Surf to a Pikachu in slot 1.",
    id = 84037, badge = "152545", published = "9/22/2019 9:18:37 PM", modified = "1/5/2021 7:39:48 AM",
    trigger = never(byte(0x00DCDF) != 25) &&
              ((repeated(5, byte(0x00DCE1) != 57) && prev(byte(0x00DCE1)) != 57 && byte(0x00DCE1) == 57) ||
               (repeated(5, byte(0x00DCE2) != 57) && prev(byte(0x00DCE2)) != 57 && byte(0x00DCE2) == 57) ||
               (repeated(5, byte(0x00DCE3) != 57) && prev(byte(0x00DCE3)) != 57 && byte(0x00DCE3) == 57) ||
               (repeated(5, byte(0x00DCE4) != 57) && prev(byte(0x00DCE4)) != 57 && byte(0x00DCE4) == 57))
)

// Is the delay before receiving an achievement ok?
achievement(
    title = "My Radio is Haunted!", points = 1,
    description = "Tune in to a very spooky signal at the Ruins of Alph.",
    id = 84199, badge = "91595", published = "9/26/2019 9:47:58 PM", modified = "1/10/2020 4:53:45 PM",
    trigger = once(byte(0x00D958) == 52 && repeated(240, currentMusicId() == 70))
)

achievement(
    title = "Just Chill", points = 1,
    description = "Sit on a bench.",
    id = 94347, badge = "103950", published = "1/12/2020 6:56:43 AM", modified = "3/10/2020 11:07:23 PM",
    trigger = prev(word(0x00D4E6)) == 2824 && word(0x00D4E6) == 3080 && currentMap() == 1040
)

achievement(
    title = "An Odd Egg", points = 5,
    description = "Hatch a Shiny Pokemon from an Egg. (Not Ditto)",
    id = 80923, badge = "87267", published = "8/19/2019 7:43:55 PM", modified = "1/12/2020 10:30:00 PM",
    trigger = prev(byte(0x00C1C9)) == 0 && byte(0x00C1C9) == 2 &&
              ((unless(byte(0x00DCD8) == 132) && prior(byte(0x00DCD8)) == 253 && prior(byte(0x00DCFA)) == 0 &&
                unless(high4(0x00DCF4) == 1) && unless(high4(0x00DCF4) == 4) && unless(high4(0x00DCF4) == 5) &&
                unless(high4(0x00DCF4) == 8) && unless(high4(0x00DCF4) == 9) && unless(high4(0x00DCF4) == 12) &&
                unless(high4(0x00DCF4) == 13) && low4(0x00DCF4) == 10 && high4(0x00DCF5) == 10 && low4(0x00DCF5) == 10) ||
               (unless(byte(0x00DCD9) == 132) && prior(byte(0x00DCD9)) == 253 && prior(byte(0x00DD2A)) == 0 &&
                unless(high4(0x00DD24) == 1) && unless(high4(0x00DD24) == 4) && unless(high4(0x00DD24) == 5) &&
                unless(high4(0x00DD24) == 8) && unless(high4(0x00DD24) == 9) && unless(high4(0x00DD24) == 12) &&
                unless(high4(0x00DD24) == 13) && low4(0x00DD24) == 10 && high4(0x00DD25) == 10 && low4(0x00DD25) == 10) ||
               (unless(byte(0x00DCDA) == 132) && prior(byte(0x00DCDA)) == 253 && prior(byte(0x00DD5A)) == 0 &&
                unless(high4(0x00DD54) == 1) && unless(high4(0x00DD54) == 4) && unless(high4(0x00DD54) == 5) &&
                unless(high4(0x00DD54) == 8) && unless(high4(0x00DD54) == 9) && unless(high4(0x00DD54) == 12) &&
                unless(high4(0x00DD54) == 13) && low4(0x00DD54) == 10 && high4(0x00DD55) == 10 && low4(0x00DD55) == 10) ||
               (unless(byte(0x00DCDB) == 132) && prior(byte(0x00DCDB)) == 253 && prior(byte(0x00DD8A)) == 0 &&
                unless(high4(0x00DD84) == 1) && unless(high4(0x00DD84) == 4) && unless(high4(0x00DD84) == 5) &&
                unless(high4(0x00DD84) == 8) && unless(high4(0x00DD84) == 9) && unless(high4(0x00DD84) == 12) &&
                unless(high4(0x00DD84) == 13) && low4(0x00DD84) == 10 && high4(0x00DD85) == 10 && low4(0x00DD85) == 10) ||
               (unless(byte(0x00DCDC) == 132) && prior(byte(0x00DCDC)) == 253 && prior(byte(0x00DDBA)) == 0 &&
                unless(high4(0x00DDB4) == 1) && unless(high4(0x00DDB4) == 4) && unless(high4(0x00DDB4) == 5) &&
                unless(high4(0x00DDB4) == 8) && unless(high4(0x00DDB4) == 9) && unless(high4(0x00DDB4) == 12) &&
                unless(high4(0x00DDB4) == 13) && low4(0x00DDB4) == 10 && high4(0x00DDB5) == 10 && low4(0x00DDB5) == 10) ||
               (unless(byte(0x00DCDD) == 132) && prior(byte(0x00DCDD)) == 253 && prior(byte(0x00DDEA)) == 0 &&
                unless(high4(0x00DDE4) == 1) && unless(high4(0x00DDE4) == 4) && unless(high4(0x00DDE4) == 5) &&
                unless(high4(0x00DDE4) == 8) && unless(high4(0x00DDE4) == 9) && unless(high4(0x00DDE4) == 12) &&
                unless(high4(0x00DDE4) == 13) && low4(0x00DDE4) == 10 && high4(0x00DDE5) == 10 && low4(0x00DDE5) == 10))
)

// Ticket 30642: I moved the truck and got the mew data but the achievement hasn't triggered. I checked the dex after
//               moving the truck and sure enough I have the data. Do I need to wait a bit longer or what?<br>MD5:
//               Unknown<br>Emulator: RetroArch (Gambatte)
achievement(
    title = "You Know What to Do", points = 5, type="missable",
    description = "Find something under the truck. (Without having seen data before)",
    id = 83688, badge = "91074", published = "9/18/2019 2:36:59 PM", modified = "1/10/2020 4:52:31 PM",
    trigger = never(currentLocation() != 61) && once(byte(0x00DBF5) == 1 && bit6(0x00DECB) == 1 &&
              prev(bit6(0x00DECB)) < bit6(0x00DECB) && prev(bit0(0x00DECB)) == bit0(0x00DECB) &&
              prev(bit1(0x00DECB)) == bit1(0x00DECB) && prev(bit2(0x00DECB)) == bit2(0x00DECB) &&
              prev(bit3(0x00DECB)) == bit3(0x00DECB) && prev(bit4(0x00DECB)) == bit4(0x00DECB) &&
              prev(bit5(0x00DECB)) == bit5(0x00DECB) && prev(bit7(0x00DECB)) == bit7(0x00DECB))
)

achievement(
    title = "Fun With Letters", points = 5,
    description = "Teach an Unown a second move.",
    id = 84198, badge = "152549", published = "9/26/2019 7:40:58 PM", modified = "1/5/2021 7:50:00 AM",
    trigger = never(currentMap() != 5635) &&
              ((byte(0x00DCDF) == 201 && byte(0x00DCE1) == 237 && prev(byte(0x00DCE2)) == 0 && byte(0x00DCE2) > 0) ||
               (byte(0x00DD0F) == 201 && byte(0x00DD11) == 237 && prev(byte(0x00DD12)) == 0 && byte(0x00DD12) > 0) ||
               (byte(0x00DD3F) == 201 && byte(0x00DD41) == 237 && prev(byte(0x00DD42)) == 0 && byte(0x00DD42) > 0) ||
               (byte(0x00DD6F) == 201 && byte(0x00DD71) == 237 && prev(byte(0x00DD72)) == 0 && byte(0x00DD72) > 0) ||
               (byte(0x00DD9F) == 201 && byte(0x00DDA1) == 237 && prev(byte(0x00DDA2)) == 0 && byte(0x00DDA2) > 0) ||
               (byte(0x00DDCF) == 201 && byte(0x00DDD1) == 237 && prev(byte(0x00DDD2)) == 0 && byte(0x00DDD2) > 0))
)

achievement(
    title = "What's Your Password?", points = 5,
    description = "Max out your Blue Card and get Buena's Number.",
    id = 94136, badge = "152550", published = "1/10/2020 1:33:24 PM", modified = "1/5/2021 7:50:02 AM",
    trigger = never(currentMap() != 4611) && measured(byte(0x00DC4B) == 30) && byte(0x00C1C9) == 147
)

// Ticket 24048: didn't trigger on egg hatching<br>MD5: 02aef2b6042393f5e117dd4a4a638100<br>Emulator: RAVBA
achievement(
    title = "The Oddest Egg", points = 5,
    description = "Hatch a Shiny Ditto from an Egg.",
    id = 94148, badge = "103948", published = "1/10/2020 4:38:01 PM", modified = "1/12/2020 10:36:44 PM",
    trigger = prev(byte(0x00C1C9)) == 0 && byte(0x00C1C9) == 2 &&
              ((byte(0x00DCD8) == 132 && prior(byte(0x00DCD8)) == 253 && prior(byte(0x00DCFA)) == 0 &&
                unless(high4(0x00DCF4) == 1) && unless(high4(0x00DCF4) == 4) && unless(high4(0x00DCF4) == 5) &&
                unless(high4(0x00DCF4) == 8) && unless(high4(0x00DCF4) == 9) && unless(high4(0x00DCF4) == 12) &&
                unless(high4(0x00DCF4) == 13) && low4(0x00DCF4) == 10 && high4(0x00DCF5) == 10 && low4(0x00DCF5) == 10) ||
               (byte(0x00DCD9) == 132 && prior(byte(0x00DCD9)) == 253 && prior(byte(0x00DD2A)) == 0 &&
                unless(high4(0x00DD24) == 1) && unless(high4(0x00DD24) == 4) && unless(high4(0x00DD24) == 5) &&
                unless(high4(0x00DD24) == 8) && unless(high4(0x00DD24) == 9) && unless(high4(0x00DD24) == 12) &&
                unless(high4(0x00DD24) == 13) && low4(0x00DD24) == 10 && high4(0x00DD25) == 10 && low4(0x00DD25) == 10) ||
               (byte(0x00DCDA) == 132 && prior(byte(0x00DCDA)) == 253 && prior(byte(0x00DD5A)) == 0 &&
                unless(high4(0x00DD54) == 1) && unless(high4(0x00DD54) == 4) && unless(high4(0x00DD54) == 5) &&
                unless(high4(0x00DD54) == 8) && unless(high4(0x00DD54) == 9) && unless(high4(0x00DD54) == 12) &&
                unless(high4(0x00DD54) == 13) && low4(0x00DD54) == 10 && high4(0x00DD55) == 10 && low4(0x00DD55) == 10) ||
               (byte(0x00DCDB) == 132 && prior(byte(0x00DCDB)) == 253 && prior(byte(0x00DD8A)) == 0 &&
                unless(high4(0x00DD84) == 1) && unless(high4(0x00DD84) == 4) && unless(high4(0x00DD84) == 5) &&
                unless(high4(0x00DD84) == 8) && unless(high4(0x00DD84) == 9) && unless(high4(0x00DD84) == 12) &&
                unless(high4(0x00DD84) == 13) && low4(0x00DD84) == 10 && high4(0x00DD85) == 10 && low4(0x00DD85) == 10) ||
               (byte(0x00DCDC) == 132 && prior(byte(0x00DCDC)) == 253 && prior(byte(0x00DDBA)) == 0 &&
                unless(high4(0x00DDB4) == 1) && unless(high4(0x00DDB4) == 4) && unless(high4(0x00DDB4) == 5) &&
                unless(high4(0x00DDB4) == 8) && unless(high4(0x00DDB4) == 9) && unless(high4(0x00DDB4) == 12) &&
                unless(high4(0x00DDB4) == 13) && low4(0x00DDB4) == 10 && high4(0x00DDB5) == 10 && low4(0x00DDB5) == 10) ||
               (byte(0x00DCDD) == 132 && prior(byte(0x00DCDD)) == 253 && prior(byte(0x00DDEA)) == 0 &&
                unless(high4(0x00DDE4) == 1) && unless(high4(0x00DDE4) == 4) && unless(high4(0x00DDE4) == 5) &&
                unless(high4(0x00DDE4) == 8) && unless(high4(0x00DDE4) == 9) && unless(high4(0x00DDE4) == 12) &&
                unless(high4(0x00DDE4) == 13) && low4(0x00DDE4) == 10 && high4(0x00DDE5) == 10 && low4(0x00DDE5) == 10))
)

// Ticket 37119: Reached round 7 as the achievement instructed me, and didn't get the achievement. This was a huge
//               timesink due to the amount of luck required, and I lost my run at round 7 anyway due to, again, bad
//               luck.
//               MD5: Unknown
//               Emulator: RALibRetro (VBA-M 2.1.3)
goldenrodGameCorner = 4875
function isInGoldenrodGameCorner() => never(!isCurrentMap(goldenrodGameCorner))
function currentVoltorbFlipLevel() => byte(0x00C41A)
function reachedLevelSix() => repeated(5, currentVoltorbFlipLevel() == 6)
function wonLevelSix() => prev(currentVoltorbFlipLevel()) == 6 && measured(currentVoltorbFlipLevel() == 7, when = currentMap() == goldenrodGameCorner)

achievement(
    title = "Family Friendly Alternative", points = 10,
    description = "Reach Round 7 in Voltorb Flip. (Goldenrod)",
    id = 84038, badge = "152546", published = "9/22/2019 9:18:44 PM", modified = "1/5/2021 7:49:40 AM",
    trigger = isInGoldenrodGameCorner() && 
                reachedLevelSix() && 
                wonLevelSix()
)

// Ticket 26837: Triggered on first win with Triple 7s
//               
//               Rich Presence at time of trigger:
//               CLEAR, 🎖3/16 📱10/251 ⏰5:07<br>MD5: 02aef2b6042393f5e117dd4a4a638100
// Ticket 24025: did it with accidently selecting a few 3s in between them and didn't unlock. Did it again making sure
//               to only select 1 and still didn't pop. jltn was watching when i did it<br>MD5:
//               02aef2b6042393f5e117dd4a4a638100<br>Emulator: RAVBA

celadonGameCorner = 4629
slotsSound = 157

function betAmount() => byte(0x00C70A)
function amountWon() => word(0x00C711)

function isInCeladonGameCorner() => (never(!isCurrentMap(celadonGameCorner)) && never(currentSFX() == slotsSound))
function betAmountIsOne() => once(betAmount() != 1)
function recordWin() => amountWon() > prev(amountWon())
function winThreeTimes() => measured(repeated(3, recordWin()))
function slotsCheatingMeasures() => never(betAmount() > 3) && never(amountWon() > 300)


achievement(
    title = "1 Credit Clear", points = 10,
    description = "Win in the slots three times by betting one coin. (Don't leave machine) (Celadon)",
    id = 84039, badge = "152548", published = "9/22/2019 9:18:49 PM", modified = "1/5/2021 7:49:41 AM",
    trigger = isInCeladonGameCorner() &&
              betAmountIsOne() &&
              winThreeTimes() &&
              slotsCheatingMeasures()
)

achievement(
    title = "ShockSlayer's Final Challenge", points = 25,
    description = "You've beaten the game entirely.",
    id = 94149, badge = "152547", published = "1/10/2020 4:38:09 PM", modified = "1/5/2021 7:49:38 AM",
    trigger = never(currentMap() != 4378) && repeated(5, bit7(0x00DA94) == 0) && prev(bit7(0x00DA94)) == 0 &&
              bit7(0x00DA94) == 1
)

achievement(
    title = "The Mascot", points = 5, type="missable",
    description = "Catch Pigy. (missable info in comments)",
    id = 94155, badge = "103949", published = "1/10/2020 4:38:35 PM", modified = "3/10/2020 11:05:35 PM",
    trigger = never(currentMap() != 4378) && repeated(5, bit0(0x00DA9E) == 0) && prev(bit0(0x00DA9E)) == 0 &&
              bit0(0x00DA9E) == 1 && once(byte(0x00C1C9) == 2) && prior(byte(0x00D22E)) == 220
)

achievement(
    title = "HOF Master", points = 50,
    description = "Enter the Hall of Fame for the 200th time.",
    id = 84009, badge = "103944", published = "9/22/2019 10:58:42 AM", modified = "5/1/2020 5:37:37 PM",
    trigger = never(currentMap() != 2064) && repeated(5, byte(0x00D95E) == 199) && prev(byte(0x00D95E)) == 199 &&
              measured(byte(0x00D95E) == 200)
)
