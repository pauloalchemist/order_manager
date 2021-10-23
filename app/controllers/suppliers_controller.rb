class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    @suppliers = Supplier.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SuppliersReportPdf.new(@suppliers)
        send_data pdf.render, filename: "fornecedores_#{Time.now}.pdf", type: 'application/pdf', disposition: 'inline'
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
    @supplier = Supplier.new
  end

  def edit; end

  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_url, notice: 'Fornecedor criado com sucesso.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :fantasy_name, :cnpj)
  end
end
