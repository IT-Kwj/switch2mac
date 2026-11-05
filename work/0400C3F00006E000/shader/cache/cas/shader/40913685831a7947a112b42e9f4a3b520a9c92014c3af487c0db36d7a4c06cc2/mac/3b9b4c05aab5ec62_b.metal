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
    bool _1566 = false;
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
    float _274 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
    float _276 = sqrt(_266);
    float _278 = fma(_274, 3.0, _274);
    int _280 = _264 << 2;
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
        float2 _2038 = float2(_363, _365);
        float3 _369 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2038, float2(0.0), isnan(_2038)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2038, float2(0.0), isnan(_2038)), level(0.0)).xyz;
        float _371 = _369.x;
        float _373 = _369.y;
        float _375 = _369.z;
        float2 _2054 = float2(_363, _365);
        float _377 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2054, float2(0.0), isnan(_2054)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2054, float2(0.0), isnan(_2054)), level(0.0)).x;
        float3 _2063 = float3(_363, _365, float(0));
        float3 _2067 = select(_2063, float3(0.0), isnan(_2063));
        float4 _380 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2067.xy, uint(rint(_2067.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2067.xy, uint(rint(_2067.z)), level(0.0)).xyzw;
        float _382 = _380.x;
        float _384 = _380.y;
        float _386 = _380.z;
        float _388 = _380.w;
        float3 _2082 = float3(_363, _365, float(1));
        float3 _2084 = select(_2082, float3(0.0), isnan(_2082));
        float4 _390 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2084.xy, uint(rint(_2084.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2084.xy, uint(rint(_2084.z)), level(0.0)).xyzw;
        float _392 = _390.x;
        float _394 = _390.y;
        float _396 = _390.z;
        float _398 = _390.w;
        float3 _2099 = float3(_363, _365, float(2));
        float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
        float4 _400 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2101.xy, uint(rint(_2101.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2101.xy, uint(rint(_2101.z)), level(0.0)).xyzw;
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
        float _422 = _418 * _321;
        float _424 = _152 * 1.02332699298858642578125;
        float _426 = fma(_416, _416, _420);
        float _428 = _150 * 1.02332699298858642578125;
        float _430 = _148 * 1.02332699298858642578125;
        float _432 = sqrt(_426);
        bool _434 = _432 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _436 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _438 = _432 + _436;
        float _440 = _301;
        float _442 = _438;
        float _444 = _432;
        float _446 = _311;
        float _448 = _313;
        if (_434)
        {
            float _450 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _440 = _450;
        }
        float _452 = _440;
        float _454 = _452;
        if (_434)
        {
            float _456 = _438 * _452;
            _442 = _456;
        }
        float _458 = _442;
        if (_434)
        {
            float _460 = _458 * 0.15915493667125701904296875;
            _454 = _460;
        }
        float _462 = _454;
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
            _444 = _480;
        }
        float _482 = _444;
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
        float _512 = _388 * _424;
        float _514 = _510 * 100.0;
        float _516 = 1.0 / _510;
        float _518 = fma(_422, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
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
        float _550 = precise::max(0.0, _546);
        float _552 = precise::max(_548, -127.0);
        float _554 = _268 + 1.0;
        float _556 = sqrt(_540);
        float _558 = _528 * _542;
        float _560 = _534 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _562 = -_552;
        float _564 = exp2(_562);
        float _566 = log2(_558);
        float _568 = _392 * _424;
        float _570 = _394 * _424;
        float _572 = fma(_396, _428, _522);
        float _574 = _556 * 0.636619746685028076171875;
        float _576 = fma(_384, 0.88622701168060302734375, _568);
        float _578 = fma(_386, 0.88622701168060302734375, _570);
        float _580 = exp2(_560);
        float _582 = fma(_398, _428, _576);
        float _584 = -_564;
        float _586 = _584 + 1.0;
        float _588 = fma(_566, _516, 100.0);
        float _590 = fma(_402, _428, _578);
        float _592 = 1.0 / _552;
        float _594 = -_588;
        float _596 = _594 + _550;
        float _598 = fma(_404, _430, _572);
        float _600 = -_268;
        float _602 = fma(_580, _554, _600);
        float _604 = _510 * _596;
        float _606 = fma(_602, 0.5, 0.5);
        float _608 = fma(_272, 0.5, 0.5);
        float _610 = -_604;
        float _612 = exp2(_610);
        float _614 = fma(_608, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _616 = fma(_608, _614, -0.212114393711090087890625);
        float3 _2417 = float3(_363, _365, float(3));
        float3 _2419 = select(_2417, float3(0.0), isnan(_2417));
        float4 _618 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2419.xy, uint(rint(_2419.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2419.xy, uint(rint(_2419.z)), level(0.0)).xyzw;
        float _620 = _618.x;
        float _622 = _618.y;
        float _624 = _618.z;
        float _626 = _618.w;
        float3 _2434 = float3(_363, _365, float(6));
        float3 _2436 = select(_2434, float3(0.0), isnan(_2434));
        float4 _628 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2436.xy, uint(rint(_2436.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2436.xy, uint(rint(_2436.z)), level(0.0)).xyzw;
        float _630 = _628.x;
        float _632 = _628.y;
        float _634 = _628.z;
        float _636 = _628.w;
        float _638 = fma(_608, _616, 1.570728778839111328125);
        float _640 = -_638;
        float _642 = fma(_574, _640, 1.0);
        float _644 = _612 * _586;
        float3 _2463 = float3(_363, _365, float(4));
        float3 _2465 = select(_2463, float3(0.0), isnan(_2463));
        float4 _646 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2465.xy, uint(rint(_2465.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2465.xy, uint(rint(_2465.z)), level(0.0)).xyzw;
        float _648 = _646.x;
        float _650 = _646.y;
        float _652 = _646.z;
        float _654 = _646.w;
        float _656 = _644 * _592;
        float3 _2484 = float3(_363, _365, float(7));
        float3 _2486 = select(_2484, float3(0.0), isnan(_2484));
        float4 _658 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2486.xy, uint(rint(_2486.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2486.xy, uint(rint(_2486.z)), level(0.0)).xyzw;
        float _660 = _658.x;
        float _662 = _658.y;
        float _664 = _658.z;
        float _666 = _658.w;
        float3 _2502 = float3(_363, _365, float(5));
        float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
        float4 _668 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2504.xy, uint(rint(_2504.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2504.xy, uint(rint(_2504.z)), level(0.0)).xyzw;
        float _670 = _668.x;
        float _672 = _668.y;
        float _674 = _668.z;
        float _676 = _668.w;
        float2 _2518 = float2(_363, _365);
        float3 _678 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2518, float2(0.0), isnan(_2518)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2518, float2(0.0), isnan(_2518)), level(0.0)).xyz;
        float _680 = _678.x;
        float _682 = _678.y;
        float _684 = _678.z;
        float2 _2532 = float2(_642, _606);
        float3 _686 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2532, float2(0.0), isnan(_2532)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2532, float2(0.0), isnan(_2532)), level(0.0)).xyz;
        float _688 = _686.x;
        float _690 = _686.y;
        float _692 = _686.z;
        float _694 = fma(_375, _375, 1.0);
        float _696 = _375 * 2.0;
        float _698 = fma(_406, _430, _582);
        float _700 = fma(_408, _430, _590);
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
        float _760 = _656 * _758;
        float _762 = precise::max(0.0, _598);
        float _764 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _766 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _768 = _762 * _764;
        float _770 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _772 = _706 * _766;
        float _774 = _704 * _770;
        float _776 = 1.0 / _357;
        float _778 = _626 * _424;
        float _780 = _632 * _424;
        float _782 = fma(_620, 0.88622701168060302734375, _778);
        float _784 = fma(_630, 0.88622701168060302734375, _780);
        float _786 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _788 = _422 + _786;
        float _790 = fma(_634, _428, _784);
        float _792 = _648 * _424;
        float _794 = _650 * _424;
        float _796 = fma(_652, _428, _782);
        float _798 = fma(_636, _430, _790);
        float _800 = fma(_622, 0.88622701168060302734375, _792);
        float _802 = _662 * _424;
        float _804 = fma(_624, 0.88622701168060302734375, _794);
        float _806 = _798 * 0.31830990314483642578125;
        float _808 = precise::clamp(_806, 0.0, 1.0);
        float _810 = fma(_654, _428, _800);
        float _812 = fma(_660, 0.88622701168060302734375, _802);
        float _814 = fma(_670, _428, _804);
        float _816 = fma(_672, _430, _796);
        float _818 = precise::min(_808, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _820 = fma(_664, _428, _812);
        float _822 = fma(_674, _430, _810);
        float _824 = fma(_676, _430, _814);
        float _826 = precise::max(0.0, _816);
        float _828 = fma(_666, _430, _820);
        float _830 = _818 * 0.88622701168060302734375;
        float _832 = precise::max(0.0, _822);
        float _834 = _788 * _776;
        float _836 = precise::clamp(_834, 0.0, 1.0);
        float _838 = _828 * 0.31830990314483642578125;
        float _840 = precise::clamp(_838, 0.0, 1.0);
        float _842 = fma(_830, (*spvDescriptorSet0.cp_c3)._m0[9].x, _768);
        float _844 = fma(_830, (*spvDescriptorSet0.cp_c3)._m0[9].y, _774);
        float _846 = precise::max(0.0, _824);
        float _848 = _840 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _850 = precise::clamp(_848, 0.0, 1.0);
        float _852 = fma(_830, (*spvDescriptorSet0.cp_c3)._m0[9].z, _772);
        float _854 = _278 * 0.25;
        float _856 = _760 * _836;
        float _858 = fma(_826, _850, _842);
        float _860 = fma(_832, _850, _844);
        float _862 = fma(_846, _850, _852);
        float _864 = _854 * _748;
        float _866 = _858 * _750;
        float _868 = _860 * _750;
        float _870 = _862 * _750;
        int _872 = _280 + as_type<int>(_144);
        float _874 = fma(_864, (*spvDescriptorSet0.cp_c3)._m0[7].x, _866);
        float _876 = fma(_864, (*spvDescriptorSet0.cp_c3)._m0[7].y, _868);
        float _878 = fma(_864, (*spvDescriptorSet0.cp_c3)._m0[7].z, _870);
        float _880 = -_716;
        float _882 = _880 + 1.0;
        float _884 = _680 * _874;
        float _886 = _682 * _876;
        float _888 = _684 * _878;
        float _890 = _357 * _854;
        float _892 = _854 * _688;
        float _894 = _854 * _690;
        float _896 = _854 * _692;
        float _898 = _882 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        int _900 = _872 << 2;
        int _902 = _900 + 1024;
        uint _904 = uint(int(uint(_902) >> uint(2)));
        _26[int(_904)] = as_type<uint>(_890);
        float _906 = _878;
        float _908 = _854;
        float _910 = _800;
        float _912 = _804;
        float _914 = _674;
        if (_718)
        {
            _906 = as_type<float>(_303);
        }
        int _916 = as_type<int>(_906);
        int _918 = _916;
        if (_718)
        {
            _908 = as_type<float>(_305);
        }
        int _920 = as_type<int>(_908);
        int _922 = _872 << 4;
        int _924 = _922 + 1280;
        uint _926 = uint(int(uint(_924) >> uint(2)));
        _26[int(_926)] = as_type<uint>(_884);
        int _928 = _922 + 1284;
        uint _930 = uint(int(uint(_928) >> uint(2)));
        _26[int(_930)] = as_type<uint>(_886);
        int _932 = _922 + 1288;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        _26[int(_934)] = as_type<uint>(_888);
        int _936 = _922 + 1292;
        uint _938 = uint(int(uint(_936) >> uint(2)));
        _26[int(_938)] = as_type<uint>(_856);
        int _940 = _920;
        if (_718)
        {
            _910 = as_type<float>(_307);
        }
        int _942 = as_type<int>(_910);
        int _944 = _942;
        if (_718)
        {
            _912 = _309;
        }
        float _946 = _912;
        int _948 = _872 << 4;
        uint _950 = uint(int(uint(_948) >> uint(2)));
        _26[int(_950)] = as_type<uint>(_892);
        int _952 = _948 + 4;
        uint _954 = uint(int(uint(_952) >> uint(2)));
        _26[int(_954)] = as_type<uint>(_894);
        int _956 = _948 + 8;
        uint _958 = uint(int(uint(_956) >> uint(2)));
        _26[int(_958)] = as_type<uint>(_896);
        int _960 = _948 + 12;
        uint _962 = uint(int(uint(_960) >> uint(2)));
        _26[int(_962)] = as_type<uint>(_898);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        float _964 = _946;
        if (!_718)
        {
            int _966 = _280 << 4;
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
            int _992 = _280 << 4;
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
            int _1018 = _280 << 4;
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
            int _1042 = _280 << 4;
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
            int _1068 = _280 << 4;
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
            int _1094 = _280 << 4;
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
            int _1166 = _280 << 4;
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
            float _1224 = _1214 + as_type<float>(_305);
            float _1226 = _1218 * _1092;
            float _1228 = -_1164;
            float _1230 = _1228 + 1.0;
            int _1232 = _280 << 4;
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
            float _1258 = _1220 + as_type<float>(_303);
            float _1260 = _1148 * _1226;
            float _1262 = _1152 * _1226;
            int _1264 = _280 << 2;
            int _1266 = _1264 + 1024;
            uint _1268 = uint(int(uint(_1266) >> uint(2)));
            float _1270 = as_type<float>(_26[int(_1268)]);
            float _1272 = _1156 * _1226;
            float _1274 = precise::min(_1230, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1276 = fma(_998, _1218, _1262);
            int _1278 = _280 << 2;
            int _1280 = _1278 + 1028;
            uint _1282 = uint(int(uint(_1280) >> uint(2)));
            float _1284 = as_type<float>(_26[int(_1282)]);
            float _1286 = fma(_1004, _1218, _1260);
            float _1288 = -_1192;
            float _1290 = exp2(_1288);
            float _1292 = fma(_1010, _1218, _1272);
            int _1294 = _280 << 2;
            int _1296 = _1294 + 1032;
            uint _1298 = uint(int(uint(_1296) >> uint(2)));
            float _1300 = as_type<float>(_26[int(_1298)]);
            float _1302 = -_1048;
            float _1304 = _1302 + _1172;
            float _1306 = -_1204;
            float _1308 = _1306 + _1274;
            float _1310 = -_1054;
            float _1312 = _1310 + _1178;
            int _1314 = _280 << 2;
            int _1316 = _1314 + 1036;
            uint _1318 = uint(int(uint(_1316) >> uint(2)));
            float _1320 = as_type<float>(_26[int(_1318)]);
            float _1322 = -_1060;
            float _1324 = _1322 + _1184;
            float _1326 = _1308 * _1190;
            float _1328 = _1222 + as_type<float>(_307);
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
            int _1358 = _280 << 4;
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
            int _1382 = _280 << 4;
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
            int _1440 = _280 << 4;
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
            int _1458 = _280 << 2;
            int _1460 = _1458 + 1024;
            uint _1462 = uint(int(uint(_1460) >> uint(2)));
            _26[int(_1462)] = as_type<uint>(_1414);
            int _1464 = _280 << 2;
            int _1466 = _1464 + 1028;
            uint _1468 = uint(int(uint(_1466) >> uint(2)));
            _26[int(_1468)] = as_type<uint>(_1422);
            int _1470 = _280 << 2;
            int _1472 = _1470 + 1032;
            uint _1474 = uint(int(uint(_1472) >> uint(2)));
            _26[int(_1474)] = as_type<uint>(_1430);
            int _1476 = _280 << 2;
            int _1478 = _1476 + 1036;
            uint _1480 = uint(int(uint(_1478) >> uint(2)));
            _26[int(_1480)] = as_type<uint>(_1438);
            int _1482 = _280 << 4;
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
            _914 = _1412;
            _446 = _1350;
            _448 = _1438;
            _918 = as_type<int>(_1432);
            _940 = as_type<int>(_1434);
            _944 = as_type<int>(_1436);
            _964 = _1192;
        }
        float _1500 = _914;
        float _1502 = _446;
        float _1504 = _448;
        int _1506 = _918;
        int _1508 = _940;
        int _1510 = _944;
        float _1512 = _964;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1514 = _872 << 4;
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
        float _1540 = 1.0 / _422;
        int _1542 = _872 << 2;
        int _1544 = _1542 + 1024;
        uint _1546 = uint(int(uint(_1544) >> uint(2)));
        float _1548 = as_type<float>(_26[int(_1546)]);
        float _1550 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
        float _1552 = _1550 + 1.0;
        float _1554 = -_1538;
        float _1556 = exp2(_1554);
        float _1558 = _1548 * _1540;
        float _1560 = precise::max(_1556, _1552);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1520, _1526, _1532, _1560), uint3(int3(_78, _72, int(_299))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1558, _1558, _1558, _1558), uint3(int3(_78, _72, int(_299))));
        int _1562 = int(_299) + 4;
        bool _1564 = uint(_1562) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _283 = uint(_1562);
        _285 = _1500;
        _287 = _1506;
        _289 = _1508;
        _291 = _1510;
        _293 = _1512;
        _295 = _1502;
        _297 = _1504;
        if (_1564)
        {
            _1566 = true;
            if (_1566)
            {
                break;
            }
        }
    } while (true);
    _1566 = false;
}

