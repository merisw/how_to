class StepsController < ApplicationController
  before_filter :find_instruction
  before_filter :find_step, :only => [:show, :edit, :update, :destroy]

  def new
    @step = @instruction.steps.build
  end

  def create
    @step = @instruction.steps.build(params[:step])
    if @step.save
      flash[:notice] = "Step has been created."
      redirect_to [@instruction, @step]
    else
      flash[:alert] = "Step has not been created."
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @step.update_attributes(params[:step])
      flash[:notice] = "Step has been updated."
      redirect_to [@instruction, @step]
    else
      flash[:alert] = "Step has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @step.destroy
    flash[:notice] = "Step has been deleted."
    redirect_to @instruction
  end

  private
  def find_instruction
    @instruction = Instruction.find(params[:instruction_id])
  end

  def find_step
    @step = @instruction.steps.find(params[:id])
  end

end
