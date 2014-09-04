library shelf_perf_compare.shared;

import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

const HELLO_WORLD =
    const String.fromEnvironment('body', defaultValue: 'Hello, world!');

/// Don't modify this!
final BYTES = new Uint8List.fromList(UTF8.encode(HELLO_WORLD));

// TODO(kevmoo): should this be sliced in a more "reasonable" way?
final _listOfBytes = [BYTES];

Stream<List<int>> getHelloWorldStream() =>
    new Stream.fromIterable(_listOfBytes);


Future startServer(ServerFunc func) {
  var port = new RawReceivePort((msg) => print(msg));

  return Isolate.spawn(func, port.sendPort);
}

typedef void ServerFunc([SendPort port]);

typedef void PrintFunc(Object obj);

PrintFunc getPrintFunc(SendPort port) {
  if (port == null) return print;
  return port.send;
}


const _CONSTITUTION = r'''
The Project Gutenberg EBook of The United States' Constitution
by  Founding Fathers

Copyright laws are changing all over the world. Be sure to check the
copyright laws for your country before downloading or redistributing
this or any other Project Gutenberg eBook.

This header should be the first thing seen when viewing this Project
Gutenberg file.  Please do not remove it.  Do not change or edit the
header without written permission.

Please read the "legal small print," and other information about the
eBook and Project Gutenberg at the bottom of this file.  Included is
important information about your specific rights and restrictions in
how the file may be used.  You can also find out about how to make a
donation to Project Gutenberg, and how to get involved.


**Welcome To The World of Free Plain Vanilla Electronic Texts**

**eBooks Readable By Both Humans and By Computers, Since 1971**

*****These eBooks Were Prepared By Thousands of Volunteers!*****


Title: The United States' Constitution

Author:  Founding Fathers

Release Date: December, 1975  [EBook #5]
[This file was first posted on August 19, 2003]
[Most recently updated: April 14, 2006]

Edition: 11

Language: English


*** START OF THE PROJECT GUTENBERG EBOOK, THE UNITED STATES' CONSTITUTION ***




All of the original Project Gutenberg Etexts from the
1970's were produced in ALL CAPS, no lower case.  The
computers we used then didn't have lower case at all.

***

These original Project Gutenberg Etexts will be compiled into a file
containing them all, in order to improve the content ratios of Etext
to header material.

***



The following edition of The Consitution of the United States of America
has been based on many hours of study of a variety of editions, and will
include certain variant spellings, punctuation, and captialization as we
have been able to reasonable ascertain belonged to the orginal.  In case
of internal discrepancies in these matters, most or all have been left.

In our orginal editions the letters were all CAPITALS, and we did not do
anything about capitalization, consistent or otherwise, nor with most of
the punctuation, since we had limited punctionation in those days.

This document does NOT include the amendments, as the Bill of Rights was
one of our earlier Project Gutenberg Etexts, and the others will be sent
in a separate posting.

***

We would ask that any Consitutional scholars would please take a minute,
or longer, to send us a note concerning possible corrections.

***




THE CONSTITUTION OF THE UNITED STATES OF AMERICA, 1787



We the people of the United States, in Order to form a more perfect Union,
establish Justice, insure domestic Tranquility, provide for the common defence,
promote the general Welfare, and secure the Blessings of Liberty to ourselves
and our Posterity, do ordain and establish this Constitution for the
United States of America.


Article 1

Section 1.  All legislative Powers herein granted shall be vested in a
Congress of the United States, which shall consist of a Senate and
House of Representatives.

Section 2.  The House of Representatives shall be composed of Members
chosen every second Year by the People of the several States,
and the electors in each State shall have the qualifications requisite
for electors of the most numerous branch of the State legislature.

No Person shall be a Representative who shall not have attained to the
Age of twenty five Years, and been seven Years a citizen of the United States,
and who shall not, when elected, be an Inhabitant of that State in which
he shall be chosen.

Representatives and direct Taxes shall be apportioned among
the several States which may be included within this Union,
according to their respective Numbers, which shall be determined
by adding to the whole number of free Persons, including those
bound to Service for a Term of Years, and excluding Indians not taxed,
three fifths of all other Persons.  The actual Enumeration shall be made
within three Years after the first Meeting of the Congress of the
United States, and within every subsequent Term of ten Years,
in such Manner as they shall by law Direct.  The number of
Representatives shall not exceed one for every thirty Thousand,
but each State shall have at least one Representative;
and until such enumeration shall be made, the State of New Hampshire
shall be entitled to chuse three, Massachusetts eight, Rhode Island
and Providence Plantations one, Connecticut five, New York six,
New Jersey four, Pennsylvania eight, Delaware one, Maryland six,
Virginia ten, North Carolina five, South Carolina five, and Georgia three.

When vacancies happen in the Representation from any State, the Executive
Authority thereof shall issue Writs of Election to fill such Vacancies.

The House of Representatives shall chuse their Speaker and other Officers;
and shall have the sole Power of Impeachment.

Section 3.  The Senate of the United States shall be composed of
two Senators from each State, chosen by the legislature thereof,
for six Years; and each Senator shall have one Vote.

Immediately after they shall be assembled in Consequence of the first Election,
they shall be divided as equally as may be into three Classes.  The Seats of
the Senators of the first Class shall be vacated at the expiration of the
second Year, of the second Class at the expiration of the fourth Year,
and of the third Class at the expiration of the sixth Year, so that one third
may be chosen every second Year; and if vacancies happen by Resignation,
or otherwise, during the recess of the Legislature of any State,
the Executive thereof may make temporary Appointments until the
next meeting of the Legislature, which shall then fill such Vacancies.

No person shall be a Senator who shall not have attained to the Age of
thirty Years, and been nine Years a Citizen of the United States,
and who shall not, when elected, be an Inhabitant of that State
for which he shall be chosen.

The Vice-President of the United States shall be President of the Senate,
but shall have no Vote, unless they be equally divided.

The Senate shall choose their other Officers, and also a President
pro tempore, in the Absence of the Vice-President, or when he shall
exercise the Office of President of the United States.

The Senate shall have the sole Power to try all Impeachments.
When sitting for that Purpose, they shall be on Oath or Affirmation.
When the President of the United States is tried, the Chief Justice
shall preside: And no Person shall be convicted without the Concurrence
of two thirds of the Members present.

Judgment in cases of Impeachment shall not extend further than to removal
from Office, and disqualification to hold and enjoy any Office of honor,
Trust or Profit under the United States:  but the Party convicted shall
nevertheless be liable and subject to Indictment, Trial, Judgment and
Punishment, according to Law.

Section 4.  The Times, Places and Manner of holding Elections for Senators and
Representatives, shall be prescribed in each State by the Legislature thereof;
but the Congress may at any time by Law make or alter such Regulations,
except as to the Places of chusing Senators.

The Congress shall assemble at least once in every Year,
and such Meeting shall be on the first Monday in December,
unless they shall by law appoint a different Day.


Section 5.  Each House shall be the Judge of the Elections,
Returns and Qualifications of its own Members, and a
Majority of each shall constitute a Quorum to do Business;
but a smaller Number may adjourn from day to day,
and may be authorized to compel the Attendance of absent Members,
in such Manner, and under such Penalties as each House may provide.

Each house may determine the Rules of its Proceedings,
punish its Members for disorderly Behavior, and, with the
Concurrence of two-thirds, expel a Member.

Each house shall keep a Journal of its Proceedings,
and from time to time publish the same, excepting such Parts as may
in their Judgment require Secrecy; and the Yeas and Nays of the
Members of either House on any question shall, at the Desire of
one fifth of those Present, be entered on the Journal.

Neither House, during the Session of Congress, shall, without the
Consent of the other, adjourn for more than three days, nor to
any other Place than that in which the two Houses shall be sitting.

Section 6.  The Senators and Representatives shall receive a Compensation
for their Services, to be ascertained by Law, and paid out of the Treasury
of the United States.  They shall in all Cases, except Treason, Felony and
Breach of the Peace, be privileged from Arrest during their Attendance
at the Session of their respective Houses, and in going to and returning
from the same; and for any Speech or Debate in either House,
they shall not be questioned in any other Place.

No Senator or Representative shall, during the Time for which he was elected,
be appointed to any civil Office under the authority of the United States,
which shall have been created, or the Emoluments whereof shall have been
increased during such time; and no Person holding any Office under the
United States, shall be a Member of either House during his Continuance
in Office.

Section 7.  All Bills for raising Revenue shall originate in the
House of Representatives; but the Senate may propose or concur with
Amendments as on other Bills.

Every Bill which shall have passed the House of Representatives and
the Senate, shall, before it become a Law, be presented to the
President of the United States; If he approve he shall sign it,
but if not he shall return it, with his Objections to that House
in which it shall have originated, who shall enter the Objections
at large on their Journal, and proceed to reconsider it.
If after such Reconsideration two thirds of that house
shall agree to pass the Bill, it shall be sent,
together with the Objections, to the other House, by which
it shall likewise be reconsidered, and if approved by two thirds
of that House, it shall become a law.  But in all such Cases
the Votes of both Houses shall be determined by Yeas and Nays,
and the Names of the Persons voting for and against the Bill shall be
entered on the Journal of each House respectively.  If any Bill
shall not be returned by the President within ten Days (Sundays excepted)
after it shall have been presented to him, the Same shall be a Law,
in like Manner as if he had signed it, unless the Congress by their
Adjournment prevent its Return, in which case it shall not be a Law.

Every Order, Resolution, or Vote to which the Concurrence of the Senate
and House of Representatives may be necessary (except on a question
of Adjournment) shall be presented to the President of the United States;
and before the Same shall take Effect, shall be approved by him,
or being disapproved by him, shall be repassed by two thirds of
the Senate and House of Representatives, according to the Rules
and Limitations prescribed in the Case of a Bill.

Section 8.  The Congress shall have Power to lay and collect Taxes, Duties,
Imposts and Excises, to pay the Debts and provide for the common Defence
and general Welfare of the United States; but all Duties, Imposts and Excises
shall be uniform throughout the United States;

To borrow Money on the credit of the United States;

To regulate Commerce with foreign Nations, and among the several States,
and with the Indian Tribes;

To establish an uniform Rule of Naturalization, and uniform Laws
on the subject of Bankruptcies throughout the United States;

To coin Money, regulate the Value thereof, and of foreign Coin,
and fix the Standard of Weights and Measures;

To provide for the Punishment of counterfeiting the Securities
and current Coin of the United States;

To establish Post Offices and Post Roads;

To promote the Progress of Science and useful Arts, by securing
for limited Times to Authors and Inventors the exclusive Right
to their respective Writings and Discoveries;

To constitute Tribunals inferior to the supreme Court;

To define and punish Piracies and Felonies committed on the high Seas,
and Offenses against the Law of Nations;

To declare War, grant Letters of Marque and Reprisal,
and make Rules concerning Captures on Land and Water;

To raise and support Armies, but no Appropriation of Money to that Use
shall be for a longer term than two Years;

To provide and maintain a Navy;

To make Rules for the Government and Regulation of the land and naval Forces;

To provide for calling forth the Militia to execute the Laws of the Union,
suppress Insurrections and repel Invasions;

To provide for organizing, arming, and disciplining, the Militia, and for
governing such Part of them as may be employed in the Service of the
United States, reserving to the States respectively, the Appointment
of the Officers, and the Authority of training the militia according
to the discipline prescribed by Congress;

To exercise exclusive Legislation in all Cases whatsoever,
over such District (not exceeding ten Miles square) as may,
by Cession of particular States, and the Acceptance of Congress,
become the Seat of the Government of the United States, and to
exercise like Authority over all Places purchased by the Consent
of the Legislature of the State in which the Same shall be,
for the Erection of Forts, Magazines, Arsenals, Dockyards,
and other needful Buildings;--And

To make all Laws which shall be necessary and proper for carrying
into Execution the foregoing Powers, and all other Powers vested
by this Constitution in the Government of the United States,
or in any Department or Officer thereof.

Section 9.  The Migration or Importation of such Persons as any
of the States now existing shall think proper to admit, shall not
be prohibited by the Congress prior to the Year one thousand eight
hundred and eight, but a Tax or Duty may be imposed on such Importation,
not exceeding ten dollars for each Person.

The Privilege of the Writ of Habeas Corpus shall not be suspended, unless
when in Cases of Rebellion or Invasion the public Safety may require it.

No Bill of Attainder or ex post facto Law shall be passed.

No Capitation, or other direct, Tax shall be laid, unless in Proportion
to the Census or Enumeration herein before directed to be taken.

No Tax or Duty shall be laid on Articles exported from any State.

No Preference shall be given by any Regulation of Commerce or Revenue
to the Ports of one State over those of another: nor shall Vessels bound to,
or from, one State, be obliged to enter, clear, or pay Duties in another.

No Money shall be drawn from the Treasury, but in Consequence
of Appropriations made by Law; and a regular Statement and Account
of the Receipts and Expenditures of all public Money shall be
published from time to time.

No Title of Nobility shall be granted by the United States;
and no Person holding any Office of Profit or Trust under them, shall,
without the Consent of the Congress, accept of any present, Emolument,
Office, or Title, of any kind whatever, from any King, Prince,
or foreign State.

Section 10.  No State shall enter into any Treaty, Alliance, or
Confederation; grant Letters of Marque and Reprisal; coin Money;
emit Bills of Credit; make any Thing but gold and silver Coin a Tender
in Payment of Debts; pass any Bill of Attainder, ex post facto Law,
or Law impairing the Obligation of Contracts, or grant any Title of Nobility.

No State shall, without the Consent of the Congress, lay any Imposts or Duties
on Imports or Exports, except what may be absolutely necessary for executing
it's inspection Laws: and the net Produce of all Duties and Imposts,
laid by any State on Imports or Exports, shall be for the Use of the Treasury
of the United States; and all such Laws shall be subject to the Revision
and Controul of the Congress.


No State shall, without the Consent of Congress, lay any Duty of
Tonnage, keep Troops, or Ships of War in time of Peace, enter into any
Agreement or Compact with another State, or with a foreign Power, or
engage in War, unless actually invaded, or in such imminent Danger
as will not admit of delay.

ARTICLE 2

Section 1.  The executive Power shall be vested in a President
of the United States of America.  He shall hold his Office during
the Term of four Years, and, together with the Vice President
chosen for the same Term, be elected, as follows:

Each State shall appoint, in such Manner as the Legislature thereof may direct,
a Number of Electors, equal to the whole Number of Senators and Representatives
to which the State may be entitled in the Congress:  but no Senator or
Representative, or Person holding an Office of Trust or Profit under
the United States, shall be appointed an Elector.

The Electors shall meet in their respective States, and vote by Ballot
for two Persons, of whom one at least shall not be an Inhabitant of
the same State with themselves.  And they shall make a List of
all the Persons voted for, and of the Number of Votes for each;
which List they shall sign and certify, and transmit sealed to
the Seat of the Government of the United States, directed to the
President of the Senate.  The President of the Senate shall,
in the Presence of the Senate and House of Representatives,
open all the Certificates, and the Votes shall then be counted.
The Person having the greatest Number of Votes shall be the President,
if such Number be a Majority of the whole Number of Electors appointed;
and if there be more than one who have such Majority, and have an equal
Number of votes, then the House of Representatives shall immediately
chuse by Ballot one of them for President; and if no Person have
a Majority, then from the five highest on the List the said House
shall in like Manner chuse the President.  But in chusing the President,
the Votes shall be taken by States, the Representation from each State
having one Vote; a Quorum for this Purpose shall consist of a Member
or Members from two thirds of the States, and a Majority of all the
States shall be necessary to a Choice.  In every Case, after the Choice
of the President, the Person having the greatest Number of Votes of
the Electors shall be the Vice President.  But if there should remain
two or more who have equal Votes, the Senate shall chuse from them
by Ballot the Vice President.

The Congress may determine the Time of chusing the Electors,
and the Day on which they shall give their Votes; which Day
shall be the same throughout the United States.

No Person except a natural born Citizen, or a Citizen of the United States,
at the time of the Adoption of this Constitution, shall be eligible to
the Office of President; neither shall any Person be eligible to that
Office who shall not have attained to the Age of thirty five Years,
and been fourteen Years a Resident within the United States.

In Case of the Removal of the President from Office, or of his Death,
Resignation, or Inability to discharge the Powers and Duties of the
said Office, the Same shall devolve on the Vice President, and the
Congress may by Law provide for the Case of Removal, Death, Resignation
or Inability, both of the President and Vice President, declaring what
Officer shall then act as President, and such Officer shall act accordingly,
until the Disability be removed, or a President shall be elected.

The President shall, at stated Times, receive for his Services,
a Compensation, which shall neither be encreased nor diminished during
the Period for which he shall have been elected, and he shall not receive
within that Period any other Emolument from the United States, or any of them.

Before he enter on the Execution of his Office, he shall take the
following Oath or Affirmation:--"I do solemnly swear (or affirm) that
I will faithfully execute the Office of President of the United States,
and will to the best of my Ability, preserve, protect and defend the
Constitution of the United States."

Section 2.  The President shall be Commander in Chief of the Army
and Navy of the United States, and of the Militia of the several States,
when called into the actual Service of the United States;
he may require the Opinion, in writing, of the principal Officer
in each of the executive Departments, upon any Subject relating to
the Duties of their respective Offices, and he shall have Power
to grant Reprieves and Pardons for Offenses against the United States,
except in Cases of impeachment.

He shall have Power, by and with the Advice and Consent of the
Senate, to make Treaties, provided two thirds of the Senators
present concur; and he shall nominate, and by and with the Advice
and Consent of the Senate, shall appoint Ambassadors, other public
Ministers and Consuls, Judges of the supreme Court, and all other
Officers of the United States, whose Appointments are not herein
otherwise provided for, and which shall be established by Law:
but the Congress may by Law vest the Appointment of such inferior Officers,
as they think proper, in the President alone, in the Courts of Law,
or in the Heads of Departments.

The President shall have Power to fill up all Vacancies that may happen
during the Recess of the Senate, by granting Commissions which shall
expire at the End of their next session.

Section 3.  He shall from time to time give to the Congress
Information of the State of the Union, and recommend to their
Consideration such Measures as he shall judge necessary and expedient;
he may, on extraordinary Occasions, convene both Houses, or either
of them, and in Case of Disagreement between them, with Respect to
the Time of Adjournment, he may adjourn them to such Time as he shall
think proper; he shall receive Ambassadors and other public Ministers;
he shall take Care that the Laws be faithfully executed, and shall
Commission all the Officers of the United States.

Section 4.  The President, Vice President and all civil Officers of the
United States, shall be removed from Office on Impeachment for,
and Conviction of, Treason, Bribery, or other high Crimes and Misdemeanors.

ARTICLE THREE

Section 1.  The judicial Power of the United States, shall be vested
in one supreme Court, and in such inferior Courts as the Congress may
from time to time ordain and establish.  The Judges, both of the supreme
and inferior Courts, shall hold their Offices during good behavior,
and shall, at stated Times, receive for their Services, a Compensation,
which shall not be diminished during their Continuance in Office.

Section 2.  The judicial Power shall extend to all Cases, in Law and Equity,
arising under this Constitution, the Laws of the United States, and Treaties
made, or which shall be made, under their Authority;--to all Cases affecting
Ambassadors, other public Ministers and Consuls;--to all Cases of admiralty
and maritime Jurisdiction;--to Controversies to which the United States
shall be a Party;--to Controversies between two or more States;--between a
State and Citizens of another State;--between Citizens of different States;
--between Citizens of the same State claiming Lands under Grants of
different States, and between a State, or the Citizens thereof,
and foreign States, Citizens or Subjects.

In all cases affecting Ambassadors, other public Ministers and Consuls,
and those in which a State shall be Party, the supreme Court shall have
original Jurisdiction.  In all the other Cases before mentioned, the
supreme Court shall have appellate Jurisdiction, both as to Law and Fact,
with such Exceptions, and under such Regulations as the Congress shall make.

The Trial of all Crimes, except in Cases of Impeachment, shall be by Jury;
and such Trial shall be held in the State where the said Crimes shall
have been committed; but when not committed within any State, the Trial
shall be at such Place or Places as the Congress may by Law have directed.

Section 3.  Treason against the United States, shall consist only in
levying War against them, or in adhering to their Enemies, giving them
Aid and Comfort.  No Person shall be convicted of Treason unless on
the Testimony of two Witnesses to the same overt Act, or on Confession
in open Court.

The Congress shall have power to declare the punishment of Treason,
but no Attainder of Treason shall work Corruption of Blood,
or Forfeiture except during the Life of the Person attainted.


ARTICLE FOUR

Section 1.  Full Faith and Credit shall be given in each State to the
public Acts, Records, and judicial Proceedings of every other State.
And the Congress may by general Laws prescribe the Manner in which such Acts,
Records, and Proceedings shall be proved, and the Effect thereof.


Section 2.  The Citizens of each State shall be entitled to all
Privileges and Immunities of Citizens in the several States.

A Person charged in any State with Treason, Felony, or other Crime,
who shall flee from Justice, and be found in another State,
shall on Demand of the executive Authority of the State from
which he fled, be delivered up, to be removed to the State having
Jurisdiction of the Crime.

No person held to Service or Labor in one State, under the Laws thereof,
escaping into another, shall, in Consequence of any Law or Regulation therein,
be discharged from such Service or Labor, But shall be delivered up on Claim
of the Party to whom such Service or Labor may be due.


Section 3.  New States may be admitted by the Congress into this Union;
but no new States shall be formed or erected within the Jurisdiction
of any other State; nor any State be formed by the Junction of two
or more States, or Parts of States, without the Consent of the
Legislatures of the States concerned as well as of the Congress.

The Congress shall have Power to dispose of and make all needful Rules
and Regulations respecting the Territory or other Property belonging
to the United States; and nothing in this Constitution shall be so
construed as to Prejudice any Claims of the United States,
or of any particular State.

Section 4.  The United States shall guarantee to every State in this Union
a Republican Form of Government, and shall protect each of them against
Invasion; and on Application of the Legislature, or of the Executive
(when the Legislature cannot be convened) against domestic Violence.


ARTICLE FIVE

The Congress, whenever two thirds of both Houses shall deem it necessary,
shall propose Amendments to this Constitution, or, on the Application of
the Legislatures of two thirds of the several States, shall call a Convention
for proposing Amendments, which, in either Case, shall be valid to all Intents
and Purposes, as Part of this Constitution, when ratified by the Legislatures
of three fourths of the several States, or by Conventions in three fourths
thereof, as the one or the other Mode of Ratification may be proposed by
the Congress; Provided that no Amendment which may be made prior to the
Year one thousand eight hundred and eight shall in any Manner affect
the first and fourth Clauses in the ninth Section of the first Article;
and that no State, without its Consent, shall be deprived of it's
equal Suffrage in the Senate.

ARTICLE SIX

All Debts contracted and Engagements entered into, before the Adoption
of this Constitution, shall be as valid against the United States
under this Constitution, as under the Confederation.

This Constitution, and the Laws of the United States which shall be made
in Pursuance thereof; and all Treaties made, or which shall be made,
under the Authority of the United States, shall be the supreme
Law of the Land; and the Judges in every State shall be bound thereby,
any Thing in the Constitution or Laws of any State to the Contrary
notwithstanding.

The Senators and Representatives before mentioned, and the Members of the
several State Legislatures, and all executive and judicial Officers,
both of the United States and of the several States, shall be bound
by Oath or Affirmation, to support this Constitution; but no religious
Test shall ever be required as a Qualification to any Office or public Trust
under the United States

ARTICLE SEVEN

The Ratification of the Conventions of nine States, shall be sufficient for the
Establishment of this Constitution between the States so ratifying the Same.

Done in Convention by the Unanimous Consent of the States present
the Seventeenth Day of September in the Year of our Lord one
thousand seven hundred and eighty seven and of the Independence of the
United States of America the Twelfth        In Witness whereof We have
hereunto subscribed our Names,

Go. WASHINGTON--
Presid. and deputy from Virginia

New Hampshire

John Langdon
Nicholas Gilman

Massachusetts

Nathaniel Gorham
Rufus King

Connecticut

Wm. Saml. Johnson
Roger Sherman

New York

Alexander Hamilton

New Jersey

Wil: Livingston
David Brearley
Wm. Paterson
Jona: Dayton

Pennsylvania

B Franklin
Thomas Mifflin
Robt Morris
Geo. Clymer
Thos FitzSimons
Jared Ingersoll
James Wilson
Gouv Morris

Delaware

Geo: Read
Gunning Bedford jun
John Dickinson
Richard Bassett
Jaco: Broom

Maryland

James Mchenry
Dan of St Thos. Jenifer
Danl Carroll

Virginia

John Blair--
James Madison Jr.

North Carolina

Wm. Blount
Rich'd Dobbs Spaight
Hu Williamson

South Carolina

J. Rutledge
Charles Cotesworth Pinckney
Charles Pinckney
Pierce Butler

Georgia

William Few
Abr Baldwin


Attest:
William Jackson, Secretary






*** END OF THE PROJECT GUTENBERG EBOOK, THE UNITED STATES' CONSTITUTION ***

This file should be named const11.txt or const11.zip
Corrected EDITIONS of our eBooks get a new NUMBER, const12.txt
VERSIONS based on separate sources get new LETTER, const11a.txt

Project Gutenberg eBooks are often created from several printed
editions, all of which are confirmed as Public Domain in the US
unless a copyright notice is included.  Thus, we usually do not
keep eBooks in compliance with any particular paper edition.

We are now trying to release all our eBooks one year in advance
of the official release dates, leaving time for better editing.
Please be encouraged to tell us about any error or corrections,
even years after the official publication date.

Please note neither this listing nor its contents are final til
midnight of the last day of the month of any such announcement.
The official release date of all Project Gutenberg eBooks is at
Midnight, Central Time, of the last day of the stated month.  A
preliminary version may often be posted for suggestion, comment
and editing by those who wish to do so.

Most people start at our Web sites at:
http://gutenberg.net or
http://promo.net/pg

These Web sites include award-winning information about Project
Gutenberg, including how to donate, how to help produce our new
eBooks, and how to subscribe to our email newsletter (free!).


Those of you who want to download any eBook before announcement
can get to them as follows, and just download by date.  This is
also a good way to get them instantly upon announcement, as the
indexes our cataloguers produce obviously take a while after an
announcement goes out in the Project Gutenberg Newsletter.

http://www.ibiblio.org/gutenberg/etext05 or
ftp://ftp.ibiblio.org/pub/docs/books/gutenberg/etext05

Or /etext04, 03, 02, 01, 00, 99, 98, 97, 96, 95, 94, 93, 92, 92,
91 or 90

Just search by the first five letters of the filename you want,
as it appears in our Newsletters.


Information about Project Gutenberg (one page)

We produce about two million dollars for each hour we work.  The
time it takes us, a rather conservative estimate, is fifty hours
to get any eBook selected, entered, proofread, edited, copyright
searched and analyzed, the copyright letters written, etc.   Our
projected audience is one hundred million readers.  If the value
per text is nominally estimated at one dollar then we produce $2
million dollars per hour in 2002 as we release over 100 new text
files per month:  1240 more eBooks in 2001 for a total of 4000+
We are already on our way to trying for 2000 more eBooks in 2002
If they reach just 1-2% of the world's population then the total
will reach over half a trillion eBooks given away by year's end.

The Goal of Project Gutenberg is to Give Away 1 Trillion eBooks!
This is ten thousand titles each to one hundred million readers,
which is only about 4% of the present number of computer users.

Here is the briefest record of our progress (* means estimated):

eBooks Year Month

    1  1971 July
   10  1991 January
  100  1994 January
 1000  1997 August
 1500  1998 October
 2000  1999 December
 2500  2000 December
 3000  2001 November
 4000  2001 October/November
 6000  2002 December*
 9000  2003 November*
10000  2004 January*


The Project Gutenberg Literary Archive Foundation has been created
to secure a future for Project Gutenberg into the next millennium.

We need your donations more than ever!

As of February, 2002, contributions are being solicited from people
and organizations in: Alabama, Alaska, Arkansas, Connecticut,
Delaware, District of Columbia, Florida, Georgia, Hawaii, Illinois,
Indiana, Iowa, Kansas, Kentucky, Louisiana, Maine, Massachusetts,
Michigan, Mississippi, Missouri, Montana, Nebraska, Nevada, New
Hampshire, New Jersey, New Mexico, New York, North Carolina, Ohio,
Oklahoma, Oregon, Pennsylvania, Rhode Island, South Carolina, South
Dakota, Tennessee, Texas, Utah, Vermont, Virginia, Washington, West
Virginia, Wisconsin, and Wyoming.

We have filed in all 50 states now, but these are the only ones
that have responded.

As the requirements for other states are met, additions to this list
will be made and fund raising will begin in the additional states.
Please feel free to ask to check the status of your state.

In answer to various questions we have received on this:

We are constantly working on finishing the paperwork to legally
request donations in all 50 states.  If your state is not listed and
you would like to know if we have added it since the list you have,
just ask.

While we cannot solicit donations from people in states where we are
not yet registered, we know of no prohibition against accepting
donations from donors in these states who approach us with an offer to
donate.

International donations are accepted, but we don't know ANYTHING about
how to make them tax-deductible, or even if they CAN be made
deductible, and don't have the staff to handle it even if there are
ways.

Donations by check or money order may be sent to:

 PROJECT GUTENBERG LITERARY ARCHIVE FOUNDATION
 809 North 1500 West
 Salt Lake City, UT 84116

Contact us if you want to arrange for a wire transfer or payment
method other than by check or money order.

The Project Gutenberg Literary Archive Foundation has been approved by
the US Internal Revenue Service as a 501(c)(3) organization with EIN
[Employee Identification Number] 64-622154.  Donations are
tax-deductible to the maximum extent permitted by law.  As fund-raising
requirements for other states are met, additions to this list will be
made and fund-raising will begin in the additional states.

We need your donations more than ever!

You can get up to date donation information online at:

http://www.gutenberg.net/donation.html


***

If you can't reach Project Gutenberg,
you can always email directly to:

Michael S. Hart <hart@pobox.com>

Prof. Hart will answer or forward your message.

We would prefer to send you information by email.


**The Legal Small Print**


(Three Pages)

***START**THE SMALL PRINT!**FOR PUBLIC DOMAIN EBOOKS**START***
Why is this "Small Print!" statement here? You know: lawyers.
They tell us you might sue us if there is something wrong with
your copy of this eBook, even if you got it for free from
someone other than us, and even if what's wrong is not our
fault. So, among other things, this "Small Print!" statement
disclaims most of our liability to you. It also tells you how
you may distribute copies of this eBook if you want to.

*BEFORE!* YOU USE OR READ THIS EBOOK
By using or reading any part of this PROJECT GUTENBERG-tm
eBook, you indicate that you understand, agree to and accept
this "Small Print!" statement. If you do not, you can receive
a refund of the money (if any) you paid for this eBook by
sending a request within 30 days of receiving it to the person
you got it from. If you received this eBook on a physical
medium (such as a disk), you must return it with your request.

ABOUT PROJECT GUTENBERG-TM EBOOKS
This PROJECT GUTENBERG-tm eBook, like most PROJECT GUTENBERG-tm eBooks,
is a "public domain" work distributed by Professor Michael S. Hart
through the Project Gutenberg Association (the "Project").
Among other things, this means that no one owns a United States copyright
on or for this work, so the Project (and you!) can copy and
distribute it in the United States without permission and
without paying copyright royalties. Special rules, set forth
below, apply if you wish to copy and distribute this eBook
under the "PROJECT GUTENBERG" trademark.

Please do not use the "PROJECT GUTENBERG" trademark to market
any commercial products without permission.

To create these eBooks, the Project expends considerable
efforts to identify, transcribe and proofread public domain
works. Despite these efforts, the Project's eBooks and any
medium they may be on may contain "Defects". Among other
things, Defects may take the form of incomplete, inaccurate or
corrupt data, transcription errors, a copyright or other
intellectual property infringement, a defective or damaged
disk or other eBook medium, a computer virus, or computer
codes that damage or cannot be read by your equipment.

LIMITED WARRANTY; DISCLAIMER OF DAMAGES
But for the "Right of Replacement or Refund" described below,
[1] Michael Hart and the Foundation (and any other party you may
receive this eBook from as a PROJECT GUTENBERG-tm eBook) disclaims
all liability to you for damages, costs and expenses, including
legal fees, and [2] YOU HAVE NO REMEDIES FOR NEGLIGENCE OR
UNDER STRICT LIABILITY, OR FOR BREACH OF WARRANTY OR CONTRACT,
INCLUDING BUT NOT LIMITED TO INDIRECT, CONSEQUENTIAL, PUNITIVE
OR INCIDENTAL DAMAGES, EVEN IF YOU GIVE NOTICE OF THE
POSSIBILITY OF SUCH DAMAGES.

If you discover a Defect in this eBook within 90 days of
receiving it, you can receive a refund of the money (if any)
you paid for it by sending an explanatory note within that
time to the person you received it from. If you received it
on a physical medium, you must return it with your note, and
such person may choose to alternatively give you a replacement
copy. If you received it electronically, such person may
choose to alternatively give you a second opportunity to
receive it electronically.

THIS EBOOK IS OTHERWISE PROVIDED TO YOU "AS-IS". NO OTHER
WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, ARE MADE TO YOU AS
TO THE EBOOK OR ANY MEDIUM IT MAY BE ON, INCLUDING BUT NOT
LIMITED TO WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A
PARTICULAR PURPOSE.

Some states do not allow disclaimers of implied warranties or
the exclusion or limitation of consequential damages, so the
above disclaimers and exclusions may not apply to you, and you
may have other legal rights.

INDEMNITY
You will indemnify and hold Michael Hart, the Foundation,
and its trustees and agents, and any volunteers associated
with the production and distribution of Project Gutenberg-tm
texts harmless, from all liability, cost and expense, including
legal fees, that arise directly or indirectly from any of the
following that you do or cause:  [1] distribution of this eBook,
[2] alteration, modification, or addition to the eBook,
or [3] any Defect.

DISTRIBUTION UNDER "PROJECT GUTENBERG-tm"
You may distribute copies of this eBook electronically, or by
disk, book or any other medium if you either delete this
"Small Print!" and all other references to Project Gutenberg,
or:

[1]  Only give exact copies of it.  Among other things, this
     requires that you do not remove, alter or modify the
     eBook or this "small print!" statement.  You may however,
     if you wish, distribute this eBook in machine readable
     binary, compressed, mark-up, or proprietary form,
     including any form resulting from conversion by word
     processing or hypertext software, but only so long as
     *EITHER*:

     [*]  The eBook, when displayed, is clearly readable, and
          does *not* contain characters other than those
          intended by the author of the work, although tilde
          (~), asterisk (*) and underline (_) characters may
          be used to convey punctuation intended by the
          author, and additional characters may be used to
          indicate hypertext links; OR

     [*]  The eBook may be readily converted by the reader at
          no expense into plain ASCII, EBCDIC or equivalent
          form by the program that displays the eBook (as is
          the case, for instance, with most word processors);
          OR

     [*]  You provide, or agree to also provide on request at
          no additional cost, fee or expense, a copy of the
          eBook in its original plain ASCII form (or in EBCDIC
          or other equivalent proprietary form).

[2]  Honor the eBook refund and replacement provisions of this
     "Small Print!" statement.

[3]  Pay a trademark license fee to the Foundation of 20% of the
     gross profits you derive calculated using the method you
     already use to calculate your applicable taxes.  If you
     don't derive profits, no royalty is due.  Royalties are
     payable to "Project Gutenberg Literary Archive Foundation"
     the 60 days following each date you prepare (or were
     legally required to prepare) your annual (or equivalent
     periodic) tax return.  Please contact us beforehand to
     let us know your plans and to work out the details.

WHAT IF YOU *WANT* TO SEND MONEY EVEN IF YOU DON'T HAVE TO?
Project Gutenberg is dedicated to increasing the number of
public domain and licensed works that can be freely distributed
in machine readable form.

The Project gratefully accepts contributions of money, time,
public domain materials, or royalty free copyright licenses.
Money should be paid to the:
"Project Gutenberg Literary Archive Foundation."

If you are interested in contributing scanning equipment or
software or other items, please contact Michael Hart at:
hart@pobox.com

[Portions of this eBook's header and trailer may be reprinted only
when distributed free of all fees.  Copyright (C) 2001, 2002 by
Michael S. Hart.  Project Gutenberg is a TradeMark and may not be
used in any sales of Project Gutenberg eBooks or other materials be
they hardware or software or any other related product without
express permission.]

*END THE SMALL PRINT! FOR PUBLIC DOMAIN EBOOKS*Ver.02/11/02*END*
''';
