#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    (*spvDescriptorSet0.cp_s0)._m0[8] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].x);
    (*spvDescriptorSet0.cp_s0)._m0[9] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    (*spvDescriptorSet0.cp_s0)._m0[10] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].z);
    (*spvDescriptorSet0.cp_s0)._m0[11] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].w);
    (*spvDescriptorSet0.cp_s0)._m0[12] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].x);
    (*spvDescriptorSet0.cp_s0)._m0[13] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].y);
    (*spvDescriptorSet0.cp_s0)._m0[14] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].z);
    (*spvDescriptorSet0.cp_s0)._m0[15] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].w);
    (*spvDescriptorSet0.cp_s0)._m0[20] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[5].x);
    (*spvDescriptorSet0.cp_s0)._m0[21] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[5].y);
    (*spvDescriptorSet0.cp_s0)._m0[22] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[5].z);
    (*spvDescriptorSet0.cp_s0)._m0[23] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[5].w);
    (*spvDescriptorSet0.cp_s0)._m0[36] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[9].x);
    (*spvDescriptorSet0.cp_s0)._m0[37] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[9].y);
    (*spvDescriptorSet0.cp_s0)._m0[38] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[9].z);
    (*spvDescriptorSet0.cp_s0)._m0[39] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[9].w);
    (*spvDescriptorSet0.cp_s0)._m0[44] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[11].x);
    (*spvDescriptorSet0.cp_s0)._m0[45] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[11].y);
    (*spvDescriptorSet0.cp_s0)._m0[46] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[11].z);
    (*spvDescriptorSet0.cp_s0)._m0[47] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[11].w);
    (*spvDescriptorSet0.cp_s0)._m0[40] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[10].x);
    (*spvDescriptorSet0.cp_s0)._m0[41] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[10].y);
    (*spvDescriptorSet0.cp_s0)._m0[42] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[10].z);
    (*spvDescriptorSet0.cp_s0)._m0[43] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[10].w);
    (*spvDescriptorSet0.cp_s0)._m0[56] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[14].x);
    (*spvDescriptorSet0.cp_s0)._m0[57] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[14].y);
    (*spvDescriptorSet0.cp_s0)._m0[58] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[14].z);
    (*spvDescriptorSet0.cp_s0)._m0[59] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[14].w);
    (*spvDescriptorSet0.cp_s0)._m0[16] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].x);
    (*spvDescriptorSet0.cp_s0)._m0[17] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].y);
    (*spvDescriptorSet0.cp_s0)._m0[18] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].z);
    (*spvDescriptorSet0.cp_s0)._m0[19] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[4].w);
    (*spvDescriptorSet0.cp_s0)._m0[24] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[6].x);
    (*spvDescriptorSet0.cp_s0)._m0[25] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[6].y);
    (*spvDescriptorSet0.cp_s0)._m0[26] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[6].z);
    (*spvDescriptorSet0.cp_s0)._m0[27] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[6].w);
    (*spvDescriptorSet0.cp_s0)._m0[28] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[7].x);
    (*spvDescriptorSet0.cp_s0)._m0[29] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[7].y);
    (*spvDescriptorSet0.cp_s0)._m0[30] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[7].z);
    (*spvDescriptorSet0.cp_s0)._m0[31] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[7].w);
    (*spvDescriptorSet0.cp_s0)._m0[32] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[8].x);
    (*spvDescriptorSet0.cp_s0)._m0[33] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[8].y);
    (*spvDescriptorSet0.cp_s0)._m0[34] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[8].z);
    (*spvDescriptorSet0.cp_s0)._m0[35] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[8].w);
    (*spvDescriptorSet0.cp_s0)._m0[60] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[15].x);
    (*spvDescriptorSet0.cp_s0)._m0[61] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[15].y);
    (*spvDescriptorSet0.cp_s0)._m0[62] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[15].z);
    (*spvDescriptorSet0.cp_s0)._m0[63] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[15].w);
    (*spvDescriptorSet0.cp_s0)._m0[64] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[16].x);
    (*spvDescriptorSet0.cp_s0)._m0[65] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[16].y);
    (*spvDescriptorSet0.cp_s0)._m0[66] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    (*spvDescriptorSet0.cp_s0)._m0[67] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[16].w);
    (*spvDescriptorSet0.cp_s0)._m0[76] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[19].x);
    (*spvDescriptorSet0.cp_s0)._m0[77] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[19].y);
    (*spvDescriptorSet0.cp_s0)._m0[78] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[19].z);
    (*spvDescriptorSet0.cp_s0)._m0[79] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[19].w);
    (*spvDescriptorSet0.cp_s0)._m0[48] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[12].x);
    (*spvDescriptorSet0.cp_s0)._m0[49] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[12].y);
    (*spvDescriptorSet0.cp_s0)._m0[50] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[12].z);
    (*spvDescriptorSet0.cp_s0)._m0[51] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[12].w);
    (*spvDescriptorSet0.cp_s0)._m0[52] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[13].x);
    (*spvDescriptorSet0.cp_s0)._m0[53] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[13].y);
    (*spvDescriptorSet0.cp_s0)._m0[54] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[13].z);
    (*spvDescriptorSet0.cp_s0)._m0[55] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[13].w);
    (*spvDescriptorSet0.cp_s0)._m0[68] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[17].x);
    (*spvDescriptorSet0.cp_s0)._m0[69] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[17].y);
    (*spvDescriptorSet0.cp_s0)._m0[70] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[17].z);
    (*spvDescriptorSet0.cp_s0)._m0[71] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[17].w);
    (*spvDescriptorSet0.cp_s0)._m0[72] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[18].x);
    (*spvDescriptorSet0.cp_s0)._m0[73] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[18].y);
    (*spvDescriptorSet0.cp_s0)._m0[74] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[18].z);
    (*spvDescriptorSet0.cp_s0)._m0[75] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[18].w);
    (*spvDescriptorSet0.cp_s0)._m0[80] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[20].x);
    (*spvDescriptorSet0.cp_s0)._m0[81] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[20].y);
    (*spvDescriptorSet0.cp_s0)._m0[82] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[20].z);
    (*spvDescriptorSet0.cp_s0)._m0[83] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[20].w);
    (*spvDescriptorSet0.cp_s0)._m0[84] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[21].x);
    (*spvDescriptorSet0.cp_s0)._m0[85] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[21].y);
    (*spvDescriptorSet0.cp_s0)._m0[86] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[21].z);
    (*spvDescriptorSet0.cp_s0)._m0[87] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[21].w);
    (*spvDescriptorSet0.cp_s0)._m0[96] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[24].x);
    (*spvDescriptorSet0.cp_s0)._m0[97] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[24].y);
    (*spvDescriptorSet0.cp_s0)._m0[98] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[24].z);
    (*spvDescriptorSet0.cp_s0)._m0[99] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[24].w);
    (*spvDescriptorSet0.cp_s0)._m0[88] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[22].x);
    (*spvDescriptorSet0.cp_s0)._m0[89] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[22].y);
    (*spvDescriptorSet0.cp_s0)._m0[90] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[22].z);
    (*spvDescriptorSet0.cp_s0)._m0[91] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[22].w);
    (*spvDescriptorSet0.cp_s0)._m0[92] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[23].x);
    (*spvDescriptorSet0.cp_s0)._m0[93] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[23].y);
    (*spvDescriptorSet0.cp_s0)._m0[94] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[23].z);
    (*spvDescriptorSet0.cp_s0)._m0[95] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[23].w);
    (*spvDescriptorSet0.cp_s0)._m0[100] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[25].x);
    (*spvDescriptorSet0.cp_s0)._m0[101] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[25].y);
    (*spvDescriptorSet0.cp_s0)._m0[102] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[25].z);
    (*spvDescriptorSet0.cp_s0)._m0[103] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[25].w);
    (*spvDescriptorSet0.cp_s0)._m0[104] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[26].x);
    (*spvDescriptorSet0.cp_s0)._m0[105] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[26].y);
    (*spvDescriptorSet0.cp_s0)._m0[106] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[26].z);
    (*spvDescriptorSet0.cp_s0)._m0[107] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[26].w);
    (*spvDescriptorSet0.cp_s0)._m0[108] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[27].x);
    (*spvDescriptorSet0.cp_s0)._m0[109] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[27].y);
    (*spvDescriptorSet0.cp_s0)._m0[110] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[27].z);
    (*spvDescriptorSet0.cp_s0)._m0[111] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[27].w);
    (*spvDescriptorSet0.cp_s0)._m0[4] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    (*spvDescriptorSet0.cp_s0)._m0[5] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y);
    (*spvDescriptorSet0.cp_s0)._m0[6] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].z);
    (*spvDescriptorSet0.cp_s0)._m0[7] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].w);
    (*spvDescriptorSet0.cp_s0)._m0[1328] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[43].z);
}

