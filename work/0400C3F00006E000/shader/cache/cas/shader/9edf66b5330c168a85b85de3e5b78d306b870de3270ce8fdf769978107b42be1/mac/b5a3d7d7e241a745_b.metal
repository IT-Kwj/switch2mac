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
    bool _1570 = false;
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
    if (_240)
    {
        return;
    }
    float _258 = _248 + 1.0;
    int _260 = as_type<int>(_63) << 2;
    int _262 = _260 + as_type<int>(_67);
    float _264 = -_150;
    float _266 = fma(_264, (*spvDescriptorSet0.cp_c3)._m0[6].z, _254);
    float _268 = _256 * _232;
    float _270 = sqrt(_258);
    float _272 = -_266;
    float _274 = fma(_272, (*spvDescriptorSet0.cp_c3)._m0[15].x, _266);
    int _276 = _262 << 2;
    uint _279 = as_type<uint>(_144);
    float _281 = 0.0;
    float _283 = 0.0;
    int _285 = 0;
    int _287 = 0;
    int _289 = 0;
    int _291 = 0;
    float _293 = 0.0;
    float _295 = 0.0;
    do
    {
        uint _297 = _279;
        float _299 = _281;
        float _301 = _283;
        int _303 = _285;
        int _305 = _287;
        int _307 = _289;
        int _309 = _291;
        float _311 = _293;
        float _313 = _295;
        float _315 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _317 = log2(_315);
        float _319 = float(_297);
        float _321 = _270 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _323 = int(_297) + 1;
        float _325 = _150 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _327 = float(uint(_323));
        float _329 = _317 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _331 = _319 * _329;
        float _333 = _327 * _329;
        float _335 = _148 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _337 = exp2(_331);
        float _339 = exp2(_333);
        float _341 = _337 + (-1.0);
        float _343 = _341 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _345 = _339 + (-1.0);
        float _347 = _270 * _343;
        float _349 = -_343;
        float _351 = fma(_345, (*spvDescriptorSet0.cp_c3)._m0[8].z, _349);
        float _353 = fma(_347, _335, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _355 = fma(_347, _325, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _357 = _351 * _321;
        float _359 = fma(_148, _357, _353);
        float _361 = fma(_150, _357, _355);
        float _363 = fma(_359, 6.2500002968590706586837768554688e-05, 0.5);
        float _365 = fma(_361, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _2035 = float2(_363, _365);
        float3 _369 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2035, float2(0.0), isnan(_2035)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2035, float2(0.0), isnan(_2035)), level(0.0)).xyz;
        float _371 = _369.x;
        float _373 = _369.y;
        float _375 = _369.z;
        float2 _2051 = float2(_363, _365);
        float _377 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2051, float2(0.0), isnan(_2051)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2051, float2(0.0), isnan(_2051)), level(0.0)).x;
        float3 _2060 = float3(_363, _365, float(0));
        float3 _2064 = select(_2060, float3(0.0), isnan(_2060));
        float4 _380 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2064.xy, uint(rint(_2064.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2064.xy, uint(rint(_2064.z)), level(0.0)).xyzw;
        float _382 = _380.x;
        float _384 = _380.y;
        float _386 = _380.z;
        float _388 = _380.w;
        float3 _2079 = float3(_363, _365, float(1));
        float3 _2081 = select(_2079, float3(0.0), isnan(_2079));
        float4 _390 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2081.xy, uint(rint(_2081.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2081.xy, uint(rint(_2081.z)), level(0.0)).xyzw;
        float _392 = _390.x;
        float _394 = _390.y;
        float _396 = _390.z;
        float _398 = _390.w;
        float _400 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _402 = _361 + _400;
        float _404 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _406 = _359 + _404;
        float _408 = _343 + _351;
        float _410 = _402 * _402;
        float _412 = _408 * _321;
        float _414 = fma(_406, _406, _410);
        float _416 = _152 * 1.02332699298858642578125;
        float _418 = _150 * 1.02332699298858642578125;
        float _420 = fma(_412, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _422 = precise::clamp(_420, 0.0, 1.0);
        float _424 = sqrt(_414);
        float _426 = -_422;
        float _428 = _426 + 1.0;
        float _430 = abs(_428);
        float _432 = log2(_430);
        bool _434 = _424 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _436 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _438 = _424 + _436;
        float _440 = _299;
        float _442 = _438;
        float _444 = _301;
        float _446 = _424;
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
            _470 = _480;
        }
        float _482 = _470;
        float _484 = _482;
        if (_434)
        {
            float _486 = _476 + (-1.0);
            _446 = _486;
        }
        float _488 = _446;
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
        float _508 = fma(_373, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _510 = fma(_377, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _512 = _502 ? _478 : 0.00999999977648258209228515625;
        float _514 = _268 + 1.0;
        float _516 = _508 * 100.0;
        float _518 = _508 * 5115.0;
        float _520 = 1.0 / _508;
        float _522 = -_510;
        float _524 = _522 + _506;
        float _526 = _508 * _512;
        float _528 = _388 * _416;
        float _530 = _392 * _416;
        float _532 = _394 * _416;
        float _534 = precise::max(0.0, _524);
        float _536 = fma(_382, 0.88622701168060302734375, _528);
        float _538 = exp2(_516);
        float _540 = fma(_384, 0.88622701168060302734375, _530);
        float _542 = fma(_274, -0.5, 0.5);
        float _544 = fma(_396, _418, _536);
        float _546 = fma(_386, 0.88622701168060302734375, _532);
        float _548 = sqrt(_542);
        float _550 = fma(_538, 512.0, -512.0);
        float _552 = precise::max(_526, -127.0);
        float _554 = 1.0 / _550;
        float _556 = _548 * 0.636619746685028076171875;
        float _558 = -_552;
        float _560 = exp2(_558);
        float _562 = _518 * _554;
        float _564 = _432 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _566 = exp2(_564);
        float _568 = log2(_562);
        float _570 = -_268;
        float _572 = fma(_566, _514, _570);
        float _574 = fma(_572, 0.5, 0.5);
        float _576 = fma(_568, _520, 100.0);
        float _578 = 1.0 / _552;
        float _580 = -_576;
        float _582 = _580 + _534;
        float _584 = _508 * _582;
        float _586 = fma(_274, 0.5, 0.5);
        float _588 = fma(_586, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _590 = -_584;
        float _592 = exp2(_590);
        float _594 = fma(_586, _588, -0.212114393711090087890625);
        float _596 = fma(_586, _594, 1.570728778839111328125);
        float _598 = -_560;
        float _600 = _598 + 1.0;
        float3 _2387 = float3(_363, _365, float(2));
        float3 _2389 = select(_2387, float3(0.0), isnan(_2387));
        float4 _602 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2389.xy, uint(rint(_2389.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2389.xy, uint(rint(_2389.z)), level(0.0)).xyzw;
        float _604 = _602.x;
        float _606 = _602.y;
        float _608 = _602.z;
        float _610 = _602.w;
        float _612 = -_596;
        float _614 = fma(_556, _612, 1.0);
        float _616 = _592 * _600;
        float _618 = _616 * _578;
        float _620 = fma(_398, _418, _540);
        float3 _2419 = float3(_363, _365, float(3));
        float3 _2421 = select(_2419, float3(0.0), isnan(_2419));
        float4 _622 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2421.xy, uint(rint(_2421.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2421.xy, uint(rint(_2421.z)), level(0.0)).xyzw;
        float _624 = _622.x;
        float _626 = _622.y;
        float _628 = _622.z;
        float _630 = _622.w;
        float3 _2436 = float3(_363, _365, float(6));
        float3 _2438 = select(_2436, float3(0.0), isnan(_2436));
        float4 _632 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2438.xy, uint(rint(_2438.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2438.xy, uint(rint(_2438.z)), level(0.0)).xyzw;
        float _634 = _632.x;
        float _636 = _632.y;
        float _638 = _632.z;
        float _640 = _632.w;
        float3 _2453 = float3(_363, _365, float(4));
        float3 _2455 = select(_2453, float3(0.0), isnan(_2453));
        float4 _642 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2455.xy, uint(rint(_2455.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2455.xy, uint(rint(_2455.z)), level(0.0)).xyzw;
        float _644 = _642.x;
        float _646 = _642.y;
        float _648 = _642.z;
        float _650 = _642.w;
        float3 _2471 = float3(_363, _365, float(7));
        float3 _2473 = select(_2471, float3(0.0), isnan(_2471));
        float4 _652 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2473.xy, uint(rint(_2473.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2473.xy, uint(rint(_2473.z)), level(0.0)).xyzw;
        float _654 = _652.x;
        float _656 = _652.y;
        float _658 = _652.z;
        float _660 = _652.w;
        float3 _2489 = float3(_363, _365, float(5));
        float3 _2491 = select(_2489, float3(0.0), isnan(_2489));
        float4 _662 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2491.xy, uint(rint(_2491.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2491.xy, uint(rint(_2491.z)), level(0.0)).xyzw;
        float _664 = _662.x;
        float _666 = _662.y;
        float _668 = _662.z;
        float _670 = _662.w;
        float2 _2505 = float2(_363, _365);
        float3 _672 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2505, float2(0.0), isnan(_2505)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2505, float2(0.0), isnan(_2505)), level(0.0)).xyz;
        float _674 = _672.x;
        float _676 = _672.y;
        float _678 = _672.z;
        float2 _2519 = float2(_614, _574);
        float3 _680 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2519, float2(0.0), isnan(_2519)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2519, float2(0.0), isnan(_2519)), level(0.0)).xyz;
        float _682 = _680.x;
        float _684 = _680.y;
        float _686 = _680.z;
        float _688 = fma(_375, _375, 1.0);
        float _690 = _375 * 2.0;
        float _692 = _432 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _694 = -_690;
        float _696 = fma(_274, _694, _688);
        float _698 = -_690;
        float _700 = _688 + _698;
        bool _702 = as_type<int>(_144) != 0;
        float _704 = exp2(_692);
        float _706 = abs(_696);
        float _708 = log2(_706);
        float _710 = abs(_700);
        float _712 = log2(_710);
        float _714 = _708 * 1.5;
        float _716 = exp2(_714);
        float _718 = _712 * 1.5;
        float _720 = -_375;
        float _722 = fma(_720, _375, 1.0);
        float _724 = exp2(_718);
        float _726 = _716 * 12.56637096405029296875;
        float _728 = 1.0 / _726;
        float _730 = _724 * 12.56637096405029296875;
        float _732 = 1.0 / _730;
        float _734 = _722 * _728;
        float _736 = _722 * _732;
        float _738 = fma(_371, -0.99447572231292724609375, 1.0);
        float _740 = log2(_738);
        float _742 = _740 * (-0.0199999995529651641845703125);
        float _744 = _357 * _742;
        float _746 = _618 * _744;
        float _748 = _148 * 1.02332699298858642578125;
        float _750 = fma(_604, _418, _546);
        float _752 = fma(_606, _748, _544);
        float _754 = fma(_608, _748, _620);
        float _756 = fma(_610, _748, _750);
        float _758 = precise::max(0.0, _752);
        float _760 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _762 = precise::max(0.0, _754);
        float _764 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _766 = _758 * _760;
        float _768 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _770 = _762 * _764;
        float _772 = precise::max(0.0, _756);
        float _774 = 1.0 / _357;
        float _776 = _636 * _416;
        float _778 = _630 * _416;
        float _780 = _656 * _416;
        float _782 = _644 * _416;
        float _784 = fma(_634, 0.88622701168060302734375, _776);
        float _786 = _646 * _416;
        float _788 = fma(_654, 0.88622701168060302734375, _780);
        float _790 = fma(_624, 0.88622701168060302734375, _778);
        float _792 = fma(_638, _418, _784);
        float _794 = fma(_626, 0.88622701168060302734375, _782);
        float _796 = fma(_628, 0.88622701168060302734375, _786);
        float _798 = fma(_658, _418, _788);
        float _800 = fma(_640, _748, _792);
        float _802 = fma(_648, _418, _790);
        float _804 = fma(_650, _418, _794);
        float _806 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _808 = _412 + _806;
        float _810 = _800 * 0.31830990314483642578125;
        float _812 = precise::clamp(_810, 0.0, 1.0);
        float _814 = fma(_664, _418, _796);
        float _816 = fma(_660, _748, _798);
        float _818 = fma(_666, _748, _802);
        float _820 = fma(_668, _748, _804);
        float _822 = precise::min(_812, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _824 = _808 * _774;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        float _828 = fma(_670, _748, _814);
        float _830 = _816 * 0.31830990314483642578125;
        float _832 = precise::clamp(_830, 0.0, 1.0);
        float _834 = _772 * _768;
        float _836 = _822 * 0.88622701168060302734375;
        float _838 = _746 * _826;
        float _840 = precise::max(0.0, _818);
        float _842 = fma(_836, (*spvDescriptorSet0.cp_c3)._m0[9].x, _766);
        float _844 = precise::max(0.0, _820);
        float _846 = _832 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _848 = precise::clamp(_846, 0.0, 1.0);
        float _850 = fma(_836, (*spvDescriptorSet0.cp_c3)._m0[9].y, _770);
        float _852 = precise::max(0.0, _828);
        float _854 = fma(_836, (*spvDescriptorSet0.cp_c3)._m0[9].z, _834);
        float _856 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
        float _858 = fma(_840, _848, _842);
        float _860 = fma(_844, _848, _850);
        float _862 = fma(_852, _848, _854);
        float _864 = -_704;
        float _866 = _864 + 1.0;
        float _868 = _856 * _734;
        float _870 = _858 * _736;
        float _872 = _860 * _736;
        float _874 = _862 * _736;
        float _876 = _357 * _856;
        float _878 = fma(_868, (*spvDescriptorSet0.cp_c3)._m0[7].x, _870);
        float _880 = fma(_868, (*spvDescriptorSet0.cp_c3)._m0[7].y, _872);
        float _882 = fma(_868, (*spvDescriptorSet0.cp_c3)._m0[7].z, _874);
        float _884 = _856 * _682;
        float _886 = _674 * _878;
        float _888 = _676 * _880;
        float _890 = _856 * _684;
        float _892 = _678 * _882;
        int _894 = _276 + as_type<int>(_144);
        float _896 = _856 * _686;
        float _898 = _866 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _900 = _822;
        float _902 = _882;
        float _904 = _840;
        float _906 = _872;
        float _908 = _670;
        float _910 = _668;
        if (_702)
        {
            _900 = as_type<float>(_303);
        }
        int _912 = as_type<int>(_900);
        int _914 = _894 << 2;
        int _916 = _914 + 1024;
        uint _918 = uint(int(uint(_916) >> uint(2)));
        _26[int(_918)] = as_type<uint>(_876);
        int _920 = _912;
        if (_702)
        {
            _902 = as_type<float>(_305);
        }
        int _922 = as_type<int>(_902);
        int _924 = _922;
        if (_702)
        {
            _904 = as_type<float>(_307);
        }
        int _926 = as_type<int>(_904);
        int _928 = _894 << 4;
        int _930 = _928 + 1280;
        uint _932 = uint(int(uint(_930) >> uint(2)));
        _26[int(_932)] = as_type<uint>(_886);
        int _934 = _928 + 1284;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        _26[int(_936)] = as_type<uint>(_888);
        int _938 = _928 + 1288;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        _26[int(_940)] = as_type<uint>(_892);
        int _942 = _928 + 1292;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        _26[int(_944)] = as_type<uint>(_838);
        int _946 = _926;
        if (_702)
        {
            _906 = as_type<float>(_309);
        }
        int _948 = as_type<int>(_906);
        int _950 = _894 << 4;
        uint _952 = uint(int(uint(_950) >> uint(2)));
        _26[int(_952)] = as_type<uint>(_884);
        int _954 = _950 + 4;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        _26[int(_956)] = as_type<uint>(_890);
        int _958 = _950 + 8;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        _26[int(_960)] = as_type<uint>(_896);
        int _962 = _950 + 12;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        _26[int(_964)] = as_type<uint>(_898);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _966 = _948;
        if (!_702)
        {
            int _968 = _276 << 4;
            int _970 = _968 + 1280;
            uint _972 = uint(int(uint(_970) >> uint(2)));
            float _974 = as_type<float>(_26[int(_972)]);
            int _976 = _968 + 1284;
            uint _978 = uint(int(uint(_976) >> uint(2)));
            float _980 = as_type<float>(_26[int(_978)]);
            int _982 = _968 + 1288;
            uint _984 = uint(int(uint(_982) >> uint(2)));
            float _986 = as_type<float>(_26[int(_984)]);
            int _988 = _968 + 1292;
            uint _990 = uint(int(uint(_988) >> uint(2)));
            float _992 = as_type<float>(_26[int(_990)]);
            int _994 = _276 << 4;
            int _996 = _994 + 1296;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            float _1000 = as_type<float>(_26[int(_998)]);
            int _1002 = _994 + 1300;
            uint _1004 = uint(int(uint(_1002) >> uint(2)));
            float _1006 = as_type<float>(_26[int(_1004)]);
            int _1008 = _994 + 1304;
            uint _1010 = uint(int(uint(_1008) >> uint(2)));
            float _1012 = as_type<float>(_26[int(_1010)]);
            int _1014 = _994 + 1308;
            uint _1016 = uint(int(uint(_1014) >> uint(2)));
            float _1018 = as_type<float>(_26[int(_1016)]);
            int _1020 = _276 << 4;
            uint _1022 = uint(int(uint(_1020) >> uint(2)));
            float _1024 = as_type<float>(_26[int(_1022)]);
            int _1026 = _1020 + 4;
            uint _1028 = uint(int(uint(_1026) >> uint(2)));
            float _1030 = as_type<float>(_26[int(_1028)]);
            int _1032 = _1020 + 8;
            uint _1034 = uint(int(uint(_1032) >> uint(2)));
            float _1036 = as_type<float>(_26[int(_1034)]);
            int _1038 = _1020 + 12;
            uint _1040 = uint(int(uint(_1038) >> uint(2)));
            float _1042 = as_type<float>(_26[int(_1040)]);
            int _1044 = _276 << 4;
            int _1046 = _1044 + 1312;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>(_26[int(_1048)]);
            int _1052 = _1044 + 1316;
            uint _1054 = uint(int(uint(_1052) >> uint(2)));
            float _1056 = as_type<float>(_26[int(_1054)]);
            int _1058 = _1044 + 1320;
            uint _1060 = uint(int(uint(_1058) >> uint(2)));
            float _1062 = as_type<float>(_26[int(_1060)]);
            int _1064 = _1044 + 1324;
            uint _1066 = uint(int(uint(_1064) >> uint(2)));
            float _1068 = as_type<float>(_26[int(_1066)]);
            int _1070 = _276 << 4;
            int _1072 = _1070 + 16;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            float _1076 = as_type<float>(_26[int(_1074)]);
            int _1078 = _1070 + 20;
            uint _1080 = uint(int(uint(_1078) >> uint(2)));
            float _1082 = as_type<float>(_26[int(_1080)]);
            int _1084 = _1070 + 24;
            uint _1086 = uint(int(uint(_1084) >> uint(2)));
            float _1088 = as_type<float>(_26[int(_1086)]);
            int _1090 = _1070 + 28;
            uint _1092 = uint(int(uint(_1090) >> uint(2)));
            float _1094 = as_type<float>(_26[int(_1092)]);
            int _1096 = _276 << 4;
            int _1098 = _1096 + 1328;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            float _1102 = as_type<float>(_26[int(_1100)]);
            int _1104 = _1096 + 1332;
            uint _1106 = uint(int(uint(_1104) >> uint(2)));
            float _1108 = as_type<float>(_26[int(_1106)]);
            int _1110 = _1096 + 1336;
            uint _1112 = uint(int(uint(_1110) >> uint(2)));
            float _1114 = as_type<float>(_26[int(_1112)]);
            int _1116 = _1096 + 1340;
            uint _1118 = uint(int(uint(_1116) >> uint(2)));
            float _1120 = as_type<float>(_26[int(_1118)]);
            float _1122 = as_type<float>(_309) + _992;
            float _1124 = -_1122;
            float _1126 = exp2(_1124);
            float _1128 = _1122 + _1018;
            float _1130 = -_980;
            float _1132 = _1130 + _1030;
            float _1134 = -_986;
            float _1136 = _1134 + _1036;
            float _1138 = -_1128;
            float _1140 = exp2(_1138);
            float _1142 = _1128 + _1068;
            float _1144 = -_1000;
            float _1146 = _1144 + _1076;
            float _1148 = -_1006;
            float _1150 = _1148 + _1082;
            float _1152 = -_1126;
            float _1154 = _1152 + 1.0;
            float _1156 = _1142 + _1120;
            int _1158 = _276 << 4;
            int _1160 = _1158 + 32;
            uint _1162 = uint(int(uint(_1160) >> uint(2)));
            float _1164 = as_type<float>(_26[int(_1162)]);
            int _1166 = _1158 + 36;
            uint _1168 = uint(int(uint(_1166) >> uint(2)));
            float _1170 = as_type<float>(_26[int(_1168)]);
            int _1172 = _1158 + 40;
            uint _1174 = uint(int(uint(_1172) >> uint(2)));
            float _1176 = as_type<float>(_26[int(_1174)]);
            int _1178 = _1158 + 44;
            uint _1180 = uint(int(uint(_1178) >> uint(2)));
            float _1182 = as_type<float>(_26[int(_1180)]);
            float _1184 = precise::min(_1154, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1186 = -_974;
            float _1188 = _1186 + _1024;
            float _1190 = -_1140;
            float _1192 = _1190 + 1.0;
            float _1194 = -_311;
            float _1196 = _1184 + _1194;
            float _1198 = -_1142;
            float _1200 = exp2(_1198);
            float _1202 = precise::min(_1192, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1204 = _1196 * _1042;
            float _1206 = _1188 * _1204;
            float _1208 = _1132 * _1204;
            float _1210 = _1136 * _1204;
            float _1212 = fma(_974, _1196, _1206);
            float _1214 = -_1184;
            float _1216 = _1214 + _1202;
            float _1218 = fma(_986, _1196, _1210);
            float _1220 = fma(_980, _1196, _1208);
            float _1222 = -_1012;
            float _1224 = _1222 + _1088;
            float _1226 = _1216 * _1094;
            float _1228 = -_1200;
            float _1230 = _1228 + 1.0;
            int _1232 = _276 << 4;
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
            float _1258 = _1146 * _1226;
            float _1260 = _1150 * _1226;
            int _1262 = _276 << 2;
            int _1264 = _1262 + 1024;
            uint _1266 = uint(int(uint(_1264) >> uint(2)));
            float _1268 = as_type<float>(_26[int(_1266)]);
            float _1270 = precise::min(_1230, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1272 = fma(_1000, _1216, _1258);
            float _1274 = fma(_1006, _1216, _1260);
            int _1276 = _276 << 2;
            int _1278 = _1276 + 1028;
            uint _1280 = uint(int(uint(_1278) >> uint(2)));
            float _1282 = as_type<float>(_26[int(_1280)]);
            float _1284 = -_1156;
            float _1286 = exp2(_1284);
            float _1288 = -_1202;
            float _1290 = _1288 + _1270;
            float _1292 = _1224 * _1226;
            int _1294 = _276 << 2;
            int _1296 = _1294 + 1032;
            uint _1298 = uint(int(uint(_1296) >> uint(2)));
            float _1300 = as_type<float>(_26[int(_1298)]);
            float _1302 = -_1050;
            float _1304 = _1302 + _1164;
            float _1306 = _1290 * _1182;
            float _1308 = -_1056;
            float _1310 = _1308 + _1170;
            int _1312 = _276 << 2;
            int _1314 = _1312 + 1036;
            uint _1316 = uint(int(uint(_1314) >> uint(2)));
            float _1318 = as_type<float>(_26[int(_1316)]);
            float _1320 = -_1062;
            float _1322 = _1320 + _1176;
            float _1324 = _1304 * _1306;
            float _1326 = _1310 * _1306;
            float _1328 = fma(_1012, _1216, _1292);
            float _1330 = _1212 + as_type<float>(_303);
            float _1332 = _1322 * _1306;
            float _1334 = _1220 + as_type<float>(_305);
            float _1336 = fma(_1056, _1290, _1326);
            float _1338 = -_1286;
            float _1340 = _1338 + 1.0;
            float _1342 = fma(_1062, _1290, _1332);
            float _1344 = _1218 + as_type<float>(_307);
            float _1346 = _1334 + _1274;
            float _1348 = fma(_1050, _1290, _1324);
            float _1350 = precise::min(_1340, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1352 = _1330 + _1272;
            float _1354 = _1344 + _1328;
            float _1356 = _1346 + _1336;
            int _1358 = _276 << 4;
            int _1360 = _1358 + 1280;
            uint _1362 = uint(int(uint(_1360) >> uint(2)));
            _26[int(_1362)] = as_type<uint>(_1330);
            int _1364 = _1358 + 1284;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            _26[int(_1366)] = as_type<uint>(_1334);
            int _1368 = _1358 + 1288;
            uint _1370 = uint(int(uint(_1368) >> uint(2)));
            _26[int(_1370)] = as_type<uint>(_1344);
            int _1372 = _1358 + 1292;
            uint _1374 = uint(int(uint(_1372) >> uint(2)));
            _26[int(_1374)] = as_type<uint>(_1122);
            float _1376 = -_1270;
            float _1378 = _1350 + _1376;
            float _1380 = _1352 + _1348;
            float _1382 = _1354 + _1342;
            int _1384 = _276 << 4;
            int _1386 = _1384 + 1296;
            uint _1388 = uint(int(uint(_1386) >> uint(2)));
            _26[int(_1388)] = as_type<uint>(_1352);
            int _1390 = _1384 + 1300;
            uint _1392 = uint(int(uint(_1390) >> uint(2)));
            _26[int(_1392)] = as_type<uint>(_1346);
            int _1394 = _1384 + 1304;
            uint _1396 = uint(int(uint(_1394) >> uint(2)));
            _26[int(_1396)] = as_type<uint>(_1354);
            int _1398 = _1384 + 1308;
            uint _1400 = uint(int(uint(_1398) >> uint(2)));
            _26[int(_1400)] = as_type<uint>(_1128);
            float _1402 = -_1102;
            float _1404 = _1402 + _1238;
            float _1406 = _1378 * _1256;
            float _1408 = -_1108;
            float _1410 = _1408 + _1244;
            float _1412 = -_1114;
            float _1414 = _1412 + _1250;
            float _1416 = _1268 + _313;
            float _1418 = _1404 * _1406;
            float _1420 = _1410 * _1406;
            float _1422 = _1414 * _1406;
            float _1424 = _1416 + _1282;
            float _1426 = fma(_1102, _1378, _1418);
            float _1428 = fma(_1108, _1378, _1420);
            float _1430 = fma(_1114, _1378, _1422);
            float _1432 = _1424 + _1300;
            float _1434 = _1426 + _1380;
            float _1436 = _1428 + _1356;
            float _1438 = _1430 + _1382;
            float _1440 = _1432 + _1318;
            int _1442 = _276 << 4;
            int _1444 = _1442 + 1312;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            _26[int(_1446)] = as_type<uint>(_1380);
            int _1448 = _1442 + 1316;
            uint _1450 = uint(int(uint(_1448) >> uint(2)));
            _26[int(_1450)] = as_type<uint>(_1356);
            int _1452 = _1442 + 1320;
            uint _1454 = uint(int(uint(_1452) >> uint(2)));
            _26[int(_1454)] = as_type<uint>(_1382);
            int _1456 = _1442 + 1324;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            _26[int(_1458)] = as_type<uint>(_1142);
            int _1460 = _276 << 2;
            int _1462 = _1460 + 1024;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            _26[int(_1464)] = as_type<uint>(_1416);
            int _1466 = _276 << 2;
            int _1468 = _1466 + 1028;
            uint _1470 = uint(int(uint(_1468) >> uint(2)));
            _26[int(_1470)] = as_type<uint>(_1424);
            int _1472 = _276 << 2;
            int _1474 = _1472 + 1032;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            _26[int(_1476)] = as_type<uint>(_1432);
            int _1478 = _276 << 2;
            int _1480 = _1478 + 1036;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            _26[int(_1482)] = as_type<uint>(_1440);
            int _1484 = _276 << 4;
            int _1486 = _1484 + 1328;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            _26[int(_1488)] = as_type<uint>(_1434);
            int _1490 = _1484 + 1332;
            uint _1492 = uint(int(uint(_1490) >> uint(2)));
            _26[int(_1492)] = as_type<uint>(_1436);
            int _1494 = _1484 + 1336;
            uint _1496 = uint(int(uint(_1494) >> uint(2)));
            _26[int(_1496)] = as_type<uint>(_1438);
            int _1498 = _1484 + 1340;
            uint _1500 = uint(int(uint(_1498) >> uint(2)));
            _26[int(_1500)] = as_type<uint>(_1156);
            _908 = _1410;
            _910 = _1404;
            _448 = _1350;
            _450 = _1440;
            _920 = as_type<int>(_1434);
            _924 = as_type<int>(_1436);
            _946 = as_type<int>(_1438);
            _966 = as_type<int>(_1156);
        }
        float _1502 = _908;
        float _1504 = _910;
        float _1506 = _448;
        float _1508 = _450;
        int _1510 = _920;
        int _1512 = _924;
        int _1514 = _946;
        int _1516 = _966;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1518 = _894 << 4;
        int _1520 = _1518 + 1280;
        uint _1522 = uint(int(uint(_1520) >> uint(2)));
        float _1524 = as_type<float>(_26[int(_1522)]);
        int _1526 = _1518 + 1284;
        uint _1528 = uint(int(uint(_1526) >> uint(2)));
        float _1530 = as_type<float>(_26[int(_1528)]);
        int _1532 = _1518 + 1288;
        uint _1534 = uint(int(uint(_1532) >> uint(2)));
        float _1536 = as_type<float>(_26[int(_1534)]);
        int _1538 = _1518 + 1292;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        float _1542 = as_type<float>(_26[int(_1540)]);
        float _1544 = 1.0 / _412;
        int _1546 = _894 << 2;
        int _1548 = _1546 + 1024;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        float _1552 = as_type<float>(_26[int(_1550)]);
        float _1554 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
        float _1556 = _1554 + 1.0;
        float _1558 = -_1542;
        float _1560 = exp2(_1558);
        float _1562 = _1552 * _1544;
        float _1564 = precise::max(_1560, _1556);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1524, _1530, _1536, _1564), uint3(int3(_78, _72, int(_297))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1562, _1562, _1562, _1562), uint3(int3(_78, _72, int(_297))));
        int _1566 = int(_297) + 4;
        bool _1568 = uint(_1566) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _279 = uint(_1566);
        _281 = _1502;
        _283 = _1504;
        _285 = _1510;
        _287 = _1512;
        _289 = _1514;
        _291 = _1516;
        _293 = _1506;
        _295 = _1508;
        if (_1568)
        {
            _1570 = true;
            if (_1570)
            {
                break;
            }
        }
    } while (true);
    _1570 = false;
}

