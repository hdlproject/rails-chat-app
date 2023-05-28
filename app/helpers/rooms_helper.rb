module RoomsHelper
  def get_formatted_room_rows(rooms)
    items = []
    rooms.each do |room|
      item = {
        text: format(
          '[%<room_type>s] %<room_members>s',
          room_type: room.room_type,
          room_members: room.members.map { |member| member.name }.join(' - ')
        ),
        room_id: room.id
      }
      items.push(item)
    end

    items
  end
end
