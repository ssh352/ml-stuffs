
%macro imprt (Pin);
proc import out = _&pin
file ="C:\Users\dhanasekaran\Desktop\Obj_Completed_Combined\Temp\&pin..xls"
DBMS=excel replace;
range = "1:11";
run;

data _&pin (Keep= F GV_FIXED_DATE1);
set _&pin;
where GV_2013_VALUATION="PIN NO:";
run;

data _&pin;
set _&pin;
rename F2=F;
drop F2;
keep _all_;
F=INPUT(F2,best12.);
run;

proc sql;
update _&pin
set F=&pin;
quit;
run;

proc append base = _1208167 data = _&pin force;
run;

%mend imprt;

%imprt(1208782);
%imprt(1209034);
%imprt(1209777);
%imprt(1212739);
%imprt(1213042);
%imprt(1217871);
%imprt(1219059);
%imprt(1221312);
%imprt(1223179);
%imprt(1226424);
%imprt(1227064);
%imprt(1228270);
%imprt(1230127);
%imprt(1230220);
%imprt(1231587);
%imprt(1232237);
%imprt(1232796);
%imprt(1233117);
%imprt(1234043);
%imprt(1235761);
%imprt(1239993);
%imprt(1240079);
%imprt(1240180);
%imprt(1241357);
%imprt(1241395);
%imprt(1246517);
%imprt(1248909);
%imprt(1251397);
%imprt(1254224);
%imprt(1258757);
%imprt(1259374);
%imprt(1259587);
%imprt(1261055);
%imprt(1262067);
%imprt(1262298);
%imprt(1263778);
%imprt(1264466);
%imprt(1267770);
%imprt(1269400);
%imprt(1270230);
%imprt(1270835);
%imprt(1271063);
%imprt(1271457);
%imprt(1274549);
%imprt(1276978);
%imprt(1277608);
%imprt(1278282);
%imprt(1278389);
%imprt(1279787);
%imprt(1280175);
%imprt(1280794);
%imprt(1281053);
%imprt(1281150);
%imprt(1283041);
%imprt(1283103);
%imprt(1283546);
%imprt(1284051);
%imprt(1284424);
%imprt(1285316);
%imprt(1287652);
%imprt(1288326);
%imprt(1291066);
%imprt(1292733);
%imprt(1292863);
%imprt(1295601);
%imprt(1297129);
%imprt(1303167);
%imprt(1303327);
%imprt(1304374);
%imprt(1308404);
%imprt(1311472);
%imprt(1311596);
%imprt(1314011);
%imprt(1315176);
%imprt(1315390);
%imprt(1315675);
%imprt(1316383);
%imprt(1317486);
%imprt(1322156);
%imprt(1324186);
%imprt(1324248);
%imprt(1330822);
%imprt(1331365);
%imprt(1332670);
%imprt(1332978);
%imprt(1333470);
%imprt(1333830);
%imprt(1334573);
%imprt(1334588);
%imprt(1335127);
%imprt(1336084);
%imprt(1336345);
%imprt(1336560);
%imprt(1337825);
%imprt(1337874);
%imprt(1338861);
%imprt(1341677);
%imprt(1342831);
%imprt(1345202);
%imprt(1345800);
%imprt(1347867);
%imprt(1350091);
%imprt(1352678);
%imprt(1354297);
%imprt(1356670);
%imprt(1357156);
%imprt(1360166);
%imprt(1360793);
%imprt(1362567);
%imprt(1367095);
%imprt(1367579);
%imprt(1368610);
%imprt(1369797);
%imprt(1371353);
%imprt(1371736);
%imprt(1372567);
%imprt(1372661);
%imprt(1373239);
%imprt(1373952);
%imprt(1375681);
%imprt(1379184);
%imprt(1382773);
%imprt(1382919);
%imprt(1383465);
%imprt(1384272);
%imprt(1390589);
%imprt(1390650);
%imprt(1391259);
%imprt(1393767);
%imprt(1394442);
%imprt(1398129);
%imprt(1398277);
%imprt(1399501);
%imprt(1402228);
%imprt(1402702);
%imprt(1403963);
%imprt(1405437);
%imprt(1407458);
%imprt(1409582);
%imprt(1410105);
%imprt(1410384);
%imprt(1410752);
%imprt(1412281);
%imprt(1412755);
%imprt(1413457);
%imprt(1415576);
%imprt(1415994);
%imprt(1418253);
%imprt(1422798);
%imprt(1427314);
%imprt(1427467);
%imprt(1428131);
%imprt(1428698);
%imprt(1429016);
%imprt(1429892);
%imprt(1430094);
%imprt(1431253);
%imprt(1434398);
%imprt(1435858);
%imprt(1436763);
%imprt(1438444);
%imprt(1440001);
%imprt(1441106);
%imprt(1444474);
%imprt(1446252);
%imprt(1447038);
%imprt(1447125);
%imprt(1447242);
%imprt(1448652);
%imprt(1449215);
%imprt(1449777);
%imprt(1450396);
%imprt(1451392);
%imprt(1451425);
%imprt(1451813);
%imprt(1452147);
%imprt(1452998);
%imprt(1454143);
%imprt(1456643);
%imprt(1457527);
%imprt(1458113);
%imprt(1459156);
%imprt(1459244);
%imprt(1460842);
%imprt(1461006);
%imprt(1462479);
%imprt(1462967);
%imprt(1464108);
%imprt(1464585);
%imprt(1465557);
%imprt(1465801);
%imprt(1466079);
%imprt(1466103);
%imprt(1469042);
%imprt(1472985);
%imprt(1473491);
%imprt(1474911);
%imprt(1475482);
%imprt(1475627);
%imprt(1477273);
%imprt(1479250);
%imprt(1479710);
%imprt(1480872);
%imprt(1481314);
%imprt(1483084);
%imprt(1484129);
%imprt(1488138);
%imprt(1489602);
%imprt(1491035);
%imprt(1491286);
%imprt(1491329);
%imprt(1491490);
%imprt(1494428);
%imprt(1495946);
%imprt(1496239);
%imprt(1496420);
%imprt(1497204);
%imprt(1500259);
%imprt(1500916);
%imprt(1505154);
%imprt(1505569);
%imprt(1505660);
%imprt(1506827);
%imprt(1507004);
%imprt(1507493);
%imprt(1507959);
%imprt(1508938);
%imprt(1509500);
%imprt(1511525);
%imprt(1513489);
%imprt(1516632);
%imprt(1517145);
%imprt(1518662);
%imprt(1519071);
%imprt(1521159);
%imprt(1523642);
%imprt(1523997);
%imprt(1528979);
%imprt(1529759);
%imprt(1531541);
%imprt(1531804);
%imprt(1531819);
%imprt(1531933);
%imprt(1534403);
%imprt(1534822);
%imprt(1534871);
%imprt(1535058);
%imprt(1535901);
%imprt(1537144);
%imprt(1538666);
%imprt(1540623);
%imprt(1540957);
%imprt(1545479);
%imprt(1545908);
%imprt(1547436);
%imprt(1549657);
%imprt(1552572);
%imprt(1553949);
%imprt(1553981);
%imprt(1555577);
%imprt(1555725);
%imprt(1559612);
%imprt(1562501);
%imprt(1563932);
%imprt(1569192);
%imprt(1571507);
%imprt(1574582);
%imprt(1575074);
%imprt(1576114);
%imprt(1576561);
%imprt(1578661);
%imprt(1579380);
%imprt(1579752);
%imprt(1580209);
%imprt(1580872);
%imprt(1581046);
%imprt(1581983);
%imprt(1584844);
%imprt(1585297);
%imprt(1590771);
%imprt(1591726);
%imprt(1596052);
%imprt(1599214);
%imprt(1599409);
%imprt(1600598);
%imprt(1601442);
%imprt(1602325);
%imprt(1602405);
%imprt(1610371);
%imprt(1613971);
%imprt(1614026);
%imprt(1614064);
%imprt(1615632);
%imprt(1616077);
%imprt(1617009);
%imprt(1617757);
%imprt(1617787);
%imprt(1618140);
%imprt(1618476);
%imprt(1619035);
%imprt(1623449);
%imprt(1624228);
%imprt(1627666);
%imprt(1628786);
%imprt(1629257);
%imprt(1630131);
%imprt(1630318);
%imprt(1631348);
%imprt(1632284);
%imprt(1632921);
%imprt(1633576);
%imprt(1633631);
%imprt(1637657);
%imprt(1640035);
%imprt(1640064);
%imprt(1640337);
%imprt(1640762);
%imprt(1644080);
%imprt(1645067);
%imprt(1645350);
%imprt(1647677);
%imprt(1648989);
%imprt(1653742);
%imprt(1654597);
%imprt(1654893);
%imprt(1655519);
%imprt(1656372);
%imprt(1656583);
%imprt(1657462);
%imprt(1663148);
%imprt(1663532);
%imprt(1664231);
%imprt(1669247);
%imprt(1669315);
%imprt(1670227);
%imprt(1673403);
%imprt(1674413);
%imprt(1675410);
%imprt(1675711);
%imprt(1676550);
%imprt(1677977);
%imprt(1678139);
%imprt(1679251);
%imprt(1679627);
%imprt(1680001);
%imprt(1680449);
%imprt(1680995);
%imprt(1681710);
%imprt(1682289);
%imprt(1682388);
%imprt(1683990);
%imprt(1684256);
%imprt(1684895);
%imprt(1684951);
%imprt(1685867);
%imprt(1688192);
%imprt(1688295);
%imprt(1689245);
%imprt(1689688);
%imprt(1690055);
%imprt(1690060);
%imprt(1690426);
%imprt(1693465);
%imprt(1694147);
%imprt(1694149);
%imprt(1697167);
%imprt(1698833);
%imprt(1705156);
%imprt(1706199);
%imprt(1709313);
%imprt(1712484);
%imprt(1713270);
%imprt(1713485);
%imprt(1714835);
%imprt(1716141);
%imprt(1720142);
%imprt(1723815);
%imprt(1724095);
%imprt(1724684);
%imprt(1726828);
%imprt(1727634);
%imprt(1727708);
%imprt(1728016);
%imprt(1728720);
%imprt(1729588);
%imprt(1731938);
%imprt(1732415);
%imprt(1733601);
%imprt(1734400);
%imprt(1735776);
%imprt(1735957);
%imprt(1736674);
%imprt(1737020);
%imprt(1737885);
%imprt(1739578);
%imprt(1740155);
%imprt(1740299);
%imprt(1742690);
%imprt(1745161);
%imprt(1746511);
%imprt(1748015);
%imprt(1748147);
%imprt(1750048);
%imprt(1751061);
%imprt(1751432);
%imprt(1752293);
%imprt(1757847);
%imprt(1758203);
%imprt(1759539);
%imprt(1762547);
%imprt(1766144);
%imprt(1770084);
%imprt(1770931);
%imprt(1771652);
%imprt(1772245);
%imprt(1773958);
%imprt(1774145);
%imprt(1781645);
%imprt(1781650);
%imprt(1783440);
%imprt(1783996);
%imprt(1785572);
%imprt(1786625);
%imprt(1786716);
%imprt(1787329);
%imprt(1787376);
%imprt(1787752);
%imprt(1788470);
%imprt(1789567);
%imprt(1790727);
%imprt(1790807);
%imprt(1791226);
%imprt(1791582);
%imprt(1792021);
%imprt(1793465);
%imprt(1796817);
%imprt(1798025);
%imprt(1802053);
%imprt(1803141);
%imprt(1806692);
%imprt(1811119);
%imprt(1814322);
%imprt(1815500);
%imprt(1816304);
%imprt(1817124);
%imprt(1817404);
%imprt(1817702);
%imprt(1818305);
%imprt(1818777);
%imprt(1820222);
%imprt(1823488);
%imprt(1825157);
%imprt(1825461);
%imprt(1828305);
%imprt(1830970);
%imprt(1831308);
%imprt(1835779);
%imprt(1836088);
%imprt(1837522);
%imprt(1837898);
%imprt(1838606);
%imprt(1838763);
%imprt(1841176);
%imprt(1842235);
%imprt(1842246);
%imprt(1842660);
%imprt(1843774);
%imprt(1844494);
%imprt(1844652);
%imprt(1846336);
%imprt(1847621);
%imprt(1849208);
%imprt(1851779);
%imprt(1852379);
%imprt(1853016);
%imprt(1853835);
%imprt(1858091);
%imprt(1859543);
%imprt(1859949);
%imprt(1860746);
%imprt(1863872);
%imprt(1867342);
%imprt(1868581);
%imprt(1869052);
%imprt(1870579);
%imprt(1872940);
%imprt(1874245);
%imprt(1876313);
%imprt(1879345);
%imprt(1890406);
%imprt(1892369);
%imprt(1892509);
%imprt(2002113);
%imprt(2004715);
%imprt(2008850);
%imprt(2015940);
%imprt(2020866);
%imprt(2021149);
%imprt(2027494);
