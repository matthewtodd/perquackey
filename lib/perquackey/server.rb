require 'perquackey'
require 'sinatra/base'

module Perquackey
  class Server < Sinatra::Base
    get '/' do
      @letters = ''
      @table   = Perquackey::WordTable.new
      erb :letters
    end

    post '/' do
      @letters = params[:letters]
      redirect "/#{@letters}"
    end

    get '/:letters' do
      @letters = params[:letters]
      @table   = Perquackey::Game.new.words(@letters)
      erb :letters
    end

    template :layout do
      layout = <<-END_HTML.strip
    <?xml version="1.0" encoding="utf-8" ?>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="en-US" xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><%= "Perquackey: #{@letters}" %></title>
      </head>
      <body>
        <h1>Perquackey</h1>
        <form name="form" action="/" method="post">
          <input name="letters" value="<%= @letters %>">
        </form>
        <script type="text/javascript">
          document.forms.form.letters.focus();
        </script>
        <%= yield %>
        <p>Thanks to Mendel Cooper and Alan Beale for the <a href="http://personal.riverusers.com/~thegrendel/software.html">YAWL Word List</a>.</p>
      </body>
    </html>
      END_HTML
    end

    template :letters do
      letters = <<-END_HTML.strip
    <table>
      <tr>
        <% @table.headers.each do |header| %>
          <th><%= header %></th>
        <% end %>
      </tr>

      <% @table.each do |row| %>
        <tr>
          <% row.each do |word| %>
            <td><%= word %></td>
          <% end %>
        </tr>
      <% end %>
    </table>
      END_HTML
    end
  end
end