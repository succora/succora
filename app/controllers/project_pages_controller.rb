class ProjectPagesController < ApplicationController
  before_action :set_project_page, only: [:show, :edit, :update, :destroy]

pay_request = PaypalAdaptive::Request.new
    data = {
      "returnUrl" => return_url,
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode" => "AUD",
      "receiverList" =>
              { "receiver" => [
                {"email" => "succoranetwork-facilitator@gmail.com", "amount"=> amount}
              ]},
      "cancelUrl" => cancel_url,
      "actionType" => "PAY",
      "ipnNotificationUrl" => ipn_url
    }

    #To do chained payments, just add a primary boolean flag:{“receiver”=> [{"email"=>"PRIMARY", "amount"=>"100.00", "primary" => true}, {"email"=>"OTHER", "amount"=>"75.00", "primary" => false}]}

    pay_response = pay_request.pay(data)

    if pay_response.success?
        # Send user to paypal
        redirect_to pay_response.approve_paypal_payment_url
    else
        puts pay_response.errors.first['message']
        redirect_to "/", notice: "Something went wrong. Please contact support."
    end

def ipn_notification
    ipn = PaypalAdaptive::IpnNotification.new
    ipn.send_back(request.raw_post)

    if ipn.verified?
      logger.info "IT WORKED"
    else
      logger.info "IT DIDNT WORK"
    end

    render nothing: true
  end

  # GET /project_pages
  # GET /project_pages.json
  def index
    @project_pages = ProjectPage.all
  end

  # GET /project_pages/1
  # GET /project_pages/1.json
  def show
  end

  # GET /project_pages/new
  def new
    @project_page = ProjectPage.new
  end

  # GET /project_pages/1/edit
  def edit
  end

  # POST /project_pages
  # POST /project_pages.json
  def create
    @project_page = ProjectPage.new(project_page_params)

    respond_to do |format|
      if @project_page.save
        format.html { redirect_to @project_page, notice: 'Project page was successfully created.' }
        format.json { render :show, status: :created, location: @project_page }
      else
        format.html { render :new }
        format.json { render json: @project_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_pages/1
  # PATCH/PUT /project_pages/1.json
  def update
    respond_to do |format|
      if @project_page.update(project_page_params)
        format.html { redirect_to @project_page, notice: 'Project page was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_page }
      else
        format.html { render :edit }
        format.json { render json: @project_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_pages/1
  # DELETE /project_pages/1.json
  def destroy
    @project_page.destroy
    respond_to do |format|
      format.html { redirect_to project_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_page
      @project_page = ProjectPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_page_params
      params.require(:project_page).permit(:title, :subtitle, :description)
    end
end
