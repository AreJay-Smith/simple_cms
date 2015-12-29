class SectionsController < ApplicationController
  def index
    @section = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Sections was successfully saved!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.upadte_attributes(sections_params)
      flash[:notice] = "Upadated Successfully!"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')


  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Page was successfully destroyed!"
    redirect_to(:action => 'index')
  end

private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

end
