class VerbsController < ApplicationController
  # GET /verbs
  # GET /verbs.xml
  def index
    @verb = Verb.new
    find_verbs

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @verbs }
      format.js { render :partial => "list" }
    end
  end
  
  def find_verbs
    page = params[:page] || 1
    common = {:order => "command asc", :include => :tags, :page => page}
    
    @verbs = if params[:letter]
      Verb.paginate(common.merge(:conditions => ["verbs.name LIKE '?%'", params[:letter]]))
    elsif tag = params[:tag]
      Verb.paginate(common.merge(:conditions => ["tags.name = ?", tag]))
    elsif q = (params[:q] && params[:q].upcase)
      fields = %w{verbs.name verbs.command verbs.you_see verbs.target_sees verbs.others_see verbs.your_status verbs.notes tags.name}
      condition = fields.collect{|field| "UPPER(#{field}) LIKE '%#{q}%'"}.join(" OR ")
      Verb.paginate(common.merge(:conditions => condition))
    else
      Verb.paginate(common)
    end
    
  end

  # GET /verbs/1
  # GET /verbs/1.xml
  def show
    @verb = Verb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @verb }
    end
  end

  # GET /verbs/new
  # GET /verbs/new.xml
  def new
    @verb = Verb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @verb }
    end
  end

  # GET /verbs/1/edit
  def edit
    @verb = Verb.find(params[:id])
  end

  # POST /verbs
  # POST /verbs.xml
  def create
    @verb = Verb.new(params[:verb])

    respond_to do |format|
      if @verb.save
        flash[:notice] = 'Verb was successfully created.'
        format.html { redirect_to(@verb) }
        format.xml  { render :xml => @verb, :status => :created, :location => @verb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @verb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /verbs/1
  # PUT /verbs/1.xml
  def update
    @verb = Verb.find(params[:id])

    respond_to do |format|
      if @verb.update_attributes(params[:verb])
        flash[:notice] = 'Verb was successfully updated.'
        format.html { redirect_to(@verb) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @verb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /verbs/1
  # DELETE /verbs/1.xml
  def destroy
    @verb = Verb.find(params[:id])
    @verb.destroy

    respond_to do |format|
      format.html { redirect_to(verbs_url) }
      format.xml  { head :ok }
    end
  end
end
