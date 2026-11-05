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
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> cp_t_tcb_12 [[id(4)]];
    sampler cp_t_tcb_12Smplr [[id(5)]];
    texture2d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> cp_t_tcb_14 [[id(8)]];
    sampler cp_t_tcb_14Smplr [[id(9)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    sampler cp_t_tcb_12Smplr_w [[id(13)]];
    sampler cp_t_tcb_CSmplr_w [[id(14)]];
    sampler cp_t_tcb_14Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _1616 = false;
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    float _63 = as_type<float>(gl_WorkGroupID.x);
    float _65 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_59) << 2;
    int _70 = _68 + as_type<int>(_61);
    float _72 = float(uint(_70));
    int _74 = as_type<int>(_63) << 2;
    int _76 = _74 + as_type<int>(_65);
    float _78 = _72 + 0.5;
    float _80 = float(uint(_76));
    float _82 = -_78;
    float _84 = fma(_82, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _86 = _80 + 0.5;
    float _88 = fma(_84, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _90 = fma(_86, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _92 = _88 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _94 = _88 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _96 = fma(_90, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _98 = _88 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _100 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[1].x, _92);
    float _102 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[0].x, _98);
    float _104 = fma(_96, (*spvDescriptorSet0.cp_c3)._m0[2].x, _94);
    float _106 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _108 = _100 + _106;
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _112 = _102 + _110;
    float _114 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _116 = _104 + _114;
    float _118 = _108 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _120 = _112 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _122 = _116 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _124 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _126 = _118 + _124;
    float _128 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _130 = _120 + _128;
    float _132 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _134 = _122 + _132;
    float _136 = _126 * _126;
    float _138 = fma(_130, _130, _136);
    float _140 = fma(_134, _134, _138);
    float _142 = as_type<float>(gl_LocalInvocationID.z);
    float _144 = rsqrt(_140);
    float _146 = _130 * _144;
    float _148 = _134 * _144;
    float _150 = _126 * _144;
    float _152 = _146 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _154 = _148 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _156 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _158 = _152 * _152;
    float _160 = _154 * _154;
    float _162 = precise::max(0.0, _156);
    float _164 = _158 + _160;
    float _166 = sqrt(_164);
    float _168 = -_150;
    float _170 = -_162;
    float _172 = fma(_168, (*spvDescriptorSet0.cp_c3)._m0[8].w, _170);
    bool _176 = _166 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _178 = _144;
    float _180 = _172;
    float _182 = _158;
    if (!_176)
    {
        _178 = _160;
    }
    float _184 = _178;
    bool _186 = !_176;
    float _188 = _184;
    if (!_186)
    {
        float _190 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _192 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _194 = _166 + _192;
        float _196 = rsqrt(_164);
        float _198 = _194 * _190;
        float _200 = _198 * 0.15915493667125701904296875;
        float _202 = _172 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _204 = _200 * 6.283185482025146484375;
        float _206 = sin(_204);
        float _208 = _200 * 6.283185482025146484375;
        float _210 = cos(_208);
        float _212 = fma(_206, _202, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _214 = _196 * _212;
        float _216 = _210 + (-1.0);
        float _218 = _152 * _214;
        float _220 = _216 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _222 = _154 * _214;
        float _224 = fma(_172, _210, _220);
        float _226 = _218 * _218;
        float _228 = _222 * _222;
        _180 = _224;
        _182 = _226;
        _188 = _228;
    }
    float _230 = _180;
    float _232 = _182;
    float _234 = _188;
    float _236 = fma(_230, _230, _232);
    bool _238 = as_type<uint>(_142) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _240 = _88 * _88;
    float _242 = _236 + _234;
    float _244 = _146 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _246 = fma(_96, _96, _240);
    float _248 = -_150;
    float _250 = -_244;
    float _252 = fma(_248, (*spvDescriptorSet0.cp_c3)._m0[6].y, _250);
    float _254 = rsqrt(_242);
    float _256 = -_148;
    float _258 = fma(_256, (*spvDescriptorSet0.cp_c3)._m0[6].z, _252);
    if (_238)
    {
        return;
    }
    int _260 = as_type<int>(_61) << 2;
    int _262 = _260 + as_type<int>(_65);
    float _264 = _246 + 1.0;
    float _266 = _254 * _230;
    float _268 = -_258;
    float _270 = fma(_268, (*spvDescriptorSet0.cp_c3)._m0[15].x, _258);
    int _272 = _262 << 2;
    float _274 = sqrt(_264);
    float _276 = precise::min(1.0, (*spvDescriptorSet0.cp_c3)._m0[28].w);
    float _278 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _280 = 1.0 + _278;
    float _282 = _276 + _276;
    uint _285 = as_type<uint>(_142);
    float _287 = 0.0;
    int _289 = 0;
    int _291 = 0;
    int _293 = 0;
    int _295 = 0;
    float _297 = 0.0;
    float _299 = 0.0;
    do
    {
        uint _301 = _285;
        float _303 = _287;
        int _305 = _289;
        int _307 = _291;
        int _309 = _293;
        int _311 = _295;
        float _313 = _297;
        float _315 = _299;
        float _317 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _319 = log2(_317);
        float _321 = float(_301);
        float _323 = _274 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _325 = int(_301) + 1;
        float _327 = _146 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _329 = _148 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _331 = float(uint(_325));
        float _333 = _319 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _335 = _321 * _333;
        float _337 = _331 * _333;
        float _339 = exp2(_335);
        float _341 = exp2(_337);
        float _343 = _339 + (-1.0);
        float _345 = _343 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _347 = _341 + (-1.0);
        float _349 = _274 * _345;
        float _351 = -_345;
        float _353 = fma(_347, (*spvDescriptorSet0.cp_c3)._m0[8].z, _351);
        float _355 = fma(_349, _327, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _357 = fma(_349, _329, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _359 = _353 * _323;
        float _361 = fma(_146, _359, _355);
        float _363 = fma(_148, _359, _357);
        float _365 = fma(_361, 6.2500002968590706586837768554688e-05, 0.5);
        float _367 = fma(_363, 6.2500002968590706586837768554688e-05, 0.5);
        float2 _2092 = float2(_365, _367);
        float _369 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_2092, float2(0.0), isnan(_2092)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_2092, float2(0.0), isnan(_2092)), level(0.0)).x;
        float3 _2103 = float3(_365, _367, float(0));
        float3 _2107 = select(_2103, float3(0.0), isnan(_2103));
        float4 _372 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2107.xy, uint(rint(_2107.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2107.xy, uint(rint(_2107.z)), level(0.0)).xyzw;
        float _374 = _372.x;
        float _376 = _372.y;
        float _378 = _372.z;
        float _380 = _372.w;
        float3 _2122 = float3(_365, _367, float(1));
        float3 _2124 = select(_2122, float3(0.0), isnan(_2122));
        float4 _382 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2124.xy, uint(rint(_2124.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2124.xy, uint(rint(_2124.z)), level(0.0)).xyzw;
        float _384 = _382.x;
        float _386 = _382.y;
        float _388 = _382.z;
        float _390 = _382.w;
        float _392 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _394 = _363 + _392;
        float _396 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _398 = _361 + _396;
        float _400 = _345 + _353;
        float _402 = _394 * _394;
        float _404 = _150 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _406 = _150 * _359;
        float _408 = _400 * _323;
        float _410 = fma(_398, _398, _402);
        float _412 = fma(_349, _404, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _414 = _150 * 1.02332699298858642578125;
        float _416 = sqrt(_410);
        float _418 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _420 = _418 * 100.0;
        float _422 = _418 * 5115.0;
        float _424 = exp2(_420);
        bool _426 = _416 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _428 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _430 = _416 + _428;
        float _432 = fma(_424, 512.0, -512.0);
        float _434 = _303;
        float _436 = _416;
        float _438 = _412;
        float _440 = _313;
        float _442 = _315;
        if (_426)
        {
            float _444 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _434 = _444;
        }
        float _446 = _434;
        float _448 = fma(_408, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _450 = precise::clamp(_448, 0.0, 1.0);
        float _452 = 1.0 / _432;
        float _454 = -_450;
        float _456 = _454 + 1.0;
        float _458 = _450;
        if (_426)
        {
            float _460 = _430 * _446;
            _436 = _460;
        }
        float _462 = _436;
        float _464 = abs(_456);
        float _466 = log2(_464);
        float _468 = _412 + _406;
        float _470 = _462;
        if (_426)
        {
            float _472 = _462 * 0.15915493667125701904296875;
            _470 = _472;
        }
        float _474 = _470;
        if (!_426)
        {
            _458 = _468;
        }
        float _476 = _458;
        float _478 = _422 * _452;
        float _480 = 1.0 / _418;
        float _482 = _474;
        float _484 = _476;
        if (_426)
        {
            float _486 = _474 * 6.283185482025146484375;
            float _488 = cos(_486);
            _482 = _488;
        }
        float _490 = _482;
        float _492 = _466 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _494 = log2(_478);
        if (_426)
        {
            float _496 = _490 + (-1.0);
            _438 = _496;
        }
        float _498 = _438;
        float _500 = exp2(_492);
        float _502 = _498;
        if (_426)
        {
            float _504 = _498 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _502 = _504;
        }
        float _506 = _502;
        if (_426)
        {
            float _508 = fma(_468, _490, _506);
            _484 = _508;
        }
        float _510 = _484;
        float _512 = abs(_406);
        bool _514 = _512 > 0.00999999977648258209228515625;
        float _516 = fma(_494, _480, 100.0);
        float _518 = -_510;
        float _520 = fma(_468, 2.0, _518);
        float _522 = _514 ? _406 : 0.00999999977648258209228515625;
        float _524 = fma(_270, -0.5, 0.5);
        float _526 = _418 * _522;
        float _528 = precise::max(_526, -127.0);
        float _530 = fma(_369, (*spvDescriptorSet0.cp_c3)._m0[10].y, (*spvDescriptorSet0.cp_c3)._m0[10].x);
        float _532 = _380 * _414;
        float _534 = sqrt(_524);
        float _536 = _530 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _538 = fma(_374, 0.88622701168060302734375, _532);
        float _540 = -_536;
        float _542 = _520 + _540;
        float _544 = precise::max(0.0, _542);
        float _546 = -_516;
        float _548 = _546 + _544;
        float _550 = _384 * _414;
        float _552 = -_528;
        float _554 = exp2(_552);
        float _556 = _534 * 0.636619746685028076171875;
        float _558 = _418 * _548;
        float _560 = _266 + 1.0;
        float _562 = fma(_376, 0.88622701168060302734375, _550);
        float _564 = -_266;
        float _566 = fma(_500, _560, _564);
        float _568 = -_558;
        float _570 = exp2(_568);
        float _572 = fma(_566, 0.5, 0.5);
        float _574 = fma(_270, 0.5, 0.5);
        float _576 = 1.0 / _528;
        float _578 = fma(_574, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float3 _2411 = float3(_365, _367, float(2));
        float3 _2413 = select(_2411, float3(0.0), isnan(_2411));
        float4 _580 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2413.xy, uint(rint(_2413.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2413.xy, uint(rint(_2413.z)), level(0.0)).xyzw;
        float _582 = _580.x;
        float _584 = _580.y;
        float _586 = _580.z;
        float _588 = _580.w;
        float3 _2428 = float3(_365, _367, float(3));
        float3 _2430 = select(_2428, float3(0.0), isnan(_2428));
        float4 _590 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2430.xy, uint(rint(_2430.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2430.xy, uint(rint(_2430.z)), level(0.0)).xyzw;
        float _592 = _590.x;
        float _594 = _590.y;
        float _596 = _590.z;
        float _598 = _590.w;
        float3 _2445 = float3(_365, _367, float(4));
        float3 _2447 = select(_2445, float3(0.0), isnan(_2445));
        float4 _600 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2447.xy, uint(rint(_2447.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2447.xy, uint(rint(_2447.z)), level(0.0)).xyzw;
        float _602 = _600.x;
        float _604 = _600.y;
        float _606 = _600.z;
        float _608 = _600.w;
        float2 _2461 = float2(_365, _367);
        float _610 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_2461, float2(0.0), isnan(_2461)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_2461, float2(0.0), isnan(_2461)), level(0.0)).z;
        float3 _2470 = float3(_365, _367, float(6));
        float3 _2472 = select(_2470, float3(0.0), isnan(_2470));
        float4 _612 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2472.xy, uint(rint(_2472.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2472.xy, uint(rint(_2472.z)), level(0.0)).xyzw;
        float _614 = _612.x;
        float _616 = _612.y;
        float _618 = _612.z;
        float _620 = _612.w;
        float _622 = fma(_574, _578, -0.212114393711090087890625);
        float _624 = -_554;
        float _626 = _624 + 1.0;
        float _628 = fma(_574, _622, 1.570728778839111328125);
        float _630 = _570 * _626;
        float _632 = -_628;
        float _634 = fma(_556, _632, 1.0);
        float _636 = _630 * _576;
        float3 _2511 = float3(_365, _367, float(7));
        float3 _2513 = select(_2511, float3(0.0), isnan(_2511));
        float4 _638 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2513.xy, uint(rint(_2513.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2513.xy, uint(rint(_2513.z)), level(0.0)).xyzw;
        float _640 = _638.x;
        float _642 = _638.y;
        float _644 = _638.z;
        float _646 = _638.w;
        float3 _2529 = float3(_365, _367, float(5));
        float3 _2531 = select(_2529, float3(0.0), isnan(_2529));
        float4 _648 = dm_bs(spvDescriptorSet0.cp_t_tcb_12.sample(spvDescriptorSet0.cp_t_tcb_12Smplr, _2531.xy, uint(rint(_2531.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_12, spvDescriptorSet0.cp_t_tcb_12Smplr_w, _2531.xy, uint(rint(_2531.z)), level(0.0)).xyzw;
        float _650 = _648.x;
        float _652 = _648.y;
        float _654 = _648.z;
        float _656 = _648.w;
        float2 _2545 = float2(_634, _572);
        float3 _660 = dm_bs(spvDescriptorSet0.cp_t_tcb_14.sample(spvDescriptorSet0.cp_t_tcb_14Smplr, select(_2545, float2(0.0), isnan(_2545)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.cp_t_tcb_14, spvDescriptorSet0.cp_t_tcb_14Smplr_w, select(_2545, float2(0.0), isnan(_2545)), level(0.0)).xyz;
        float _662 = _660.x;
        float _664 = _660.y;
        float _666 = _660.z;
        float _668 = _386 * _414;
        float _670 = _466 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _672 = fma(_378, 0.88622701168060302734375, _668);
        float _674 = _148 * 1.02332699298858642578125;
        float _676 = _146 * 1.02332699298858642578125;
        float _678 = exp2(_670);
        bool _680 = as_type<int>(_142) != 0;
        float _682 = fma(_388, _674, _538);
        float _684 = fma(_390, _674, _562);
        float _686 = fma(_584, _676, _682);
        float _688 = fma(_582, _674, _672);
        float _690 = fma(_586, _676, _684);
        float _692 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _694 = fma(_588, _676, _688);
        float _696 = precise::max(0.0, _686);
        float _698 = _598 * _414;
        float _700 = _696 * _692;
        float _702 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _704 = fma(_592, 0.88622701168060302734375, _698);
        float _706 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _708 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _710 = precise::max(0.0, _690);
        float _712 = precise::max(0.0, _694);
        float _714 = fma(_606, _674, _704);
        float _716 = _610 * 2.0;
        float _718 = log2(_708);
        float _720 = _602 * _414;
        float _722 = _712 * _706;
        float _724 = fma(_610, _610, 1.0);
        float _726 = _616 * _414;
        float _728 = fma(_594, 0.88622701168060302734375, _720);
        float _730 = _642 * _414;
        float _732 = -_716;
        float _734 = fma(_270, _732, _724);
        float _736 = -_716;
        float _738 = _724 + _736;
        float _740 = fma(_614, 0.88622701168060302734375, _726);
        float _742 = _604 * _414;
        float _744 = fma(_640, 0.88622701168060302734375, _730);
        float _746 = fma(_608, _674, _728);
        float _748 = abs(_734);
        float _750 = log2(_748);
        float _752 = fma(_618, _674, _740);
        float _754 = fma(_596, 0.88622701168060302734375, _742);
        float _756 = _718 * (-0.0199999995529651641845703125);
        float _758 = fma(_644, _674, _744);
        float _760 = fma(_620, _676, _752);
        float _762 = fma(_652, _676, _714);
        float _764 = _359 * _756;
        float _766 = abs(_738);
        float _768 = log2(_766);
        float _770 = _760 * 0.31830990314483642578125;
        float _772 = precise::clamp(_770, 0.0, 1.0);
        float _774 = fma(_650, _674, _754);
        float _776 = _636 * _764;
        float _778 = fma(_646, _676, _758);
        float _780 = fma(_654, _676, _746);
        float _782 = precise::min(_772, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _784 = fma(_656, _676, _774);
        float _786 = _750 * 1.5;
        float _788 = _710 * _702;
        float _790 = 1.0 / _359;
        float _792 = _782 * 0.88622701168060302734375;
        float _794 = _778 * 0.31830990314483642578125;
        float _796 = precise::clamp(_794, 0.0, 1.0);
        float _798 = -_610;
        float _800 = fma(_798, _610, 1.0);
        float _802 = precise::max(0.0, _762);
        float _804 = fma(_792, (*spvDescriptorSet0.cp_c3)._m0[9].x, _700);
        float _806 = _768 * 1.5;
        float _808 = precise::max(0.0, _780);
        float _810 = exp2(_786);
        float _812 = precise::max(0.0, _784);
        float _814 = fma(_792, (*spvDescriptorSet0.cp_c3)._m0[9].y, _788);
        float _816 = fma(_792, (*spvDescriptorSet0.cp_c3)._m0[9].z, _722);
        float _818 = _796 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _820 = precise::clamp(_818, 0.0, 1.0);
        float _822 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _824 = _408 + _822;
        int _826 = _272 + as_type<int>(_142);
        float _828 = exp2(_806);
        float _830 = fma(_802, _820, _804);
        float _832 = fma(_808, _820, _814);
        float _834 = fma(_812, _820, _816);
        float _836 = _824 * _790;
        float _838 = precise::clamp(_836, 0.0, 1.0);
        float _840 = _810 * 12.56637096405029296875;
        float _842 = _776 * _838;
        float _844 = 1.0 / _840;
        float _846 = _828 * 12.56637096405029296875;
        float _848 = 1.0 / _846;
        float _850 = _800 * _844;
        float _852 = _800 * _848;
        float _854 = _282 * 0.5;
        float _856 = _830 * _852;
        float _858 = _854 * _850;
        float _860 = _832 * _852;
        float _862 = _834 * _852;
        float _864 = _854 * _664;
        float _866 = fma(_858, (*spvDescriptorSet0.cp_c3)._m0[7].x, _856);
        float _868 = fma(_858, (*spvDescriptorSet0.cp_c3)._m0[7].y, _860);
        float _870 = fma(_858, (*spvDescriptorSet0.cp_c3)._m0[7].z, _862);
        float _872 = -_678;
        float _874 = _872 + 1.0;
        float _876 = _854 * _662;
        float _878 = _359 * _854;
        float _880 = _854 * _666;
        float _882 = _866 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _884 = _868 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _886 = _870 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        float _888 = _874 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        int _890 = _826 << 2;
        int _892 = _890 + 1024;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        _26[int(_894)] = as_type<uint>(_878);
        float _896 = _858;
        float _898 = _860;
        float _900 = _862;
        float _902 = _866;
        float _904 = _754;
        if (_680)
        {
            _896 = as_type<float>(_305);
        }
        int _906 = as_type<int>(_896);
        int _908 = _906;
        if (_680)
        {
            _898 = as_type<float>(_307);
        }
        int _910 = as_type<int>(_898);
        int _912 = _826 << 4;
        int _914 = _912 + 1280;
        uint _916 = uint(int(uint(_914) >> uint(2)));
        _26[int(_916)] = as_type<uint>(_882);
        int _918 = _912 + 1284;
        uint _920 = uint(int(uint(_918) >> uint(2)));
        _26[int(_920)] = as_type<uint>(_884);
        int _922 = _912 + 1288;
        uint _924 = uint(int(uint(_922) >> uint(2)));
        _26[int(_924)] = as_type<uint>(_886);
        int _926 = _912 + 1292;
        uint _928 = uint(int(uint(_926) >> uint(2)));
        _26[int(_928)] = as_type<uint>(_842);
        int _930 = _910;
        if (_680)
        {
            _900 = as_type<float>(_309);
        }
        int _932 = as_type<int>(_900);
        int _934 = _932;
        if (_680)
        {
            _902 = as_type<float>(_311);
        }
        int _936 = as_type<int>(_902);
        int _938 = _826 << 4;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        _26[int(_940)] = as_type<uint>(_876);
        int _942 = _938 + 4;
        uint _944 = uint(int(uint(_942) >> uint(2)));
        _26[int(_944)] = as_type<uint>(_864);
        int _946 = _938 + 8;
        uint _948 = uint(int(uint(_946) >> uint(2)));
        _26[int(_948)] = as_type<uint>(_880);
        int _950 = _938 + 12;
        uint _952 = uint(int(uint(_950) >> uint(2)));
        _26[int(_952)] = as_type<uint>(_888);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _954 = _936;
        if (!_680)
        {
            int _956 = _272 << 4;
            int _958 = _956 + 1280;
            uint _960 = uint(int(uint(_958) >> uint(2)));
            float _962 = as_type<float>(_26[int(_960)]);
            int _964 = _956 + 1284;
            uint _966 = uint(int(uint(_964) >> uint(2)));
            float _968 = as_type<float>(_26[int(_966)]);
            int _970 = _956 + 1288;
            uint _972 = uint(int(uint(_970) >> uint(2)));
            float _974 = as_type<float>(_26[int(_972)]);
            int _976 = _956 + 1292;
            uint _978 = uint(int(uint(_976) >> uint(2)));
            float _980 = as_type<float>(_26[int(_978)]);
            int _982 = _272 << 4;
            int _984 = _982 + 1296;
            uint _986 = uint(int(uint(_984) >> uint(2)));
            float _988 = as_type<float>(_26[int(_986)]);
            int _990 = _982 + 1300;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            float _994 = as_type<float>(_26[int(_992)]);
            int _996 = _982 + 1304;
            uint _998 = uint(int(uint(_996) >> uint(2)));
            float _1000 = as_type<float>(_26[int(_998)]);
            int _1002 = _982 + 1308;
            uint _1004 = uint(int(uint(_1002) >> uint(2)));
            float _1006 = as_type<float>(_26[int(_1004)]);
            int _1008 = _272 << 4;
            int _1010 = _1008 + 1312;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_26[int(_1012)]);
            int _1016 = _1008 + 1316;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_26[int(_1018)]);
            int _1022 = _1008 + 1320;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_26[int(_1024)]);
            int _1028 = _1008 + 1324;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_26[int(_1030)]);
            int _1034 = _272 << 4;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_26[int(_1036)]);
            int _1040 = _1034 + 4;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>(_26[int(_1042)]);
            int _1046 = _1034 + 8;
            uint _1048 = uint(int(uint(_1046) >> uint(2)));
            float _1050 = as_type<float>(_26[int(_1048)]);
            int _1052 = _1034 + 12;
            uint _1054 = uint(int(uint(_1052) >> uint(2)));
            float _1056 = as_type<float>(_26[int(_1054)]);
            int _1058 = _272 << 4;
            int _1060 = _1058 + 16;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_26[int(_1062)]);
            int _1066 = _1058 + 20;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            float _1070 = as_type<float>(_26[int(_1068)]);
            int _1072 = _1058 + 24;
            uint _1074 = uint(int(uint(_1072) >> uint(2)));
            float _1076 = as_type<float>(_26[int(_1074)]);
            int _1078 = _1058 + 28;
            uint _1080 = uint(int(uint(_1078) >> uint(2)));
            float _1082 = as_type<float>(_26[int(_1080)]);
            int _1084 = _272 << 4;
            int _1086 = _1084 + 1328;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_26[int(_1088)]);
            int _1092 = _1084 + 1332;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            float _1096 = as_type<float>(_26[int(_1094)]);
            int _1098 = _1084 + 1336;
            uint _1100 = uint(int(uint(_1098) >> uint(2)));
            float _1102 = as_type<float>(_26[int(_1100)]);
            int _1104 = _1084 + 1340;
            uint _1106 = uint(int(uint(_1104) >> uint(2)));
            float _1108 = as_type<float>(_26[int(_1106)]);
            float _1110 = as_type<float>(_311) + _980;
            float _1112 = -_1110;
            float _1114 = exp2(_1112);
            float _1116 = _1110 + _1006;
            float _1118 = _1116 + _1032;
            float _1120 = -_1116;
            float _1122 = exp2(_1120);
            float _1124 = -_962;
            float _1126 = _1124 + _1038;
            float _1128 = -_968;
            float _1130 = _1128 + _1044;
            float _1132 = -_974;
            float _1134 = _1132 + _1050;
            float _1136 = -_994;
            float _1138 = _1136 + _1070;
            float _1140 = -_988;
            float _1142 = _1140 + _1064;
            float _1144 = -_1000;
            float _1146 = _1144 + _1076;
            float _1148 = -_1114;
            float _1150 = _1148 + 1.0;
            float _1152 = _1118 + _1108;
            int _1154 = _272 << 4;
            int _1156 = _1154 + 32;
            uint _1158 = uint(int(uint(_1156) >> uint(2)));
            float _1160 = as_type<float>(_26[int(_1158)]);
            int _1162 = _1154 + 36;
            uint _1164 = uint(int(uint(_1162) >> uint(2)));
            float _1166 = as_type<float>(_26[int(_1164)]);
            int _1168 = _1154 + 40;
            uint _1170 = uint(int(uint(_1168) >> uint(2)));
            float _1172 = as_type<float>(_26[int(_1170)]);
            int _1174 = _1154 + 44;
            uint _1176 = uint(int(uint(_1174) >> uint(2)));
            float _1178 = as_type<float>(_26[int(_1176)]);
            float _1180 = precise::min(_1150, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1182 = -_1122;
            float _1184 = _1182 + 1.0;
            float _1186 = -_1118;
            float _1188 = exp2(_1186);
            float _1190 = -_313;
            float _1192 = _1180 + _1190;
            float _1194 = precise::min(_1184, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1196 = _1192 * _1056;
            float _1198 = -_1180;
            float _1200 = _1198 + _1194;
            float _1202 = _1126 * _1196;
            float _1204 = _1130 * _1196;
            float _1206 = _1134 * _1196;
            float _1208 = _1200 * _1082;
            float _1210 = fma(_962, _1192, _1202);
            float _1212 = fma(_968, _1192, _1204);
            float _1214 = fma(_974, _1192, _1206);
            float _1216 = -_1188;
            float _1218 = _1216 + 1.0;
            float _1220 = _1138 * _1208;
            int _1222 = _272 << 4;
            int _1224 = _1222 + 48;
            uint _1226 = uint(int(uint(_1224) >> uint(2)));
            float _1228 = as_type<float>(_26[int(_1226)]);
            int _1230 = _1222 + 52;
            uint _1232 = uint(int(uint(_1230) >> uint(2)));
            float _1234 = as_type<float>(_26[int(_1232)]);
            int _1236 = _1222 + 56;
            uint _1238 = uint(int(uint(_1236) >> uint(2)));
            float _1240 = as_type<float>(_26[int(_1238)]);
            int _1242 = _1222 + 60;
            uint _1244 = uint(int(uint(_1242) >> uint(2)));
            float _1246 = as_type<float>(_26[int(_1244)]);
            float _1248 = _1142 * _1208;
            float _1250 = _1146 * _1208;
            float _1252 = precise::min(_1218, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1254 = _272 << 2;
            int _1256 = _1254 + 1024;
            uint _1258 = uint(int(uint(_1256) >> uint(2)));
            float _1260 = as_type<float>(_26[int(_1258)]);
            float _1262 = fma(_988, _1200, _1248);
            float _1264 = fma(_994, _1200, _1220);
            float _1266 = -_1152;
            float _1268 = exp2(_1266);
            int _1270 = _272 << 2;
            int _1272 = _1270 + 1028;
            uint _1274 = uint(int(uint(_1272) >> uint(2)));
            float _1276 = as_type<float>(_26[int(_1274)]);
            float _1278 = -_1194;
            float _1280 = _1278 + _1252;
            float _1282 = fma(_1000, _1200, _1250);
            float _1284 = _1210 + as_type<float>(_305);
            int _1286 = _272 << 2;
            int _1288 = _1286 + 1032;
            uint _1290 = uint(int(uint(_1288) >> uint(2)));
            float _1292 = as_type<float>(_26[int(_1290)]);
            float _1294 = _1212 + as_type<float>(_307);
            float _1296 = -_1014;
            float _1298 = _1296 + _1160;
            float _1300 = _1280 * _1178;
            int _1302 = _272 << 2;
            int _1304 = _1302 + 1036;
            uint _1306 = uint(int(uint(_1304) >> uint(2)));
            float _1308 = as_type<float>(_26[int(_1306)]);
            float _1310 = -_1020;
            float _1312 = _1310 + _1166;
            float _1314 = -_1026;
            float _1316 = _1314 + _1172;
            float _1318 = _1298 * _1300;
            float _1320 = _1214 + as_type<float>(_309);
            float _1322 = _1312 * _1300;
            float _1324 = _1316 * _1300;
            float _1326 = fma(_1014, _1280, _1318);
            float _1328 = _1294 + _1264;
            float _1330 = fma(_1020, _1280, _1322);
            float _1332 = -_1268;
            float _1334 = _1332 + 1.0;
            float _1336 = fma(_1026, _1280, _1324);
            float _1338 = _1284 + _1262;
            float _1340 = _1320 + _1282;
            float _1342 = _1328 + _1330;
            float _1344 = precise::min(_1334, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1346 = _1338 + _1326;
            float _1348 = _1340 + _1336;
            int _1350 = _272 << 4;
            int _1352 = _1350 + 1280;
            uint _1354 = uint(int(uint(_1352) >> uint(2)));
            _26[int(_1354)] = as_type<uint>(_1284);
            int _1356 = _1350 + 1284;
            uint _1358 = uint(int(uint(_1356) >> uint(2)));
            _26[int(_1358)] = as_type<uint>(_1294);
            int _1360 = _1350 + 1288;
            uint _1362 = uint(int(uint(_1360) >> uint(2)));
            _26[int(_1362)] = as_type<uint>(_1320);
            int _1364 = _1350 + 1292;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            _26[int(_1366)] = as_type<uint>(_1110);
            float _1368 = -_1252;
            float _1370 = _1344 + _1368;
            int _1372 = _272 << 4;
            int _1374 = _1372 + 1296;
            uint _1376 = uint(int(uint(_1374) >> uint(2)));
            _26[int(_1376)] = as_type<uint>(_1338);
            int _1378 = _1372 + 1300;
            uint _1380 = uint(int(uint(_1378) >> uint(2)));
            _26[int(_1380)] = as_type<uint>(_1328);
            int _1382 = _1372 + 1304;
            uint _1384 = uint(int(uint(_1382) >> uint(2)));
            _26[int(_1384)] = as_type<uint>(_1340);
            int _1386 = _1372 + 1308;
            uint _1388 = uint(int(uint(_1386) >> uint(2)));
            _26[int(_1388)] = as_type<uint>(_1116);
            float _1390 = -_1090;
            float _1392 = _1390 + _1228;
            float _1394 = _1370 * _1246;
            float _1396 = -_1096;
            float _1398 = _1396 + _1234;
            float _1400 = -_1102;
            float _1402 = _1400 + _1240;
            float _1404 = _1260 + _315;
            float _1406 = _1392 * _1394;
            float _1408 = _1398 * _1394;
            float _1410 = _1402 * _1394;
            float _1412 = _1404 + _1276;
            float _1414 = fma(_1090, _1370, _1406);
            float _1416 = fma(_1096, _1370, _1408);
            float _1418 = fma(_1102, _1370, _1410);
            float _1420 = _1412 + _1292;
            float _1422 = _1414 + _1346;
            float _1424 = _1416 + _1342;
            float _1426 = _1418 + _1348;
            float _1428 = _1420 + _1308;
            int _1430 = _272 << 4;
            int _1432 = _1430 + 1312;
            uint _1434 = uint(int(uint(_1432) >> uint(2)));
            _26[int(_1434)] = as_type<uint>(_1346);
            int _1436 = _1430 + 1316;
            uint _1438 = uint(int(uint(_1436) >> uint(2)));
            _26[int(_1438)] = as_type<uint>(_1342);
            int _1440 = _1430 + 1320;
            uint _1442 = uint(int(uint(_1440) >> uint(2)));
            _26[int(_1442)] = as_type<uint>(_1348);
            int _1444 = _1430 + 1324;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            _26[int(_1446)] = as_type<uint>(_1118);
            int _1448 = _272 << 2;
            int _1450 = _1448 + 1024;
            uint _1452 = uint(int(uint(_1450) >> uint(2)));
            _26[int(_1452)] = as_type<uint>(_1404);
            int _1454 = _272 << 2;
            int _1456 = _1454 + 1028;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            _26[int(_1458)] = as_type<uint>(_1412);
            int _1460 = _272 << 2;
            int _1462 = _1460 + 1032;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            _26[int(_1464)] = as_type<uint>(_1420);
            int _1466 = _272 << 2;
            int _1468 = _1466 + 1036;
            uint _1470 = uint(int(uint(_1468) >> uint(2)));
            _26[int(_1470)] = as_type<uint>(_1428);
            int _1472 = _272 << 4;
            int _1474 = _1472 + 1328;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            _26[int(_1476)] = as_type<uint>(_1422);
            int _1478 = _1472 + 1332;
            uint _1480 = uint(int(uint(_1478) >> uint(2)));
            _26[int(_1480)] = as_type<uint>(_1424);
            int _1482 = _1472 + 1336;
            uint _1484 = uint(int(uint(_1482) >> uint(2)));
            _26[int(_1484)] = as_type<uint>(_1426);
            int _1486 = _1472 + 1340;
            uint _1488 = uint(int(uint(_1486) >> uint(2)));
            _26[int(_1488)] = as_type<uint>(_1152);
            _904 = _1398;
            _440 = _1344;
            _442 = _1428;
            _908 = as_type<int>(_1422);
            _930 = as_type<int>(_1424);
            _934 = as_type<int>(_1426);
            _954 = as_type<int>(_1152);
        }
        float _1490 = _904;
        float _1492 = _440;
        float _1494 = _442;
        int _1496 = _908;
        int _1498 = _930;
        int _1500 = _934;
        int _1502 = _954;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1504 = _826 << 4;
        int _1506 = _1504 + 1280;
        uint _1508 = uint(int(uint(_1506) >> uint(2)));
        float _1510 = as_type<float>(_26[int(_1508)]);
        int _1512 = _1504 + 1284;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>(_26[int(_1514)]);
        int _1518 = _1504 + 1288;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>(_26[int(_1520)]);
        int _1524 = _1504 + 1292;
        uint _1526 = uint(int(uint(_1524) >> uint(2)));
        float _1528 = as_type<float>(_26[int(_1526)]);
        float _1530 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _1532 = _408 + _1530;
        float _1534 = 1.0 / _408;
        int _1536 = _826 << 2;
        int _1538 = _1536 + 1024;
        uint _1540 = uint(int(uint(_1538) >> uint(2)));
        float _1542 = as_type<float>(_26[int(_1540)]);
        float _1544 = _1532 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _1546 = precise::clamp(_1544, 0.0, 1.0);
        float _1548 = abs(_1546);
        float _1550 = log2(_1548);
        float _1552 = _1550 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _1554 = exp2(_1552);
        float _1556 = -_1528;
        float _1558 = exp2(_1556);
        float _1560 = _1554 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _1562 = precise::max(_1558, _280);
        float _1564 = -_1562;
        float _1566 = _1564 + 1.0;
        float _1568 = -_1560;
        float _1570 = _1568 + 1.0;
        float _1572 = 1.0 / _1566;
        bool _1574 = _1570 > _1566;
        bool _1576 = isnan(_1570);
        bool _1578 = _1574 || _1576;
        bool _1580 = isnan(_1566);
        bool _1582 = _1578 || _1580;
        float _1584 = _1570 * _1572;
        float _1586 = _1542 * _1534;
        bool _1588 = !_1582;
        float _1590 = _1588 ? _1584 : 1.0;
        float _1592 = _1510 * _1590;
        float _1594 = _1516 * _1590;
        float _1596 = _1522 * _1590;
        float _1598 = fma(_1566, _1590, _1560);
        float _1600 = precise::clamp(_1598, 0.0, 1.0);
        float _1602 = fma(_1560, (*spvDescriptorSet0.cp_c3)._m0[14].x, _1592);
        float _1604 = fma(_1560, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1594);
        float _1606 = fma(_1560, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1596);
        float _1608 = -_1600;
        float _1610 = _1608 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1602, _1604, _1606, _1610), uint3(int3(_76, _70, int(_301))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1586, _1586, _1586, _1586), uint3(int3(_76, _70, int(_301))));
        int _1612 = int(_301) + 4;
        bool _1614 = uint(_1612) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _285 = uint(_1612);
        _287 = _1490;
        _289 = _1496;
        _291 = _1498;
        _293 = _1500;
        _295 = _1502;
        _297 = _1492;
        _299 = _1494;
        if (_1614)
        {
            _1616 = true;
            if (_1616)
            {
                break;
            }
        }
    } while (true);
    _1616 = false;
}

