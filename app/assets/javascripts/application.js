// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$ ->
  #ボタンをクリックしたら発動
  $('btn').click ->
    #ボタンの横に要素を作成
    $(this).after ''
    return
  #上で生成した要素に普通のホバーイベントを発動
  $('#hover').hover (->
    #マウスを乗せたら色が変わる
    $(this).css 'background', '#c00'
    #ここにはマウスを離したときの動作を記述
    return
  ), ->
    #色指定を空欄にすれば元の色に戻る
    $(this).css 'background', '#59EFC1'
    return
  return

