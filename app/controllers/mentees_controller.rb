class MenteesController < ApplicationController
  before_action :set_mentee, only: %i[ show edit update destroy ]

  def index
    @mentees = Mentee.all
  end

  def show
  end

  def new
    @mentee = Mentee.new
  end

  def create
    @mentee = Mentee.new(mentee_params)
    if @mentee.save
      redirect_to @mentee, notice: "Mentora criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mentee.update(mentee_params)
      redirect_to @mentee, notice: "Mentorada atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @mentee.destroy
    redirect_to mentees_path, notice: "Mentorada removido com sucesso."
  end

  private

  def set_mentee
    @mentee = Mentee.find(params[:id])
  end

  def mentee_params
    params.expect(mentee: [ :name, :email, :linkedin_url, :bio ])
  end
end
