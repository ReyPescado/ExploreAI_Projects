-- Plan of Action
/*
1. We want to focus our efforts on improving the water sources that affect the most people.
	• Most people will benefit if we improve the shared taps first.
    
2. Wells are a good source of water, but many are contaminated. Fixing this will benefit a lot of people.

3. Fixing existing infrastructure will help many people. If they have running water again, they won't have to queue, thereby shorting queue times
for others. So we can solve two problems at once.

4. Installing taps in homes will stretch our resources too thin, so for now if the queue times are low, we won't improve that source.

5. Most water sources are in rural areas. We need to ensure our teams know this as this means they will have to make these repairs/upgrades in
rural areas where road conditions, supplies, and labour are harder challenges to overcome.
*/



-- Practical solutions
/*
1. If communities are using rivers, we will dispatch trucks to those regions to provide water temporarily in the short term, while we send out
crews to drill for wells, providing a more permanent solution. Sokoto is the first province we will target.

2. If communities are using wells, we will install filters to purify the water. For chemically polluted wells, we can install reverse osmosis (RO)
filters, and for wells with biological contamination, we can install UV filters that kill microorganisms - but we should install RO filters too. In
the long term, we must figure out why these sources are polluted.

3. For shared taps, in the short term, we can send additional water tankers to the busiest taps, on the busiest days. We can use the queue time
pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on installing extra taps where they are needed.
According to UN standards, the maximum acceptable wait time for water is 30 minutes. With this in mind, our aim is to install taps to get
queue times below 30 min. Towns like Bello, Abidjan and Zuri have a lot of people using shared taps, so we will send out teams to those
towns first.

4. Shared taps with short queue times (< 30 min) represent a logistical challenge to further reduce waiting times. The most effective solution,
installing taps in homes, is resource-intensive and better suited as a long-term goal.

5. Addressing broken infrastructure offers a significant impact even with just a single intervention. It is expensive to fix, but so many people can
benefit from repairing one facility. For example, fixing a reservoir or pipe that multiple taps are connected to. We identified towns like Amina,
Lusaka, Zuri, Djenne and rural parts of Amanzi seem to be good places to start.
*/



-- High Level View of Improvements
/*
1. Rivers → Drill wells

2. wells: if the well is contaminated with chemicals → Install RO filter

3. wells: if the well is contaminated with biological contaminants → Install UV and RO filter

4. shared_taps: if the queue is longer than 30 min (30 min and above) → Install X taps nearby where X number of taps is calculated using X
= FLOOR(time_in_queue / 30).

5. tap_in_home_broken → Diagnose local infrastructure
*/