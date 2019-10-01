class AnalysesController < ApplicationController

  def create
    uploaded_file = params[:file_to_analyze]

    if uploaded_file.present?
      analysis = Analysis.from_uploaded_file(
        uploaded_file: uploaded_file,
        exclude_common: ActiveModel::Type::Boolean.new.cast(params[:exclude_common]),
      )

      analysis.save!

      redirect_to analysis and return
    end

    redirect_to '/'
  end

  def index
    @last_ten = Analysis.order(:created_at).last(10).reverse
  end

  def show
    @analysis = Analysis.find(params[:id])

    @exclude_common = @analysis.data.fetch('exclude_common')

    @word_frequencies = @analysis.data.fetch('word_frequencies').to_a.sort_by do |word_and_count|
      [-word_and_count.last, word_and_count.first]
    end.first(25).to_h

    @original_text = @analysis.data.fetch('original_text')
  end

end
