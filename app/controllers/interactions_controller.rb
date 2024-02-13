class InteractionsController < ApplicationController

  before_action :set_interaction, only: [:show, :update, :destroy]

  def index
    @interactions = Interaction.all
    render json: @interactions, each_serializer: InteractionSerializer
  end

  def show
    interaction = Interaction.find(params[:id])
    render json: interaction, serializer: InteractionSerializer
  end

  def create
    @interaction = Interaction.new(interaction_params)

    if @interaction.save
      render json: @interaction, status: :created, location: @interaction
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @interaction.update(interaction_params)
      render json: @interaction
    else
      render json: @interaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @interaction.destroy
      render json: { message: 'Interaction Destroyed Successfully' }, status: :ok
    else
      render json: { message: 'Failed to Destroy Interaction' }, status: :unprocessable_entity
    end
  end

  private

  def set_interaction
    @interaction = Interaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Record Not Found' }, status: :not_found
  end

  def interaction_params
    params.require(:interaction).permit(:description, :date_time, :interaction_type, :status, :contact_id)
  end

end