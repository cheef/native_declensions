require 'che_native_declensions'
require 'hash_extension'
ActiveRecord::Base.send(:include, Che::NativeDeclensions)
ActionView::Base.send(:include, Che::NativeDeclensionsHelper)