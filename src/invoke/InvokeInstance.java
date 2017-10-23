package invoke;

import java.io.IOException;
import java.util.TimeZone;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.autoscaling.model.Tag;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.CreateTagsRequest;
import com.amazonaws.services.ec2.model.DescribeInstancesRequest;
import com.amazonaws.services.ec2.model.DescribeInstancesResult;
import com.amazonaws.services.ec2.model.RunInstancesRequest;
import com.amazonaws.services.ec2.model.RunInstancesResult;
import com.jcraft.jsch.JSchException;

import database.DatabaseAccess;




public class InvokeInstance {

	public void createSensor(String user_id, String sensor_name, String lat, String lon) throws InterruptedException {
		// TODO Auto-generated method stub

		
		
	
		AmazonEC2 amazonEC2Client = new AmazonEC2Client(new BasicAWSCredentials("AKIAJKE734M3ECBVELTQ", "hGIQ2CX60wVDrUIEXA/YQXYMMNDNdbQLqI+KWsWd"));

//new AmazonEC2Client(new BasicAWSCredentials("AKIAI32NAJBWBXFWKXPQ", "fbQTu9ERdPKdkKFycmnDIgMpQ2ziphaiFIHjXUw6"));

		amazonEC2Client.setEndpoint("ec2.us-west-2.amazonaws.com");


		RunInstancesRequest runInstancesRequest = new RunInstancesRequest();
	        	

		runInstancesRequest.withImageId("ami-2d966a4d")
                   .withInstanceType("t2.micro")
                   .withMinCount(1)
                   .withMaxCount(1)
                   .withKeyName("KEYSENSOR")
                   
                   //.withKeyName("Hello_281")
                   .withSecurityGroups("default");
                   //.withSecurityGroups("launch-wizard-1");
                   //.withSecurityGroups("JavaSecurityGroup");


	  
		RunInstancesResult runInstancesResult = amazonEC2Client.runInstances(runInstancesRequest);


		/*CreateTagsRequest createTagsRequest = new CreateTagsRequest();
		
		com.amazonaws.services.ec2.model.Tag tags = new com.amazonaws.services.ec2.model.Tag("Name",sensor_name);
		try{
		createTagsRequest.withResources(runInstancesResult.getReservation().getInstances().get(0).getInstanceId()).withTags(tags );
		amazonEC2Client.createTags(createTagsRequest);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
*/
		System.out.println(runInstancesResult.toString() + "\n");

		DescribeInstancesRequest ir=new DescribeInstancesRequest();
		ir.withInstanceIds(runInstancesResult.getReservation().getInstances().get(0).getInstanceId());


		DescribeInstancesResult ires=amazonEC2Client.describeInstances(ir);

		System.out.println(ires.toString());
		
		String state=ires.getReservations().get(0).getInstances().get(0).getState().getName().toString();

		System.out.println("state is: "+state);

		while(!state.equals("running")){
			ires=amazonEC2Client.describeInstances(ir);
			state=ires.getReservations().get(0).getInstances().get(0).getState().getName().toString();
			System.out.println("Running state is: "+state);
			Thread.sleep(5000);
		}


while(true){
	if(ires.getReservations().get(0).getInstances().get(0).getState().getName().toString()!="pending"){
		break;
	}
}
		
		

		String publicIp = ires.getReservations().get(0).getInstances().get(0).getPublicIpAddress().toString();

		String groupId = ires.getReservations().get(0).getInstances().get(0).getSecurityGroups().get(0).getGroupId().toString();

		String groupname = ires.getReservations().get(0).getInstances().get(0).getSecurityGroups().get(0).getGroupName().toString();

		String privateIp = ires.getReservations().get(0).getInstances().get(0).getPrivateIpAddress().toString();
		
		String sensor_id = ires.getReservations().get(0).getInstances().get(0).getInstanceId().toString();

		String owner_id = ires.getReservations().get(0).getOwnerId().toString();

		String image_id = ires.getReservations().get(0).getInstances().get(0).getImageId().toString();

		System.out.println(ires.getReservations().get(0).getInstances().get(0).getInstanceId().toString());

		System.out.println(ires.getReservations().get(0).getInstances().get(0).getKeyName().toString());

		System.out.println(ires.getReservations().get(0).getInstances().get(0).getPrivateIpAddress().toString());

		System.out.println(ires.getReservations().get(0).getInstances().get(0).getVpcId().toString());
		
	//	String tag_key = ires.getReservations().get(0).getInstances().get(0).getTags().get(0).getKey();
	//ires.getReservations().get(0).getInstances().get(0).getTags().get(0).getValue();

		
		System.out.println("public ip  "+ publicIp);
		RemoteCall rc = new RemoteCall();
		try {
		//	Thread.sleep(50000);
			
			rc.runScript(publicIp, user_id, sensor_id, lat, lon);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int hub = assignHub();
		String status_new ="Running";
		
		
		TimeZone.setDefault(TimeZone.getTimeZone("PST"));
		java.util.Date utilDate = new java.util.Date();
		System.out.println("date  " + utilDate );
		java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());
		System.out.println("timestamp  "+sq);
		
		
		String name="Name";
		String query = "INSERT INTO sensor_master (sensor_id,latitude,longitude,sensor_status,public_ip,private_ip,creation_date,sensor_tag_key,sensor_tag_value,user_id,hub_id)"

				+"VALUES ('"+sensor_id+"','"+lat+"','"+lon+"','"+status_new	+"','"+publicIp+"','"+privateIp+"','"+sq+"','"+name+"','"+sensor_name+"','"+user_id+"',"+hub+")";
						
		
		DatabaseAccess db = new DatabaseAccess();
		db.insert(query);
		
		String qq1 = "SELECT no_of_server FROM sensordb.hub_master where hub_id="+hub;
		int no_of_server = db.getNoodfSensor(qq1);
		no_of_server++;
		
		String qu = "UPDATE `sensordb`.`hub_master` SET `no_of_server`='"+no_of_server+"' WHERE `hub_id`="+hub;
		db.insert(qu);
		
	}
	
	
	
	
	public int assignHub()
	{
		int new_hub_id;
		String q = "SELECT  hub_id from sensordb.hub_master where no_of_server<3";
		
		DatabaseAccess db =new DatabaseAccess();
		int check_hub_id = db.getHubId(q);
		
		if(check_hub_id==0)
		{
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
