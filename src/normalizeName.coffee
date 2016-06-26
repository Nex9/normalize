_ = require('lodash')

normalizeName = (s) ->
  return if typeof s isnt 'string'

  s = s.trim().toLowerCase()

  specialCharMapping =
    "ä": "ae"
    "ö": "oe"
    "ü": "ue"
    "&": "and"
    "+": "and"
    "ß": "ss"
    "@": "at"

  s = s.replace(new RegExp(key, 'g'), value) for key, value of specialCharMapping

  _.deburr(s.
    #remove all punctuation and special characters
    replace(/[\.,#¡!?¿@$%\^&\*;:{}='`‘’“”„"~()\?><\[\]†‡‹›•™¦©®ª«»¬°¹²³µ¶·º℅ⁿ§¨‣‼№♠♣♦♥←→↑↓♀♂♩♪♬♭]/g, '').
    # replace every slash, underscore, overscore, space and backslash with '-'
    replace(/\/|\_|\‾|\ |\\/g, '-').
    # replace multiple occurences of - with one only -
    replace(/\-+/g, '-').
    # remove leading and trailing -
    replace(/^-|-$/g, '')
  )


module.exports = normalizeName