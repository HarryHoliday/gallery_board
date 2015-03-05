require_dependency 'settings_controller'

module GallerySettingPatch
    def self.included(base)
        base.send(:include, InstanceMethods)

        base.class_eval do
            alias_method_chain :plugin, :gallery
        end
    end

    module InstanceMethods
        def plugin_with_gallery
            @boards = Board.all
            return plugin_without_gallery
        end
    end
end

SettingsController.send(:include, GallerySettingPatch)
