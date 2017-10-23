package invoke;

import java.util.HashMap;
import java.util.Iterator;

import database.DatabaseAccess;

public class HubLoadBalancer {

	
	
	public int assignHub()
	{
		int new_hub_id;
		String q = "SELECT  hub_id from sensordb.hub_master where no_of_server<3 and cpu_utilization<'75'";
		
		DatabaseAccess db =new DatabaseAccess();
		int check_hub_id = db.getHubId(q);
		
		if(check_hub_id==0)
		{
			
			
			String qu="SELECT sensor_id, AVG(cpu_data) as avgutil FROM sensordb.utilization group by sensor_id";
			
			HashMap<String, String> cpu = db.getCpuUtilizationbySensorIFd(qu);
			
			Iterator it =  cpu.values().iterator();
			int i=0;
			
			while(it.hasNext())
			{
				
				String cpuutil =  (String) it.next();
				
				//if()
				
				i++;
			}
			
			
			String query = "INSERT INTO `sensordb`.`hub_master` (`no_of_server`, `hub_status`) VALUES ('0', 'Running');";
			db.insert(query);
			String q1= "SELECT hub_id FROM sensordb.hub_master";
			 new_hub_id=db.getHubId(q1);
			
		
			 
			 
		}
		else{
			
			new_hub_id=check_hub_id;
		}
		
		
		return new_hub_id;
	}
	
	
	
	
	
}
