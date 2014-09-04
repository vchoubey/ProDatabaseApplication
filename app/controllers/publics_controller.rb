class PublicsController < ApplicationController
  before_action :set_public, only: [:show] #, :edit, :update, :destroy]
  # before_action :get_details, only: [:get_individual_details]
  # before_action :get_individuals, only: [:index]
  # before_action :get_individual_details, only: [:show]

  # GET /publics
  def index
    

    #@publics = connect.to_hash
    #@publics = 
    Public.all
    @publics = Corporation.all.order("id asc").limit(15)
  end


  # def get_individuals
    # debugger  
    #   @publics = (Public.connection.exec_query('SELECT last_name, middle_name, first_name FROM individuals limit 5')).to_hash
      
    # end

    # def get_individual_details 
    #   debugger
    #   @public_detail = (Public.connection.exec_query('SELECT last_name, middle_name, first_name, initial, suite, city, province, postal, work_phone, fax FROM individuals WHERE first_name =  && last_name = ')).to_hash
      
    # end


  def self.get_corporations where
    Public.all
    #@publics = Corporation.all.order("id asc").limit(3).offset(0)
    @publics = Corporation.all.order("id asc").limit(3).offset(324)
    #@publics = Corporation.all.order("id asc").limit(4).offset(4999)
    #@publics = Corporation.all.order("id asc").limit(2).offset(6000)
    #@publics = Corporation.all.order("id asc").limit(1).offset(6012)
    #@publics = Corporation.all.order("id asc").limit(5).offset(25000)

    @publics = Corporation.where(province: where)





    
  end

  def self.get_corporation_details name_of_corporation 
    Public.all
    @public_details =  Corporation.find_by(name: name_of_corporation)

  end

  # GET /publics/1
  def show

  end

  # def get_details
  #   @details = Public.find(params[:id])
  # end

      #   # GET /publics/new
        #   def new
        #     #@public = Public.new
        #   end

        #   # GET /publics/1/edit
        #   def edit
        #   end

        #   # POST /publics
        #   def create
        #     # @public = Public.new(public_params)

        #     # if @public.save
        #     #   redirect_to @public, notice: 'Public was successfully created.'
        #     # else
        #     #   render :new
        #     # end
        #   end

        #   # PATCH/PUT /publics/1
        #   def update
        #     # if @public.update(public_params)
        #     #   redirect_to @public, notice: 'Public was successfully updated.'
        #     # else
        #     #   render :edit
        #     # end
        #   end

        #   # DELETE /publics/1
        #   def destroy
        #     # @public.destroy
        #     # redirect_to publics_url, notice: 'Public was successfully destroyed.'
        #   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public
      Public.all
      @public = Corporation.find(params[:id])
    end

#     # Only allow a trusted parameter "white list" through.
#     def public_params
#       params.require(:public).permit(:name, :suite, :street, :city, :province, :postal, :work_phone, :fax)
#     end
end
