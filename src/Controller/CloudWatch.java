package Controller;

import java.util.Date;

import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.cloudwatch.AmazonCloudWatchClient;
import com.amazonaws.services.cloudwatch.model.Datapoint;
import com.amazonaws.services.cloudwatch.model.Dimension;
import com.amazonaws.services.cloudwatch.model.GetMetricStatisticsRequest;
import com.amazonaws.services.cloudwatch.model.GetMetricStatisticsResult;

public class CloudWatch {

    public static void main(String[] args) {

    	
    	
    	final String awsAccessKey = "AKIAJKE734M3ECBVELTQ";
        final String awsSecretKey = "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";
        final String instanceId = "i-0351a77671a0f4d61";

        final AmazonCloudWatchClient client = client(awsAccessKey, awsSecretKey);
        final GetMetricStatisticsRequest request = request(instanceId); 
        final GetMetricStatisticsResult result = result(client, request);
        toStdOut(result, instanceId);   
    
    
    
    
    }

    private static AmazonCloudWatchClient client(final String awsAccessKey, final String awsSecretKey) {
    	final AmazonCloudWatchClient client = new AmazonCloudWatchClient(new BasicAWSCredentials(awsAccessKey, awsSecretKey));
        client.setEndpoint("http://monitoring.us-west-2.amazonaws.com");
        return client;
    }

    private static GetMetricStatisticsRequest request(final String instanceId) {
    	 final long twentyFourHrs = 1000 * 60 * 60 ;
         final int oneHour = 60 *10;
         return new GetMetricStatisticsRequest()
             .withStartTime(new Date(new Date().getTime()- twentyFourHrs))
             .withNamespace("AWS/EC2")
             .withPeriod(5)
             .withDimensions(new Dimension().withName("InstanceId").withValue(instanceId))
             .withMetricName("CPUUtilization")
             .withStatistics("Average", "Maximum")
             .withEndTime(new Date());
    }

    private static GetMetricStatisticsResult result(
            final AmazonCloudWatchClient client, final GetMetricStatisticsRequest request) {
         return client.getMetricStatistics(request);
    }

    private static void toStdOut(final GetMetricStatisticsResult result, final String instanceId) {
        System.out.println(result); // outputs empty result: {Label: CPUUtilization,Datapoints: []}
        for (final Datapoint dataPoint : result.getDatapoints()) {
            System.out.printf("%s instance's average CPU utilization : %s%n", instanceId, dataPoint.getAverage());      
            System.out.printf("%s instance's max CPU utilization : %s%n", instanceId, dataPoint.getMaximum());
            System.out.println(dataPoint.getTimestamp());
        }
    }
}