class RoomAssigner
  ROOM_SIZE = 5.0
  MINIMUM_USER_ROOM_COUNT = 2

  def initialize
    case Time.now.wday
    when 0
      @next_monday = 1.day.from_now.to_date
    when 1
      @next_monday = Time.now.to_date # today is Monday!
    else
      @next_monday = Date.today.next_week(:monday)
    end

    @room_count = (User.count / ROOM_SIZE).ceil
  end

  def perform_assignments
    @next_room = Room.create(opened_at: @next_monday)
    rooms_created_count = 1

    User.all.shuffle.each do |user|
      if @next_room.users.count >= ROOM_SIZE
        @next_room = Room.create(opened_at: @next_monday)
        rooms_created_count += 1
      end

      @next_room << user
    end

    if @room_count != rooms_created_count
      Rails.logger.warn("Expected room count (#{@room_count}) did not match actual created room count (#{rooms_created_count}) for week #{@next_monday}")
    end

    if @next_room.users.count < MINIMUM_USER_ROOM_COUNT
      random_room_from_the_week = Room.where(opened_at: @next_monday)
                                      .where.not(id: @next_room.id)
      
      @next_room.users.each do |user|
        random_room_from_the_week << user
      end

      @next_room.destroy
    end
  end
end