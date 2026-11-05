#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
}

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
    constant _16* cp_c0 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    device _23* cp_s0 [[id(2)]];
    texture2d<float> cp_t_tcb_8 [[id(3)]];
    sampler cp_t_tcb_8Smplr [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _1188, thread const int& _1189, thread const int& _1190, thread int& _1191, thread uint& gl_SubgroupInvocationID)
{
    int _1194 = _1190 & 31;
    uint _1196 = uint(int(uint(_1190) >> uint(8)));
    int _1198 = int(_1196) & 31;
    float _1200 = as_type<float>(gl_SubgroupInvocationID);
    int _1202 = as_type<int>(_1200) & _1198;
    int _1204 = ~_1198;
    int _1206 = _1194 & _1204;
    int _1208 = _1206 | _1202;
    int _1210 = as_type<int>(_1200) ^ _1189;
    bool _1212 = uint(_1210) <= uint(_1208);
    _1191 = _1212 ? (-1) : 0;
    float _1214 = spvSubgroupShuffle(as_type<float>(_1188), uint(_1210));
    uint _1216 = uint(_1212 ? as_type<int>(_1214) : _1188);
    return int(_1216);
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    threadgroup spvUnsafeArray<uint, 32> _31;
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_LocalInvocationID.x);
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    int _63 = as_type<int>(_55) * 16;
    int _65 = _63 + as_type<int>(_57);
    float _67 = float(uint(_65));
    int _69 = as_type<int>(_59) * 16;
    int _71 = _69 + as_type<int>(_61);
    float _73 = _67 * (*spvDescriptorSet0.cp_c3)._m0[42].z;
    float _75 = float(uint(_71));
    float _77 = _73 * 0.0625;
    float _79 = _75 * (*spvDescriptorSet0.cp_c3)._m0[42].w;
    float _81 = fma(_75, 0.0625, 0.03125);
    float _83 = _79 * 0.0625;
    float _85 = _81 * (*spvDescriptorSet0.cp_c3)._m0[42].w;
    float _87 = fma((*spvDescriptorSet0.cp_c3)._m0[42].z, 0.03125, _77);
    float2 _609 = float2(_77, _83);
    float _89 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_609, float2(0.0), isnan(_609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_609, float2(0.0), isnan(_609)), level(0.0)).x;
    float2 _620 = float2(_77, _85);
    float _91 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_620, float2(0.0), isnan(_620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_620, float2(0.0), isnan(_620)), level(0.0)).x;
    float2 _628 = float2(_87, _83);
    float _93 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628)), level(0.0)).x;
    float2 _636 = float2(_87, _85);
    float _95 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_636, float2(0.0), isnan(_636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_636, float2(0.0), isnan(_636)), level(0.0)).x;
    float _97 = -_89;
    float _99 = fma(_97, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    bool _103 = _89 >= 1.0;
    bool _105 = isnan(_89);
    bool _107 = _103 || _105;
    bool _109 = isnan(1.0);
    bool _111 = _107 || _109;
    float _113 = -_93;
    float _115 = fma(_113, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    float _117 = -_91;
    float _119 = fma(_117, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    bool _121 = _93 >= 1.0;
    bool _123 = isnan(_93);
    bool _125 = _121 || _123;
    bool _127 = isnan(1.0);
    bool _129 = _125 || _127;
    float _131 = 1.0 / _99;
    float _133 = -_95;
    float _135 = fma(_133, (*spvDescriptorSet0.cp_c3)._m0[0].w, 1.0);
    bool _137 = _95 >= 1.0;
    bool _139 = isnan(_95);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = 1.0 / _115;
    float _149 = 1.0 / _119;
    float _151 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _153 = fma(_131, (*spvDescriptorSet0.cp_c3)._m0[1].w, _151);
    bool _155 = !_111;
    float _157 = _155 ? _153 : 1.0;
    float _159 = 1.0 / _135;
    float _161 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _163 = fma(_147, (*spvDescriptorSet0.cp_c3)._m0[1].w, _161);
    bool _165 = _91 >= 1.0;
    bool _167 = isnan(_91);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = precise::min(_157, 1.0);
    bool _177 = !_129;
    float _179 = _177 ? _163 : 1.0;
    float _181 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _183 = fma(_149, (*spvDescriptorSet0.cp_c3)._m0[1].w, _181);
    float _185 = precise::max(0.0, _157);
    float _187 = precise::min(_175, _179);
    float _189 = _157 + _179;
    bool _191 = !_173;
    float _193 = _191 ? _183 : 1.0;
    float _195 = precise::max(_185, _179);
    float _197 = -(*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _199 = fma(_159, (*spvDescriptorSet0.cp_c3)._m0[1].w, _197);
    float _201 = precise::min(_193, _187);
    float _203 = _193 + _189;
    float _205 = precise::max(_193, _195);
    bool _207 = !_145;
    float _209 = _207 ? _199 : 1.0;
    float _211 = precise::min(_209, _201);
    float _213 = _209 + _203;
    float _215 = precise::max(_209, _205);
    int _217 = as_type<int>(_211);
    int _219 = 16;
    int _221 = 31;
    int _223;
    int _804 = _51(_217, _219, _221, _223, gl_SubgroupInvocationID);
    int _225 = _804;
    int _227 = as_type<int>(_215);
    int _229 = 16;
    int _231 = 31;
    int _233;
    int _807 = _51(_227, _229, _231, _233, gl_SubgroupInvocationID);
    int _235 = _807;
    int _237 = as_type<int>(_213);
    int _239 = 16;
    int _241 = 31;
    int _243;
    int _810 = _51(_237, _239, _241, _243, gl_SubgroupInvocationID);
    int _245 = _810;
    float _247 = precise::min(as_type<float>(_225), _211);
    float _249 = precise::max(as_type<float>(_235), _215);
    int _251 = as_type<int>(_247);
    int _253 = 8;
    int _255 = 31;
    int _257;
    int _822 = _51(_251, _253, _255, _257, gl_SubgroupInvocationID);
    int _259 = _822;
    float _261 = as_type<float>(_245) + _213;
    int _263 = as_type<int>(_249);
    int _265 = 8;
    int _267 = 31;
    int _269;
    int _829 = _51(_263, _265, _267, _269, gl_SubgroupInvocationID);
    int _271 = _829;
    int _273 = as_type<int>(_261);
    int _275 = 8;
    int _277 = 31;
    int _279;
    int _832 = _51(_273, _275, _277, _279, gl_SubgroupInvocationID);
    int _281 = _832;
    float _283 = precise::min(_247, as_type<float>(_259));
    float _285 = precise::max(_249, as_type<float>(_271));
    int _287 = as_type<int>(_283);
    int _289 = 4;
    int _291 = 31;
    int _293;
    int _844 = _51(_287, _289, _291, _293, gl_SubgroupInvocationID);
    int _295 = _844;
    float _297 = _261 + as_type<float>(_281);
    int _299 = as_type<int>(_285);
    int _301 = 4;
    int _303 = 31;
    int _305;
    int _851 = _51(_299, _301, _303, _305, gl_SubgroupInvocationID);
    int _307 = _851;
    int _309 = as_type<int>(_297);
    int _311 = 4;
    int _313 = 31;
    int _315;
    int _854 = _51(_309, _311, _313, _315, gl_SubgroupInvocationID);
    int _317 = _854;
    float _319 = precise::min(_283, as_type<float>(_295));
    float _321 = precise::max(_285, as_type<float>(_307));
    int _323 = as_type<int>(_319);
    int _325 = 2;
    int _327 = 31;
    int _329;
    int _865 = _51(_323, _325, _327, _329, gl_SubgroupInvocationID);
    int _331 = _865;
    float _333 = _297 + as_type<float>(_317);
    int _335 = as_type<int>(_321);
    int _337 = 2;
    int _339 = 31;
    int _341;
    int _872 = _51(_335, _337, _339, _341, gl_SubgroupInvocationID);
    int _343 = _872;
    int _345 = as_type<int>(_61) * 16;
    int _347 = _345 + as_type<int>(_57);
    int _349 = as_type<int>(_61) * 16;
    int _351 = as_type<int>(_333);
    int _353 = 2;
    int _355 = 31;
    int _357;
    int _885 = _51(_351, _353, _355, _357, gl_SubgroupInvocationID);
    int _359 = _885;
    int _361 = -as_type<int>(_57);
    int _363 = _347 & 31;
    bool _365 = _363 != 0;
    bool _367 = _349 != _361;
    int _369 = _347;
    if (!_365)
    {
        uint _372 = uint(int(uint(_347) >> uint(5)));
        _369 = int(_372);
    }
    int _374 = _369;
    float _376 = precise::min(_319, as_type<float>(_331));
    float _378 = precise::max(_321, as_type<float>(_343));
    int _380 = as_type<int>(_376);
    int _382 = 1;
    int _384 = 31;
    int _386;
    int _918 = _51(_380, _382, _384, _386, gl_SubgroupInvocationID);
    int _388 = _918;
    float _390 = _333 + as_type<float>(_359);
    int _392 = as_type<int>(_378);
    int _394 = 1;
    int _396 = 31;
    int _398;
    int _925 = _51(_392, _394, _396, _398, gl_SubgroupInvocationID);
    int _400 = _925;
    int _402 = as_type<int>(_390);
    int _404 = 1;
    int _406 = 31;
    int _408;
    int _928 = _51(_402, _404, _406, _408, gl_SubgroupInvocationID);
    int _410 = _928;
    float _412 = precise::min(_376, as_type<float>(_388));
    float _414 = precise::max(_378, as_type<float>(_400));
    float _416 = _390 + as_type<float>(_410);
    if (!_365)
    {
        int _418 = _374 << 4;
        uint _420 = uint(int(uint(_418) >> uint(2)));
        _31[int(_420)] = as_type<uint>(_412);
        int _422 = _418 + 4;
        uint _424 = uint(int(uint(_422) >> uint(2)));
        _31[int(_424)] = as_type<uint>(_414);
    }
    if (!_365)
    {
        int _426 = _374 << 4;
        int _428 = _426 + 8;
        uint _430 = uint(int(uint(_428) >> uint(2)));
        _31[int(_430)] = as_type<uint>(_416);
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    if (_367)
    {
        return;
    }
    float _432 = as_type<float>(_31[4]);
    float _434 = as_type<float>(_31[5]);
    float _436 = as_type<float>(_31[6]);
    int _438 = as_type<int>(_59) * as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y);
    int _440 = _438 + as_type<int>(_55);
    float _442 = as_type<float>(_31[0]);
    float _444 = as_type<float>(_31[1]);
    float _446 = as_type<float>(_31[2]);
    int _448 = _440 * 16;
    float _450 = as_type<float>(_31[8]);
    float _452 = as_type<float>(_31[9]);
    float _454 = as_type<float>(_31[10]);
    float _456 = as_type<float>(_31[12]);
    float _458 = as_type<float>(_31[13]);
    float _460 = as_type<float>(_31[14]);
    float _462 = as_type<float>(_31[16]);
    float _464 = as_type<float>(_31[17]);
    float _466 = as_type<float>(_31[18]);
    float _468 = as_type<float>(_31[20]);
    float _470 = as_type<float>(_31[21]);
    float _472 = as_type<float>(_31[22]);
    float _474 = as_type<float>(_31[24]);
    float _476 = as_type<float>(_31[25]);
    float _478 = as_type<float>(_31[26]);
    float _480 = as_type<float>(_31[28]);
    float _482 = as_type<float>(_31[29]);
    float _484 = as_type<float>(_31[30]);
    float _486 = precise::min(_442, _432);
    float _488 = precise::max(_444, _434);
    float _490 = _446 + _436;
    float _492 = precise::min(_486, _450);
    float _494 = precise::max(_488, _452);
    float _496 = _490 + _454;
    float _498 = precise::min(_492, _456);
    float _500 = precise::max(_494, _458);
    float _502 = _496 + _460;
    float _504 = precise::min(_498, _462);
    float _506 = precise::max(_500, _464);
    float _508 = _502 + _466;
    float _510 = precise::min(_504, _468);
    float _512 = precise::max(_506, _470);
    float _514 = _508 + _472;
    float _516 = precise::min(_510, _474);
    float _518 = precise::max(_512, _476);
    float _520 = _514 + _478;
    float _522 = precise::min(_480, _516);
    float _524 = precise::max(_482, _518);
    float _526 = _484 + _520;
    int _528 = _448 + 22016;
    int _530 = _448 + 22020;
    float _532 = _526 * 0.0009765625;
    int _534 = _448 + 22024;
    uint _536 = uint(int(uint(_528) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_536)] = as_type<uint>(_522);
    uint _538 = uint(int(uint(_530) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_538)] = as_type<uint>(_524);
    uint _540 = uint(int(uint(_534) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_540)] = as_type<uint>(_532);
}

