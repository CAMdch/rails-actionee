class ProfilesController < ApplicationController
  def dashboard
    @profile = current_user
    authorize @profile
    @track_items = TrackItem.new
    @all_favorite = TrackItem.where('user_id = ?', current_user).select('company_id').group('company_id')
    @order_invest = best_worth_invest

    @round_data = {
      labels: ['Buy', 'Hold', 'Sell'],
      datasets: [{
        label: 'Your investment',
        backgroundColor: ['#0B1E44', '#D8D2CB', '#66BBE8'],
        data: [12, 13, 15]
      }]
    }

    @round_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end

  private

  def order_invest
    all_track = TrackItem.where('user_id = ?', current_user).select('company_id').group('company_id')
    order_track = all_track.map do |track|
      company = Company.find(track.company_id)
      total_gain = company.gains(current_user)
      { company: track.company_id, gain: total_gain }
    end
    tracks = order_track.sort_by { |h| h[:gain] }
    return tracks.reverse!
  end

  def best_worth_invest
    first_part = order_invest.length.fdiv(2).round
    second_part = order_invest.length - first_part
    best_invest = []
    worth_invest = []
    i = 0
    j = first_part
    first_part.times do
      best_invest.push(order_invest[i])
      i += 1
    end

    second_part.times do
      worth_invest.push(order_invest[j])
      j += 1
    end
    return [best_invest, worth_invest]
  end
end
