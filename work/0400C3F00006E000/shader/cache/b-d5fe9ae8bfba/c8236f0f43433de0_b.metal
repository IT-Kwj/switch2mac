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

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _39 = as_type<float>(gl_WorkGroupID.x);
    float _41 = as_type<float>(gl_LocalInvocationID.x);
    int _44 = as_type<int>(_39) * 32;
    int _46 = _44 + as_type<int>(_41);
    bool _50 = uint(_46) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_50)
    {
        return;
    }
    int _52 = _46 << 4;
    int _54 = _52 + 76;
    uint _57 = uint(int(uint(_54) >> uint(2)));
    uint _59 = uint(int(uint(int(_57)) >> uint(2)));
    int _61 = int(_57) & 3;
    float _63 = (*spvDescriptorSet0.cp_c3)._m0[int(_59)][_61];
    int _65 = as_type<int>(_63) * 128;
    int _67 = 8388480 & _65;
    int _69 = _67 + 16;
    uint _71 = uint(int(uint(_67) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_71)] = 0u;
    int _73 = _67 + 4;
    uint _75 = uint(int(uint(_73) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_75)] = 0u;
    int _77 = _67 + 8;
    uint _79 = uint(int(uint(_77) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_79)] = 0u;
    int _81 = _67 + 12;
    uint _83 = uint(int(uint(_81) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_83)] = 0u;
    int _85 = _67 + 32;
    int _87 = _67 + 48;
    uint _89 = uint(int(uint(_69) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_89)] = 0u;
    int _91 = _69 + 4;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_93)] = 0u;
    int _95 = _69 + 8;
    uint _97 = uint(int(uint(_95) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_97)] = 0u;
    int _99 = _69 + 12;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_101)] = 0u;
    int _103 = _67 + 96;
    uint _105 = uint(int(uint(_85) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_105)] = 0u;
    int _107 = _85 + 4;
    uint _109 = uint(int(uint(_107) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_109)] = 0u;
    int _111 = _85 + 8;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_113)] = 0u;
    int _115 = _85 + 12;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_117)] = 0u;
    int _119 = _67 + 64;
    uint _121 = uint(int(uint(_87) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_121)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].x);
    int _123 = _87 + 4;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_125)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].y);
    int _127 = _87 + 8;
    uint _129 = uint(int(uint(_127) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_129)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].z);
    int _131 = _87 + 12;
    uint _133 = uint(int(uint(_131) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_133)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[1].w);
    int _135 = _67 + 80;
    uint _137 = uint(int(uint(_119) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_137)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].x);
    int _139 = _119 + 4;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_141)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].y);
    int _143 = _119 + 8;
    uint _145 = uint(int(uint(_143) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_145)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].z);
    int _147 = _119 + 12;
    uint _149 = uint(int(uint(_147) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_149)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[2].w);
    int _151 = _67 + 112;
    uint _153 = uint(int(uint(_135) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_153)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].x);
    int _155 = _135 + 4;
    uint _157 = uint(int(uint(_155) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_157)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].y);
    int _159 = _135 + 8;
    uint _161 = uint(int(uint(_159) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_161)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].z);
    int _163 = _135 + 12;
    uint _165 = uint(int(uint(_163) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_165)] = as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[3].w);
    uint _167 = uint(int(uint(_103) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_167)] = 0u;
    int _169 = _103 + 4;
    uint _171 = uint(int(uint(_169) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_171)] = 0u;
    int _173 = _103 + 8;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_175)] = 0u;
    int _177 = _103 + 12;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_179)] = 0u;
    uint _181 = uint(int(uint(_151) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_181)] = 0u;
    int _183 = _151 + 4;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_185)] = 0u;
    int _187 = _151 + 8;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_189)] = 0u;
    int _191 = _151 + 12;
    uint _193 = uint(int(uint(_191) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_193)] = 0u;
}

