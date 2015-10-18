During the development of a project for my employer, I had to implement a search which should filter roundabout 4000 records in total.
If the given criteria is returning more than 5 records, I had to return random 5 ones, if it's returning less than 5 records, the order
of the records had also be randomized. As the records in our dataset are holding address-data, we could easily show a Google-Map
and generate markers out of our 5 (or less) matches.

The whole projects scope was covering 3 separate installations of Wordpress, and a application written in Ruby on Rails.
So, to guarantee good performance for all of this, I decided to use a vServer with 4 Gigs of memory. This allowed me to
update the results of my search on every keystroke of the user typing his needed criteria to filter the whole dataset... by means,
if the user is searching for "husum", we're firing 5 requests to the server, and the server is doing another 5 MySQL-queries.

As always I was asking myself "Can't all this data-processing be done inside the browser??"... so I came home and just wanted to know.
I've exported our 4000 records into a JSON-File, wrote a tiny HTML-page, saved the JSON to a JS-variable and did a first test using
Array.filter... I was expecting that this would just kill the browser or at least would take several seconds where the page is
not responding to anything else... but it did not! Surprisingly, this was performing pretty good!!

And so I also implemented the remaining functionality of my search, including GoogleMaps-API and the randomized results...
still surprised by the very good performance and a little proud that not even 1 request is hitting our server and with it the database.
