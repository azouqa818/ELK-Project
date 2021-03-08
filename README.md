## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Project-1-repo\ELK-Project\Images\MyAzureNetworkDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - ansible.cfg 
  - Docker.yml
  - filebeat-config.yml
  - filebeat.yml
  - Metricbeat-config.yml 
  - metricbeat.yml 
  - install-elk.yml
  - hosts

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized access to the network.
- A load balancer ensures the availability (CIA triad) of the resources by managing the traffic to the VMs and reducing TTLs. 
- An advantage to adding a jump box is to control access to other virtual machines, by allowing connections from specific IP adresses and forwarding to those machines that are not exposed to the public internet adding an additional layer of security.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat collects data about specific files on remote machines. It is often used to collect log files from specific files.  
- MetricBeat records the machine's metric, such as uptime. 

The configuration details of each machine may be found below.

| Name        | Function          | IP address | Operating System |
|-------------|-------------------|------------|------------------|
| Jump Box    | Gateway           | 10.0.0.4   | Ubuntu Linux     |
| Web-1 DVWA  | Web server - DVWA | 10.0.0.5   | Ubuntu Linux     |
| Web-2 DVWA  | Web server - DVWA | 10.0.0.6   | Ubuntu Linux     |
| Web-3 DVWA  | Web server - DVWA | 10.0.0.7   | Ubuntu Linux     |
| ELK-server  | Elk Web server    | 10.1.0.4   | Ubuntu Linux     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box and the ELK-server machines can accept connections from the Internet. Access to these machines is only allowed from the following IP address:
- Personal IP address

Machines within the network can only be accessed by ssh keys.
- Via the Jump Box [10.0.0.4]

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP addresses         |
|-------------|---------------------|------------------------------|
| Jump Box    | No                  | Personal IP address          |
| Web-1 DVWA  | No                  | 10.0.0.4 10.1.0.4            |
| Web-2 DVWA  | No                  | 10.0.0.4 10.1.0.4            |
| Web-3 DVWA  | No                  | 10.0.0.4 10.1.0.4            |
| ELK-server  | No                  | Personal IP address 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It is minimal in nature, consistent, secure and highly reliable. Ansible requires a password or SSH key in order to start managing systems and can start managing systems without installing any agent software. 

The playbook implements the following tasks:

- Install Docker using Docker.yml 
- In the hosts config file, add a new group [Elkserver] and the Private IP to Elk server to the group
- Install ELK server using install-ELK.yml
- Edit FileBeat-Config.yml - line# 1105 and line# 1806 to add your ELK server public IP address and port
- Edit MetricBeat-Congfig.yml
- Install FileBeat.yml and MetricBeat.yml to your ansible container then edit the files
- SSH to the ELK server from your ansible container 
- Run the commmand [sudo docker ps] to ensure that it has been installed properly 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Project-1-repo\ELK-Project\Images\ElkServerDockerps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5 
- Web-2 10.0.0.6 
- Web-3 10.0.0.7 

We have installed the following Beats on these machines:
- Filebeat and Metricbeat 

These Beats allow us to collect the following information from each machine:
- Filebeat monitors log files/ locations, collects log events and forwards them to Elasticsearch of logstash for indexing.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebteat.yml and metricbeat file to /etc/ansible/roles/files directory.
- Update the files to include ELK's server Private IP to ELastic search and Kibana sections of the configuration file.
- Run the playbook, and navigate to http://[Elk server private IP]:5601/app/kibana to check that the installation worked as expected.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
