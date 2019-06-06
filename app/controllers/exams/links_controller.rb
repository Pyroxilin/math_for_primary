module Exams
  class LinksController < ApplicationController
    layout 'exam_links'

    def index
      @url = 'http://localhost:3000/exam_sessions/MqDzvB'
      @qr_code = RQRCode::QRCode.new(@url).as_svg(module_size: 5).html_safe
    end
  end
end
