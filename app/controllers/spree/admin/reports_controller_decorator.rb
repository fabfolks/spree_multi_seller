Spree::Admin::ReportsController.class_eval do
  def model_class
    Spree::Report
  end
end

#FIXME:: Dirty Hack, to get around CanCan ability check,
# as Spree::Admin::ReportsController does not have a 
# corresponding model. Ideal way is to override
# authorize_admin not look into model_class and somehow pass in
# :class => flase for those controllers without model.
class Spree::Report

end
