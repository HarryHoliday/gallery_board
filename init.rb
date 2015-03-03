require 'redmine'

require 'gallery_board_patch'

Redmine::Plugin.register :gallery_board do
  name 'Gallery Board plugin'
  author 'Harry Holiday'
  description 'To change style to gallery board from default board style as table'
  version '1.0.0'

  settings :default => {'style' => 1}, :partial => 'settings/gallery_board'
end
