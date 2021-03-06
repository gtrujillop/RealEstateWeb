# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items.
  # Defaults to 'selected' navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name, item| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # If this option is set to true, all item names will be considered as safe (passed through html_safe). Defaults to false.
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.renderer = SimpleNavigationRenderers::Bootstrap3

  navigation.items do |primary|

    primary.item :user_options, {icon: "glyphicon glyphicon-list", title: "Menu"}, if: -> { current_user } do |user_options|

      user_options.item :propiedades, 'Propiedades', '#', if: -> { current_user.is_a?(LeaseHolder) } do |propiedades|
        propiedades.item :mostrar, 'Mis Propiedades', user_properties_path(current_user.id)
        propiedades.item :agregar, 'Registrar Propiedad', new_user_property_path(current_user.id)
      end

      user_options.item :operaciones, 'Operaciones', '#', if: -> { current_user.is_a?(LeaseHolder) || current_user.is_a?(Consultant) } do |operaciones|
        operaciones.item :show, 'Mis Operaciones', '#'
        operaciones.item :show, 'Nueva Operación', new_user_operation_path(current_user.id)
      end

      user_options.item :usuarios, 'Usuarios', '#', if: -> { current_user.is_admin? } do |usuarios|
        usuarios.item :show, 'Listar', '#'
        usuarios.item :show_roles, 'Roles', '#'
      end

      user_options.item :lugares, 'Lugares', '#', if: -> { current_user.is_admin? } do |lugares|
        lugares.item :show, 'Cargar', new_location_path
        lugares.item :show_roles, 'Ver todos', '#'
      end


    end

    primary.dom_class = 'nav'

  end
end
