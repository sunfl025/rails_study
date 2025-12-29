class ApplicationController < ActionController::Base
    include ApplicationHelper
    
    def hello
     render html: "¡Hola, mundo!"
    end
end
