# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.includes(:price_lists).order(:products).page params[:page]
    respond_to do |format|
      format.html
      format.pdf do
        @products = Product.all
        pdf = ProductsReportPdf.new(@products)
        send_data pdf.render, filename: "produtos_#{Time.now}.pdf", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Relatório Forncedor #{@supplier.corporate_name}"
        pdf.text "Nome fantasia: #{@supplier.fantasy_name}"
        pdf.text "CNPJ: #{@supplier.cnpj}"
        send_data pdf.render,
                  filename: 'export.pdf',
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :sku, :supplier_id)
  end
end
