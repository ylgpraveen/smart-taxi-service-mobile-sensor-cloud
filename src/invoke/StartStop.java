package invoke;

import java.util.ArrayList;
import java.util.List;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.DescribeInstancesRequest;
import com.amazonaws.services.ec2.model.DescribeInstancesResult;
import com.amazonaws.services.ec2.model.StopInstancesRequest;

import database.DatabaseAccess;

public class StartStop {

	public void stopSensor(final String user_id, final String sensor_id) throws InterruptedException {
		// TODO Auto-generated method stub

		List<String> instancesToStop = new ArrayList<String>();
		instancesToStop.add(sensor_id);
		AmazonEC2 amazonEC2Client = new AmazonEC2Client(new BasicAWSCredentials("AJIAJKE734D3E1FRQVTQ", "SDDEW3455DFsfj53XCjttdgtred"));
		amazonEC2Client.setEndpoint("ec2.us-west-2.amazonaws.com");
		
		DescribeInstancesRequest ir=new DescribeInstancesRequest();
		ir.withInstanceIds(instancesToStop);
		DescribeInstancesResult ires=amazonEC2Client.describeInstances(ir);
		
		String state=ires.getReservations().get(0).getInstances().get(0).getState().getName().toString();

		System.out.println("state is: "+state);
		
		if(state.equals("stopped"))
		{
			System.out.println("Already Stopped");
		
		}
		else
		{
			
			StopInstancesRequest stoptr = new StopInstancesRequest();    
			stoptr.setInstanceIds(instancesToStop);
			amazonEC2Client.stopInstances(stoptr);
			
			String state1=ires.getReservations().get(0).getInstances().get(0).getState().getName().toString();

			System.out.println("state is: "+state1);

			while(!state1.equals("stopped")){
			//if(ires.getReservations().get(0).getInstances().get(0).getState().getName().toString()!="pending"){
				//break;
			//}
				ires=amazonEC2Client.describeInstances(ir);
				state1=ires.getReservations().get(0).getInstances().get(0).getState().getName().toString();
				System.out.println("Running state is: "+state1);
				Thread.sleep(5000);
			}
			
			String query = "UPDATE `sensordb`.`sensor_master` SET `sensor_status`='Stopped' WHERE `sensor_id`='"+sensor_id+"';";
			
			DatabaseAccess db = new DatabaseAccess();
			db.insert(query);
			
		
		
		}
		
		
		
		
		
	}

}
