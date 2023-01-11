class RoomAssignerWorker
  include Sidekiq::Job

  def perform
    room_assigner = RoomAssigner.new
    room_assigner.perform_assignments
  end
end