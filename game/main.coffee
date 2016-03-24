###

Based on the Raconteur story scaffold, copyright (c) Bruno Dias 2015.

Distributed under the MIT license. See LICENSE for information.

###

# Require the libraries we rely on

situation = require('raconteur')
undum = require('undum-commonjs')
oneOf = require('raconteur/lib/oneOf.js')
elements = require('raconteur/lib/elements.js')
qualities = require('raconteur/lib/qualities.js')

a = elements.a
span = elements.span
img = elements.img
p = (content) -> "<p>" + content + "</p>"

# ----------------------------------------------------------------------------
# IFID and game version - Edit this

undum.game.id = "659fb84c-62ed-4d1c-ba01-89c9316e3270" #UUID
undum.game.version = "0.1"

# ----------------------------------------------------------------------------
# Helper functions

# Function that makes content appear after a number of seconds have passed
# The `action` parameter should be the id of an action in the actions object of the parent situation
appearAfter = (system, seconds, action) ->
	seconds *= 1000
	action = "./_writer_" + action
	setTimeout(
		(() ->
			system.doLink(action)
		), 
		seconds)
	"" #return an empty string

# ----------------------------------------------------------------------------
# Game content

situation 'start',
	content: (character, system) ->
		"""
		*\"Cities, like dreams, are made of [desires and fears](intro),
		even if the thread of their discourse is secret, 
		their rules are absurd, their perspectives deceitful,
		and everything conceals something else.\"*

		-- Italo Calvino, Invisible Cities
		<br>
		<br>
		"""
situation 'intro',
	content: (character, system) ->
		"""
		A fire crackles and pops in the hearth.
		<br>
		<br>
		#{ appearAfter(system, 2, 'old-man') }

		"""
	writers:
		"old-man": (character, system) ->
			"""
			In a velvet armchair before the ornate fireplace sits an old man. His thick hair, 
			the color of dirty snow, frames his lined face. His suit, though worn, is impeccable. 
			White smoke from his wooden pipe mingles with sooty fumes from the fire.
			
			#{ appearAfter(system, 2, 'he-speaks') }

			"""
		"he-speaks": (character, system) ->
			"""
				[He speaks](opening_monologue):
			"""

situation 'opening_monologue',
	content:
		"""
			\"There are some cities so heavy with memory that they resist the flow of time. 
			Each generation walks upon the bones of the generations that came before, and make their small marks 
			only to be buried beneath the feet of their children and their children's children. But the city remains 
			-- or rather, new cities are built on top of the old, and no matter how deep you dig there will be another 
			layer of cracked streets and faded murals and ghosts.\"  

			\"Poets have written more verses of glittering Adriata by the sea than there are grains of sand on her beaches. 
			Historians have chronicled her many triumphs and lamented her ancient defeats. But the memory of Adriata's marble 
			walls stretches past the time of the most ancient histories, and beneath her cobbled streets lie secrets entombed for 
			millennia. Sometimes, when the passing footstep of an errant child disturbs earth long undisturbed or the song of a 
			love-struck youth finds its way into rooms that have not known song for a century, something shifts in the delicate 
			architecture of Adriata's jumbled past. Cracks begin to form - and if you are very watchful, and very patient, you might 
			find a way to slip into these cracks and explore her secrets long forgotten.\"     

			\"My story begins in Adriata, and it ends in Adriata, just as all stories ultimately begin and end in Adriata. Listen 
			carefully, for like the city itself this story conceals its roots with its substance, and somewhere beneath its intricate 
			surface lies the ghost of truth...\"

		"""

#-----------------------------------------------------------------------------
# Initialise Undum

undum.game.init = (character, system) ->
  # Add initialisation code here

# Get the party started when the DOM is ready.

window.onload = undum.begin