# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
clickSwitch = ->

  setState = (isA) ->
    btnA.className = if isA == 0 then 'btn inactive' else 'btn'
    # Aのとき非表示
    divA.className = if isA == 0 then 'boxDisplay' else 'boxNone'
    # Aのとき表示
    btnB.className = if isA == 1 then 'btn inactive' else 'btn'
    # Bのとき非表示
    divB.className = if isA == 1 then 'boxDisplay' else 'boxNone'
    # Bのとき表示
    return

  'use strict'
  isA = 0
  # 現在地判定
  btnA = document.getElementById('a')
  btnB = document.getElementById('b')
  divA = document.getElementById('divA')
  divB = document.getElementById('divB')
  setState 0
  btnA.addEventListener 'click', ->
    if isA == 0
      return
    isA = 0
    setState 0
    return
  btnB.addEventListener 'click', ->
    if isA == 1
      return
    isA = 1
    setState 1
    return
  return

document.addEventListener 'DOMContentLoaded', clickSwitch, false
