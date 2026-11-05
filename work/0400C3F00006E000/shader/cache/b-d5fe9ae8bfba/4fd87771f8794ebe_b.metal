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
    bool _1638 = false;
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
    int _278 = _264 << 2;
    float _280 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _282 = _280 + 1.0;
    float _284 = fma(_274, 3.0, _274);
    uint _287 = as_type<uint>(_144);
    float _289 = 0.0;
    float _291 = 0.0;
    int _293 = 0;
    int _295 = 0;
    int _297 = 0;
    int _299 = 0;
    float _301 = 0.0;
    float _303 = 0.0;
    do
    {
        uint _305 = _287;
        float _307 = _289;
        float _309 = _291;
        int _311 = _293;
        int _313 = _295;
        int _315 = _297;
        int _317 = _299;
        float _319 = _301;
        float _321 = _303;
        float _323 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _325 = log2(_323);
        float _327 = float(_305);
        float _329 = _276 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _331 = int(_305) + 1;
        float _333 = _150 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _335 = float(uint(_331));
        float _337 = _325 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _339 = _327 * _337;
        float _341 = _335 * _337;
        float _343 = _148 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _345 = exp2(_339);
        float _347 = exp2(_341);
        float _349 = _345 + (-1.0);
        float _351 = _349 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _353 = _347 + (-1.0);
        float _355 = _276 * _351;
        float _357 = -_351;
        float _359 = fma(_353, (*spvDescriptorSet0.cp_c3)._m0[8].z, _357);
        float _361 = fma(_355, _343, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _363 = fma(_355, _333, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _365 = _359 * _329;
        float _367 = fma(_148, _365, _361);
        float _369 = fma(_150, _365, _363);
        float _371 = fma(_367, 6.2500002968590706586837768554688e-05, 0.5);
        float _373 = fma(_369, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _2116 = float2(_371, _373);
        float3 _377 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2116, float2(0.0), isnan(_2116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2116, float2(0.0), isnan(_2116)), level(0.0)).xyz;
        float _379 = _377.x;
        float _381 = _377.y;
        float _383 = _377.z;
        float2 _2132 = float2(_371, _373);
        float _385 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2132, float2(0.0), isnan(_2132)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2132, float2(0.0), isnan(_2132)), level(0.0)).x;
        float3 _2141 = float3(_371, _373, float(0));
        float3 _2145 = select(_2141, float3(0.0), isnan(_2141));
        float4 _388 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2145.xy, uint(rint(_2145.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2145.xy, uint(rint(_2145.z)), level(0.0)).xyzw;
        float _390 = _388.x;
        float _392 = _388.y;
        float _394 = _388.z;
        float _396 = _388.w;
        float3 _2160 = float3(_371, _373, float(1));
        float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
        float4 _398 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2162.xy, uint(rint(_2162.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2162.xy, uint(rint(_2162.z)), level(0.0)).xyzw;
        float _400 = _398.x;
        float _402 = _398.y;
        float _404 = _398.z;
        float _406 = _398.w;
        float3 _2177 = float3(_371, _373, float(2));
        float3 _2179 = select(_2177, float3(0.0), isnan(_2177));
        float4 _408 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2179.xy, uint(rint(_2179.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2179.xy, uint(rint(_2179.z)), level(0.0)).xyzw;
        float _410 = _408.x;
        float _412 = _408.y;
        float _414 = _408.z;
        float _416 = _408.w;
        float _418 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _420 = _369 + _418;
        float _422 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _424 = _367 + _422;
        float _426 = _351 + _359;
        float _428 = _420 * _420;
        float _430 = _426 * _329;
        float _432 = _152 * 1.02332699298858642578125;
        float _434 = fma(_424, _424, _428);
        float _436 = _150 * 1.02332699298858642578125;
        float _438 = _148 * 1.02332699298858642578125;
        float _440 = sqrt(_434);
        bool _442 = _440 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _444 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _446 = _440 + _444;
        float _448 = _307;
        float _450 = _446;
        float _452 = _309;
        float _454 = _440;
        float _456 = _319;
        float _458 = _321;
        if (_442)
        {
            float _460 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _448 = _460;
        }
        float _462 = _448;
        if (_442)
        {
            float _464 = _446 * _462;
            _450 = _464;
        }
        float _466 = _450;
        if (_442)
        {
            float _468 = _466 * 0.15915493667125701904296875;
            _452 = _468;
        }
        float _470 = _452;
        float _472 = _152 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _474 = fma(_355, _472, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _476 = _470;
        float _478 = _474;
        if (_442)
        {
            float _480 = _470 * 6.283185482025146484375;
            float _482 = cos(_480);
            _476 = _482;
        }
        float _484 = _476;
        float _486 = _152 * _365;
        float _488 = _474 + _486;
        if (!_442)
        {
            _478 = _488;
        }
        float _490 = _478;
        float _492 = _490;
        if (_442)
        {
            float _494 = _484 + (-1.0);
            _454 = _494;
        }
        float _496 = _454;
        float _498 = _496;
        if (_442)
        {
            float _500 = _496 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _498 = _500;
        }
        float _502 = _498;
        if (_442)
        {
            float _504 = fma(_488, _484, _502);
            _492 = _504;
        }
        float _506 = _492;
        float _508 = -_506;
        float _510 = fma(_488, 2.0, _508);
        float _512 = abs(_486);
        bool _514 = _512 > 0.00999999977648258209228515625;
        float _516 = fma(_381, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _518 = fma(_430, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _520 = precise::clamp(_518, 0.0, 1.0);
        float _522 = fma(_385, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _524 = fma(_272, -0.5, 0.5);
        float _526 = _516 * 100.0;
        float _528 = -_520;
        float _530 = _528 + 1.0;
        float _532 = _516 * 5115.0;
        float _534 = 1.0 / _516;
        float _536 = -_522;
        float _538 = _536 + _510;
        float _540 = _396 * _432;
        float _542 = precise::max(0.0, _538);
        float _544 = _400 * _432;
        float _546 = exp2(_526);
        float _548 = fma(_390, 0.88622701168060302734375, _540);
        float _550 = _402 * _432;
        float _552 = fma(_392, 0.88622701168060302734375, _544);
        float _554 = fma(_404, _436, _548);
        float _556 = fma(_394, 0.88622701168060302734375, _550);
        float _558 = abs(_530);
        float _560 = log2(_558);
        float _562 = fma(_406, _436, _552);
        float _564 = fma(_546, 512.0, -512.0);
        float _566 = _514 ? _486 : 0.00999999977648258209228515625;
        float _568 = _268 + 1.0;
        float _570 = sqrt(_524);
        float _572 = fma(_410, _436, _556);
        float _574 = _516 * _566;
        float _576 = fma(_412, _438, _554);
        float _578 = fma(_414, _438, _562);
        float _580 = 1.0 / _564;
        float _582 = precise::max(_574, -127.0);
        float _584 = 1.0 / _582;
        float _586 = fma(_272, 0.5, 0.5);
        float _588 = _570 * 0.636619746685028076171875;
        float _590 = _532 * _580;
        float _592 = _560 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _594 = exp2(_592);
        float _596 = log2(_590);
        float _598 = fma(_586, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _600 = -_268;
        float _602 = fma(_594, _568, _600);
        float _604 = fma(_586, _598, -0.212114393711090087890625);
        float _606 = fma(_586, _604, 1.570728778839111328125);
        float _608 = fma(_596, _534, 100.0);
        float _610 = -_606;
        float _612 = fma(_588, _610, 1.0);
        float _614 = -_608;
        float _616 = _614 + _542;
        float _618 = fma(_602, 0.5, 0.5);
        float _620 = -_582;
        float _622 = exp2(_620);
        float _624 = _516 * _616;
        float3 _2500 = float3(_371, _373, float(3));
        float3 _2502 = select(_2500, float3(0.0), isnan(_2500));
        float4 _626 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2502.xy, uint(rint(_2502.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2502.xy, uint(rint(_2502.z)), level(0.0)).xyzw;
        float _628 = _626.x;
        float _630 = _626.y;
        float _632 = _626.z;
        float _634 = _626.w;
        float3 _2517 = float3(_371, _373, float(6));
        float3 _2519 = select(_2517, float3(0.0), isnan(_2517));
        float4 _636 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2519.xy, uint(rint(_2519.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2519.xy, uint(rint(_2519.z)), level(0.0)).xyzw;
        float _638 = _636.x;
        float _640 = _636.y;
        float _642 = _636.z;
        float _644 = _636.w;
        float3 _2534 = float3(_371, _373, float(4));
        float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
        float4 _646 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2536.xy, uint(rint(_2536.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2536.xy, uint(rint(_2536.z)), level(0.0)).xyzw;
        float _648 = _646.x;
        float _650 = _646.y;
        float _652 = _646.z;
        float _654 = _646.w;
        float _656 = -_624;
        float _658 = exp2(_656);
        float _660 = -_622;
        float _662 = _660 + 1.0;
        float _664 = _658 * _662;
        float _666 = _664 * _584;
        float3 _2566 = float3(_371, _373, float(7));
        float3 _2568 = select(_2566, float3(0.0), isnan(_2566));
        float4 _668 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2568.xy, uint(rint(_2568.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2568.xy, uint(rint(_2568.z)), level(0.0)).xyzw;
        float _670 = _668.x;
        float _672 = _668.y;
        float _674 = _668.z;
        float _676 = _668.w;
        float3 _2584 = float3(_371, _373, float(5));
        float3 _2586 = select(_2584, float3(0.0), isnan(_2584));
        float4 _678 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2586.xy, uint(rint(_2586.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2586.xy, uint(rint(_2586.z)), level(0.0)).xyzw;
        float _680 = _678.x;
        float _682 = _678.y;
        float _684 = _678.z;
        float _686 = _678.w;
        float2 _2600 = float2(_371, _373);
        float3 _688 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_2600, float2(0.0), isnan(_2600)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_2600, float2(0.0), isnan(_2600)), level(0.0)).xyz;
        float _690 = _688.x;
        float _692 = _688.y;
        float _694 = _688.z;
        float2 _2614 = float2(_612, _618);
        float3 _696 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2614, float2(0.0), isnan(_2614)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2614, float2(0.0), isnan(_2614)), level(0.0)).xyz;
        float _698 = _696.x;
        float _700 = _696.y;
        float _702 = _696.z;
        float _704 = fma(_416, _438, _572);
        float _706 = precise::max(0.0, _576);
        float _708 = _560 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _710 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _712 = precise::max(0.0, _578);
        bool _714 = as_type<int>(_144) != 0;
        float _716 = _706 * _710;
        float _718 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _720 = _383 * 2.0;
        float _722 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _724 = exp2(_708);
        float _726 = _712 * _718;
        float _728 = fma(_383, _383, 1.0);
        float _730 = -_720;
        float _732 = fma(_272, _730, _728);
        float _734 = -_720;
        float _736 = _728 + _734;
        float _738 = abs(_732);
        float _740 = log2(_738);
        float _742 = abs(_736);
        float _744 = log2(_742);
        float _746 = _740 * 1.5;
        float _748 = exp2(_746);
        float _750 = _744 * 1.5;
        float _752 = -_383;
        float _754 = fma(_752, _383, 1.0);
        float _756 = exp2(_750);
        float _758 = _748 * 12.56637096405029296875;
        float _760 = 1.0 / _758;
        float _762 = _756 * 12.56637096405029296875;
        float _764 = 1.0 / _762;
        float _766 = _754 * _760;
        float _768 = _754 * _764;
        float _770 = fma(_379, -0.99447572231292724609375, 1.0);
        float _772 = precise::max(0.0, _704);
        float _774 = log2(_770);
        float _776 = _772 * _722;
        float _778 = _774 * (-0.0199999995529651641845703125);
        float _780 = _365 * _778;
        float _782 = _666 * _780;
        float _784 = 1.0 / _365;
        float _786 = _634 * _432;
        float _788 = _640 * _432;
        float _790 = _648 * _432;
        float _792 = _650 * _432;
        float _794 = fma(_628, 0.88622701168060302734375, _786);
        float _796 = fma(_638, 0.88622701168060302734375, _788);
        float _798 = fma(_630, 0.88622701168060302734375, _790);
        float _800 = fma(_632, 0.88622701168060302734375, _792);
        float _802 = fma(_652, _436, _794);
        float _804 = fma(_642, _436, _796);
        float _806 = fma(_654, _436, _798);
        float _808 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _810 = _430 + _808;
        float _812 = _798;
        float _814 = _800;
        float _816 = _686;
        float _818 = _684;
        if (_714)
        {
            _812 = as_type<float>(_311);
        }
        int _820 = as_type<int>(_812);
        float _822 = fma(_644, _438, _804);
        float _824 = _284 * 0.25;
        float _826 = _810 * _784;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = _822 * 0.31830990314483642578125;
        float _832 = precise::clamp(_830, 0.0, 1.0);
        float _834 = _365 * _824;
        float _836 = _782 * _828;
        float _838 = precise::min(_832, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _840 = _838 * 0.88622701168060302734375;
        float _842 = _672 * _432;
        float _844 = fma(_680, _436, _800);
        float _846 = fma(_682, _438, _802);
        float _848 = fma(_684, _438, _806);
        float _850 = fma(_670, 0.88622701168060302734375, _842);
        float _852 = fma(_686, _438, _844);
        float _854 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].x, _716);
        float _856 = precise::max(0.0, _846);
        float _858 = fma(_674, _436, _850);
        float _860 = precise::max(0.0, _848);
        float _862 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].y, _726);
        float _864 = precise::max(0.0, _852);
        float _866 = fma(_676, _438, _858);
        float _868 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].z, _776);
        float _870 = _824 * _766;
        int _872 = _278 + as_type<int>(_144);
        float _874 = _866 * 0.31830990314483642578125;
        float _876 = precise::clamp(_874, 0.0, 1.0);
        float _878 = _824 * _698;
        float _880 = _824 * _700;
        float _882 = _824;
        int _884 = _820;
        if (_714)
        {
            _814 = as_type<float>(_313);
        }
        int _886 = as_type<int>(_814);
        float _888 = _876 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _890 = precise::clamp(_888, 0.0, 1.0);
        int _892 = _872 << 2;
        int _894 = _892 + 1024;
        uint _896 = uint(int(uint(_894) >> uint(2)));
        _26[int(_896)] = as_type<uint>(_834);
        float _898 = fma(_856, _890, _854);
        float _900 = fma(_860, _890, _862);
        float _902 = fma(_864, _890, _868);
        float _904 = _824 * _702;
        float _906 = _898 * _768;
        float _908 = _900 * _768;
        float _910 = _902 * _768;
        int _912 = _886;
        if (_714)
        {
            _882 = as_type<float>(_315);
        }
        int _914 = as_type<int>(_882);
        float _916 = fma(_870, (*spvDescriptorSet0.cp_c3)._m0[7].x, _906);
        float _918 = fma(_870, (*spvDescriptorSet0.cp_c3)._m0[7].y, _908);
        float _920 = fma(_870, (*spvDescriptorSet0.cp_c3)._m0[7].z, _910);
        float _922 = -_724;
        float _924 = _922 + 1.0;
        float _926 = _690 * _916;
        float _928 = _692 * _918;
        float _930 = _694 * _920;
        float _932 = _924 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _934 = _920;
        int _936 = _914;
        if (_714)
        {
            _934 = as_type<float>(_317);
        }
        int _938 = as_type<int>(_934);
        int _940 = _872 << 4;
        int _942 = _940 + 1280;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        _26[int(_944)] = as_type<uint>(_926);
        int _946 = _940 + 1284;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        _26[int(_948)] = as_type<uint>(_928);
        int _950 = _940 + 1288;
        uint _952 = uint(int(uint(_950) >> uint(2)));
        _26[int(_952)] = as_type<uint>(_930);
        int _954 = _940 + 1292;
        uint _956 = uint(int(uint(_954) >> uint(2)));
        _26[int(_956)] = as_type<uint>(_836);
        int _958 = _872 << 4;
        uint _960 = uint(int(uint(_958) >> uint(2)));
        _26[int(_960)] = as_type<uint>(_878);
        int _962 = _958 + 4;
        uint _964 = uint(int(uint(_962) >> uint(2)));
        _26[int(_964)] = as_type<uint>(_880);
        int _966 = _958 + 8;
        uint _968 = uint(int(uint(_966) >> uint(2)));
        _26[int(_968)] = as_type<uint>(_904);
        int _970 = _958 + 12;
        uint _972 = uint(int(uint(_970) >> uint(2)));
        _26[int(_972)] = as_type<uint>(_932);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _974 = _938;
        if (!_714)
        {
            int _976 = _278 << 4;
            int _978 = _976 + 1280;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            float _982 = as_type<float>(_26[int(_980)]);
            int _984 = _976 + 1284;
            uint _986 = uint(int(uint(_984) >> uint(2)));
            float _988 = as_type<float>(_26[int(_986)]);
            int _990 = _976 + 1288;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            float _994 = as_type<float>(_26[int(_992)]);
            int _996 = _976 + 1292;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            float _1000 = as_type<float>(_26[int(_998)]);
            int _1002 = _278 << 4;
            int _1004 = _1002 + 1296;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            float _1008 = as_type<float>(_26[int(_1006)]);
            int _1010 = _1002 + 1300;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_26[int(_1012)]);
            int _1016 = _1002 + 1304;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_26[int(_1018)]);
            int _1022 = _1002 + 1308;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_26[int(_1024)]);
            int _1028 = _278 << 4;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_26[int(_1030)]);
            int _1034 = _1028 + 4;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_26[int(_1036)]);
            int _1040 = _1028 + 8;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>(_26[int(_1042)]);
            int _1046 = _1028 + 12;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>(_26[int(_1048)]);
            int _1052 = _278 << 4;
            int _1054 = _1052 + 16;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            float _1058 = as_type<float>(_26[int(_1056)]);
            int _1060 = _1052 + 20;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_26[int(_1062)]);
            int _1066 = _1052 + 24;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            float _1070 = as_type<float>(_26[int(_1068)]);
            int _1072 = _1052 + 28;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            float _1076 = as_type<float>(_26[int(_1074)]);
            int _1078 = _278 << 4;
            int _1080 = _1078 + 1312;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            float _1084 = as_type<float>(_26[int(_1082)]);
            int _1086 = _1078 + 1316;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_26[int(_1088)]);
            int _1092 = _1078 + 1320;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            float _1096 = as_type<float>(_26[int(_1094)]);
            int _1098 = _1078 + 1324;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            float _1102 = as_type<float>(_26[int(_1100)]);
            int _1104 = _278 << 4;
            int _1106 = _1104 + 1328;
            uint _1108 = uint(int(uint(_1106) >> uint(2)));
            float _1110 = as_type<float>(_26[int(_1108)]);
            int _1112 = _1104 + 1332;
            uint _1114 = uint(int(uint(_1112) >> uint(2)));
            float _1116 = as_type<float>(_26[int(_1114)]);
            int _1118 = _1104 + 1336;
            uint _1120 = uint(int(uint(_1118) >> uint(2)));
            float _1122 = as_type<float>(_26[int(_1120)]);
            int _1124 = _1104 + 1340;
            uint _1126 = uint(int(uint(_1124) >> uint(2)));
            float _1128 = as_type<float>(_26[int(_1126)]);
            float _1130 = as_type<float>(_313) + _1000;
            float _1132 = -_1130;
            float _1134 = exp2(_1132);
            float _1136 = _1130 + _1026;
            float _1138 = -_982;
            float _1140 = _1138 + _1032;
            float _1142 = -_988;
            float _1144 = _1142 + _1038;
            float _1146 = -_994;
            float _1148 = _1146 + _1044;
            float _1150 = -_1136;
            float _1152 = exp2(_1150);
            float _1154 = -_1014;
            float _1156 = _1154 + _1064;
            float _1158 = -_1020;
            float _1160 = _1158 + _1070;
            float _1162 = -_1008;
            float _1164 = _1162 + _1058;
            float _1166 = _1136 + _1102;
            float _1168 = -_1134;
            float _1170 = _1168 + 1.0;
            float _1172 = -_1166;
            float _1174 = exp2(_1172);
            int _1176 = _278 << 4;
            int _1178 = _1176 + 32;
            uint _1180 = uint(int(uint(_1178) >> uint(2)));
            float _1182 = as_type<float>(_26[int(_1180)]);
            int _1184 = _1176 + 36;
            uint _1186 = uint(int(uint(_1184) >> uint(2)));
            float _1188 = as_type<float>(_26[int(_1186)]);
            int _1190 = _1176 + 40;
            uint _1192 = uint(int(uint(_1190) >> uint(2)));
            float _1194 = as_type<float>(_26[int(_1192)]);
            int _1196 = _1176 + 44;
            uint _1198 = uint(int(uint(_1196) >> uint(2)));
            float _1200 = as_type<float>(_26[int(_1198)]);
            float _1202 = _1166 + _1128;
            float _1204 = precise::min(_1170, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1206 = -_1152;
            float _1208 = _1206 + 1.0;
            float _1210 = -_319;
            float _1212 = _1204 + _1210;
            float _1214 = precise::min(_1208, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1216 = _1212 * _1050;
            float _1218 = -_1174;
            float _1220 = _1218 + 1.0;
            float _1222 = _1144 * _1216;
            float _1224 = _1148 * _1216;
            float _1226 = _1140 * _1216;
            float _1228 = fma(_988, _1212, _1222);
            float _1230 = -_1204;
            float _1232 = _1230 + _1214;
            float _1234 = fma(_982, _1212, _1226);
            float _1236 = fma(_994, _1212, _1224);
            float _1238 = _1228 + as_type<float>(_315);
            float _1240 = _1232 * _1076;
            int _1242 = _278 << 4;
            int _1244 = _1242 + 48;
            uint _1246 = uint(int(uint(_1244) >> uint(2)));
            float _1248 = as_type<float>(_26[int(_1246)]);
            int _1250 = _1242 + 52;
            uint _1252 = uint(int(uint(_1250) >> uint(2)));
            float _1254 = as_type<float>(_26[int(_1252)]);
            int _1256 = _1242 + 56;
            uint _1258 = uint(int(uint(_1256) >> uint(2)));
            float _1260 = as_type<float>(_26[int(_1258)]);
            int _1262 = _1242 + 60;
            uint _1264 = uint(int(uint(_1262) >> uint(2)));
            float _1266 = as_type<float>(_26[int(_1264)]);
            float _1268 = _1234 + as_type<float>(_317);
            float _1270 = _1236 + as_type<float>(_311);
            float _1272 = _1156 * _1240;
            float _1274 = _1160 * _1240;
            int _1276 = _278 << 2;
            int _1278 = _1276 + 1024;
            uint _1280 = uint(int(uint(_1278) >> uint(2)));
            float _1282 = as_type<float>(_26[int(_1280)]);
            float _1284 = _1164 * _1240;
            float _1286 = fma(_1014, _1232, _1272);
            float _1288 = precise::min(_1220, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1290 = _278 << 2;
            int _1292 = _1290 + 1028;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>(_26[int(_1294)]);
            float _1298 = fma(_1008, _1232, _1284);
            float _1300 = fma(_1020, _1232, _1274);
            float _1302 = -_1202;
            float _1304 = exp2(_1302);
            int _1306 = _278 << 2;
            int _1308 = _1306 + 1032;
            uint _1310 = uint(int(uint(_1308) >> uint(2)));
            float _1312 = as_type<float>(_26[int(_1310)]);
            float _1314 = -_1084;
            float _1316 = _1314 + _1182;
            float _1318 = -_1214;
            float _1320 = _1318 + _1288;
            float _1322 = -_1090;
            float _1324 = _1322 + _1188;
            int _1326 = _278 << 2;
            int _1328 = _1326 + 1036;
            uint _1330 = uint(int(uint(_1328) >> uint(2)));
            float _1332 = as_type<float>(_26[int(_1330)]);
            float _1334 = -_1096;
            float _1336 = _1334 + _1194;
            float _1338 = _1320 * _1200;
            float _1340 = _1270 + _1300;
            int _1342 = _278 << 4;
            int _1344 = _1342 + 1280;
            uint _1346 = uint(int(uint(_1344) >> uint(2)));
            _26[int(_1346)] = as_type<uint>(_1268);
            int _1348 = _1342 + 1284;
            uint _1350 = uint(int(uint(_1348) >> uint(2)));
            _26[int(_1350)] = as_type<uint>(_1238);
            int _1352 = _1342 + 1288;
            uint _1354 = uint(int(uint(_1352) >> uint(2)));
            _26[int(_1354)] = as_type<uint>(_1270);
            int _1356 = _1342 + 1292;
            uint _1358 = uint(int(uint(_1356) >> uint(2)));
            _26[int(_1358)] = as_type<uint>(_1130);
            float _1360 = _1324 * _1338;
            float _1362 = _1316 * _1338;
            float _1364 = _1336 * _1338;
            float _1366 = fma(_1090, _1320, _1360);
            float _1368 = -_1304;
            float _1370 = _1368 + 1.0;
            float _1372 = fma(_1084, _1320, _1362);
            float _1374 = fma(_1096, _1320, _1364);
            float _1376 = _1268 + _1298;
            float _1378 = _1238 + _1286;
            float _1380 = precise::min(_1370, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1382 = _1340 + _1374;
            float _1384 = _1376 + _1372;
            float _1386 = _1378 + _1366;
            int _1388 = _278 << 4;
            int _1390 = _1388 + 1296;
            uint _1392 = uint(int(uint(_1390) >> uint(2)));
            _26[int(_1392)] = as_type<uint>(_1376);
            int _1394 = _1388 + 1300;
            uint _1396 = uint(int(uint(_1394) >> uint(2)));
            _26[int(_1396)] = as_type<uint>(_1378);
            int _1398 = _1388 + 1304;
            uint _1400 = uint(int(uint(_1398) >> uint(2)));
            _26[int(_1400)] = as_type<uint>(_1340);
            int _1402 = _1388 + 1308;
            uint _1404 = uint(int(uint(_1402) >> uint(2)));
            _26[int(_1404)] = as_type<uint>(_1136);
            float _1406 = -_1288;
            float _1408 = _1380 + _1406;
            float _1410 = -_1110;
            float _1412 = _1410 + _1248;
            float _1414 = -_1116;
            float _1416 = _1414 + _1254;
            float _1418 = _1408 * _1266;
            float _1420 = -_1122;
            float _1422 = _1420 + _1260;
            int _1424 = _278 << 4;
            int _1426 = _1424 + 1312;
            uint _1428 = uint(int(uint(_1426) >> uint(2)));
            _26[int(_1428)] = as_type<uint>(_1384);
            int _1430 = _1424 + 1316;
            uint _1432 = uint(int(uint(_1430) >> uint(2)));
            _26[int(_1432)] = as_type<uint>(_1386);
            int _1434 = _1424 + 1320;
            uint _1436 = uint(int(uint(_1434) >> uint(2)));
            _26[int(_1436)] = as_type<uint>(_1382);
            int _1438 = _1424 + 1324;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            _26[int(_1440)] = as_type<uint>(_1166);
            float _1442 = _1282 + _321;
            float _1444 = _1412 * _1418;
            float _1446 = _1416 * _1418;
            float _1448 = _1422 * _1418;
            float _1450 = _1442 + _1296;
            float _1452 = fma(_1110, _1408, _1444);
            float _1454 = fma(_1116, _1408, _1446);
            float _1456 = fma(_1122, _1408, _1448);
            float _1458 = _1450 + _1312;
            float _1460 = _1452 + _1384;
            float _1462 = _1454 + _1386;
            float _1464 = _1456 + _1382;
            float _1466 = _1458 + _1332;
            int _1468 = _278 << 2;
            int _1470 = _1468 + 1024;
            uint _1472 = uint(int(uint(_1470) >> uint(2)));
            _26[int(_1472)] = as_type<uint>(_1442);
            int _1474 = _278 << 2;
            int _1476 = _1474 + 1028;
            uint _1478 = uint(int(uint(_1476) >> uint(2)));
            _26[int(_1478)] = as_type<uint>(_1450);
            int _1480 = _278 << 2;
            int _1482 = _1480 + 1032;
            uint _1484 = uint(int(uint(_1482) >> uint(2)));
            _26[int(_1484)] = as_type<uint>(_1458);
            int _1486 = _278 << 2;
            int _1488 = _1486 + 1036;
            uint _1490 = uint(int(uint(_1488) >> uint(2)));
            _26[int(_1490)] = as_type<uint>(_1466);
            int _1492 = _278 << 4;
            int _1494 = _1492 + 1328;
            uint _1496 = uint(int(uint(_1494) >> uint(2)));
            _26[int(_1496)] = as_type<uint>(_1460);
            int _1498 = _1492 + 1332;
            uint _1500 = uint(int(uint(_1498) >> uint(2)));
            _26[int(_1500)] = as_type<uint>(_1462);
            int _1502 = _1492 + 1336;
            uint _1504 = uint(int(uint(_1502) >> uint(2)));
            _26[int(_1504)] = as_type<uint>(_1464);
            int _1506 = _1492 + 1340;
            uint _1508 = uint(int(uint(_1506) >> uint(2)));
            _26[int(_1508)] = as_type<uint>(_1202);
            _816 = _1418;
            _818 = _1422;
            _456 = _1380;
            _458 = _1466;
            _974 = as_type<int>(_1460);
            _936 = as_type<int>(_1462);
            _884 = as_type<int>(_1464);
            _912 = as_type<int>(_1202);
        }
        float _1510 = _816;
        float _1512 = _818;
        float _1514 = _456;
        float _1516 = _458;
        int _1518 = _974;
        int _1520 = _936;
        int _1522 = _884;
        int _1524 = _912;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1526 = _872 << 4;
        int _1528 = _1526 + 1280;
        uint _1530 = uint(int(uint(_1528) >> uint(2)));
        float _1532 = as_type<float>(_26[int(_1530)]);
        int _1534 = _1526 + 1284;
        uint _1536 = uint(int(uint(_1534) >> uint(2)));
        float _1538 = as_type<float>(_26[int(_1536)]);
        int _1540 = _1526 + 1288;
        uint _1542 = uint(int(uint(_1540) >> uint(2)));
        float _1544 = as_type<float>(_26[int(_1542)]);
        int _1546 = _1526 + 1292;
        uint _1548 = uint(int(uint(_1546) >> uint(2)));
        float _1550 = as_type<float>(_26[int(_1548)]);
        float _1552 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _1554 = _430 + _1552;
        float _1556 = 1.0 / _430;
        int _1558 = _872 << 2;
        int _1560 = _1558 + 1024;
        uint _1562 = uint(int(uint(_1560) >> uint(2)));
        float _1564 = as_type<float>(_26[int(_1562)]);
        float _1566 = _1554 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _1568 = precise::clamp(_1566, 0.0, 1.0);
        float _1570 = abs(_1568);
        float _1572 = log2(_1570);
        float _1574 = _1572 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _1576 = exp2(_1574);
        float _1578 = -_1550;
        float _1580 = exp2(_1578);
        float _1582 = _1576 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _1584 = precise::max(_1580, _282);
        float _1586 = -_1584;
        float _1588 = _1586 + 1.0;
        float _1590 = -_1582;
        float _1592 = _1590 + 1.0;
        float _1594 = 1.0 / _1588;
        bool _1596 = _1592 > _1588;
        bool _1598 = isnan(_1592);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan(_1588);
        bool _1604 = _1600 || _1602;
        float _1606 = _1592 * _1594;
        float _1608 = _1564 * _1556;
        bool _1610 = !_1604;
        float _1612 = _1610 ? _1606 : 1.0;
        float _1614 = _1532 * _1612;
        float _1616 = _1538 * _1612;
        float _1618 = _1544 * _1612;
        float _1620 = fma(_1588, _1612, _1582);
        float _1622 = precise::clamp(_1620, 0.0, 1.0);
        float _1624 = fma(_1582, (*spvDescriptorSet0.cp_c3)._m0[14].x, _1614);
        float _1626 = fma(_1582, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1616);
        float _1628 = fma(_1582, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1618);
        float _1630 = -_1622;
        float _1632 = _1630 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1624, _1626, _1628, _1632), uint3(int3(_78, _72, int(_305))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1608, _1608, _1608, _1608), uint3(int3(_78, _72, int(_305))));
        int _1634 = int(_305) + 4;
        bool _1636 = uint(_1634) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _287 = uint(_1634);
        _289 = _1510;
        _291 = _1512;
        _293 = _1522;
        _295 = _1524;
        _297 = _1520;
        _299 = _1518;
        _301 = _1514;
        _303 = _1516;
        if (_1636)
        {
            _1638 = true;
            if (_1638)
            {
                break;
            }
        }
    } while (true);
    _1638 = false;
}

