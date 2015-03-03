require_dependency 'boards_controller'

module GalleryBoardPatch
    def self.included(base)
        base.send(:include, InstanceMethods)

        base.class_eval do
            alias_method_chain :show, :gallery
        end
    end

    module InstanceMethods
        def show_with_gallery
            @plugin = Redmine::Plugin.find('gallery_board')
            @settings = Setting.send "plugin_#{@plugin.id}"
            @style = @settings['style']
            return show_without_gallery
        end
    end
end

BoardsController.send(:include, GalleryBoardPatch)
