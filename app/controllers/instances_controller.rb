class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :update, :destroy]

  # GET /instances
  # GET /instances.json
  def usage
    instances = { 
     "instances":[
       {
        "name": "maquina1",
        "cpu": [23, 24, 23, 25, 29, 5],
        "memory": [55, 23, 41, 23, 12,64],
        "disk": [55, 23, 41, 23, 12, 64],
        "timestamp": ["2015-05-22:33:43Z", "2015-05-22:43:43Z", "2015-05-22:53:43Z", "2015-05-23:03:43Z", "2015-05-23:13:43Z", "2015-05-23:23:43Z"]
       },
       {
        "name": "maquina2",
        "cpu": [23, 24, 23, 25, 29, 5],
        "memory": [55, 23, 41, 23, 12,64],
        "disk": [55, 23, 41, 23, 12, 64],
        "timestamp": ["2015-05-22:33:43Z", "2015-05-22:43:43Z", "2015-05-22:53:43Z", "2015-05-23:03:43Z", "2015-05-23:13:43Z", "2015-05-23:23:43Z"]
       }
     ]
   }

    #get all usage in the last 24h for all machines
    #@instances = Instance.all
    
    render json: instances
  end

  # POST /instances
  # POST /instances.json
  def create
    usage = { 
      name: "maquina1",
      cpu: 22,
      memory: 78,
      disk: 34
    }

    # add entry on DynDB
    #if @instance.save
      render json: usage, status: :created, location: usage 
    #else
    #  render json: @instance.errors, status: :unprocessable_entity
    #end
  end
end