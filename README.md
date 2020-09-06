# spikeORtom# Bunkit
##### A ML curated excusee, so that you can bunk your next class smoothly😎
This project is built during first day back MLH hackathon.
&NewLine;
### What on earth is this?
We did not plan to start out planning to make this, but we wanted to align a bit with a theme as an afterthought, hence we thought, there must be some who still won't be feeling like attending classes, so why not help them!! And thus the idea of bunkit was born. It may seem deceivingly simple on top but under the mood, there's a lot going on.

### Tech Stack
* Flutter(app)
* HTML+CSS(web page)
* Python + Flask web app
* gpt2 for text generation
* Heroku for static excuses
* GCP compute engine for gpt2 text generation

### Installation
To build the flutter app, make sure you have android sdk and flutter sdk already set up, then.
* Clone this repository `git clone https://github.com/nayakastha/spikeORtom`
* `cd app`
* 'flutter build apk -release'

To build the web app
* Open the root in shell and run `cd web-gpt2`
* Install the required dependencies `pip requirements.txt` (Warning, large download size)
* To start dev server, run `python app.py`

### Functionalities
There are 2 types of excuses this generates
* A static excuse, which is basically a random combination of some excuses we have hardcoded, structured to give a syntactically correct sentence. You can get this by going to [localhost/getx](http://localhost/getx) or [from the live server here](http://34.72.142.129/getx/)
* The other (fancier!!!) excuse is generated when we pass some random keywords from the above excuse to a gpt2 model. It gives out coherent sentences, with some absurdity of course(this baby is still learning how to make excuses). Each excuse takes 8-10s to generate so kindly bear with us for now.


### Limitations
* One major problem I faced is not getting GCP credits because we are from APAC region, hence not eligible. 
* Running a gpt2 model on a live server is very intensive an affair, with CPU usages sometimes going over 140% of stipulated firepower. We're using a e2-medium(2 vCPU, 4Gb memory, Intel Haswell), so it is burning through the little GCP credits we had really quickly, a solution to this would be welcome.
* This was the first instance we have worked on a web project, let alone a ml and gcp project, those were far fetched until now. The server is not yet fully optimized, and crashes at randomly.





