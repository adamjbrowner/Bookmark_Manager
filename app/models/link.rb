require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
class Link
# add DataMapper functionality to this class so it can communicate with the database
include DataMapper::Resource
# these property declarations set the column headers in the 'links' table
  has n, :tags, through: Resource
  property :id, Serial # Serial means that it will be auto-incremented for every record
  property :title, String
  property :url, String
end
