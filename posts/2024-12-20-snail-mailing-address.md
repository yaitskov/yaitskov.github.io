---
title: Snail mailing address
---

# Table of Contents

1.  [Problem](#orge56de3b)
    1.  [Personal mobility and relocation rate](#orge413ce8)
    2.  [Keeping up to date efforts](#org442f65d)
    3.  [Personal experience](#org8d1fe4c)
    4.  [Tax and budget](#org2b23566)
    5.  [Privacy and phishing](#orgd26f164)
    6.  [Spam](#orga3d0485)
    7.  [Address input validation](#org92b64a0)
    8.  [Ecology and Global warming](#org1ee8855)
    9.  [Desuetude](#orgc3334bb)
2.  [Design Draft](#org4bb9629)
    1.  [Postal Address (PA)](#org6ca5d48)
    2.  [Address Alias (AA)](#orgbedb233)
    3.  [PMAA REST API](#orgc39f670)
    4.  [Gradual implementation](#orgb81e0fd)

The article presents an alternative mailing address - Permanent
Mailing Address Alias (PMAA).


<a id="orge56de3b"></a>

# Problem

The postal address system predates 3rd Industrial Revolution<sup><a id="fnr.1" class="footref" href="#fn.1" role="doc-backlink">1</a></sup> and
the design overlooks capabilities appeared later with modern
technologies, but it is still in use due to social inertia<sup><a id="fnr.2" class="footref" href="#fn.2" role="doc-backlink">2</a></sup> and
the network effect<sup><a id="fnr.3" class="footref" href="#fn.3" role="doc-backlink">3</a></sup>.

Let's enumerate issues the mailing address system encounters today and
draft a solution based on information technologies available.

If you agree up on the issues below, please, sign [the petition](https://chng.it/6GhJ6jMFs8).


<a id="orge413ce8"></a>

## Personal mobility and relocation rate

The number of state-to-state movers rose from 7.9 million in 2021 to
8.2 million in 2022. This shows a decade-long trend of state-to-state
migration, which is expected to continue to increase even as overall
migration numbers decline.<sup><a id="fnr.4" class="footref" href="#fn.4" role="doc-backlink">4</a></sup>

Overall 40 million people changed their addresses in 2023 in the
US. <sup><a id="fnr.5" class="footref" href="#fn.5" role="doc-backlink">5</a></sup>


<a id="org442f65d"></a>

## Keeping up to date efforts

When a person moves, he/she should update his/her
address in a few dozen systems:

1.  employer/university/school/military
2.  driver license
3.  vehicle registration
4.  voter registration
5.  IRS
6.  5.3  bank accounts on average<sup><a id="fnr.6" class="footref" href="#fn.6" role="doc-backlink">6</a></sup>
7.  dozens of shops (amazon, ebay, walmart, etc.)
8.  car insurance
9.  health insurance
10. USPS forwarding
11. mobile operator
12. CCW
13. internet provider (at least terminate contract automatically if
    new address is out of range)

How much time would it take to sync the address across all these
systems?!

Many places have a web interface and/or a mobile app, but anyway the
process is very routine and error prone. Recall all these security
questions you need to answer and one-time codes to provide&#x2026; Nobody
wants to waste time on this.

Moreover, the IRS allows you to change the address through a paper mail
only. Mail to the IRS can be delivered exclusively by USPS and USPS
locations don't provide a print service. So the mover has to plan a whole
operation to complete the task!

USPS provides an option for mail forwarding but it is a half-measure.

Military mailing address has a common trait with the proposed design
(mail follows the soldiers whenever they are), but such address also
has limited scope and is not available for civilians.

It is worth to note that the Oath of Allegiance expects from a
swearing person to bear arms on behalf of the US if required by the
law.  So the person in some way connected to the military service.
This fact promotes the idea of extending military mailing address
style to all citizens.

A PO box with a web interface is a great tool, but it is not
applicable for bank accounts or DL, and the PO box user has to trust
somebody with unsealing envelopes and scanning letters.


<a id="org8d1fe4c"></a>

## Personal experience

The article contains a lot of statistical references, but as the
author, who is an experienced software engineer and who lived in 4
states, I confirm that the situation is unsatisfactory and requires
serious revision taking advantage of new technologies.


<a id="org2b23566"></a>

## Tax and budget

The time required for handling papers could be used for fun or earning
extra dollars.

Let's assume it would take 2 hours to update the address everywhere.

Per capita income in the past 12 months in 2023: $43,289. <sup><a id="fnr.7" class="footref" href="#fn.7" role="doc-backlink">7</a></sup>
There are 2080 working hours per year.
So an average pay rate is $20 per hour.

$$ 2h * 4E7 * \$20 = \$1.6E9 $$

The US economy is missing out **$1.6 billion** annually, because people
are busy with keeping their mail addresses up to date.

Average federal income tax rate is 14.5% in 2022.<sup><a id="fnr.8" class="footref" href="#fn.8" role="doc-backlink">8</a></sup>

$$ 0.145 * \$1.6E9 = \$232E6 $$

Therefore the federal budget could get **extra $232 million** per annum,
meanwhile US debt maximum systematically increases<sup><a id="fnr.9" class="footref" href="#fn.9" role="doc-backlink">9</a></sup>.


<a id="orgd26f164"></a>

## Privacy and phishing<sup><a id="fnr.10" class="footref" href="#fn.10" role="doc-backlink">10</a></sup>

A mail address stored in a database poses a threat for privacy similar
to phone number or email address. 353 million of accounts leaked due
data breaches in 2023 in the US.<sup><a id="fnr.11" class="footref" href="#fn.11" role="doc-backlink">11</a></sup>

Mail address is indivisible from geo location.

Autobinding [AA](#org99906cf) cannot be used by more than one sender. It means that
AA leaked from an organization cannot be used for spamming or phishing
by somebody else.


<a id="orga3d0485"></a>

## Spam

A mail address is vulnerable to massive spam delivery without even
mentioning a particular recipient by name.

A person in PMAA should be able to disable delivery of mails
addressed by postal address directly.

Businesses, you finished working with, tend to mail reminder letters
periodically.

Dedicated AA can be invalidated and cannot be used after that.


<a id="org92b64a0"></a>

## Address input validation

Credit card number has a special encoding preventing a single typo in
any digit.<sup><a id="fnr.12" class="footref" href="#fn.12" role="doc-backlink">12</a></sup> Regular mail address doesn't have anything like that.
Zip code cannot catch a typo in an apartment or building number.

Organizations such as DMV have extra requirements to the address
person provides. They want to prove that the person lives there.

A person in PMAA can have only 1 postal address at any given time,
but it is not exposed. So the previous requirement is fulfilled
automatically.


<a id="org1ee8855"></a>

## Ecology and Global warming

I rented an apartment in Miami next to a beach. My mailbox was
getting full of junk every week addressed to previous dwellers!
I assume it is a common pattern for places with high tenant turnover.

Imagine how much paper and labor is wasted for letters, for which it
is known in advance that they will not be read.

20g $CO_2$ is produced per letter<sup><a id="fnr.13" class="footref" href="#fn.13" role="doc-backlink">13</a></sup>

$$ 20g * 5\ letter\ a\ week * 52\ week\ a\ year = 5.2kg\ CO_2 $$

It is an equivalent of 12.92 lb of $CO_2$ per annum per apartment.

Such a situation happens because USPS forwarding eventually expires,
but the addressee is not interested anymore in updating the address
everywhere it is mentioned.

A new tenant usually is also reluctant to stop the sender from future
correspondence, because it is easier just to recycle such junk mail.

PMAA should help with breaking this vicious cycle.


<a id="orgc3334bb"></a>

## Desuetude

U.S. Code section 39 §3004<sup><a id="fnr.14" class="footref" href="#fn.14" role="doc-backlink">14</a></sup> (Delivery of mail to persons not residents
of the place of address) is not enforced in practice:

> Whenever the Postal Service determines that letters or parcels sent in
> the mail are addressed to places not the residence or regular business
> address of the person for whom they are intended, to enable the person
> to escape identification, the Postal Service may deliver the mail only
> upon identification of the person so addressed.


<a id="org4bb9629"></a>

# Design Draft

The best solution for minimizing efforts related to changing the
postal address is to use permanent address alias ([AA](#org99906cf)), which
identifies the recipient in a unique way, which is resolved to a regular
or military address every time up on shipping. Immutability of the [AA](#org99906cf)
is provided through its geo independence.

While a US person or a business may issue any number of [AA](#org99906cf)s all AAs are
always resolved to the same postal address ([PA](#org3ef986b)).

These days [PA](#org3ef986b) on an envelope is written mostly for convenience,
because the envelope, before being shipped, is labeled by a unique
barcode and the actual address is stored in the central database,
which guides sorting robots to provide correct routing.

So the AA should not contain the literal PA of destination and
infrastructure for PMAA implementation already exists.


<a id="org6ca5d48"></a>

## Postal Address (PA)

<a id="org3ef986b"></a>

PA is exposed to authorized shipping companies only (e.g. USPS, FedEx, DHL
etc.) by resolution via [AA](#org99906cf) and recipient name.

Delivery just by [PA](#org3ef986b) can be disabled to prevent spam.

Just a single PA can be bound to SSN or a foreign passport in case of an
immigrant.


<a id="orgbedb233"></a>

## Address Alias (AA)

<a id="org99906cf"></a>

[PA](#org3ef986b) can be bound to any number of AAs.  Ideally every time a person
needs to fill a form containing a postal address an new AA might be
issued by the system. AA dedicated to a specific sender closes the
problem of leaks.

AA format can be the same as PA to minimize efforts with updating
existing forms and database schemes.

It is enough to introduce a special zip code and city to intercept
default routing.

Let every state to pick a name and zip code for a virtual city
(e.g. Pmaa 99999) covering all address aliases. AA state may not be
equal to the real state form PA, but AA state inherits PA state at
the moment of issuing AA.

PA is used for sales tax calculation by online retailer stores. PMAA
REST API should serve requests for getting current PA zip code by AA.

Unit number may be optional and serve as a Luhn-like hash of rest AA
fields.

AA maps itself onto PA in a unique way. [PA](#org3ef986b) cannot be guessed by AA and
one AA cannot be guessed by another AA.

AA can be bound to a specific sender (based on who used it first).
This way dedicated AA solves problems with privacy, leaks and phishing,
because even if AA leaks due a data breach AA cannot be used outside
of the organization it is bound to.

Having multiple AAs mitigates risk of identity theft - a leaked AA
from one system would not match AA in another place and using a
mismatching address can trigger a stronger security check.


<a id="orgc39f670"></a>

## PMAA REST API

AA is useless without the PMAA database. REST API gives granular
access to all parties. PMAA deals only with address translation.

1.  Check [AA](#org99906cf) is valid (for reusable non autobinding AA).
2.  Bind [AA](#org99906cf) to sender's AA (atomic).
3.  Chech [AA](#org99906cf) is bound to a sender.
4.  Get zip code and timestamp when PA was updated by providing [AA](#org99906cf) and person
    Name. (e.g. DMV - proof of residence)
5.  Subscribe for email notification about invalidated [AA](#org99906cf) or zip code
    or person name change (recalculate quote, invalidate DL).
6.  Issue [AA](#org99906cf).
7.  Invalidate [AA](#org99906cf).
8.  Register an account for a person or business.
9.  Submit a request for changing [PA](#org3ef986b).
10. Confirm new [PA](#org3ef986b) by a one-time code from a PMAA letter.
11. List senders used the specified AA.
12. List all AAs bound to the specified PA.
13. Can a sender (identified by PA) send to the specified AA.
14. Give the current zip code for AA for calculation of sales tax or LatLong
    near the specified AA where the LatLong coordinate and the
    associated PA have the same sales tax rules.
15. Try to resolve AA, a recipient name and sender's AA into the
    recipient's PA.


<a id="orgb81e0fd"></a>

## Gradual implementation

PMAA can be deployed gradually in parallel with existing addressing
approaches.


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> <https://en.wikipedia.org/wiki/Information_Age>

<sup><a id="fn.2" href="#fnr.2">2</a></sup> Clements, M.T. (2005). "Inefficient Standard Adoption: Inertia and Momentum Revisited". Economic Inquiry. 43 (3): 507–518. https://doi.org/10.1093/ei/cbi034

<sup><a id="fn.3" href="#fnr.3">3</a></sup> Liebowitz, S.J.; S.E. Margolis (1994). "Network Externality: An Uncommon Tragedy". The Journal of Economic Perspectives. 8 (2): 133–150. https://doi.org/10.1257/jep.8.2.133

<sup><a id="fn.4" href="#fnr.4">4</a></sup> <https://www.census.gov/library/stories/2023/11/state-to-state-migration.html>

<sup><a id="fn.5" href="#fnr.5">5</a></sup> <https://www2.census.gov/programs-surveys/demo/tables/geographic-mobility/2023/state-to-state-migration/State_to_State_Migration_Table_2023_T13.xlsx>

<sup><a id="fn.6" href="#fnr.6">6</a></sup> <https://www.paymentsjournal.com/how-many-bank-accounts-do-consumers-have/>

<sup><a id="fn.7" href="#fnr.7">7</a></sup> <https://www.census.gov/quickfacts/fact/table/US/INC910223#INC910223>

<sup><a id="fn.8" href="#fnr.8">8</a></sup> <https://taxfoundation.org/data/all/federal/latest-federal-income-tax-data-2025/>

<sup><a id="fn.9" href="#fnr.9">9</a></sup> <https://en.wikipedia.org/wiki/United_States_debt_ceiling>

<sup><a id="fn.10" href="#fnr.10">10</a></sup> <https://en.wikipedia.org/wiki/Phishing>

<sup><a id="fn.11" href="#fnr.11">11</a></sup> <https://www.statista.com/statistics/273550/data-breaches-recorded-in-the-united-states-by-number-of-breaches-and-records-exposed/>

<sup><a id="fn.12" href="#fnr.12">12</a></sup> <https://en.wikipedia.org/wiki/Luhn_algorithm>

<sup><a id="fn.13" href="#fnr.13">13</a></sup> <https://www.fortomorrow.eu/en/blog/carbon-email>

<sup><a id="fn.14" href="#fnr.14">14</a></sup> <https://uscode.house.gov/view.xhtml?path=/prelim@title39/part4/chapter30&edition=prelim>
