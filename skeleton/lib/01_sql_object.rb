require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns 
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      SQL
  
      @columns = cols.map{|col| col.to_sym}
      @columns 
  end


  def self.table_name=(table_name)
    # ...
    @table_name = table_name 
  end

  def self.table_name
    # ... 
    @table_name ||= self.to_s.tableize 
    
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
  def self.finalize!
    columns.each do |column|
      define_method(column) do
        return attributes[column]
      end
      
      
      define_method("#{column}=") do |value|
        self.attributes[column] = value 
      end 
    end 
    
  end 
end













