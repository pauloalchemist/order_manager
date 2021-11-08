class PdfWorker
  include Sidekiq::Worker

  def print(suppliers)
    SuppliersReportPdf.new(suppliers)
  end
end
