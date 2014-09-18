Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "sellers_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:sellers) %>",
                     :disabled => false)
#override logo
Deface::Override.new(:virtual_path => "spree/admin/shared/_header",
                     :name => "replace_logo",
                     :replace=> "[data-hook='logo-wrapper']",
                     :partial => "spree/admin/shared/logo",
                     :disabled => false)