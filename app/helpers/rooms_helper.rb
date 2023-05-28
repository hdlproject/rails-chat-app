module RoomsHelper
  def get_formatted_room_rows(rooms)
    items = []
    rooms.each do |room|
      item = {
        text: "[%s] %s" % [room.room_type, room.members.map { |member| member.name }.join(' - ')],
        room_id: room.id,
      }
      items.push(item)
    end

    items
  end
end
