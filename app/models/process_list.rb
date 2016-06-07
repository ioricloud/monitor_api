class ProcessList
  include Model
  @table_name = 'processes'
  class << self
    def get
      items = conn.scan(
        table_name: @table_name
      ).data.items
    end

    def create_table
      conn.create_table(
        table_name: @table_name,
        key_schema:[
          {attribute_name:'instance_id', key_type: 'HASH'},
        ],
        attribute_definitions:[
          {attribute_name:'instance_id', attribute_type: 'S'},
        ],
        provisioned_throughput: { read_capacity_units: 1, write_capacity_units: 1,}
      )
    end
  end
end
