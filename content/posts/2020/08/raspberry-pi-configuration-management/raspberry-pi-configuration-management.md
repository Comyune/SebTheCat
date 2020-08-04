+++
title = "Raspberry Pi Configuration Management"
description = "How to automate the configuration of a Raspberry Pi"
tags = ["raspberry pi", "devops", "ansible"]
date = "2020-08-04"
keywords = ["configuration", "management"]
+++

In this post we will be looking at setting up our Raspberry Pi in an automated fashion so that we can install Apache Airflow and some other tools to automate key parts of our workflow.

<!--more-->


## Purchasing a Raspberry Pi

<a target="_blank"  href="https://www.amazon.co.uk/gp/product/B07XH3HWTQ/ref=as_li_tl?ie=UTF8&camp=1634&creative=6738&creativeASIN=B07XH3HWTQ&linkCode=as2&tag=comyune-21&linkId=dbab78fff3656df9f3a66937af6c8e38">

I recommend the __Canakit Raspberry Pi 4 4Gb Starter Kit__.

<img border="0" src="//ws-eu.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=GB&ASIN=B07XH3HWTQ&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=comyune-21" >
</a>

It contains everything you need to get a complete setup going quickly, and it is available for a _very_ reasonable price.

The kit contains:

* The Raspberry Pi 4 itself (with 4GB of RAM)
* A 32GB SD card, preloaded with a bootloader (no fussing about flashing the drive yourself)
* A minimal, but attractive case
* A cooling fan and additional heat sinks for the CPU, RAM and GPU chips
* A USB type-C powerswitch adapter (actually quite useful)
* AC Power adapter (to USB type-C)
* A 4K compatible micro-HDMI to HDMI cable

---


## Setting up the Raspberry Pi & Operating System

{{% youtube jTNTJsd2hQk %}}
[Here is a Youtube video](https://www.youtube.com/watch?v=jTNTJsd2hQk)
I've put to together explaining how to assemble and setup a Canakit Raspberry Pi 4.

---


## Choosing a configuration tool


### Options are:

* [__Chef__](https://stackshare.io/chef)  
  - Familiar
  - Resource intensive (due to Ruby)
  - Ruby syntax
  - Solo and server-based architecture
  
* [__Ansible__](https://stackshare.io/ansible)  
  - Industry leading
  - Solo and server-base architecture
  - Easy to learn
  
* [__Puppet__](https://stackshare.io/puppet)  
  - Has lost favour in recent years
  - Hard to learn


### Our choice:

__Ansible__

Has great [Terraform support](https://www.hashicorp.com/resources/ansible-terraform-better-together/).

Less resource-heavy which is important on a Raspberry Pi.

---

{{< youtube "qWKK_PNHnnA" >}}


## SSHing Into a Raspberry Pi

By default you can log into the Raspberry Pi via SSH credentials like so:
`ssh pi@raspberrypi.local`
Then when prompted for a password, you can enter the default password of `raspberry`.

This may also be set to your admin password if you changed that after installation.
If it is still the default, this password should be changed immediately.

If you need help setting your SSH password, you can [read more here](https://www.shellhacks.com/raspberry-pi-default-password-how-to-change/).

You can also look into
[setting up a *.local domain name](https://www.howtogeek.com/167190/how-and-why-to-assign-the-.local-domain-to-your-raspberry-pi/)
to make things easier if you'd like.

---

{{< asciicast "wSfyeOFZNx4HZQcB2bOVb6bMV" >}}


## Installing Ansible on a Raspberry Pi

Here we install some required packages (`sshpass` and `dirmmngr`), add a PPA which gives us a more recent version of Ansible. Then we add keys for this new PPA, update our local apt, then finally download and install the latest Ansible.

```sh
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
  | sudo tee -a /etc/apt/sources.list
  
sudo apt-key adv \
  --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  
sudo apt-get update

sudo apt-get install -y \
  ansible sshpass dirmngr

ansible --version
```


## Installing Ansible on Our Local Machine

Now on our local machine, we should also ensure we have Ansible installed.

On MacOS I can do this simply using
[HomeBrew](https://brew.sh/)
and running the command `brew install ansible`.

Other installation methods are
[available here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

Then let's create our hosts file (inventory) so Ansible knows where to find our Raspberry Pi.

```sh
# Run this in a terminal on your local machine
sudo mkdir /etc/ansible
sudo nano /etc/ansible/hosts
```

Enter the following configuration.

```ini
# /etc/ansible/ansible.cfg
[defaults]
inventory=./hosts
```

__Note:__
You can also update your Ansible configuration to look in the local directory for the inventory file.
This will allow you to have multiple projects using different configurations in the future.
[Read how here.](https://www.rogerperkin.co.uk/network-automation/ansible/inventory-file/)


---


## Setting Up an SSH Key on the Raspberry Pi

First of all you will need to generate a SSH key key which is usually found in your home directory at the following location.
If you do not have one of these keys you can learn how to 
[generate one here](https://www.ssh.com/ssh/keygen/).

Next will need to copy our public key to the raspberry pi using the following:

```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub pi@raspberrypi.local
```

You should then be asked to enter your raspberry pi's SSH password, and should copy your public key onto the device. This will mean that when logging in from your current machine, you should no longer require a password.

This means that Ansible also will not require a password.


---


## Setting Up a Basic Ansible Configuration

Here I'm going to define my Raspberry Pi as the shorthand "pi", add it to a group called "automaton" and add a variable to all hosts within that group.

```ini
# /etc/ansible/hosts
[pi]
pi@raspberrypi.local

[automaton:children]
pi

[automaton:vars]
cy_automaton=true
```


Now let's test our configuration so far by running a command on our Raspberry Pi remotely.

```sh
ansible pi -a ls
```

{{< asciicast "VK3FFFOeTdaAYHkVKCmEByHQQ" >}}

You should see a directory listing of your Raspberry Pi's home directory.

__Yay!__

In a followup post we'll be looking at installing
[Apache Airflow](https://airflow.apache.org/)
and other automation tools on the Raspberry Pi using Ansible.

This will allow us to automatically publish blog posts, tweets, and by doing nothing more than dropping a file in a directory.

Stay tuned, and as always, take it easy kittens!

__Meow!__

---

## Further Viewing

* [Learning Ansible on the Raspberry Pi](https://www.youtube.com/watch?v=XnIM2cxNVX0o)

* [Ansible Quickstart Guide](https://www.ansible.com/resources/videos/quick-start-video)



## Further Reading

* [Installing Ansible on the Raspberry Pi](https://www.theurbanpenguin.com/installing-ansible-on-the-raspberry-pi/)

* [Ansible documentation](https://docs.ansible.com)
