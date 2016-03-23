###
Raconteur story scaffold, copyright (c) Bruno Dias 2015.

Distributed under the MIT license. See LICENSE for information.

In a finished game file, almost all of this scaffold will have been replaced
by new content (the new game does not carry "substantial parts" of this code)
so this copyright notice may be removed and replaced with your own.
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

# ----------------------------------------------------------------------------
# IFID and game version - Edit this

undum.game.id = "659fb84c-62ed-4d1c-ba01-89c9316e3270" #UUID
undum.game.version = "0.1"

# ----------------------------------------------------------------------------
# Game content

situation 'start',
  content: """
  ![a storyteller](img/storyteller.jpg)

  # Welcome to Raconteur

  If you're seeing this, you've successfully installed the Raconteur game
  scaffold. Get writing! 

  Raconteur lives at a [Github Repository], where you can report issues or
  send feedback.

  [Github Repository]: https://github.com/sequitur/raconteur
  """

# ----------------------------------------------------------------------------
# Qualities

qualities


#-----------------------------------------------------------------------------
# Initialise Undum

undum.game.init = (character, system) ->
  # Add initialisation code here

# Get the party started when the DOM is ready.

window.onload = undum.begin