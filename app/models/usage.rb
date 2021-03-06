class Usage
  include Model
  @table_name = 'usage'
  class << self
    def get(start, stop)
      @conn.scan(
        table_name: @table_name,
        filter_expression: "usage_time >= :start AND usage_time <= :stop",
        expression_attribute_values: {
          ":start": start,
          ":stop": stop
      }).data.items
    end

    def get_instance(instance_id, start, stop)
      conn.query(
        table_name: @table_name,
        key_condition_expression: "instance_id=:instance_id AND usage_time BETWEEN :start AND :stop",
        expression_attribute_values: {
          ":instance_id": instance_id,
          ":start": start,
          ":stop": stop
      }).data.items
    end

    def create_table
      conn.create_table(
        table_name: @table_name,
        key_schema: [
          { attribute_name: 'instance_id', key_type: 'HASH' },
          { attribute_name: 'usage_time', key_type: 'RANGE' }
        ],
        attribute_definitions: [
          { attribute_name: 'instance_id', attribute_type: 'S' },
          { attribute_name: 'usage_time', attribute_type: 'S' }
        ],
        provisioned_throughput: { read_capacity_units: 1, write_capacity_units: 1 }
      )
    end
  end
end
