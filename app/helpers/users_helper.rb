module UsersHelper
  def get_room
    Room.unactive.pluck:name, :id 
  end 
end
