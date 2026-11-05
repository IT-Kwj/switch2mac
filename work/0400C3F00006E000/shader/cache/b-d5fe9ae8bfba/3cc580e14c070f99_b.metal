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

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_C [[id(2)]];
    sampler cp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> cp_t_tcb_8 [[id(4)]];
    sampler cp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> cp_t_tcb_12 [[id(6)]];
    sampler cp_t_tcb_12Smplr [[id(7)]];
    texture2d<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
    texture2d<float> cp_t_tcb_14 [[id(10)]];
    sampler cp_t_tcb_14Smplr [[id(11)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(12)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(13)]];
    sampler cp_t_tcb_CSmplr_w [[id(14)]];
    sampler cp_t_tcb_8Smplr_w [[id(15)]];
    sampler cp_t_tcb_12Smplr_w [[id(16)]];
    sampler cp_t_tcb_ASmplr_w [[id(17)]];
    sampler cp_t_tcb_14Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _1626 = false;
    float _61 = as_type<float>(gl_WorkGroupID.y);
    float _63 = as_type<float>(gl_LocalInvocationID.y);
    float _65 = as_type<float>(gl_WorkGroupID.x);
    float _67 = as_type<float>(gl_LocalInvocationID.x);
    int _70 = as_type<int>(_61) << 2;
    int _72 = _70 + as_type<int>(_63);
    float _74 = float(uint(_72));
    int _76 = as_type<int>(_65) << 2;
    int _78 = _76 + as_type<int>(_67);
    float _80 = _74 + 0.5;
    float _82 = float(uint(_78));
    float _84 = -_80;
    float _86 = fma(_84, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _88 = _82 + 0.5;
    float _90 = fma(_86, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _92 = fma(_88, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _94 = _90 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _96 = _90 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _98 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _100 = _90 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _102 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[1].x, _94);
    float _104 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[0].x, _100);
    float _106 = fma(_98, (*spvDescriptorSet0.cp_c3)._m0[2].x, _96);
    float _108 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _110 = _102 + _108;
    float _112 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _114 = _104 + _112;
    float _116 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _118 = _106 + _116;
    float _120 = _110 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _122 = _114 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _124 = _118 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _128 = _120 + _126;
    float _130 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _132 = _122 + _130;
    float _134 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _136 = _124 + _134;
    float _138 = _128 * _128;
    float _140 = fma(_132, _132, _138);
    float _142 = fma(_136, _136, _140);
    float _144 = as_type<float>(gl_LocalInvocationID.z);
    float _146 = rsqrt(_142);
    float _148 = _132 * _146;
    float _150 = _136 * _146;
    float _152 = _128 * _146;
    float _154 = _148 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _156 = _150 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _158 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _160 = _154 * _154;
    float _162 = _156 * _156;
    float _164 = precise::max(0.0, _158);
    float _166 = _160 + _162;
    float _168 = sqrt(_166);
    float _170 = -_152;
    float _172 = -_164;
    float _174 = fma(_170, (*spvDescriptorSet0.cp_c3)._m0[8].w, _172);
    bool _178 = _168 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _180 = _146;
    float _182 = _174;
    float _184 = _160;
    if (!_178)
    {
        _180 = _162;
    }
    float _186 = _180;
    bool _188 = !_178;
    float _190 = _186;
    if (!_188)
    {
        float _192 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _194 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _196 = _168 + _194;
        float _198 = rsqrt(_166);
        float _200 = _196 * _192;
        float _202 = _200 * 0.15915493667125701904296875;
        float _204 = _174 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _206 = _202 * 6.283185482025146484375;
        float _208 = sin(_206);
        float _210 = _202 * 6.283185482025146484375;
        float _212 = cos(_210);
        float _214 = fma(_208, _204, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _216 = _198 * _214;
        float _218 = _212 + (-1.0);
        float _220 = _154 * _216;
        float _222 = _218 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _224 = _156 * _216;
        float _226 = fma(_174, _212, _222);
        float _228 = _220 * _220;
        float _230 = _224 * _224;
        _182 = _226;
        _184 = _228;
        _190 = _230;
    }
    float _232 = _182;
    float _234 = _184;
    float _236 = _190;
    float _238 = fma(_232, _232, _234);
    bool _240 = as_type<uint>(_144) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _242 = _90 * _90;
    float _244 = _238 + _236;
    float _246 = _148 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _248 = fma(_98, _98, _242);
    float _250 = -_152;
    float _252 = -_246;
    float _254 = fma(_250, (*spvDescriptorSet0.cp_c3)._m0[6].y, _252);
    float _256 = rsqrt(_244);
    float _258 = -_150;
    float _260 = fma(_258, (*spvDescriptorSet0.cp_c3)._m0[6].z, _254);
    if (_240)
    {
        return;
    }
    int _262 = as_type<int>(_63) << 2;
    int _264 = _262 + as_type<int>(_67);
    float _266 = _248 + 1.0;
    float _268 = _256 * _232;
    float _270 = -_260;
    float _272 = fma(_270, (*spvDescriptorSet0.cp_c3)._m0[15].x, _260);
    int _274 = _264 << 2;
    float _276 = sqrt(_266);
    float _278 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _280 = _278 + 1.0;
    uint _283 = as_type<uint>(_144);
    float _285 = 0.0;
    int _287 = 0;
    int _289 = 0;
    int _291 = 0;
    float _293 = 0.0;
    float _295 = 0.0;
    float _297 = 0.0;
    do
    {
        uint _299 = _283;
        float _301 = _285;
        int _303 = _287;
        int _305 = _289;
        int _307 = _291;
        float _309 = _293;
        float _311 = _295;
        float _313 = _297;
        float _315 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _317 = log2(_315);
        float _319 = float(_299);
        float _321 = _276 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _323 = int(_299) + 1;
        float _325 = _148 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _327 = _150 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _329 = float(uint(_323));
        float _331 = _317 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _333 = _319 * _331;
        float _335 = _329 * _331;
        float _337 = exp2(_333);
        float _339 = exp2(_335);
        float _341 = _337 + (-1.0);
        float _343 = _341 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _345 = _339 + (-1.0);
        float _347 = _276 * _343;
        float _349 = -_343;
        float _351 = fma(_345, (*spvDescriptorSet0.cp_c3)._m0[8].z, _349);
        float _353 = fma(_347, _325, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _355 = fma(_347, _327, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _357 = _351 * _321;
        float _359 = fma(_148, _357, _353);
        float _361 = fma(_150, _357, _355);
        float _363 = fma(_359, 6.2500002968590706586837768554688e-05, 0.5);
        float _365 = fma(_361, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _2095 = float2(_363, _365);
        float3 _369 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2095, float2(0.0), isnan(_2095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2095, float2(0.0), isnan(_2095)), level(0.0)).xyz;
        float _371 = _369.x;
        float _373 = _369.y;
        float _375 = _369.z;
        float2 _2111 = float2(_363, _365);
        float _377 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2111, float2(0.0), isnan(_2111)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2111, float2(0.0), isnan(_2111)), level(0.0)).x;
        float3 _2120 = float3(_363, _365, float(0));
        float3 _2124 = select(_2120, float3(0.0), isnan(_2120));
        float4 _380 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2124.xy, uint(rint(_2124.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2124.xy, uint(rint(_2124.z)), level(0.0)).xyzw;
        float _382 = _380.x;
        float _384 = _380.y;
        float _386 = _380.z;
        float _388 = _380.w;
        float3 _2139 = float3(_363, _365, float(1));
        float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
        float4 _390 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2141.xy, uint(rint(_2141.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2141.xy, uint(rint(_2141.z)), level(0.0)).xyzw;
        float _392 = _390.x;
        float _394 = _390.y;
        float _396 = _390.z;
        float _398 = _390.w;
        float3 _2156 = float3(_363, _365, float(2));
        float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
        float4 _400 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2158.xy, uint(rint(_2158.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2158.xy, uint(rint(_2158.z)), level(0.0)).xyzw;
        float _402 = _400.x;
        float _404 = _400.y;
        float _406 = _400.z;
        float _408 = _400.w;
        float _410 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _412 = _361 + _410;
        float _414 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _416 = _359 + _414;
        float _418 = _343 + _351;
        float _420 = _412 * _412;
        float _422 = _152 * 1.02332699298858642578125;
        float _424 = _418 * _321;
        float _426 = _150 * 1.02332699298858642578125;
        float _428 = fma(_416, _416, _420);
        float _430 = _148 * 1.02332699298858642578125;
        float _432 = sqrt(_428);
        bool _434 = _432 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _436 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _438 = _432 + _436;
        float _440 = _301;
        float _442 = _438;
        float _444 = 0.0;
        float _446 = _432;
        float _448 = _311;
        float _450 = _313;
        if (_434)
        {
            float _452 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _440 = _452;
        }
        float _454 = _440;
        if (_434)
        {
            float _456 = _438 * _454;
            _442 = _456;
        }
        float _458 = _442;
        if (_434)
        {
            float _460 = _458 * 0.15915493667125701904296875;
            _444 = _460;
        }
        float _462 = _444;
        float _464 = _152 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _466 = fma(_347, _464, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _468 = _462;
        float _470 = _466;
        if (_434)
        {
            float _472 = _462 * 6.283185482025146484375;
            float _474 = cos(_472);
            _468 = _474;
        }
        float _476 = _468;
        float _478 = _152 * _357;
        float _480 = _466 + _478;
        if (!_434)
        {
            _446 = _480;
        }
        float _482 = _446;
        float _484 = _482;
        if (_434)
        {
            float _486 = _476 + (-1.0);
            _470 = _486;
        }
        float _488 = _470;
        float _490 = _488;
        if (_434)
        {
            float _492 = _488 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _490 = _492;
        }
        float _494 = _490;
        if (_434)
        {
            float _496 = fma(_480, _476, _494);
            _484 = _496;
        }
        float _498 = _484;
        float _500 = abs(_478);
        bool _502 = _500 > 0.00999999977648258209228515625;
        float _504 = -_498;
        float _506 = fma(_480, 2.0, _504);
        float _508 = _502 ? _478 : 0.00999999977648258209228515625;
        float _510 = fma(_373, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _512 = _388 * _422;
        float _514 = _510 * 100.0;
        float _516 = 1.0 / _510;
        float _518 = fma(_424, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _520 = precise::clamp(_518, 0.0, 1.0);
        float _522 = fma(_382, 0.88622701168060302734375, _512);
        float _524 = -_520;
        float _526 = _524 + 1.0;
        float _528 = _510 * 5115.0;
        float _530 = exp2(_514);
        float _532 = abs(_526);
        float _534 = log2(_532);
        float _536 = fma(_530, 512.0, -512.0);
        float _538 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _540 = fma(_272, -0.5, 0.5);
        float _542 = 1.0 / _536;
        float _544 = -_538;
        float _546 = _544 + _506;
        float _548 = _510 * _508;
        float _550 = _392 * _422;
        float _552 = _394 * _422;
        float _554 = fma(_396, _426, _522);
        float _556 = precise::max(0.0, _546);
        float _558 = fma(_384, 0.88622701168060302734375, _550);
        float _560 = fma(_386, 0.88622701168060302734375, _552);
        float _562 = _268 + 1.0;
        float _564 = precise::max(_548, -127.0);
        float _566 = sqrt(_540);
        float _568 = fma(_398, _426, _558);
        float _570 = _528 * _542;
        float _572 = _534 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _574 = fma(_402, _426, _560);
        float _576 = -_564;
        float _578 = exp2(_576);
        float _580 = fma(_404, _430, _554);
        float _582 = log2(_570);
        float _584 = _566 * 0.636619746685028076171875;
        float _586 = exp2(_572);
        float _588 = -_578;
        float _590 = _588 + 1.0;
        float _592 = fma(_582, _516, 100.0);
        float _594 = 1.0 / _564;
        float _596 = -_592;
        float _598 = _596 + _556;
        float _600 = -_268;
        float _602 = fma(_586, _562, _600);
        float _604 = _510 * _598;
        float _606 = fma(_602, 0.5, 0.5);
        float _608 = fma(_272, 0.5, 0.5);
        float _610 = -_604;
        float _612 = exp2(_610);
        float3 _2465 = float3(_363, _365, float(3));
        float3 _2467 = select(_2465, float3(0.0), isnan(_2465));
        float4 _614 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2467.xy, uint(rint(_2467.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2467.xy, uint(rint(_2467.z)), level(0.0)).xyzw;
        float _616 = _614.x;
        float _618 = _614.y;
        float _620 = _614.z;
        float _622 = _614.w;
        float3 _2482 = float3(_363, _365, float(6));
        float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
        float4 _624 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2484.xy, uint(rint(_2484.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2484.xy, uint(rint(_2484.z)), level(0.0)).xyzw;
        float _626 = _624.x;
        float _628 = _624.y;
        float _630 = _624.z;
        float _632 = _624.w;
        float3 _2499 = float3(_363, _365, float(4));
        float3 _2501 = select(_2499, float3(0.0), isnan(_2499));
        float4 _634 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2501.xy, uint(rint(_2501.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2501.xy, uint(rint(_2501.z)), level(0.0)).xyzw;
        float _636 = _634.x;
        float _638 = _634.y;
        float _640 = _634.z;
        float _642 = _634.w;
        float _644 = fma(_608, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _646 = fma(_608, _644, -0.212114393711090087890625);
        float _648 = fma(_608, _646, 1.570728778839111328125);
        float _650 = -_648;
        float _652 = fma(_584, _650, 1.0);
        float _654 = _612 * _590;
        float3 _2537 = float3(_363, _365, float(7));
        float3 _2539 = select(_2537, float3(0.0), isnan(_2537));
        float4 _656 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2539.xy, uint(rint(_2539.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2539.xy, uint(rint(_2539.z)), level(0.0)).xyzw;
        float _658 = _656.x;
        float _660 = _656.y;
        float _662 = _656.z;
        float _664 = _656.w;
        float _666 = _654 * _594;
        float3 _2558 = float3(_363, _365, float(5));
        float3 _2560 = select(_2558, float3(0.0), isnan(_2558));
        float4 _668 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2560.xy, uint(rint(_2560.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2560.xy, uint(rint(_2560.z)), level(0.0)).xyzw;
        float _670 = _668.x;
        float _672 = _668.y;
        float _674 = _668.z;
        float _676 = _668.w;
        float2 _2574 = float2(_363, _365);
        float3 _678 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2574, float2(0.0), isnan(_2574)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2574, float2(0.0), isnan(_2574)), level(0.0)).xyz;
        float _680 = _678.x;
        float _682 = _678.y;
        float _684 = _678.z;
        float2 _2588 = float2(_652, _606);
        float3 _686 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2588, float2(0.0), isnan(_2588)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2588, float2(0.0), isnan(_2588)), level(0.0)).xyz;
        float _688 = _686.x;
        float _690 = _686.y;
        float _692 = _686.z;
        float _694 = fma(_375, _375, 1.0);
        float _696 = _375 * 2.0;
        float _698 = fma(_406, _430, _568);
        float _700 = fma(_408, _430, _574);
        float _702 = _534 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _704 = precise::max(0.0, _698);
        float _706 = precise::max(0.0, _700);
        float _708 = -_696;
        float _710 = fma(_272, _708, _694);
        float _712 = -_696;
        float _714 = _694 + _712;
        float _716 = exp2(_702);
        bool _718 = as_type<int>(_144) != 0;
        float _720 = abs(_710);
        float _722 = log2(_720);
        float _724 = abs(_714);
        float _726 = log2(_724);
        float _728 = _722 * 1.5;
        float _730 = exp2(_728);
        float _732 = _726 * 1.5;
        float _734 = exp2(_732);
        float _736 = _730 * 12.56637096405029296875;
        float _738 = 1.0 / _736;
        float _740 = _734 * 12.56637096405029296875;
        float _742 = 1.0 / _740;
        float _744 = -_375;
        float _746 = fma(_744, _375, 1.0);
        float _748 = _746 * _738;
        float _750 = _746 * _742;
        float _752 = fma(_371, -0.99447572231292724609375, 1.0);
        float _754 = log2(_752);
        float _756 = _754 * (-0.0199999995529651641845703125);
        float _758 = _357 * _756;
        float _760 = _666 * _758;
        float _762 = precise::max(0.0, _580);
        float _764 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _766 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _768 = _762 * _764;
        float _770 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _772 = _706 * _766;
        float _774 = 1.0 / _357;
        float _776 = _704 * _770;
        float _778 = _622 * _422;
        float _780 = _628 * _422;
        float _782 = _636 * _422;
        float _784 = _638 * _422;
        float _786 = fma(_616, 0.88622701168060302734375, _778);
        float _788 = fma(_626, 0.88622701168060302734375, _780);
        float _790 = fma(_618, 0.88622701168060302734375, _782);
        float _792 = fma(_620, 0.88622701168060302734375, _784);
        float _794 = fma(_640, _426, _786);
        float _796 = fma(_630, _426, _788);
        float _798 = fma(_642, _426, _790);
        float _800 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _802 = _424 + _800;
        float _804 = fma(_632, _430, _796);
        float _806 = _802 * _774;
        float _808 = precise::clamp(_806, 0.0, 1.0);
        float _810 = _660 * _422;
        float _812 = _804 * 0.31830990314483642578125;
        float _814 = precise::clamp(_812, 0.0, 1.0);
        float _816 = _760 * _808;
        float _818 = fma(_658, 0.88622701168060302734375, _810);
        float _820 = precise::min(_814, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _822 = fma(_662, _426, _818);
        float _824 = -_716;
        float _826 = _824 + 1.0;
        float _828 = fma(_670, _426, _792);
        float _830 = fma(_672, _430, _794);
        float _832 = fma(_664, _430, _822);
        float _834 = _820 * 0.88622701168060302734375;
        float _836 = fma(_674, _430, _798);
        float _838 = fma(_676, _430, _828);
        float _840 = _832 * 0.31830990314483642578125;
        float _842 = precise::clamp(_840, 0.0, 1.0);
        float _844 = fma(_834, (*spvDescriptorSet0.cp_c3)._m0[9].x, _768);
        float _846 = fma(_834, (*spvDescriptorSet0.cp_c3)._m0[9].y, _776);
        float _848 = fma(_834, (*spvDescriptorSet0.cp_c3)._m0[9].z, _772);
        float _850 = _842 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _852 = precise::clamp(_850, 0.0, 1.0);
        float _854 = precise::max(0.0, _830);
        float _856 = _826 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _858 = precise::max(0.0, _836);
        float _860 = precise::max(0.0, _838);
        float _862 = fma(_854, _852, _844);
        float _864 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
        float _866 = fma(_858, _852, _846);
        float _868 = _854;
        float _870 = _864;
        float _872 = _620;
        if (_718)
        {
            _868 = as_type<float>(_303);
        }
        int _874 = as_type<int>(_868);
        float _876 = fma(_860, _852, _848);
        float _878 = _862 * _750;
        float _880 = _864 * _748;
        float _882 = _866 * _750;
        float _884 = _876 * _750;
        int _886 = _274 + as_type<int>(_144);
        float _888 = fma(_880, (*spvDescriptorSet0.cp_c3)._m0[7].x, _878);
        float _890 = fma(_880, (*spvDescriptorSet0.cp_c3)._m0[7].y, _882);
        float _892 = fma(_880, (*spvDescriptorSet0.cp_c3)._m0[7].z, _884);
        float _894 = _357 * _864;
        float _896 = _680 * _888;
        float _898 = _682 * _890;
        float _900 = _684 * _892;
        float _902 = _864 * _688;
        float _904 = _864 * _690;
        float _906 = _864 * _692;
        int _908 = _886 << 2;
        int _910 = _908 + 1024;
        uint _912 = uint(int(uint(_910) >> uint(2)));
        _26[int(_912)] = as_type<uint>(_894);
        float _914 = _892;
        float _916 = _882;
        int _918 = _874;
        if (_718)
        {
            _914 = as_type<float>(_305);
        }
        int _920 = as_type<int>(_914);
        int _922 = _920;
        if (_718)
        {
            _870 = as_type<float>(_307);
        }
        int _924 = as_type<int>(_870);
        int _926 = _886 << 4;
        int _928 = _926 + 1280;
        uint _930 = uint(int(uint(_928) >> uint(2)));
        _26[int(_930)] = as_type<uint>(_896);
        int _932 = _926 + 1284;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        _26[int(_934)] = as_type<uint>(_898);
        int _936 = _926 + 1288;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        _26[int(_938)] = as_type<uint>(_900);
        int _940 = _926 + 1292;
        uint _942 = uint(int(uint(_940) >> uint(2)));
        _26[int(_942)] = as_type<uint>(_816);
        int _944 = _924;
        if (_718)
        {
            _916 = _309;
        }
        float _946 = _916;
        int _948 = _886 << 4;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        _26[int(_950)] = as_type<uint>(_902);
        int _952 = _948 + 4;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        _26[int(_954)] = as_type<uint>(_904);
        int _956 = _948 + 8;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        _26[int(_958)] = as_type<uint>(_906);
        int _960 = _948 + 12;
        uint _962 = uint(int(uint(_960) >> uint(2)));
        _26[int(_962)] = as_type<uint>(_856);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        float _964 = _946;
        if (!_718)
        {
            int _966 = _274 << 4;
            int _968 = _966 + 1280;
            uint _970 = uint(int(uint(_968) >> uint(2)));
            float _972 = as_type<float>(_26[int(_970)]);
            int _974 = _966 + 1284;
            uint _976 = uint(int(uint(_974) >> uint(2)));
            float _978 = as_type<float>(_26[int(_976)]);
            int _980 = _966 + 1288;
            uint _982 = uint(int(uint(_980) >> uint(2)));
            float _984 = as_type<float>(_26[int(_982)]);
            int _986 = _966 + 1292;
            uint _988 = uint(int(uint(_986) >> uint(2)));
            float _990 = as_type<float>(_26[int(_988)]);
            int _992 = _274 << 4;
            int _994 = _992 + 1296;
            uint _996 = uint(int(uint(_994) >> uint(2)));
            float _998 = as_type<float>(_26[int(_996)]);
            int _1000 = _992 + 1300;
            uint _1002 = uint(int(uint(_1000) >> uint(2)));
            float _1004 = as_type<float>(_26[int(_1002)]);
            int _1006 = _992 + 1304;
            uint _1008 = uint(int(uint(_1006) >> uint(2)));
            float _1010 = as_type<float>(_26[int(_1008)]);
            int _1012 = _992 + 1308;
            uint _1014 = uint(int(uint(_1012) >> uint(2)));
            float _1016 = as_type<float>(_26[int(_1014)]);
            int _1018 = _274 << 4;
            uint _1020 = uint(int(uint(_1018) >> uint(2)));
            float _1022 = as_type<float>(_26[int(_1020)]);
            int _1024 = _1018 + 4;
            uint _1026 = uint(int(uint(_1024) >> uint(2)));
            float _1028 = as_type<float>(_26[int(_1026)]);
            int _1030 = _1018 + 8;
            uint _1032 = uint(int(uint(_1030) >> uint(2)));
            float _1034 = as_type<float>(_26[int(_1032)]);
            int _1036 = _1018 + 12;
            uint _1038 = uint(int(uint(_1036) >> uint(2)));
            float _1040 = as_type<float>(_26[int(_1038)]);
            int _1042 = _274 << 4;
            int _1044 = _1042 + 1312;
            uint _1046 = uint(int(uint(_1044) >> uint(2)));
            float _1048 = as_type<float>(_26[int(_1046)]);
            int _1050 = _1042 + 1316;
            uint _1052 = uint(int(uint(_1050) >> uint(2)));
            float _1054 = as_type<float>(_26[int(_1052)]);
            int _1056 = _1042 + 1320;
            uint _1058 = uint(int(uint(_1056) >> uint(2)));
            float _1060 = as_type<float>(_26[int(_1058)]);
            int _1062 = _1042 + 1324;
            uint _1064 = uint(int(uint(_1062) >> uint(2)));
            float _1066 = as_type<float>(_26[int(_1064)]);
            int _1068 = _274 << 4;
            int _1070 = _1068 + 16;
            uint _1072 = uint(int(uint(_1070) >> uint(2)));
            float _1074 = as_type<float>(_26[int(_1072)]);
            int _1076 = _1068 + 20;
            uint _1078 = uint(int(uint(_1076) >> uint(2)));
            float _1080 = as_type<float>(_26[int(_1078)]);
            int _1082 = _1068 + 24;
            uint _1084 = uint(int(uint(_1082) >> uint(2)));
            float _1086 = as_type<float>(_26[int(_1084)]);
            int _1088 = _1068 + 28;
            uint _1090 = uint(int(uint(_1088) >> uint(2)));
            float _1092 = as_type<float>(_26[int(_1090)]);
            int _1094 = _274 << 4;
            int _1096 = _1094 + 1328;
            uint _1098 = uint(int(uint(_1096) >> uint(2)));
            float _1100 = as_type<float>(_26[int(_1098)]);
            int _1102 = _1094 + 1332;
            uint _1104 = uint(int(uint(_1102) >> uint(2)));
            float _1106 = as_type<float>(_26[int(_1104)]);
            int _1108 = _1094 + 1336;
            uint _1110 = uint(int(uint(_1108) >> uint(2)));
            float _1112 = as_type<float>(_26[int(_1110)]);
            int _1114 = _1094 + 1340;
            uint _1116 = uint(int(uint(_1114) >> uint(2)));
            float _1118 = as_type<float>(_26[int(_1116)]);
            float _1120 = _309 + _990;
            float _1122 = -_1120;
            float _1124 = exp2(_1122);
            float _1126 = _1120 + _1016;
            float _1128 = -_972;
            float _1130 = _1128 + _1022;
            float _1132 = -_978;
            float _1134 = _1132 + _1028;
            float _1136 = -_984;
            float _1138 = _1136 + _1034;
            float _1140 = -_1126;
            float _1142 = exp2(_1140);
            float _1144 = _1126 + _1066;
            float _1146 = -_1004;
            float _1148 = _1146 + _1080;
            float _1150 = -_998;
            float _1152 = _1150 + _1074;
            float _1154 = -_1010;
            float _1156 = _1154 + _1086;
            float _1158 = -_1124;
            float _1160 = _1158 + 1.0;
            float _1162 = -_1144;
            float _1164 = exp2(_1162);
            int _1166 = _274 << 4;
            int _1168 = _1166 + 32;
            uint _1170 = uint(int(uint(_1168) >> uint(2)));
            float _1172 = as_type<float>(_26[int(_1170)]);
            int _1174 = _1166 + 36;
            uint _1176 = uint(int(uint(_1174) >> uint(2)));
            float _1178 = as_type<float>(_26[int(_1176)]);
            int _1180 = _1166 + 40;
            uint _1182 = uint(int(uint(_1180) >> uint(2)));
            float _1184 = as_type<float>(_26[int(_1182)]);
            int _1186 = _1166 + 44;
            uint _1188 = uint(int(uint(_1186) >> uint(2)));
            float _1190 = as_type<float>(_26[int(_1188)]);
            float _1192 = _1144 + _1118;
            float _1194 = precise::min(_1160, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1196 = -_1142;
            float _1198 = _1196 + 1.0;
            float _1200 = -_311;
            float _1202 = _1194 + _1200;
            float _1204 = precise::min(_1198, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1206 = _1202 * _1040;
            float _1208 = _1134 * _1206;
            float _1210 = _1130 * _1206;
            float _1212 = _1138 * _1206;
            float _1214 = fma(_978, _1202, _1208);
            float _1216 = -_1194;
            float _1218 = _1216 + _1204;
            float _1220 = fma(_972, _1202, _1210);
            float _1222 = fma(_984, _1202, _1212);
            float _1224 = _1214 + as_type<float>(_307);
            float _1226 = _1218 * _1092;
            float _1228 = -_1164;
            float _1230 = _1228 + 1.0;
            int _1232 = _274 << 4;
            int _1234 = _1232 + 48;
            uint _1236 = uint(int(uint(_1234) >> uint(2)));
            float _1238 = as_type<float>(_26[int(_1236)]);
            int _1240 = _1232 + 52;
            uint _1242 = uint(int(uint(_1240) >> uint(2)));
            float _1244 = as_type<float>(_26[int(_1242)]);
            int _1246 = _1232 + 56;
            uint _1248 = uint(int(uint(_1246) >> uint(2)));
            float _1250 = as_type<float>(_26[int(_1248)]);
            int _1252 = _1232 + 60;
            uint _1254 = uint(int(uint(_1252) >> uint(2)));
            float _1256 = as_type<float>(_26[int(_1254)]);
            float _1258 = _1220 + as_type<float>(_305);
            float _1260 = _1148 * _1226;
            float _1262 = _1152 * _1226;
            int _1264 = _274 << 2;
            int _1266 = _1264 + 1024;
            uint _1268 = uint(int(uint(_1266) >> uint(2)));
            float _1270 = as_type<float>(_26[int(_1268)]);
            float _1272 = _1156 * _1226;
            float _1274 = precise::min(_1230, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1276 = fma(_998, _1218, _1262);
            int _1278 = _274 << 2;
            int _1280 = _1278 + 1028;
            uint _1282 = uint(int(uint(_1280) >> uint(2)));
            float _1284 = as_type<float>(_26[int(_1282)]);
            float _1286 = fma(_1004, _1218, _1260);
            float _1288 = -_1192;
            float _1290 = exp2(_1288);
            float _1292 = fma(_1010, _1218, _1272);
            int _1294 = _274 << 2;
            int _1296 = _1294 + 1032;
            uint _1298 = uint(int(uint(_1296) >> uint(2)));
            float _1300 = as_type<float>(_26[int(_1298)]);
            float _1302 = -_1048;
            float _1304 = _1302 + _1172;
            float _1306 = -_1204;
            float _1308 = _1306 + _1274;
            float _1310 = -_1054;
            float _1312 = _1310 + _1178;
            int _1314 = _274 << 2;
            int _1316 = _1314 + 1036;
            uint _1318 = uint(int(uint(_1316) >> uint(2)));
            float _1320 = as_type<float>(_26[int(_1318)]);
            float _1322 = -_1060;
            float _1324 = _1322 + _1184;
            float _1326 = _1308 * _1190;
            float _1328 = _1222 + as_type<float>(_303);
            float _1330 = _1312 * _1326;
            float _1332 = _1304 * _1326;
            float _1334 = _1324 * _1326;
            float _1336 = _1328 + _1292;
            float _1338 = -_1290;
            float _1340 = _1338 + 1.0;
            float _1342 = fma(_1048, _1308, _1332);
            float _1344 = fma(_1060, _1308, _1334);
            float _1346 = _1258 + _1276;
            float _1348 = fma(_1054, _1308, _1330);
            float _1350 = precise::min(_1340, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1352 = _1336 + _1344;
            float _1354 = _1346 + _1342;
            float _1356 = _1224 + _1286;
            int _1358 = _274 << 4;
            int _1360 = _1358 + 1280;
            uint _1362 = uint(int(uint(_1360) >> uint(2)));
            _26[int(_1362)] = as_type<uint>(_1258);
            int _1364 = _1358 + 1284;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            _26[int(_1366)] = as_type<uint>(_1224);
            int _1368 = _1358 + 1288;
            uint _1370 = uint(int(uint(_1368) >> uint(2)));
            _26[int(_1370)] = as_type<uint>(_1328);
            int _1372 = _1358 + 1292;
            uint _1374 = uint(int(uint(_1372) >> uint(2)));
            _26[int(_1374)] = as_type<uint>(_1120);
            float _1376 = -_1274;
            float _1378 = _1350 + _1376;
            float _1380 = _1356 + _1348;
            int _1382 = _274 << 4;
            int _1384 = _1382 + 1296;
            uint _1386 = uint(int(uint(_1384) >> uint(2)));
            _26[int(_1386)] = as_type<uint>(_1346);
            int _1388 = _1382 + 1300;
            uint _1390 = uint(int(uint(_1388) >> uint(2)));
            _26[int(_1390)] = as_type<uint>(_1356);
            int _1392 = _1382 + 1304;
            uint _1394 = uint(int(uint(_1392) >> uint(2)));
            _26[int(_1394)] = as_type<uint>(_1336);
            int _1396 = _1382 + 1308;
            uint _1398 = uint(int(uint(_1396) >> uint(2)));
            _26[int(_1398)] = as_type<uint>(_1126);
            float _1400 = -_1100;
            float _1402 = _1400 + _1238;
            float _1404 = _1378 * _1256;
            float _1406 = -_1106;
            float _1408 = _1406 + _1244;
            float _1410 = -_1112;
            float _1412 = _1410 + _1250;
            float _1414 = _1270 + _313;
            float _1416 = _1402 * _1404;
            float _1418 = _1408 * _1404;
            float _1420 = _1412 * _1404;
            float _1422 = _1414 + _1284;
            float _1424 = fma(_1100, _1378, _1416);
            float _1426 = fma(_1106, _1378, _1418);
            float _1428 = fma(_1112, _1378, _1420);
            float _1430 = _1422 + _1300;
            float _1432 = _1424 + _1354;
            float _1434 = _1426 + _1380;
            float _1436 = _1428 + _1352;
            float _1438 = _1430 + _1320;
            int _1440 = _274 << 4;
            int _1442 = _1440 + 1312;
            uint _1444 = uint(int(uint(_1442) >> uint(2)));
            _26[int(_1444)] = as_type<uint>(_1354);
            int _1446 = _1440 + 1316;
            uint _1448 = uint(int(uint(_1446) >> uint(2)));
            _26[int(_1448)] = as_type<uint>(_1380);
            int _1450 = _1440 + 1320;
            uint _1452 = uint(int(uint(_1450) >> uint(2)));
            _26[int(_1452)] = as_type<uint>(_1352);
            int _1454 = _1440 + 1324;
            uint _1456 = uint(int(uint(_1454) >> uint(2)));
            _26[int(_1456)] = as_type<uint>(_1144);
            int _1458 = _274 << 2;
            int _1460 = _1458 + 1024;
            uint _1462 = uint(int(uint(_1460) >> uint(2)));
            _26[int(_1462)] = as_type<uint>(_1414);
            int _1464 = _274 << 2;
            int _1466 = _1464 + 1028;
            uint _1468 = uint(int(uint(_1466) >> uint(2)));
            _26[int(_1468)] = as_type<uint>(_1422);
            int _1470 = _274 << 2;
            int _1472 = _1470 + 1032;
            uint _1474 = uint(int(uint(_1472) >> uint(2)));
            _26[int(_1474)] = as_type<uint>(_1430);
            int _1476 = _274 << 2;
            int _1478 = _1476 + 1036;
            uint _1480 = uint(int(uint(_1478) >> uint(2)));
            _26[int(_1480)] = as_type<uint>(_1438);
            int _1482 = _274 << 4;
            int _1484 = _1482 + 1328;
            uint _1486 = uint(int(uint(_1484) >> uint(2)));
            _26[int(_1486)] = as_type<uint>(_1432);
            int _1488 = _1482 + 1332;
            uint _1490 = uint(int(uint(_1488) >> uint(2)));
            _26[int(_1490)] = as_type<uint>(_1434);
            int _1492 = _1482 + 1336;
            uint _1494 = uint(int(uint(_1492) >> uint(2)));
            _26[int(_1494)] = as_type<uint>(_1436);
            int _1496 = _1482 + 1340;
            uint _1498 = uint(int(uint(_1496) >> uint(2)));
            _26[int(_1498)] = as_type<uint>(_1192);
            _872 = _1422;
            _448 = _1350;
            _450 = _1438;
            _922 = as_type<int>(_1432);
            _944 = as_type<int>(_1434);
            _918 = as_type<int>(_1436);
            _964 = _1192;
        }
        float _1500 = _872;
        float _1502 = _448;
        float _1504 = _450;
        int _1506 = _922;
        int _1508 = _944;
        int _1510 = _918;
        float _1512 = _964;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1514 = _886 << 4;
        int _1516 = _1514 + 1280;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        float _1520 = as_type<float>(_26[int(_1518)]);
        int _1522 = _1514 + 1284;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        float _1526 = as_type<float>(_26[int(_1524)]);
        int _1528 = _1514 + 1288;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        float _1532 = as_type<float>(_26[int(_1530)]);
        int _1534 = _1514 + 1292;
        uint _1536 = uint(int(uint(_1534) >> uint(2)));
        float _1538 = as_type<float>(_26[int(_1536)]);
        float _1540 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _1542 = _424 + _1540;
        float _1544 = 1.0 / _424;
        int _1546 = _886 << 2;
        int _1548 = _1546 + 1024;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        float _1552 = as_type<float>(_26[int(_1550)]);
        float _1554 = _1542 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _1556 = precise::clamp(_1554, 0.0, 1.0);
        float _1558 = abs(_1556);
        float _1560 = log2(_1558);
        float _1562 = _1560 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _1564 = exp2(_1562);
        float _1566 = -_1538;
        float _1568 = exp2(_1566);
        float _1570 = _1564 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _1572 = precise::max(_1568, _280);
        float _1574 = -_1572;
        float _1576 = _1574 + 1.0;
        float _1578 = -_1570;
        float _1580 = _1578 + 1.0;
        float _1582 = 1.0 / _1576;
        bool _1584 = _1580 > _1576;
        bool _1586 = isnan(_1580);
        bool _1588 = _1584 || _1586;
        bool _1590 = isnan(_1576);
        bool _1592 = _1588 || _1590;
        float _1594 = _1580 * _1582;
        bool _1596 = !_1592;
        float _1598 = _1596 ? _1594 : 1.0;
        float _1600 = _1520 * _1598;
        float _1602 = _1526 * _1598;
        float _1604 = _1532 * _1598;
        float _1606 = _1552 * _1544;
        float _1608 = fma(_1576, _1598, _1570);
        float _1610 = precise::clamp(_1608, 0.0, 1.0);
        float _1612 = fma(_1570, (*spvDescriptorSet0.cp_c3)._m0[14].x, _1600);
        float _1614 = fma(_1570, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1602);
        float _1616 = fma(_1570, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1604);
        float _1618 = -_1610;
        float _1620 = _1618 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1612, _1614, _1616, _1620), uint3(int3(_78, _72, int(_299))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1606, _1606, _1606, _1606), uint3(int3(_78, _72, int(_299))));
        int _1622 = int(_299) + 4;
        bool _1624 = uint(_1622) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _283 = uint(_1622);
        _285 = _1500;
        _287 = _1510;
        _289 = _1506;
        _291 = _1508;
        _293 = _1512;
        _295 = _1502;
        _297 = _1504;
        if (_1624)
        {
            _1626 = true;
            if (_1626)
            {
                break;
            }
        }
    } while (true);
    _1626 = false;
}

