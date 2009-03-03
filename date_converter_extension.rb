# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class DateConverterExtension < Radiant::Extension
  version "0.1"
  description "Simple Radiant extension, adds tag <r:date_converter> for converting date from one format to another"
  url "http://github.com/astashov/radiant-date-converter-extension/tree/master"
  
  def activate
    Page.send :include, DateConverterTags
  end
  
  def deactivate
  end
  
end
