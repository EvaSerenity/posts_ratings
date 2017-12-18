class StatisticsController < ApplicationController

  def same_ips
    ips = SameIpsQuery.new.same_ips.pluck(:user_ip)
    render json: { same_ips: ips }
  end
end