#pragma once

#include <map>

struct BASE
{
	virtual ~BASE() {}
};

const std::string ANDS[3] = { "and2", "and3", "and5" };
and2 a2("AND2");
and3 a3("AND3");
and5 a5("AND5");

const std::string ORS[3] = { "or2", "or3", "or5" };
or2 o2("OR2");
or3 o3("OR3");
or5 o5("OR5");

const std::string ORS_C[3] = { "or2_c", "or3_c", "or5_c" };
or2_c o2_c("OR2_C");
or3_c o3_c("OR3_C");
or5_c o5_c("OR5_C");

const std::string ORS_SC[3] = { "or2_sc", "or3_sc", "or5_sc" };
or2_sc o2_sc("OR2_SC");
or3_sc o3_sc("OR3_SC");
or5_sc o5_sc("OR5_SC");

const std::string XORS[3] = { "xor2", "xor3", "xor5" };
xor2 x2("XOR2");
xor3 x3("XOR3");
xor5 x5("XOR5");

const std::string XORS_C[3] = { "xor2_c", "xor3_c", "xor5_c" };
xor2_c x2_c("XOR2_C");
xor3_c x3_c("XOR3_C");
xor5_c x5_c("XOR5_C");

const std::string XORS_SC[3] = { "xor2_sc", "xor3_sc", "xor5_sc" };
xor2_sc x2_sc("XOR2_SC");
xor3_sc x3_sc("XOR3_SC");
xor5_sc x5_sc("XOR5_SC");

const std::string NANDS[3] = { "nand2", "nand3", "nand5" };
nand2 na2("NAND2");
nand3 na3("NAND3");
nand5 na5("NAND5");

const std::string NANDS_C[3] = { "nand2_c", "nand3_c", "nand5_sc" };
nand2_c na2_c("NAND2_C");
nand3_c na3_c("NAND3_C");
nand5_c na5_c("NAND5_C");

const std::string NANDS_SC[3] = { "nand2_sc", "nand3_sc", "nand5_sc" };
nand2_sc na2_sc("NAND2_SC");
nand3_sc na3_sc("NAND3_SC");
nand5_sc na5_sc("NAND5_SC");

typedef claw::meta::type_list_maker<bool, float, std::string>::result my_type_list;
typedef claw::multi_type_map<int, my_type_list> map_type;

map_type example_map;

example_map.set<bool>(0, false);



