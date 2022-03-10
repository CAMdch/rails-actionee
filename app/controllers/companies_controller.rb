require "json"
require "open-uri"
require 'finnhub_ruby'

class CompaniesController < ApplicationController
  def index
    if params[:query].present? && filter_request?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%").filter_tag(filter_params)
    elsif filter_request?
      @companies = policy_scope(Company).filter_tag(filter_params)
    elsif params[:query].present?
      @companies = policy_scope(Company).where('name ILIKE ?', "%#{params[:query]}%")
      authorize @companies
    else
      @companies = policy_scope(Company).all
      authorize @companies
    end
    @favorite_user = Favorite.where('user_id = ?', current_user)

    respond_to do |format|
      @chart_options = {
        scales: {
          y: {
            grid: {
              display: false
            }
          }
        },
        elements: {
          point:{
              radius: 0
          }
        }
      }
      format.html # Follow regular flow of Rails
      format.text { render partial: 'companies_list', locals: { companies: @companies }, formats: [:html] }
    end

    @chart_options = {
      scales: {
        y: {
          grid: {
            display: false
          }
        }
      },
      elements: {
        point:{
            radius: 0
        }
      }
    }
  end

  def show
    @company = Company.find(params[:id])
    @favorite_user = Favorite.where('user_id = ?', current_user)
    @review = Review.new
    @reviews = Review.where('company_id = ?', @company.id)
    @recommendation = Recommendation.where('company_id = ?', @company.id).order('created_at DESC').first
    @news = Publication.where('company_id = ?', @company.id).order('created_at DESC').limit(3)
    @currency = Stock.where('company_id = ?', @company.id).order('created_at DESC').first
    authorize @company
    @marker = [{ lat: @company.latitude, lng: @company.longitude }]

    @chart_data = {
      labels: time_chart.reverse,
      datasets: [{
        label: 'Stock Price',
        borderWidth: 1,
        borderColor: '#0B1E44',
        data: value_chart.reverse
      }]
    }


    @round_data = {
      labels: ['Buy', 'Hold', 'Sell'],
      datasets: [{
        label: 'My First dataset',
        backgroundColor: ['#0B1E44', '#D8D2CB', '#66BBE8'],
        data: [@recommendation.buy, @recommendation.hold, @recommendation.sell]
      }]
    }

    @round_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      plugins: {
        legend: {
          position: 'right'
        }
      }
    }

    @chart_options = {
      scales: {

        y: {
          grid: {
            display: false
          }
        }
      },
      elements: {
        point:{
            radius: 0
        }
      }
    }
  end

  def time_chart
    stocks = @company.stocks.order('created_at DESC')
    time_stop = stocks.length < 42 ? @company.stocks.order('created_at DESC').last.created_at.time : @company.stocks.order('created_at DESC').first.created_at.time - 25200
    i = 0
    month = []
    while stocks[i].created_at.time > time_stop
      month.push((stocks[i].created_at + 3600).strftime('%H:%M'))
      i += 1
    end
    return month
  end

  def value_chart
    stocks = @company.stocks.order('created_at DESC')
    time_stop = stocks.length < 42 ? @company.stocks.order('created_at DESC').last.created_at.time : @company.stocks.order('created_at DESC').first.created_at.time - 25200
    j = 0
    value = []
    while stocks[j].created_at.time > time_stop
      value.push(stocks[j].value)
      j += 1
    end
    return value
  end

  def filter_request?
    array = []
    Tag.all.each do |tag|
      array << !params[tag.name.to_s.to_sym].nil?
    end
    array.any? { |value| value == true }
  end

  def filter_params
    filter_hash = {}
    params.each do |key, value|
      filter_hash[key] = value if value == "on"
    end
    filter_hash
  end
end
# Tag.find_by(name: tag.name ) => tag intance
# tag int.id
# #Company.where(tag_id:  )

# company.tags
# make it into array and then randomise it
