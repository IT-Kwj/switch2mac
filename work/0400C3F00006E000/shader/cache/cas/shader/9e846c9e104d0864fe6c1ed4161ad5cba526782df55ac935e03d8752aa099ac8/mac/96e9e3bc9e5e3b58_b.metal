#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* cp_c4 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c5 [[id(4)]];
    texture2d<float> cp_t_tcb_C [[id(5)]];
    sampler cp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(11)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(12)]];
    sampler cp_t_tcb_CSmplr_w [[id(13)]];
    sampler cp_t_tcb_8Smplr_w [[id(14)]];
    sampler cp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _1036, thread const int& _1037, constant _10& support_buffer)
{
    int _1040 = 1 + _1037;
    float _1042 = support_buffer._m5[_1040].x;
    bool _1044 = _1042 == 1.0;
    if (_1044)
    {
        return _1036;
    }
    float _1046 = float(_1036);
    float _1048 = _1046 * _1042;
    int _1050 = int(_1048);
    return _1050;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _59 = as_type<float>(gl_WorkGroupID.z);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    float _63 = as_type<float>(gl_WorkGroupID.y);
    float _65 = as_type<float>(gl_LocalInvocationID.y);
    int _67 = as_type<int>(_59) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    int _69 = _67 << 4;
    float _71 = as_type<float>(gl_WorkGroupID.x);
    int _73 = _69 + 4;
    uint _76 = uint(int(uint(_73) >> uint(2)));
    uint _78 = uint(int(uint(int(_76)) >> uint(2)));
    int _80 = int(_76) & 3;
    float _82 = (*spvDescriptorSet0.cp_c3)._m0[int(_78)][_80];
    int _84 = as_type<int>(_63) << 2;
    int _86 = _84 + as_type<int>(_65);
    int _88 = _69 + 12;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    uint _92 = uint(int(uint(int(_90)) >> uint(2)));
    int _94 = int(_90) & 3;
    float _96 = (*spvDescriptorSet0.cp_c3)._m0[int(_92)][_94];
    int _98 = as_type<int>(_71) << 3;
    int _100 = _98 + as_type<int>(_61);
    float _102 = 1.0 / _82;
    float _104 = float(_86);
    float _106 = float(_100);
    float _108 = _104 + 0.5;
    float _110 = _106 + 0.5;
    float _112 = _110 * _102;
    float _114 = _108 * _102;
    float _116 = _82 * _96;
    float _118 = _112 + (-0.5);
    float _120 = _114 + (-0.5);
    float _122 = fma(_116, _118, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _124 = fma(_116, _120, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _126 = fma(_122, 6.2500002968590706586837768554688e-05, 0.5);
    float _128 = fma(_124, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _555 = float2(_126, _128);
    float2 _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_555, float2(0.0), isnan(_555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_555, float2(0.0), isnan(_555)), level(0.0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    int _138 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z) << 4;
    uint _140 = uint(int(uint(_138) >> uint(2)));
    uint _142 = uint(int(uint(int(_140)) >> uint(2)));
    int _144 = int(_140) & 3;
    float _146 = (*spvDescriptorSet0.cp_c4)._m0[int(_142)][_144];
    float _148 = float(as_type<int>(_59));
    float _150 = rint(_148);
    float _152 = precise::max(_150, 0.0);
    uint _154 = uint(_152);
    uint _156 = clamp(_154, 0u, 65535u);
    float _158 = fma(_134, 40.0, -20.0);
    float _160 = fma(_136, 40.0, -20.0);
    float _162 = -_158;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c6)._m0[0].z, _122);
    float _166 = -_160;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c6)._m0[0].z, _124);
    float _170 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _172 = _164 + _170;
    float _174 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _176 = _168 + _174;
    float _178 = abs(_172);
    float _180 = abs(_176);
    float _182 = precise::max(_178, _180);
    float _184 = fma(_182, 4.0, 4.0);
    float _186 = _184 * _146;
    float _188 = precise::max(_186, 1.0);
    float _190 = log2(_188);
    float _192 = floor(_190);
    bool _196 = _192 >= 5.0;
    bool _198 = isnan(_192);
    bool _200 = _196 || _198;
    bool _202 = isnan(5.0);
    bool _204 = _200 || _202;
    int _206 = as_type<int>(_186);
    float _208 = _176;
    float _210 = _190;
    float _212 = _172;
    float _214 = _118;
    if (!_204)
    {
        float _216 = floor(_190);
        int _218 = int(_216);
        _206 = _218;
    }
    int _220 = _206;
    int _222 = _220;
    if (!_204)
    {
        int _224 = min(_220, 4);
        _222 = _224;
    }
    int _226 = _222;
    int _228 = _226;
    if (!_204)
    {
        int _230 = _226 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
        _228 = _230;
    }
    int _232 = _228;
    uint _234 = 0u;
    if (!_204)
    {
        int _236 = _232 << 4;
        _234 = uint(_236);
    }
    uint _238 = _234;
    int _240 = _100;
    int _242 = 3;
    int _244 = _55(_240, _242, (*spvDescriptorSet0.support_buffer));
    int _246 = _86;
    int _248 = 3;
    int _250 = _55(_246, _248, (*spvDescriptorSet0.support_buffer));
    int3 _719 = int3(_244, _250, as_type<int>(_59));
    float4 _253 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_719.xy), uint(_719.z)).xyzw);
    float _255 = _253.x;
    float _257 = _253.y;
    float _259 = _253.z;
    float _261 = _253.w;
    float _263 = as_type<float>(_238);
    if (!_204)
    {
        uint _265 = uint(int(uint(int(_238)) >> uint(2)));
        uint _267 = uint(int(uint(int(_265)) >> uint(2)));
        int _269 = int(_265) & 3;
        float _271 = (*spvDescriptorSet0.cp_c4)._m0[int(_267)][_269];
        _263 = _271;
    }
    float _273 = _263;
    float _275 = 0.0;
    if (!_204)
    {
        float _277 = rint(_192);
        float _279 = precise::max(_277, 0.0);
        uint _281 = uint(_279);
        uint _283 = clamp(_281, 0u, 65535u);
        _275 = as_type<float>(_283);
    }
    float _285 = _275;
    if (!_204)
    {
        float _287 = fma(_176, _273, 0.5);
        _208 = _287;
    }
    float _289 = _208;
    float _291 = 0.0;
    if (!_204)
    {
        float _293 = fma(_172, _273, 0.5);
        _291 = _293;
    }
    float _295 = _291;
    float _297 = _289;
    if (!_204)
    {
        float3 _799 = float3(_295, _289, float(as_type<int>(_285)));
        float3 _803 = select(_799, float3(0.0), isnan(_799));
        float _299 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _803.xy, uint(rint(_803.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _803.xy, uint(rint(_803.z)), level(0.0)).x;
        _297 = _299;
    }
    float _301 = _297;
    float3 _815 = float3(_112, _114, float(int(_156)));
    float3 _817 = select(_815, float3(0.0), isnan(_815));
    float _303 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _817.xy, uint(rint(_817.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _817.xy, uint(rint(_817.z)), level(0.0)).w;
    bool _305 = as_type<int>(_59) != 4;
    if (!_204)
    {
        _210 = 1.0;
    }
    float _307 = _210;
    float _309 = -(*spvDescriptorSet0.cp_c3)._m0[16].y;
    float _311 = _124 + _309;
    if (!_305)
    {
        float _313 = abs(_118);
        float _315 = abs(_120);
        float _317 = precise::max(_313, _315);
        _212 = _317;
    }
    float _319 = _212;
    float _321 = _319;
    if (!_204)
    {
        _214 = (*spvDescriptorSet0.cp_c5)._m0[1].x;
    }
    float _323 = _214;
    float _325 = _323;
    if (!_204)
    {
        float _327 = fma(_323, -0.01666666753590106964111328125, _307);
        _325 = _327;
    }
    float _329 = _325;
    float _331 = -(*spvDescriptorSet0.cp_c3)._m0[16].x;
    float _333 = _122 + _331;
    float _335 = _311 * _311;
    float _337 = _114;
    float _339 = _329;
    if (!_204)
    {
        float _341 = abs(_329);
        float _343 = log2(_341);
        _337 = _343;
    }
    float _345 = _337;
    float _347 = fma(_333, _333, _335);
    float _349 = -(*spvDescriptorSet0.cp_c5)._m0[1].z;
    float _351 = fma(_349, (*spvDescriptorSet0.cp_c5)._m0[1].z, _347);
    float _353 = precise::max(0.0, _351);
    float _355 = _353 * (-1.4426949746848549693822860717773e-05);
    float _357 = exp2(_355);
    if (_204)
    {
        _339 = 0.0;
    }
    float _359 = _339;
    float _361 = _257 * (*spvDescriptorSet0.cp_c5)._m0[0].z;
    float _363 = _257;
    float _365 = _261;
    float _367 = _359;
    if (!_204)
    {
        float _369 = precise::max(_307, (*spvDescriptorSet0.cp_c6)._m0[0].y);
        _363 = _369;
    }
    float _371 = _363;
    float _373 = _371;
    if (!_204)
    {
        float _375 = _371 * _345;
        _373 = _375;
    }
    float _377 = _373;
    float _379 = fma(_255, (*spvDescriptorSet0.cp_c5)._m0[0].x, _361);
    float _381 = _255;
    if (!_204)
    {
        float _383 = exp2(_377);
        _381 = _383;
    }
    float _385 = _381;
    float _387 = precise::max(0.0, _379);
    float _389 = -_261;
    float _391 = fma(_387, 2.5, _389);
    if (!_305)
    {
        _365 = 20.0;
    }
    float _393 = _365;
    float _395 = _391 + (*spvDescriptorSet0.cp_c5)._m0[0].w;
    float _397 = _393;
    if (!_305)
    {
        float _399 = fma(_319, _393, -9.0);
        float _401 = precise::clamp(_399, 0.0, 1.0);
        _321 = _401;
    }
    float _403 = _321;
    float _405 = _357 * _395;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    if (!_305)
    {
        float _409 = -_403;
        float _411 = _409 + 1.0;
        _397 = _411;
    }
    float _413 = _397;
    if (!_204)
    {
        float _415 = _301 * _385;
        _367 = _415;
    }
    float _417 = _367;
    float _419 = precise::max(_303, _417);
    float _421 = (*spvDescriptorSet0.cp_c6)._m0[0].y * (*spvDescriptorSet0.cp_c5)._m0[1].y;
    float _423 = fma(_407, _421, _419);
    float _425 = _423;
    if (!_305)
    {
        float _427 = _423 * _413;
        _425 = _427;
    }
    float _429 = _425;
    int3 _1033 = int3(_100, _86, as_type<int>(_59));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_429, 0.0, 0.0, 0.0), uint2(_1033.xy), uint(_1033.z));
}

