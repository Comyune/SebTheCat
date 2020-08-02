# Raspberry Pi Configuration Management

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

[Here is a Youtube video]()
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

![Ansible](/images/ansible-logo.png)

__Ansible__

Has great [Terraform support](https://www.hashicorp.com/resources/ansible-terraform-better-together/).

Less resource-heavy which is important on a Raspberry Pi.

---

## Installing Ansible on a Raspberry Pi

Here we install some required packages (`sshpass` and `dirmmngr`), add a PPA which gives us a more recent version of Ansible. Then we add keys for this new PPA, update our local apt, then finally download and install the latest Ansible.

```sh
sudo apt-get install -y \
  sshpass dirmngr
  
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
  | sudo tee -a /etc/apt/sources.list
  
sudo apt-key adv \
  --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  
sudo apt-get update

sudo apt-get install ansible

ansible --version
```

Update your Ansible configuration.

```sh
cd /etc/ansible
nano ansible.cfg
```

```sh
ansible RASPBERRIES -m command -a "tail /var/log/messages"
```

---

## Further Viewing

* [Learning Ansible on the Raspberry Pi]
(https://www.youtube.com/watch?v=XnIM2cxNVX0o)

* [Ansible Quickstart Guide]
(https://www.ansible.com/resources/videos/quick-start-video)


## Further Reading

* [Installing Ansible on the Raspberry Pi]
(https://www.theurbanpenguin.com/installing-ansible-on-the-raspberry-pi/)

* [Ansible documentation]
(https://docs.ansible.com)
