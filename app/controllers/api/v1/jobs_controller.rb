module Api
  module V1
    class JobsController < ApplicationController

      before_action :set_job, only: [:show, :update, :destroy]

      def index
        @jobs = Job.all
        render json: @jobs
      end

      def create
        @job = Job.new(job_params)
        if @job.save
          render json: @job, status: :created
        else
          render json: @job.errors, status: :unprocessable_entity
        end
      end

      private
        def set_job
          @job = Job.find(params[:id])
        end

        def job_params
          params.require(:job).permit(:title, :description)
        end
    end
  end
end