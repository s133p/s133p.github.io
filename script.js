var data = [];


var dou = new Array();
for ( var t = 0; t < 20; ++t ){
for (var i = 0; i < 20; ++i)
{
  data.push(Math.floor(Math.random()*20));
}
dou.push(data);
data = [];
}

var dCsv = [];

csv = d3.csv("sales.csv", 
    function(sales)
    {
      tmp = [];
      for (var x in sales[0])
      {
        tmp.push(x);
      }
      data = sales.map(
        function(d)
        {
          var z = [];
          for (var x in d){
            z.push(d[x].trim());
          }
          return z;
        });
      dCsv.push(tmp);
      dCsv.push.apply(dCsv, data);
      main();
    }
    
    
    );



function main()
{

var p = d3.select("table")
    .selectAll("tr").data(dCsv).enter().append("tr")
    
    .selectAll("td").data(function(d){return d;}).enter().append("td")
    
    .text(function(d){return d;});

function test (d,i,t)
    {
      if (t%2 == 1)
        return "background: #CCCCCC;";
      return "background: #FFFFFF;";
    }

d3.selectAll("tr").selectAll("td").attr("style", function(d,i,t){return test(d,i,t) + "border: 1px solid black; text-align: center; display:block;";});
var tmp = d3.selectAll("tr").selectAll("td");


tmp
  .on({
      "click": function(d,i)
                      { 
                        d3.select(this).text("")
                          .append("input")
                          .property({"value": d, "id": "inp"});
                        document.getElementById("inp").focus();
                        d3.select(this).select("input").style("overflow","hide");
                        d3.select(this).select("input").on({"blur": function(d,i)
                            {
                              var val = d3.select(this).property("value");
                              console.log(val);
                              d3.select(this.parentNode).datum(val);
                              //this.parentNode.select("input").remove();
                              d3.select(this.parentNode).text(val);
                              d3.select(this).remove();
                              return 1;
                            }});

                        return 1;
                      }
        });

}
