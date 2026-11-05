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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_A [[id(2)]];
    sampler cp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

static inline __attribute__((always_inline))
int _47(thread const int& _892, thread const int& _893, constant _10& support_buffer)
{
    int _896 = 1 + _893;
    float _898 = support_buffer._m5[_896].x;
    bool _900 = _898 == 1.0;
    if (_900)
    {
        return _892;
    }
    float _902 = float(_892);
    float _904 = _902 * _898;
    int _906 = int(_904);
    return _906;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    threadgroup spvUnsafeArray<uint, 1156> _24;
    float _51 = as_type<float>(gl_LocalInvocationID.x);
    float _53 = as_type<float>(gl_LocalInvocationID.y);
    float _55 = as_type<float>(gl_WorkGroupID.x);
    float _57 = as_type<float>(gl_WorkGroupID.y);
    int _59 = as_type<int>(_53) << 4;
    int _61 = _59 + as_type<int>(_51);
    bool _65 = _61 >= 33;
    int _67 = as_type<int>(_55) << 4;
    int _69 = _67 + as_type<int>(_51);
    int _71 = as_type<int>(_57) << 4;
    int _73 = _71 + as_type<int>(_53);
    int _75 = 0;
    int _77 = as_type<int>(_55);
    int _79 = _61;
    if (!_65)
    {
        int _81 = _61 + (-256);
        _75 = _81;
    }
    int _83 = _75;
    if (!_65)
    {
        int _85 = as_type<int>(_55) << 4;
        int _87 = _85 + 16;
        _77 = _87;
    }
    int _89 = _77;
    int _91 = 0;
    if (!_65)
    {
        int _93 = as_type<int>(_57) << 4;
        int _95 = _93 + _83;
        _91 = _95;
    }
    int _97 = _91;
    int _99 = _69;
    int _101 = 0;
    int _103 = _47(_99, _101, (*spvDescriptorSet0.support_buffer));
    int _105 = _73;
    int _107 = 0;
    int _109 = _47(_105, _107, (*spvDescriptorSet0.support_buffer));
    float4 _112 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(int2(_103, _109)), 0).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    int _122 = 0;
    int _124 = 0;
    int _126 = 0;
    int _128 = 0;
    if (!_65)
    {
        int _130 = _89;
        int _132 = 0;
        int _134 = _47(_130, _132, (*spvDescriptorSet0.support_buffer));
        int _136 = _97;
        int _138 = 0;
        int _140 = _47(_136, _138, (*spvDescriptorSet0.support_buffer));
        float4 _142 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(int2(_134, _140)), 0).xyzw;
        float _144 = _142.x;
        float _146 = _142.y;
        float _148 = _142.z;
        float _150 = _142.w;
        _122 = as_type<int>(_144);
        _124 = as_type<int>(_146);
        _126 = as_type<int>(_148);
        _128 = as_type<int>(_150);
    }
    int _152 = _122;
    int _154 = _124;
    int _156 = _126;
    int _158 = _128;
    int _160 = as_type<int>(_51) << 4;
    if (!_65)
    {
        int _162 = _61 * 272;
        _79 = _162;
    }
    int _164 = _79;
    int _166 = as_type<int>(_53) * 272;
    int _168 = _166 + _160;
    uint _171 = uint(int(uint(_168) >> uint(2)));
    _24[int(_171)] = as_type<uint>(_114);
    int _173 = _168 + 4;
    uint _175 = uint(int(uint(_173) >> uint(2)));
    _24[int(_175)] = as_type<uint>(_116);
    int _177 = _168 + 8;
    uint _179 = uint(int(uint(_177) >> uint(2)));
    _24[int(_179)] = as_type<uint>(_118);
    int _181 = _168 + 12;
    uint _183 = uint(int(uint(_181) >> uint(2)));
    _24[int(_183)] = as_type<uint>(_120);
    if (!_65)
    {
        int _185 = _164 + (-69376);
        uint _187 = uint(int(uint(_185) >> uint(2)));
        _24[int(_187)] = uint(_152);
        int _189 = _164 + (-69372);
        uint _191 = uint(int(uint(_189) >> uint(2)));
        _24[int(_191)] = uint(_154);
        int _193 = _164 + (-69368);
        uint _195 = uint(int(uint(_193) >> uint(2)));
        _24[int(_195)] = uint(_156);
        int _197 = _164 + (-69364);
        uint _199 = uint(int(uint(_197) >> uint(2)));
        _24[int(_199)] = uint(_158);
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    int _201 = _168 + 28;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    float _205 = as_type<float>(_24[int(_203)]);
    int _207 = _168 + 276;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_24[int(_209)]);
    int _213 = _168 + 8;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>(_24[int(_215)]);
    uint _219 = uint(int(uint(_168) >> uint(2)));
    float _221 = as_type<float>(_24[int(_219)]);
    float _223 = _205 + _211;
    float _225 = _217 + _223;
    float _227 = float(uint(_69));
    float _229 = _221 + _225;
    float _231 = float(uint(_73));
    float _233 = _227 + 0.5;
    bool _235 = _229 >= (*spvDescriptorSet0.cp_c3)._m0[5].x;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.cp_c3)._m0[5].x);
    bool _243 = _239 || _241;
    float _245 = _231 + 0.5;
    float _247 = _233 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _249 = _245 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _251 = _245;
    float _253 = _229;
    float _255 = _118;
    float _257 = _120;
    if (!_243)
    {
        float2 _710 = float2(_247, _249);
        float4 _259 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710)), level(0.0)).xyzw;
        float _261 = _259.x;
        float _263 = _259.y;
        float _265 = _259.z;
        float _267 = _259.w;
        _251 = _261;
        _253 = _263;
        _255 = _265;
        _257 = _267;
    }
    float _269 = _251;
    float _271 = _253;
    float _273 = _255;
    float _275 = _257;
    bool _277 = !_243;
    float _279 = _269;
    float _281 = _271;
    float _283 = _273;
    float _285 = _275;
    if (!_277)
    {
        float _287 = precise::max(_205, _217);
        float _289 = precise::max(_211, _221);
        bool _291 = _287 > _289;
        float _293 = _291 ? _217 : 0.0;
        bool _295 = !_291;
        float _297 = _295 ? _221 : 0.0;
        float _299 = _291 ? _205 : 0.0;
        float _301 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _303 = fma(_293, _301, _247);
        bool _305 = !_291;
        float _307 = _305 ? _211 : 0.0;
        float _309 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _311 = fma(_297, _309, _249);
        float _313 = fma(_299, (*spvDescriptorSet0.cp_c3)._m0[0].z, _247);
        float _315 = fma(_307, (*spvDescriptorSet0.cp_c3)._m0[0].w, _249);
        float2 _797 = float2(_303, _311);
        float4 _317 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_797, float2(0.0), isnan(_797)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_797, float2(0.0), isnan(_797)), level(0.0)).xyzw;
        float _319 = _317.x;
        float _321 = _317.y;
        float _323 = _317.z;
        float _325 = _317.w;
        float2 _813 = float2(_313, _315);
        float4 _327 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_813, float2(0.0), isnan(_813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_813, float2(0.0), isnan(_813)), level(0.0)).xyzw;
        float _329 = _327.x;
        float _331 = _327.y;
        float _333 = _327.z;
        float _335 = _327.w;
        float _337 = _291 ? _205 : _211;
        float _339 = _291 ? _217 : _221;
        float _341 = _337 + _339;
        float _343 = 1.0 / _341;
        float _345 = _339 * _343;
        float _347 = _337 * _343;
        float _349 = _345 * _319;
        float _351 = _345 * _321;
        float _353 = _345 * _323;
        float _355 = _345 * _325;
        float _357 = fma(_347, _329, _349);
        float _359 = fma(_347, _331, _351);
        float _361 = fma(_347, _333, _353);
        float _363 = fma(_347, _335, _355);
        _279 = _357;
        _281 = _359;
        _283 = _361;
        _285 = _363;
    }
    float _365 = _279;
    float _367 = _281;
    float _369 = _283;
    float _371 = _285;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_365, _367, _369, _371), uint2(int2(_69, _73)));
}

