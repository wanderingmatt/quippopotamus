class QuipsController < ApplicationController
  # GET /quips
  # GET /quips.xml
  def index
    @quips = Quip.find(:all)
    @tags = tag_list

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quips }
    end
  end

  # GET /quips/1
  # GET /quips/1.xml
  def show
    @quip = Quip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quip }
    end
  end

  # GET /quips/new
  # GET /quips/new.xml
  def new
    @quip = Quip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quip }
    end
  end

  # GET /quips/1/edit
  def edit
    @quip = Quip.find(params[:id])
  end

  # POST /quips
  # POST /quips.xml
  def create
    @quip = Quip.new(params[:quip])

    respond_to do |format|
      if @quip.save
        flash[:notice] = 'Quip was successfully created.'
        format.html { redirect_to(@quip) }
        format.xml  { render :xml => @quip, :status => :created, :location => @quip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quips/1
  # PUT /quips/1.xml
  def update
    @quip = Quip.find(params[:id])

    respond_to do |format|
      if @quip.update_attributes(params[:quip])
        flash[:notice] = 'Quip was successfully updated.'
        format.html { redirect_to(@quip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quips/1
  # DELETE /quips/1.xml
  def destroy
    @quip = Quip.find(params[:id])
    @quip.destroy

    respond_to do |format|
      format.html { redirect_to(quips_url) }
      format.xml  { head :ok }
    end
  end
  
  def tag_list
    @tags = Array.new
    all_tags = Quip.tag_counts
    all_tags.each { |tag| @tags << { :name => tag.name, :count => tag.count}}
  end
end
