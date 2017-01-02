#!/usr/bin/perl
use strict;
use CGI;
use cwmodule;

# Author: Yolanda Dopico Garcia
# returns the full DNA sequence with coding regions highlighted

my $cgi = new CGI;
print $cgi->header();
								
# Obtain parameters

my $accession = $cgi->param('accession');

					
#need to tell cwmodule what to search by
my $GetDNA= cwmodule::GetDNA($accession);




print <<__EOF;
<!DOCTYPE html>
<head>
   <title>Results - DETAIL PAGE</title>

<style type='text/css'>
<!--

/* ========= CSS style main pages ================== */
.page { 
        margin-right: auto;
        margin-left: auto;
        width: 960px;
       }

body { background: #F0F0F5}

/* ====== Header style ================ */

.header { padding-top: 0.5em;
          margin: 0;          
        }

.logo {
      float: left;
      padding-left: 60px;
      }

.title { 
        padding-left: 150px;
	font-family: verdana, geneva, sans-serif;
        font-size: 25px;
       }

.navbox { padding-top: 10px;
        }


/* ====== Navigation bar style ========== */
 
 .navbar ul { 
	margin: 0; 
	padding: 20px; 
	list-style-type: none; 
	text-align: left; 
	background-color: #000; 
	} 
 
 .navbar ul li {  
	display: inline; 
	} 
 
 .navbar ul li a { 
	text-decoration: none; 
	padding: .2em 1em; 
	color: #fff; 
	background-color: #000; 
	} 

.navbar ul li a:hover { 
	color: #000; 
	background-color: #fff; 
        font-size:15px;
	} 
        
  
.active { font-weight:bold;
          font-size:20px;
          text-transform: uppercase;
        }
 
 
       
/* ====== Search box style ========== */


.searchbox {
             margin: 0; 
	     padding-top: 20px;  
             padding-right: 10px;
             float: right;      
             
           }


/*======== CONTENT =========*/


.contentDetail  {   
           
          padding-top: 15px;
          padding-left: 50px;
          padding-right: 50px;
          padding-bottom: 50px; 
          margin-top: 10px;
          margin-bottom: 20px;
          }
.contentDetail h1 {             
          font-family: verdana, geneva, sans-serif;
          font-size: 20px;
          color: #787d80;
          padding-top: 10px;
          padding-bottom: 5px;          
          }
.contentDetail p {             
          font-family: verdana, geneva, sans-serif;
          font-size: 15px;
          line-height: 18px;
          word-wrap:break-word;
           
          }
	  
.info { color: #787d80;
}  


		
/* ====== Footer style ========== */


.footer { padding: 0.50em;          
          border-top: 5px solid black;
        }

/* ==== end CSS ===*/
-->
</style>
</head>




<body>
<div class='page'>

<!--  =========== HEADER ============     -->
<header>
<div class='header'>

<div class='logo'>
<img src="http://student.cryst.bbk.ac.uk/~dm002/DNA.png" width="98" height="114" alt="text"/>
</div> <!-- end logo div  -->

<div class='title'>
<h1><small>CHROMOSOME 3</small></h1>
</div> <!-- end title div  -->




<div class='navbox'> <!-- navbar and search box    -->
<!--  ========== SEARCH BOX ==========   -->

<div class='searchbox'>
 <form action='http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/dm002/searchYoli.pl'  method="post">

   <select name = "searchBy">
           <option  value="gid">Gene Id</option>
           <option  value="protein">Protein</option>
           <option  value="accession">Accession Number</option>
           <option  value="chromosome_loc">Chromosome Location</option>
    </select>

    <input name="input" type="text" />
    <input type="submit" value="search"/>
</form>
</div>  <!-- end searchbox div -->

<!--  ========= NAVIGATION BAR ==========     -->
<!-- Navigation bar      -->
<div class='navbar'>

<ul>
   <li><a href='http://student.cryst.bbk.ac.uk/~dm002/homepage.html'>Home</a></li>
   <li><a href='http://student.cryst.bbk.ac.uk/cgi-bin/cgiwrap/pm001/summary2.pl'>Summary</a></li>
   <li class='active'><a href='http://student.cryst.bbk.ac.uk/~dm002/detail.html'>Detail</a></li>
</ul>

</div>   <!-- ======= end navbar div ============= -->
</div>   <!-- end navbox div  -->


</div>  <!-- ===end header div ====== -->
</header>   <!--  ===== END HEADER =====     -->


<div class='contentDetail'>
<!--  ====== MY CGI RESULTS ======     -->

   <h1>Results</h1>

       <p class='info'>The complete DNA sequence for <b>$accession</b> entry with coding regions highlighted in red:</p>

       $GetDNA
 
      <a href="#top">Back to top</a>
</div> <!-- === end content div ===-->



<!--  ====== FOOTER =======     -->

<footer>
    <div class='footer'>

      <p class='footnote'><small>MSc/MRes Bioinformatics with Systems Biology 2013/2014: Biocomputing II</small></p>

   </div>  <!-- end footer div  -->
</footer> <!-- end footer  -->


</div>  <!-- end page div -->
</body>
</html>

__EOF
 
