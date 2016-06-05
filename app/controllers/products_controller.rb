class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    if Rails.env.development?
      @domain = "http://localhost:3000"
    else
      @domain = "https://hawkeye360.herokuapp.com"
    end
    @iframe = '<iframe src="%s/products/%s/preview" width="%s" height="%s"></iframe>' % [@domain, @product.id, @product.display_width, @product.display_height]
    gon.image_path = "https://s3-us-west-2.amazonaws.com/#{ENV['S3_BUCKET']}/uploads/product/images/#{@product.id}/"
    gon.total_frames = @product.total_frames
    gon.file_extension = @product.file_extension
    gon.display_width = @product.display_width
    gon.display_height = @product.display_height
    binding.pry
  end

  def preview
    @product = Product.find(params[:id])
    gon.image_path = "https://s3-us-west-2.amazonaws.com/#{ENV['S3_BUCKET']}/uploads/product/images/#{@product.id}/"
    gon.total_frames = @product.total_frames
    gon.file_extension = @product.file_extension
    gon.display_width = @product.display_width
    gon.display_height = @product.display_height
    @preview = true
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :total_frames, :file_extension, 
                                      :display_width, :display_height, {images: []})
    end
end
