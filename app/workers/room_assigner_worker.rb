class RoomAssignerWorker
  include Sidekiq::Job

  def perform
    room_assigner = RoomAssigner.next_week
    room_assigner.perform_assignments
  end
end