class Admin::SkillsController < AdminController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      redirect_to admin_skills_path, notice: "Skill sucessfully saved!"
    else
      flash[:alert] = "Saving skill failed! Errors are: #{@skill.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      redirect_to admin_skills_path, notice: "Skill sucessfully updated!"
    else
      flash[:alert] = "Saving skill failed! Errors are: #{@skill.errors.full_messages.join(', ')}"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end