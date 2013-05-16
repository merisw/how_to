class InstructionsController < ApplicationController
  before_filter :find_instruction, :only => [:show, :edit, :update, :destroy]

  def index
    @instructions = Instruction.all
  end

  def new
    @instruction = Instruction.new
  end

  def create
    @instruction = Instruction.new(params[:instruction])
    if @instruction.save
      flash[:notice] = "Instruction set has been created."
      redirect_to @instruction
    else
      flash[:alert] = "Instruction set has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @instruction.update_attributes(params[:instruction])
      flash[:notice] = "Instruction set has been updated."
      redirect_to @instruction
    else
      flash[:alert] = "Instructions have not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @instruction.destroy
    flash[:notice] = "Instructions have been deleted."
    redirect_to instruction_path
  end

  private
    def find_instruction
      @instruction = Instruction.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The instruction set you were looking for could not be found."
      redirect_to instructions_path
    end

end
