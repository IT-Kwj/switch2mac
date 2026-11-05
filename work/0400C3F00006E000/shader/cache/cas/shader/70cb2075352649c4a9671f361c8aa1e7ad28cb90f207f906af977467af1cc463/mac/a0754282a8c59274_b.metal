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
    texture2d_array<float> cp_t_tcb_C [[id(2)]];
    sampler cp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> cp_t_tcb_E [[id(4)]];
    sampler cp_t_tcb_ESmplr [[id(5)]];
    texture3d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    texture3d<float, access::write> cp_i_tcb_4A_ [[id(7)]];
    sampler cp_t_tcb_CSmplr_w [[id(8)]];
    sampler cp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    threadgroup spvUnsafeArray<uint, 576> _26;
    bool _1596 = false;
    float _55 = as_type<float>(gl_WorkGroupID.y);
    float _57 = as_type<float>(gl_LocalInvocationID.y);
    float _59 = as_type<float>(gl_WorkGroupID.x);
    float _61 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_55) << 2;
    int _66 = _64 + as_type<int>(_57);
    float _68 = float(uint(_66));
    int _70 = as_type<int>(_59) << 2;
    int _72 = _70 + as_type<int>(_61);
    float _74 = _68 + 0.5;
    float _76 = float(uint(_72));
    float _78 = -_74;
    float _80 = fma(_78, (*spvDescriptorSet0.cp_c4)._m0[0].y, 0.5);
    float _82 = _76 + 0.5;
    float _84 = fma(_80, (*spvDescriptorSet0.cp_c3)._m0[4].y, (*spvDescriptorSet0.cp_c3)._m0[4].w);
    float _86 = fma(_82, (*spvDescriptorSet0.cp_c4)._m0[0].x, -0.5);
    float _88 = _84 * (*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _90 = _84 * (*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _92 = fma(_86, (*spvDescriptorSet0.cp_c3)._m0[4].x, (*spvDescriptorSet0.cp_c3)._m0[4].z);
    float _94 = _84 * (*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _96 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[1].x, _88);
    float _98 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[0].x, _94);
    float _100 = fma(_92, (*spvDescriptorSet0.cp_c3)._m0[2].x, _90);
    float _102 = -(*spvDescriptorSet0.cp_c3)._m0[1].z;
    float _104 = _96 + _102;
    float _106 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _108 = _98 + _106;
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[2].z;
    float _112 = _100 + _110;
    float _114 = _104 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _116 = _108 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _118 = _112 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _120 = -(*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _122 = _114 + _120;
    float _124 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _126 = _116 + _124;
    float _128 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _130 = _118 + _128;
    float _132 = _122 * _122;
    float _134 = fma(_126, _126, _132);
    float _136 = fma(_130, _130, _134);
    float _138 = as_type<float>(gl_LocalInvocationID.z);
    float _140 = rsqrt(_136);
    float _142 = _126 * _140;
    float _144 = _130 * _140;
    float _146 = _122 * _140;
    float _148 = _142 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _150 = _144 * (*spvDescriptorSet0.cp_c3)._m0[8].w;
    float _152 = (*spvDescriptorSet0.cp_c3)._m0[3].y + (-220.0);
    float _154 = _148 * _148;
    float _156 = _150 * _150;
    float _158 = precise::max(0.0, _152);
    float _160 = _154 + _156;
    float _162 = sqrt(_160);
    float _164 = -_146;
    float _166 = -_158;
    float _168 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[8].w, _166);
    bool _172 = _162 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _174 = _140;
    float _176 = _168;
    float _178 = _154;
    if (!_172)
    {
        _174 = _156;
    }
    float _180 = _174;
    bool _182 = !_172;
    float _184 = _180;
    if (!_182)
    {
        float _186 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _188 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _190 = _162 + _188;
        float _192 = rsqrt(_160);
        float _194 = _190 * _186;
        float _196 = _194 * 0.15915493667125701904296875;
        float _198 = _168 + (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _200 = _196 * 6.283185482025146484375;
        float _202 = sin(_200);
        float _204 = _196 * 6.283185482025146484375;
        float _206 = cos(_204);
        float _208 = fma(_202, _198, (*spvDescriptorSet0.cp_c3)._m0[10].z);
        float _210 = _192 * _208;
        float _212 = _206 + (-1.0);
        float _214 = _148 * _210;
        float _216 = _212 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
        float _218 = _150 * _210;
        float _220 = fma(_168, _206, _216);
        float _222 = _214 * _214;
        float _224 = _218 * _218;
        _176 = _220;
        _178 = _222;
        _184 = _224;
    }
    float _226 = _176;
    float _228 = _178;
    float _230 = _184;
    float _232 = fma(_226, _226, _228);
    bool _234 = as_type<uint>(_138) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
    float _236 = _84 * _84;
    float _238 = _232 + _230;
    float _240 = _142 * (*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _242 = fma(_92, _92, _236);
    float _244 = -_146;
    float _246 = -_240;
    float _248 = fma(_244, (*spvDescriptorSet0.cp_c3)._m0[6].y, _246);
    float _250 = rsqrt(_238);
    float _252 = -_144;
    float _254 = fma(_252, (*spvDescriptorSet0.cp_c3)._m0[6].z, _248);
    if (_234)
    {
        return;
    }
    int _256 = as_type<int>(_57) << 2;
    int _258 = _256 + as_type<int>(_61);
    float _260 = _242 + 1.0;
    float _262 = _250 * _226;
    float _264 = -_254;
    float _266 = fma(_264, (*spvDescriptorSet0.cp_c3)._m0[15].x, _254);
    float _268 = sqrt(_260);
    float _270 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _272 = _270 + 1.0;
    int _274 = _258 << 2;
    uint _277 = as_type<uint>(_138);
    float _279 = 0.0;
    int _281 = 0;
    int _283 = 0;
    int _285 = 0;
    int _287 = 0;
    float _289 = 0.0;
    float _291 = 0.0;
    do
    {
        uint _293 = _277;
        float _295 = _279;
        int _297 = _281;
        int _299 = _283;
        int _301 = _285;
        int _303 = _287;
        float _305 = _289;
        float _307 = _291;
        float _309 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _311 = log2(_309);
        float _313 = float(_293);
        float _315 = _268 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _317 = int(_293) + 1;
        float _319 = _144 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _321 = _142 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _323 = float(uint(_317));
        float _325 = _311 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _327 = _313 * _325;
        float _329 = _323 * _325;
        float _331 = exp2(_327);
        float _333 = exp2(_329);
        float _335 = _331 + (-1.0);
        float _337 = _335 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _339 = _333 + (-1.0);
        float _341 = _268 * _337;
        float _343 = -_337;
        float _345 = fma(_339, (*spvDescriptorSet0.cp_c3)._m0[8].z, _343);
        float _347 = fma(_341, _319, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _349 = fma(_341, _321, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _351 = _345 * _315;
        float _353 = _337 + _345;
        float _355 = fma(_144, _351, _347);
        float _357 = fma(_142, _351, _349);
        float _359 = _353 * _315;
        float _361 = _146 * _351;
        float _363 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _365 = _355 + _363;
        float _367 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _369 = _357 + _367;
        float _371 = fma(_359, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _373 = precise::clamp(_371, 0.0, 1.0);
        float _375 = _365 * _365;
        float _377 = -_373;
        float _379 = _377 + 1.0;
        float _381 = fma(_369, _369, _375);
        float _383 = abs(_379);
        float _385 = log2(_383);
        float _387 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _389 = _387 * 100.0;
        float _391 = _387 * 5115.0;
        float _393 = sqrt(_381);
        float _395 = exp2(_389);
        bool _397 = _393 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _399 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _401 = _393 + _399;
        float _403 = fma(_395, 512.0, -512.0);
        float _405 = _146 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _407 = 1.0 / _387;
        float _409 = fma(_341, _405, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _411 = _409 + _361;
        float _413 = _295;
        float _415 = _401;
        float _417 = _391;
        float _419 = (*spvDescriptorSet0.cp_c3)._m0[11].y;
        float _421 = _409;
        float _423 = _305;
        float _425 = _307;
        if (_397)
        {
            float _427 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _413 = _427;
        }
        float _429 = _413;
        float _431 = 1.0 / _403;
        if (_397)
        {
            float _433 = _401 * _429;
            _415 = _433;
        }
        float _435 = _415;
        float _437 = _435;
        if (_397)
        {
            float _439 = _435 * 0.15915493667125701904296875;
            _437 = _439;
        }
        float _441 = _437;
        float _443 = _391 * _431;
        if (!_397)
        {
            _417 = _411;
        }
        float _445 = _417;
        float _447 = _441;
        float _449 = _445;
        if (_397)
        {
            float _451 = _441 * 6.283185482025146484375;
            float _453 = cos(_451);
            _447 = _453;
        }
        float _455 = _447;
        float _457 = fma(_266, -0.5, 0.5);
        float _459 = log2(_443);
        if (_397)
        {
            float _461 = _455 + (-1.0);
            _419 = _461;
        }
        float _463 = _419;
        float _465 = sqrt(_457);
        if (_397)
        {
            float _467 = _463 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _421 = _467;
        }
        float _469 = _421;
        float _471 = _385 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        if (_397)
        {
            float _473 = fma(_411, _455, _469);
            _449 = _473;
        }
        float _475 = _449;
        float _477 = abs(_361);
        bool _479 = _477 > 0.00999999977648258209228515625;
        float _481 = fma(_459, _407, 100.0);
        float _483 = exp2(_471);
        float _485 = -_475;
        float _487 = fma(_411, 2.0, _485);
        float _489 = _479 ? _361 : 0.00999999977648258209228515625;
        float _491 = -(*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _493 = _487 + _491;
        float _495 = _465 * 0.636619746685028076171875;
        float _497 = _387 * _489;
        float _499 = precise::max(0.0, _493);
        float _501 = precise::max(_497, -127.0);
        float _503 = fma(_266, 0.5, 0.5);
        float _505 = -_481;
        float _507 = _505 + _499;
        float _509 = -_501;
        float _511 = exp2(_509);
        float _513 = _387 * _507;
        float _515 = fma(_503, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _517 = -_513;
        float _519 = exp2(_517);
        float _521 = fma(_503, _515, -0.212114393711090087890625);
        float _523 = _262 + 1.0;
        float _525 = fma(_503, _521, 1.570728778839111328125);
        float _527 = -_511;
        float _529 = _527 + 1.0;
        float _531 = -_262;
        float _533 = fma(_483, _523, _531);
        float _535 = -_525;
        float _537 = fma(_495, _535, 1.0);
        float _539 = fma(_357, 6.2500002968590706586837768554688e-05, 0.5);
        float _541 = fma(_355, 6.2500002968590706586837768554688e-05, 0.5);
        float _543 = fma(_533, 0.5, 0.5);
        float _545 = _519 * _529;
        float3 _2331 = float3(_539, _541, float(0));
        float3 _2335 = select(_2331, float3(0.0), isnan(_2331));
        float4 _548 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2335.xy, uint(rint(_2335.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2335.xy, uint(rint(_2335.z)), level(0.0)).xyzw;
        float _550 = _548.x;
        float _552 = _548.y;
        float _554 = _548.z;
        float _556 = _548.w;
        float3 _2350 = float3(_539, _541, float(1));
        float3 _2352 = select(_2350, float3(0.0), isnan(_2350));
        float4 _558 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2352.xy, uint(rint(_2352.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2352.xy, uint(rint(_2352.z)), level(0.0)).xyzw;
        float _560 = _558.x;
        float _562 = _558.y;
        float _564 = _558.z;
        float _566 = _558.w;
        float3 _2367 = float3(_539, _541, float(2));
        float3 _2369 = select(_2367, float3(0.0), isnan(_2367));
        float4 _568 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2369.xy, uint(rint(_2369.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2369.xy, uint(rint(_2369.z)), level(0.0)).xyzw;
        float _570 = _568.x;
        float _572 = _568.y;
        float _574 = _568.z;
        float _576 = _568.w;
        float3 _2384 = float3(_539, _541, float(3));
        float3 _2386 = select(_2384, float3(0.0), isnan(_2384));
        float4 _578 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2386.xy, uint(rint(_2386.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2386.xy, uint(rint(_2386.z)), level(0.0)).xyzw;
        float _580 = _578.x;
        float _582 = _578.y;
        float _584 = _578.z;
        float _586 = _578.w;
        float3 _2401 = float3(_539, _541, float(4));
        float3 _2403 = select(_2401, float3(0.0), isnan(_2401));
        float4 _588 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2403.xy, uint(rint(_2403.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2403.xy, uint(rint(_2403.z)), level(0.0)).xyzw;
        float _590 = _588.x;
        float _592 = _588.y;
        float _594 = _588.z;
        float _596 = _588.w;
        float3 _2418 = float3(_539, _541, float(6));
        float3 _2420 = select(_2418, float3(0.0), isnan(_2418));
        float4 _598 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2420.xy, uint(rint(_2420.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2420.xy, uint(rint(_2420.z)), level(0.0)).xyzw;
        float _600 = _598.x;
        float _602 = _598.y;
        float _604 = _598.z;
        float _606 = _598.w;
        float3 _2436 = float3(_539, _541, float(7));
        float3 _2438 = select(_2436, float3(0.0), isnan(_2436));
        float4 _608 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2438.xy, uint(rint(_2438.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2438.xy, uint(rint(_2438.z)), level(0.0)).xyzw;
        float _610 = _608.x;
        float _612 = _608.y;
        float _614 = _608.z;
        float _616 = _608.w;
        float3 _2454 = float3(_539, _541, float(5));
        float3 _2456 = select(_2454, float3(0.0), isnan(_2454));
        float4 _618 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2456.xy, uint(rint(_2456.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2456.xy, uint(rint(_2456.z)), level(0.0)).xyzw;
        float _620 = _618.x;
        float _622 = _618.y;
        float _624 = _618.z;
        float _626 = _618.w;
        float2 _2471 = float2(_537, _543);
        float3 _630 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_2471, float2(0.0), isnan(_2471)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_2471, float2(0.0), isnan(_2471)), level(0.0)).xyz;
        float _632 = _630.x;
        float _634 = _630.y;
        float _636 = _630.z;
        float _638 = _146 * 1.02332699298858642578125;
        float _640 = 1.0 / _501;
        float _642 = _385 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        bool _644 = as_type<int>(_138) != 0;
        float _646 = exp2(_642);
        float _648 = _545 * _640;
        float _650 = _556 * _638;
        float _652 = _560 * _638;
        float _654 = _562 * _638;
        float _656 = fma(_550, 0.88622701168060302734375, _650);
        float _658 = fma(_552, 0.88622701168060302734375, _652);
        float _660 = fma(_554, 0.88622701168060302734375, _654);
        float _662 = _144 * 1.02332699298858642578125;
        float _664 = fma((*spvDescriptorSet0.cp_c3)._m0[8].x, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _666 = (*spvDescriptorSet0.cp_c3)._m0[8].x * 2.0;
        float _668 = fma(_564, _662, _656);
        float _670 = fma(_566, _662, _658);
        float _672 = -_666;
        float _674 = fma(_266, _672, _664);
        float _676 = -_666;
        float _678 = _664 + _676;
        float _680 = fma(_570, _662, _660);
        float _682 = _602 * _638;
        float _684 = _612 * _638;
        float _686 = abs(_674);
        float _688 = log2(_686);
        float _690 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _692 = fma(_600, 0.88622701168060302734375, _682);
        float _694 = _590 * _638;
        float _696 = _592 * _638;
        float _698 = fma(_610, 0.88622701168060302734375, _684);
        float _700 = _610;
        float _702 = _616;
        if (_644)
        {
            _700 = as_type<float>(_297);
        }
        int _704 = as_type<int>(_700);
        float _706 = fma(_582, 0.88622701168060302734375, _694);
        float _708 = abs(_678);
        float _710 = log2(_708);
        float _712 = fma(_584, 0.88622701168060302734375, _696);
        float _714 = fma(_614, _662, _698);
        float _716 = fma(_596, _662, _706);
        int _718 = _274 + as_type<int>(_138);
        float _720 = fma(_620, _662, _712);
        float _722 = _688 * 1.5;
        float _724 = log2(_690);
        float _726 = _710 * 1.5;
        float _728 = exp2(_722);
        float _730 = exp2(_726);
        float _732 = _724 * (-0.0199999995529651641845703125);
        float _734 = _728 * 12.56637096405029296875;
        float _736 = _142 * 1.02332699298858642578125;
        float _738 = fma(_572, _736, _668);
        float _740 = 1.0 / _734;
        float _742 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
        float _744 = fma(_742, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _746 = _730 * 12.56637096405029296875;
        float _748 = fma(_574, _736, _670);
        float _750 = _586 * _638;
        float _752 = fma(_576, _736, _680);
        float _754 = _351 * _732;
        float _756 = precise::max(0.0, _738);
        float _758 = 1.0 / _746;
        float _760 = fma(_580, 0.88622701168060302734375, _750);
        float _762 = _648 * _754;
        float _764 = precise::max(0.0, _748);
        float _766 = fma(_616, _736, _714);
        float _768 = fma(_594, _662, _760);
        float _770 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _772 = _359 + _770;
        float _774 = precise::max(0.0, _752);
        float _776 = 1.0 / _351;
        float _778 = _744 * _740;
        float _780 = fma(_622, _736, _768);
        float _782 = fma(_624, _736, _716);
        float _784 = fma(_626, _736, _720);
        float _786 = _766 * 0.31830990314483642578125;
        float _788 = precise::clamp(_786, 0.0, 1.0);
        int _790 = _704;
        if (_644)
        {
            _702 = as_type<float>(_299);
        }
        int _792 = as_type<int>(_702);
        float _794 = _744 * _758;
        float _796 = precise::max(0.0, _780);
        float _798 = _788 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _800 = precise::clamp(_798, 0.0, 1.0);
        float _802 = precise::max(0.0, _782);
        float _804 = precise::max(0.0, _784);
        float _806 = _772 * _776;
        float _808 = precise::clamp(_806, 0.0, 1.0);
        float _810 = fma(_604, _662, _692);
        float _812 = -_646;
        float _814 = _812 + 1.0;
        float _816 = _762 * _808;
        float _818 = fma(_606, _736, _810);
        float _820 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _822 = _814 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _824 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _826 = _818 * 0.31830990314483642578125;
        float _828 = precise::clamp(_826, 0.0, 1.0);
        float _830 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _832 = _756 * _820;
        float _834 = _764 * _824;
        float _836 = precise::min(_828, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _838 = _774 * _830;
        float _840 = _836 * 0.88622701168060302734375;
        float _842 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].x, _832);
        float _844 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].y, _834);
        float _846 = fma(_840, (*spvDescriptorSet0.cp_c3)._m0[9].z, _838);
        float _848 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
        float _850 = fma(_796, _800, _842);
        float _852 = fma(_802, _800, _844);
        float _854 = fma(_804, _800, _846);
        float _856 = _800;
        int _858 = _792;
        if (_644)
        {
            _856 = as_type<float>(_301);
        }
        int _860 = as_type<int>(_856);
        float _862 = _848 * _778;
        float _864 = _850 * _794;
        float _866 = _852 * _794;
        float _868 = _854 * _794;
        float _870 = _351 * _848;
        float _872 = fma(_862, (*spvDescriptorSet0.cp_c3)._m0[7].x, _864);
        float _874 = fma(_862, (*spvDescriptorSet0.cp_c3)._m0[7].y, _866);
        float _876 = fma(_862, (*spvDescriptorSet0.cp_c3)._m0[7].z, _868);
        float _878 = _848 * _632;
        float _880 = _848 * _634;
        float _882 = _848 * _636;
        float _884 = _872 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _886 = _874 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _888 = _876 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _890 = _718 << 2;
        int _892 = _890 + 1024;
        uint _894 = uint(int(uint(_892) >> uint(2)));
        _26[int(_894)] = as_type<uint>(_870);
        float _896 = _862;
        int _898 = _860;
        if (_644)
        {
            _896 = as_type<float>(_303);
        }
        int _900 = as_type<int>(_896);
        int _902 = _718 << 4;
        int _904 = _902 + 1280;
        uint _906 = uint(int(uint(_904) >> uint(2)));
        _26[int(_906)] = as_type<uint>(_884);
        int _908 = _902 + 1284;
        uint _910 = uint(int(uint(_908) >> uint(2)));
        _26[int(_910)] = as_type<uint>(_886);
        int _912 = _902 + 1288;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        _26[int(_914)] = as_type<uint>(_888);
        int _916 = _902 + 1292;
        uint _918 = uint(int(uint(_916) >> uint(2)));
        _26[int(_918)] = as_type<uint>(_816);
        int _920 = _718 << 4;
        uint _922 = uint(int(uint(_920) >> uint(2)));
        _26[int(_922)] = as_type<uint>(_878);
        int _924 = _920 + 4;
        uint _926 = uint(int(uint(_924) >> uint(2)));
        _26[int(_926)] = as_type<uint>(_880);
        int _928 = _920 + 8;
        uint _930 = uint(int(uint(_928) >> uint(2)));
        _26[int(_930)] = as_type<uint>(_882);
        int _932 = _920 + 12;
        uint _934 = uint(int(uint(_932) >> uint(2)));
        _26[int(_934)] = as_type<uint>(_822);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _936 = _900;
        if (!_644)
        {
            int _938 = _274 << 4;
            int _940 = _938 + 1280;
            uint _942 = uint(int(uint(_940) >> uint(2)));
            float _944 = as_type<float>(_26[int(_942)]);
            int _946 = _938 + 1284;
            uint _948 = uint(int(uint(_946) >> uint(2)));
            float _950 = as_type<float>(_26[int(_948)]);
            int _952 = _938 + 1288;
            uint _954 = uint(int(uint(_952) >> uint(2)));
            float _956 = as_type<float>(_26[int(_954)]);
            int _958 = _938 + 1292;
            uint _960 = uint(int(uint(_958) >> uint(2)));
            float _962 = as_type<float>(_26[int(_960)]);
            int _964 = _274 << 4;
            int _966 = _964 + 1296;
            uint _968 = uint(int(uint(_966) >> uint(2)));
            float _970 = as_type<float>(_26[int(_968)]);
            int _972 = _964 + 1300;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            float _976 = as_type<float>(_26[int(_974)]);
            int _978 = _964 + 1304;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            float _982 = as_type<float>(_26[int(_980)]);
            int _984 = _964 + 1308;
            uint _986 = uint(int(uint(_984) >> uint(2)));
            float _988 = as_type<float>(_26[int(_986)]);
            int _990 = _274 << 4;
            int _992 = _990 + 1312;
            uint _994 = uint(int(uint(_992) >> uint(2)));
            float _996 = as_type<float>(_26[int(_994)]);
            int _998 = _990 + 1316;
            uint _1000 = uint(int(uint(_998) >> uint(2)));
            float _1002 = as_type<float>(_26[int(_1000)]);
            int _1004 = _990 + 1320;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            float _1008 = as_type<float>(_26[int(_1006)]);
            int _1010 = _990 + 1324;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_26[int(_1012)]);
            int _1016 = _274 << 4;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_26[int(_1018)]);
            int _1022 = _1016 + 4;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_26[int(_1024)]);
            int _1028 = _1016 + 8;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_26[int(_1030)]);
            int _1034 = _1016 + 12;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_26[int(_1036)]);
            int _1040 = _274 << 4;
            int _1042 = _1040 + 16;
            uint _1044 = uint(int(uint(_1042) >> uint(2)));
            float _1046 = as_type<float>(_26[int(_1044)]);
            int _1048 = _1040 + 20;
            uint _1050 = uint(int(uint(_1048) >> uint(2)));
            float _1052 = as_type<float>(_26[int(_1050)]);
            int _1054 = _1040 + 24;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            float _1058 = as_type<float>(_26[int(_1056)]);
            int _1060 = _1040 + 28;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_26[int(_1062)]);
            int _1066 = _274 << 4;
            int _1068 = _1066 + 1328;
            uint _1070 = uint(int(uint(_1068) >> uint(2)));
            float _1072 = as_type<float>(_26[int(_1070)]);
            int _1074 = _1066 + 1332;
            uint _1076 = uint(int(uint(_1074) >> uint(2)));
            float _1078 = as_type<float>(_26[int(_1076)]);
            int _1080 = _1066 + 1336;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            float _1084 = as_type<float>(_26[int(_1082)]);
            int _1086 = _1066 + 1340;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_26[int(_1088)]);
            float _1092 = as_type<float>(_299) + _962;
            float _1094 = -_1092;
            float _1096 = exp2(_1094);
            float _1098 = _1092 + _988;
            float _1100 = _1098 + _1014;
            float _1102 = -_1098;
            float _1104 = exp2(_1102);
            float _1106 = -_944;
            float _1108 = _1106 + _1020;
            float _1110 = -_950;
            float _1112 = _1110 + _1026;
            float _1114 = -_956;
            float _1116 = _1114 + _1032;
            float _1118 = -_970;
            float _1120 = _1118 + _1046;
            float _1122 = -_976;
            float _1124 = _1122 + _1052;
            float _1126 = -_1096;
            float _1128 = _1126 + 1.0;
            float _1130 = -_1100;
            float _1132 = exp2(_1130);
            int _1134 = _274 << 4;
            int _1136 = _1134 + 32;
            uint _1138 = uint(int(uint(_1136) >> uint(2)));
            float _1140 = as_type<float>(_26[int(_1138)]);
            int _1142 = _1134 + 36;
            uint _1144 = uint(int(uint(_1142) >> uint(2)));
            float _1146 = as_type<float>(_26[int(_1144)]);
            int _1148 = _1134 + 40;
            uint _1150 = uint(int(uint(_1148) >> uint(2)));
            float _1152 = as_type<float>(_26[int(_1150)]);
            int _1154 = _1134 + 44;
            uint _1156 = uint(int(uint(_1154) >> uint(2)));
            float _1158 = as_type<float>(_26[int(_1156)]);
            float _1160 = _1100 + _1090;
            float _1162 = precise::min(_1128, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1164 = -_1104;
            float _1166 = _1164 + 1.0;
            float _1168 = -_305;
            float _1170 = _1162 + _1168;
            float _1172 = precise::min(_1166, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1174 = _1170 * _1038;
            float _1176 = _1108 * _1174;
            float _1178 = _1112 * _1174;
            float _1180 = _1116 * _1174;
            float _1182 = fma(_944, _1170, _1176);
            float _1184 = -_1162;
            float _1186 = _1184 + _1172;
            float _1188 = fma(_956, _1170, _1180);
            float _1190 = -_1132;
            float _1192 = _1190 + 1.0;
            int _1194 = _274 << 4;
            int _1196 = _1194 + 48;
            uint _1198 = uint(int(uint(_1196) >> uint(2)));
            float _1200 = as_type<float>(_26[int(_1198)]);
            int _1202 = _1194 + 52;
            uint _1204 = uint(int(uint(_1202) >> uint(2)));
            float _1206 = as_type<float>(_26[int(_1204)]);
            int _1208 = _1194 + 56;
            uint _1210 = uint(int(uint(_1208) >> uint(2)));
            float _1212 = as_type<float>(_26[int(_1210)]);
            int _1214 = _1194 + 60;
            uint _1216 = uint(int(uint(_1214) >> uint(2)));
            float _1218 = as_type<float>(_26[int(_1216)]);
            float _1220 = _1186 * _1064;
            float _1222 = fma(_950, _1170, _1178);
            float _1224 = -_982;
            float _1226 = _1224 + _1058;
            int _1228 = _274 << 2;
            int _1230 = _1228 + 1032;
            uint _1232 = uint(int(uint(_1230) >> uint(2)));
            float _1234 = as_type<float>(_26[int(_1232)]);
            float _1236 = _1120 * _1220;
            float _1238 = _1124 * _1220;
            float _1240 = precise::min(_1192, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1242 = _274 << 2;
            int _1244 = _1242 + 1024;
            uint _1246 = uint(int(uint(_1244) >> uint(2)));
            float _1248 = as_type<float>(_26[int(_1246)]);
            float _1250 = fma(_970, _1186, _1236);
            float _1252 = fma(_976, _1186, _1238);
            float _1254 = -_1160;
            float _1256 = exp2(_1254);
            int _1258 = _274 << 2;
            int _1260 = _1258 + 1028;
            uint _1262 = uint(int(uint(_1260) >> uint(2)));
            float _1264 = as_type<float>(_26[int(_1262)]);
            float _1266 = -_1172;
            float _1268 = _1266 + _1240;
            float _1270 = _1226 * _1220;
            float _1272 = -_996;
            float _1274 = _1272 + _1140;
            float _1276 = _1268 * _1158;
            int _1278 = _274 << 2;
            int _1280 = _1278 + 1036;
            uint _1282 = uint(int(uint(_1280) >> uint(2)));
            float _1284 = as_type<float>(_26[int(_1282)]);
            float _1286 = -_1002;
            float _1288 = _1286 + _1146;
            float _1290 = -_1008;
            float _1292 = _1290 + _1152;
            float _1294 = _1274 * _1276;
            float _1296 = _1288 * _1276;
            float _1298 = fma(_982, _1186, _1270);
            float _1300 = _1292 * _1276;
            float _1302 = _1222 + as_type<float>(_303);
            float _1304 = -_1256;
            float _1306 = _1304 + 1.0;
            float _1308 = fma(_1002, _1268, _1296);
            float _1310 = fma(_1008, _1268, _1300);
            float _1312 = _1182 + as_type<float>(_297);
            float _1314 = _1188 + as_type<float>(_301);
            float _1316 = precise::min(_1306, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1318 = _1302 + _1252;
            float _1320 = fma(_996, _1268, _1294);
            float _1322 = _1312 + _1250;
            float _1324 = _1314 + _1298;
            float _1326 = -_1240;
            float _1328 = _1316 + _1326;
            float _1330 = _1318 + _1308;
            float _1332 = _1322 + _1320;
            float _1334 = -_1072;
            float _1336 = _1334 + _1200;
            float _1338 = _1328 * _1218;
            float _1340 = -_1078;
            float _1342 = _1340 + _1206;
            float _1344 = -_1084;
            float _1346 = _1344 + _1212;
            float _1348 = _1324 + _1310;
            int _1350 = _274 << 4;
            int _1352 = _1350 + 1280;
            uint _1354 = uint(int(uint(_1352) >> uint(2)));
            _26[int(_1354)] = as_type<uint>(_1312);
            int _1356 = _1350 + 1284;
            uint _1358 = uint(int(uint(_1356) >> uint(2)));
            _26[int(_1358)] = as_type<uint>(_1302);
            int _1360 = _1350 + 1288;
            uint _1362 = uint(int(uint(_1360) >> uint(2)));
            _26[int(_1362)] = as_type<uint>(_1314);
            int _1364 = _1350 + 1292;
            uint _1366 = uint(int(uint(_1364) >> uint(2)));
            _26[int(_1366)] = as_type<uint>(_1092);
            float _1368 = _1342 * _1338;
            float _1370 = _1346 * _1338;
            float _1372 = _1248 + _307;
            float _1374 = _1336 * _1338;
            float _1376 = fma(_1078, _1328, _1368);
            float _1378 = fma(_1084, _1328, _1370);
            float _1380 = _1372 + _1264;
            float _1382 = fma(_1072, _1328, _1374);
            float _1384 = _1376 + _1330;
            float _1386 = _1378 + _1348;
            float _1388 = _1380 + _1234;
            float _1390 = _1382 + _1332;
            int _1392 = _274 << 4;
            int _1394 = _1392 + 1296;
            uint _1396 = uint(int(uint(_1394) >> uint(2)));
            _26[int(_1396)] = as_type<uint>(_1322);
            int _1398 = _1392 + 1300;
            uint _1400 = uint(int(uint(_1398) >> uint(2)));
            _26[int(_1400)] = as_type<uint>(_1318);
            int _1402 = _1392 + 1304;
            uint _1404 = uint(int(uint(_1402) >> uint(2)));
            _26[int(_1404)] = as_type<uint>(_1324);
            int _1406 = _1392 + 1308;
            uint _1408 = uint(int(uint(_1406) >> uint(2)));
            _26[int(_1408)] = as_type<uint>(_1098);
            float _1410 = _1388 + _1284;
            int _1412 = _274 << 4;
            int _1414 = _1412 + 1312;
            uint _1416 = uint(int(uint(_1414) >> uint(2)));
            _26[int(_1416)] = as_type<uint>(_1332);
            int _1418 = _1412 + 1316;
            uint _1420 = uint(int(uint(_1418) >> uint(2)));
            _26[int(_1420)] = as_type<uint>(_1330);
            int _1422 = _1412 + 1320;
            uint _1424 = uint(int(uint(_1422) >> uint(2)));
            _26[int(_1424)] = as_type<uint>(_1348);
            int _1426 = _1412 + 1324;
            uint _1428 = uint(int(uint(_1426) >> uint(2)));
            _26[int(_1428)] = as_type<uint>(_1100);
            int _1430 = _274 << 2;
            int _1432 = _1430 + 1024;
            uint _1434 = uint(int(uint(_1432) >> uint(2)));
            _26[int(_1434)] = as_type<uint>(_1372);
            int _1436 = _274 << 2;
            int _1438 = _1436 + 1028;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            _26[int(_1440)] = as_type<uint>(_1380);
            int _1442 = _274 << 2;
            int _1444 = _1442 + 1032;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            _26[int(_1446)] = as_type<uint>(_1388);
            int _1448 = _274 << 2;
            int _1450 = _1448 + 1036;
            uint _1452 = uint(int(uint(_1450) >> uint(2)));
            _26[int(_1452)] = as_type<uint>(_1410);
            int _1454 = _274 << 4;
            int _1456 = _1454 + 1328;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            _26[int(_1458)] = as_type<uint>(_1390);
            int _1460 = _1454 + 1332;
            uint _1462 = uint(int(uint(_1460) >> uint(2)));
            _26[int(_1462)] = as_type<uint>(_1384);
            int _1464 = _1454 + 1336;
            uint _1466 = uint(int(uint(_1464) >> uint(2)));
            _26[int(_1466)] = as_type<uint>(_1386);
            int _1468 = _1454 + 1340;
            uint _1470 = uint(int(uint(_1468) >> uint(2)));
            _26[int(_1470)] = as_type<uint>(_1160);
            _423 = _1316;
            _425 = _1410;
            _790 = as_type<int>(_1390);
            _936 = as_type<int>(_1384);
            _898 = as_type<int>(_1386);
            _858 = as_type<int>(_1160);
        }
        float _1472 = _423;
        float _1474 = _425;
        int _1476 = _790;
        int _1478 = _936;
        int _1480 = _898;
        int _1482 = _858;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1484 = _718 << 4;
        int _1486 = _1484 + 1280;
        uint _1488 = uint(int(uint(_1486) >> uint(2)));
        float _1490 = as_type<float>(_26[int(_1488)]);
        int _1492 = _1484 + 1284;
        uint _1494 = uint(int(uint(_1492) >> uint(2)));
        float _1496 = as_type<float>(_26[int(_1494)]);
        int _1498 = _1484 + 1288;
        uint _1500 = uint(int(uint(_1498) >> uint(2)));
        float _1502 = as_type<float>(_26[int(_1500)]);
        int _1504 = _1484 + 1292;
        uint _1506 = uint(int(uint(_1504) >> uint(2)));
        float _1508 = as_type<float>(_26[int(_1506)]);
        float _1510 = -(*spvDescriptorSet0.cp_c3)._m0[13].y;
        float _1512 = _359 + _1510;
        float _1514 = 1.0 / _359;
        int _1516 = _718 << 2;
        int _1518 = _1516 + 1024;
        uint _1520 = uint(int(uint(_1518) >> uint(2)));
        float _1522 = as_type<float>(_26[int(_1520)]);
        float _1524 = _1512 * (*spvDescriptorSet0.cp_c3)._m0[13].z;
        float _1526 = precise::clamp(_1524, 0.0, 1.0);
        float _1528 = abs(_1526);
        float _1530 = log2(_1528);
        float _1532 = _1530 * (*spvDescriptorSet0.cp_c3)._m0[13].w;
        float _1534 = exp2(_1532);
        float _1536 = -_1508;
        float _1538 = exp2(_1536);
        float _1540 = _1534 * (*spvDescriptorSet0.cp_c3)._m0[14].w;
        float _1542 = precise::max(_1538, _272);
        float _1544 = -_1542;
        float _1546 = _1544 + 1.0;
        float _1548 = -_1540;
        float _1550 = _1548 + 1.0;
        float _1552 = 1.0 / _1546;
        bool _1554 = _1550 > _1546;
        bool _1556 = isnan(_1550);
        bool _1558 = _1554 || _1556;
        bool _1560 = isnan(_1546);
        bool _1562 = _1558 || _1560;
        float _1564 = _1550 * _1552;
        bool _1566 = !_1562;
        float _1568 = _1566 ? _1564 : 1.0;
        float _1570 = _1490 * _1568;
        float _1572 = _1496 * _1568;
        float _1574 = _1502 * _1568;
        float _1576 = _1522 * _1514;
        float _1578 = fma(_1546, _1568, _1540);
        float _1580 = precise::clamp(_1578, 0.0, 1.0);
        float _1582 = fma(_1540, (*spvDescriptorSet0.cp_c3)._m0[14].x, _1570);
        float _1584 = fma(_1540, (*spvDescriptorSet0.cp_c3)._m0[14].y, _1572);
        float _1586 = fma(_1540, (*spvDescriptorSet0.cp_c3)._m0[14].z, _1574);
        float _1588 = -_1580;
        float _1590 = _1588 + 1.0;
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1582, _1584, _1586, _1590), uint3(int3(_72, _66, int(_293))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1576, _1576, _1576, _1576), uint3(int3(_72, _66, int(_293))));
        int _1592 = int(_293) + 4;
        bool _1594 = uint(_1592) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _277 = uint(_1592);
        _279 = _1590;
        _281 = _1476;
        _283 = _1482;
        _285 = _1480;
        _287 = _1478;
        _289 = _1472;
        _291 = _1474;
        if (_1594)
        {
            _1596 = true;
            if (_1596)
            {
                break;
            }
        }
    } while (true);
    _1596 = false;
}

