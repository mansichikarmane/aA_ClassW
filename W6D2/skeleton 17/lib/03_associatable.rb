require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      :primary_key => :id,
      :foreign_key => "#{name}_id".to_sym,
      :class_name => name.to_s
    }
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    :primary_key => :id,
    :foreign_key => name.to_s.singularize
    :primary_key => :id
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
