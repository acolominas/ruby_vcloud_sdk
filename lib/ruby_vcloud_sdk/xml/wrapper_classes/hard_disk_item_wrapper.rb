module VCloudSdk
  module Xml
    class HardDiskItemWrapper < Item
      def hash
        [disk_id, instance_id, bus_type, bus_sub_type].hash
      end

      def eql?(other)
        disk_id == other.disk_id && instance_id == other.instance_id &&
          bus_type == other.bus_type && bus_sub_type == other.bus_sub_type
      end

      def initialize(item)
        super(item.node, item.namespace, item.namespace_definitions)
      end

      def capacity_mb
        host_resource[HOST_RESOURCE_ATTRIBUTE[:CAPACITY]]
      end
      
      def capacity_mb= new_capacity           
        host_resource[HOST_RESOURCE_ATTRIBUTE[:CAPACITY]] = new_capacity
      end

      def disk_id
        get_rasd_content(RASD_TYPES[:ADDRESS_ON_PARENT])
      end

      def disk_id= new_id
        set_rasd_content(new_id,RASD_TYPES[:ADDRESS_ON_PARENT])
      end

      def instance_id
        get_rasd_content(RASD_TYPES[:INSTANCE_ID])
      end

      def bus_sub_type
        host_resource[HOST_RESOURCE_ATTRIBUTE[:BUS_SUB_TYPE]]
      end

      def bus_type
        host_resource[HOST_RESOURCE_ATTRIBUTE[:BUS_TYPE]]
      end

      def parent_instance_id
        get_rasd_content(RASD_TYPES[:PARENT])
      end

      def element_name
        get_rasd_content(RASD_TYPES[:ELEMENT_NAME])
      end

      def element_name= new_name
        set_rasd_content(new_name,RASD_TYPES[:ELEMENT_NAME])
      end

      def host_resource
        get_rasd(RASD_TYPES[:HOST_RESOURCE])
      end
    end
  end
end
