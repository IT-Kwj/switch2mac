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
    bool _1540 = false;
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
    float _268 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, 1.0);
    float _270 = sqrt(_260);
    int _272 = _258 << 2;
    float _274 = -(*spvDescriptorSet0.cp_c3)._m0[8].y;
    float _276 = _274 + 1.0;
    float _278 = fma(_268, 3.0, _268);
    uint _281 = as_type<uint>(_138);
    float _283 = 0.0;
    int _285 = 0;
    int _287 = 0;
    int _289 = 0;
    int _291 = 0;
    float _293 = 0.0;
    float _295 = 0.0;
    do
    {
        uint _297 = _281;
        float _299 = _283;
        int _301 = _285;
        int _303 = _287;
        int _305 = _289;
        int _307 = _291;
        float _309 = _293;
        float _311 = _295;
        float _313 = abs((*spvDescriptorSet0.cp_c4)._m0[1].x);
        float _315 = log2(_313);
        float _317 = float(_297);
        float _319 = _270 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        int _321 = int(_297) + 1;
        float _323 = _142 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _325 = float(uint(_321));
        float _327 = _315 * (*spvDescriptorSet0.cp_c4)._m0[0].z;
        float _329 = _317 * _327;
        float _331 = _325 * _327;
        float _333 = exp2(_329);
        float _335 = exp2(_331);
        float _337 = _333 + (-1.0);
        float _339 = _337 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
        float _341 = _335 + (-1.0);
        float _343 = _270 * _339;
        float _345 = -_339;
        float _347 = fma(_341, (*spvDescriptorSet0.cp_c3)._m0[8].z, _345);
        float _349 = _144 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _351 = fma(_343, _323, (*spvDescriptorSet0.cp_c3)._m0[3].x);
        float _353 = _347 * _319;
        float _355 = fma(_343, _349, (*spvDescriptorSet0.cp_c3)._m0[3].z);
        float _357 = fma(_142, _353, _351);
        float _359 = fma(_144, _353, _355);
        float _361 = fma(_357, 6.2500002968590706586837768554688e-05, 0.5);
        float _363 = fma(_359, 6.2500002968590706586837768554688e-05, 0.5);
        float3 _2017 = float3(_361, _363, float(0));
        float3 _2021 = select(_2017, float3(0.0), isnan(_2017));
        float4 _366 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2021.xy, uint(rint(_2021.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2021.xy, uint(rint(_2021.z)), level(0.0)).xyzw;
        float _368 = _366.x;
        float _370 = _366.y;
        float _372 = _366.z;
        float _374 = _366.w;
        float3 _2036 = float3(_361, _363, float(1));
        float3 _2038 = select(_2036, float3(0.0), isnan(_2036));
        float4 _376 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2038.xy, uint(rint(_2038.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2038.xy, uint(rint(_2038.z)), level(0.0)).xyzw;
        float _378 = _376.x;
        float _380 = _376.y;
        float _382 = _376.z;
        float _384 = _376.w;
        float _386 = -(*spvDescriptorSet0.cp_c3)._m0[3].z;
        float _388 = _359 + _386;
        float _390 = -(*spvDescriptorSet0.cp_c3)._m0[3].x;
        float _392 = _357 + _390;
        float _394 = _339 + _347;
        float _396 = _388 * _388;
        float _398 = _146 * _353;
        float _400 = _394 * _319;
        float _402 = fma(_392, _392, _396);
        float _404 = _146 * (*spvDescriptorSet0.cp_c4)._m0[1].y;
        float _406 = _146 * 1.02332699298858642578125;
        float _408 = sqrt(_402);
        float _410 = fma((*spvDescriptorSet0.cp_c3)._m0[6].w, 0.07999999821186065673828125, 0.0199999995529651641845703125);
        float _412 = fma(_343, _404, (*spvDescriptorSet0.cp_c3)._m0[3].y);
        float _414 = _410 * 100.0;
        float _416 = _412 + _398;
        float _418 = 1.0 / _410;
        bool _420 = _408 > (*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _422 = exp2(_414);
        float _424 = _299;
        float _426 = _412;
        float _428 = _388;
        float _430 = _404;
        float _432 = _339;
        float _434 = _309;
        float _436 = _311;
        if (_420)
        {
            float _438 = 1.0 / (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _424 = _438;
        }
        float _440 = _424;
        float _442 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
        float _444 = _408 + _442;
        float _446 = _444;
        if (!_420)
        {
            _426 = _416;
        }
        float _448 = _426;
        float _450 = fma(_422, 512.0, -512.0);
        float _452 = 1.0 / _450;
        float _454 = _448;
        if (_420)
        {
            float _456 = _444 * _440;
            _446 = _456;
        }
        float _458 = _446;
        if (_420)
        {
            float _460 = _458 * 0.15915493667125701904296875;
            _428 = _460;
        }
        float _462 = _428;
        float _464 = _462;
        if (_420)
        {
            float _466 = _462 * 6.283185482025146484375;
            float _468 = cos(_466);
            _464 = _468;
        }
        float _470 = _464;
        float _472 = fma(_400, (*spvDescriptorSet0.cp_c3)._m0[11].y, (*spvDescriptorSet0.cp_c3)._m0[11].x);
        float _474 = precise::clamp(_472, 0.0, 1.0);
        float _476 = -_474;
        float _478 = _476 + 1.0;
        float _480 = _410 * 5115.0;
        float _482 = _480 * _452;
        float _484 = abs(_478);
        float _486 = log2(_484);
        if (_420)
        {
            float _488 = _470 + (-1.0);
            _430 = _488;
        }
        float _490 = _430;
        float _492 = fma(_266, -0.5, 0.5);
        float _494 = log2(_482);
        if (_420)
        {
            float _496 = _490 * (*spvDescriptorSet0.cp_c3)._m0[10].w;
            _432 = _496;
        }
        float _498 = _432;
        if (_420)
        {
            float _500 = fma(_416, _470, _498);
            _454 = _500;
        }
        float _502 = _454;
        float _504 = abs(_398);
        bool _506 = _504 > 0.00999999977648258209228515625;
        float _508 = _486 * (*spvDescriptorSet0.cp_c3)._m0[12].x;
        float _510 = -_502;
        float _512 = fma(_416, 2.0, _510);
        float _514 = _506 ? _398 : 0.00999999977648258209228515625;
        float _516 = sqrt(_492);
        float _518 = -(*spvDescriptorSet0.cp_c3)._m0[3].w;
        float _520 = _512 + _518;
        float _522 = _410 * _514;
        float _524 = fma(_494, _418, 100.0);
        float _526 = precise::max(0.0, _520);
        float _528 = exp2(_508);
        float _530 = precise::max(_522, -127.0);
        float _532 = fma(_266, 0.5, 0.5);
        float _534 = -_524;
        float _536 = _534 + _526;
        float _538 = _262 + 1.0;
        float _540 = fma(_532, -0.0187292993068695068359375, 0.07426099479198455810546875);
        float _542 = _410 * _536;
        float _544 = -_530;
        float _546 = exp2(_544);
        float _548 = fma(_532, _540, -0.212114393711090087890625);
        float _550 = _516 * 0.636619746685028076171875;
        float _552 = fma(_532, _548, 1.570728778839111328125);
        float _554 = -_262;
        float _556 = fma(_528, _538, _554);
        float _558 = -_542;
        float _560 = exp2(_558);
        float _562 = -_552;
        float _564 = fma(_550, _562, 1.0);
        float _566 = -_546;
        float _568 = _566 + 1.0;
        float _570 = 1.0 / _530;
        float _572 = _560 * _568;
        float _574 = fma(_556, 0.5, 0.5);
        float3 _2323 = float3(_361, _363, float(2));
        float3 _2325 = select(_2323, float3(0.0), isnan(_2323));
        float4 _576 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2325.xy, uint(rint(_2325.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2325.xy, uint(rint(_2325.z)), level(0.0)).xyzw;
        float _578 = _576.x;
        float _580 = _576.y;
        float _582 = _576.z;
        float _584 = _576.w;
        float3 _2340 = float3(_361, _363, float(3));
        float3 _2342 = select(_2340, float3(0.0), isnan(_2340));
        float4 _586 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2342.xy, uint(rint(_2342.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2342.xy, uint(rint(_2342.z)), level(0.0)).xyzw;
        float _588 = _586.x;
        float _590 = _586.y;
        float _592 = _586.z;
        float _594 = _586.w;
        float3 _2357 = float3(_361, _363, float(4));
        float3 _2359 = select(_2357, float3(0.0), isnan(_2357));
        float4 _596 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2359.xy, uint(rint(_2359.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2359.xy, uint(rint(_2359.z)), level(0.0)).xyzw;
        float _598 = _596.x;
        float _600 = _596.y;
        float _602 = _596.z;
        float _604 = _596.w;
        float3 _2374 = float3(_361, _363, float(6));
        float3 _2376 = select(_2374, float3(0.0), isnan(_2374));
        float4 _606 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2376.xy, uint(rint(_2376.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2376.xy, uint(rint(_2376.z)), level(0.0)).xyzw;
        float _608 = _606.x;
        float _610 = _606.y;
        float _612 = _606.z;
        float _614 = _606.w;
        float3 _2392 = float3(_361, _363, float(7));
        float3 _2394 = select(_2392, float3(0.0), isnan(_2392));
        float4 _616 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2394.xy, uint(rint(_2394.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2394.xy, uint(rint(_2394.z)), level(0.0)).xyzw;
        float _618 = _616.x;
        float _620 = _616.y;
        float _622 = _616.z;
        float _624 = _616.w;
        float _626 = _572 * _570;
        float3 _2413 = float3(_361, _363, float(5));
        float3 _2415 = select(_2413, float3(0.0), isnan(_2413));
        float4 _628 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _2415.xy, uint(rint(_2415.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _2415.xy, uint(rint(_2415.z)), level(0.0)).xyzw;
        float _630 = _628.x;
        float _632 = _628.y;
        float _634 = _628.z;
        float _636 = _628.w;
        float _638 = _374 * _406;
        float _640 = fma(_368, 0.88622701168060302734375, _638);
        float2 _2437 = float2(_564, _574);
        float3 _644 = dm_bs(spvDescriptorSet0.cp_t_tcb_E.sample(spvDescriptorSet0.cp_t_tcb_ESmplr, select(_2437, float2(0.0), isnan(_2437)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_E, spvDescriptorSet0.cp_t_tcb_ESmplr_w, select(_2437, float2(0.0), isnan(_2437)), level(0.0)).xyz;
        float _646 = _644.x;
        float _648 = _644.y;
        float _650 = _644.z;
        float _652 = _378 * _406;
        float _654 = _380 * _406;
        float _656 = _486 * (*spvDescriptorSet0.cp_c3)._m0[11].z;
        float _658 = fma(_370, 0.88622701168060302734375, _652);
        float _660 = fma(_372, 0.88622701168060302734375, _654);
        float _662 = _144 * 1.02332699298858642578125;
        float _664 = exp2(_656);
        float _666 = fma(_382, _662, _640);
        float _668 = fma(_384, _662, _658);
        float _670 = fma((*spvDescriptorSet0.cp_c3)._m0[8].x, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _672 = (*spvDescriptorSet0.cp_c3)._m0[8].x * 2.0;
        float _674 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
        float _676 = fma(_674, (*spvDescriptorSet0.cp_c3)._m0[8].x, 1.0);
        float _678 = _142 * 1.02332699298858642578125;
        bool _680 = as_type<int>(_138) != 0;
        float _682 = -_672;
        float _684 = fma(_266, _682, _670);
        float _686 = -_672;
        float _688 = _670 + _686;
        float _690 = abs(_684);
        float _692 = log2(_690);
        float _694 = abs(_688);
        float _696 = log2(_694);
        float _698 = _692 * 1.5;
        float _700 = exp2(_698);
        float _702 = _696 * 1.5;
        float _704 = exp2(_702);
        float _706 = _700 * 12.56637096405029296875;
        float _708 = 1.0 / _706;
        float _710 = _704 * 12.56637096405029296875;
        float _712 = 1.0 / _710;
        float _714 = _676 * _708;
        float _716 = _676 * _712;
        float _718 = fma((*spvDescriptorSet0.cp_c3)._m0[7].w, -0.99447572231292724609375, 1.0);
        float _720 = log2(_718);
        float _722 = _720 * (-0.0199999995529651641845703125);
        float _724 = _353 * _722;
        float _726 = _626 * _724;
        float _728 = fma(_578, _662, _660);
        float _730 = fma(_580, _678, _666);
        float _732 = _594 * _406;
        float _734 = _610 * _406;
        float _736 = fma(_584, _678, _728);
        float _738 = _620 * _406;
        float _740 = _598 * _406;
        float _742 = fma(_608, 0.88622701168060302734375, _734);
        float _744 = fma(_582, _678, _668);
        float _746 = precise::max(0.0, _736);
        float _748 = _600 * _406;
        float _750 = fma(_612, _662, _742);
        float _752 = fma(_618, 0.88622701168060302734375, _738);
        float _754 = fma(_588, 0.88622701168060302734375, _732);
        float _756 = fma(_614, _678, _750);
        float _758 = fma(_590, 0.88622701168060302734375, _740);
        float _760 = fma(_592, 0.88622701168060302734375, _748);
        float _762 = fma(_622, _662, _752);
        float _764 = _756 * 0.31830990314483642578125;
        float _766 = precise::clamp(_764, 0.0, 1.0);
        float _768 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].x);
        float _770 = fma(_602, _662, _754);
        float _772 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].y);
        float _774 = fma(_604, _662, _758);
        float _776 = precise::min((*spvDescriptorSet0.cp_c3)._m0[28].w, (*spvDescriptorSet0.cp_c3)._m0[7].z);
        float _778 = fma(_630, _662, _760);
        float _780 = precise::max(0.0, _730);
        float _782 = fma(_624, _678, _762);
        float _784 = precise::max(0.0, _744);
        float _786 = fma(_632, _678, _770);
        float _788 = precise::min(_766, (*spvDescriptorSet0.cp_c3)._m0[28].w);
        float _790 = fma(_634, _678, _774);
        float _792 = fma(_636, _678, _778);
        float _794 = _780 * _768;
        float _796 = _784 * _772;
        float _798 = _746 * _776;
        float _800 = 1.0 / _353;
        float _802 = _788 * 0.88622701168060302734375;
        float _804 = _782 * 0.31830990314483642578125;
        float _806 = precise::clamp(_804, 0.0, 1.0);
        float _808 = precise::max(0.0, _786);
        float _810 = -(*spvDescriptorSet0.cp_c3)._m0[5].w;
        float _812 = _400 + _810;
        float _814 = precise::max(0.0, _790);
        float _816 = fma(_802, (*spvDescriptorSet0.cp_c3)._m0[9].x, _794);
        float _818 = precise::max(0.0, _792);
        float _820 = fma(_802, (*spvDescriptorSet0.cp_c3)._m0[9].y, _796);
        float _822 = fma(_802, (*spvDescriptorSet0.cp_c3)._m0[9].z, _798);
        float _824 = _806 + (*spvDescriptorSet0.cp_c3)._m0[9].w;
        float _826 = precise::clamp(_824, 0.0, 1.0);
        float _828 = _278 * 0.25;
        int _830 = _272 + as_type<int>(_138);
        float _832 = fma(_808, _826, _816);
        float _834 = fma(_814, _826, _820);
        float _836 = fma(_818, _826, _822);
        float _838 = _828 * _714;
        float _840 = _832 * _716;
        float _842 = _834 * _716;
        float _844 = _836 * _716;
        float _846 = _812 * _800;
        float _848 = precise::clamp(_846, 0.0, 1.0);
        float _850 = fma(_838, (*spvDescriptorSet0.cp_c3)._m0[7].x, _840);
        float _852 = fma(_838, (*spvDescriptorSet0.cp_c3)._m0[7].y, _842);
        float _854 = fma(_838, (*spvDescriptorSet0.cp_c3)._m0[7].z, _844);
        float _856 = -_664;
        float _858 = _856 + 1.0;
        float _860 = _353 * _828;
        float _862 = _726 * _848;
        float _864 = _850 * (*spvDescriptorSet0.cp_c3)._m0[5].x;
        float _866 = _858 * (*spvDescriptorSet0.cp_c3)._m0[11].w;
        float _868 = _838;
        float _870 = _840;
        float _872 = _814;
        float _874 = _854;
        float _876 = _760;
        if (_680)
        {
            _868 = as_type<float>(_301);
        }
        int _878 = as_type<int>(_868);
        int _880 = _830 << 2;
        int _882 = _880 + 1024;
        uint _884 = uint(int(uint(_882) >> uint(2)));
        _26[int(_884)] = as_type<uint>(_860);
        int _886 = _878;
        if (_680)
        {
            _870 = as_type<float>(_303);
        }
        int _888 = as_type<int>(_870);
        int _890 = _888;
        if (_680)
        {
            _872 = as_type<float>(_305);
        }
        int _892 = as_type<int>(_872);
        float _894 = _828 * _646;
        float _896 = _828 * _648;
        float _898 = _828 * _650;
        float _900 = _852 * (*spvDescriptorSet0.cp_c3)._m0[5].y;
        float _902 = _854 * (*spvDescriptorSet0.cp_c3)._m0[5].z;
        int _904 = _892;
        if (_680)
        {
            _874 = as_type<float>(_307);
        }
        int _906 = as_type<int>(_874);
        int _908 = _830 << 4;
        uint _910 = uint(int(uint(_908) >> uint(2)));
        _26[int(_910)] = as_type<uint>(_894);
        int _912 = _908 + 4;
        uint _914 = uint(int(uint(_912) >> uint(2)));
        _26[int(_914)] = as_type<uint>(_896);
        int _916 = _908 + 8;
        uint _918 = uint(int(uint(_916) >> uint(2)));
        _26[int(_918)] = as_type<uint>(_898);
        int _920 = _908 + 12;
        uint _922 = uint(int(uint(_920) >> uint(2)));
        _26[int(_922)] = as_type<uint>(_866);
        int _924 = _830 << 4;
        int _926 = _924 + 1280;
        uint _928 = uint(int(uint(_926) >> uint(2)));
        _26[int(_928)] = as_type<uint>(_864);
        int _930 = _924 + 1284;
        uint _932 = uint(int(uint(_930) >> uint(2)));
        _26[int(_932)] = as_type<uint>(_900);
        int _934 = _924 + 1288;
        uint _936 = uint(int(uint(_934) >> uint(2)));
        _26[int(_936)] = as_type<uint>(_902);
        int _938 = _924 + 1292;
        uint _940 = uint(int(uint(_938) >> uint(2)));
        _26[int(_940)] = as_type<uint>(_862);
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _942 = _906;
        if (!_680)
        {
            int _944 = _272 << 4;
            int _946 = _944 + 1280;
            uint _948 = uint(int(uint(_946) >> uint(2)));
            float _950 = as_type<float>(_26[int(_948)]);
            int _952 = _944 + 1284;
            uint _954 = uint(int(uint(_952) >> uint(2)));
            float _956 = as_type<float>(_26[int(_954)]);
            int _958 = _944 + 1288;
            uint _960 = uint(int(uint(_958) >> uint(2)));
            float _962 = as_type<float>(_26[int(_960)]);
            int _964 = _944 + 1292;
            uint _966 = uint(int(uint(_964) >> uint(2)));
            float _968 = as_type<float>(_26[int(_966)]);
            int _970 = _272 << 4;
            int _972 = _970 + 1296;
            uint _974 = uint(int(uint(_972) >> uint(2)));
            float _976 = as_type<float>(_26[int(_974)]);
            int _978 = _970 + 1300;
            uint _980 = uint(int(uint(_978) >> uint(2)));
            float _982 = as_type<float>(_26[int(_980)]);
            int _984 = _970 + 1304;
            uint _986 = uint(int(uint(_984) >> uint(2)));
            float _988 = as_type<float>(_26[int(_986)]);
            int _990 = _970 + 1308;
            uint _992 = uint(int(uint(_990) >> uint(2)));
            float _994 = as_type<float>(_26[int(_992)]);
            int _996 = _272 << 4;
            int _998 = _996 + 1312;
            uint _1000 = uint(int(uint(_998) >> uint(2)));
            float _1002 = as_type<float>(_26[int(_1000)]);
            int _1004 = _996 + 1316;
            uint _1006 = uint(int(uint(_1004) >> uint(2)));
            float _1008 = as_type<float>(_26[int(_1006)]);
            int _1010 = _996 + 1320;
            uint _1012 = uint(int(uint(_1010) >> uint(2)));
            float _1014 = as_type<float>(_26[int(_1012)]);
            int _1016 = _996 + 1324;
            uint _1018 = uint(int(uint(_1016) >> uint(2)));
            float _1020 = as_type<float>(_26[int(_1018)]);
            int _1022 = _272 << 4;
            uint _1024 = uint(int(uint(_1022) >> uint(2)));
            float _1026 = as_type<float>(_26[int(_1024)]);
            int _1028 = _1022 + 4;
            uint _1030 = uint(int(uint(_1028) >> uint(2)));
            float _1032 = as_type<float>(_26[int(_1030)]);
            int _1034 = _1022 + 8;
            uint _1036 = uint(int(uint(_1034) >> uint(2)));
            float _1038 = as_type<float>(_26[int(_1036)]);
            int _1040 = _1022 + 12;
            uint _1042 = uint(int(uint(_1040) >> uint(2)));
            float _1044 = as_type<float>(_26[int(_1042)]);
            int _1046 = _272 << 4;
            int _1048 = _1046 + 16;
            uint _1050 = uint(int(uint(_1048) >> uint(2)));
            float _1052 = as_type<float>(_26[int(_1050)]);
            int _1054 = _1046 + 20;
            uint _1056 = uint(int(uint(_1054) >> uint(2)));
            float _1058 = as_type<float>(_26[int(_1056)]);
            int _1060 = _1046 + 24;
            uint _1062 = uint(int(uint(_1060) >> uint(2)));
            float _1064 = as_type<float>(_26[int(_1062)]);
            int _1066 = _1046 + 28;
            uint _1068 = uint(int(uint(_1066) >> uint(2)));
            float _1070 = as_type<float>(_26[int(_1068)]);
            int _1072 = _272 << 4;
            int _1074 = _1072 + 1328;
            uint _1076 = uint(int(uint(_1074) >> uint(2)));
            float _1078 = as_type<float>(_26[int(_1076)]);
            int _1080 = _1072 + 1332;
            uint _1082 = uint(int(uint(_1080) >> uint(2)));
            float _1084 = as_type<float>(_26[int(_1082)]);
            int _1086 = _1072 + 1336;
            uint _1088 = uint(int(uint(_1086) >> uint(2)));
            float _1090 = as_type<float>(_26[int(_1088)]);
            int _1092 = _1072 + 1340;
            uint _1094 = uint(int(uint(_1092) >> uint(2)));
            float _1096 = as_type<float>(_26[int(_1094)]);
            float _1098 = as_type<float>(_307) + _968;
            float _1100 = -_1098;
            float _1102 = exp2(_1100);
            float _1104 = _1098 + _994;
            float _1106 = _1104 + _1020;
            float _1108 = -_1104;
            float _1110 = exp2(_1108);
            float _1112 = -_950;
            float _1114 = _1112 + _1026;
            float _1116 = -_956;
            float _1118 = _1116 + _1032;
            float _1120 = -_962;
            float _1122 = _1120 + _1038;
            float _1124 = -_982;
            float _1126 = _1124 + _1058;
            float _1128 = -_976;
            float _1130 = _1128 + _1052;
            float _1132 = -_988;
            float _1134 = _1132 + _1064;
            float _1136 = -_1102;
            float _1138 = _1136 + 1.0;
            float _1140 = _1106 + _1096;
            int _1142 = _272 << 4;
            int _1144 = _1142 + 32;
            uint _1146 = uint(int(uint(_1144) >> uint(2)));
            float _1148 = as_type<float>(_26[int(_1146)]);
            int _1150 = _1142 + 36;
            uint _1152 = uint(int(uint(_1150) >> uint(2)));
            float _1154 = as_type<float>(_26[int(_1152)]);
            int _1156 = _1142 + 40;
            uint _1158 = uint(int(uint(_1156) >> uint(2)));
            float _1160 = as_type<float>(_26[int(_1158)]);
            int _1162 = _1142 + 44;
            uint _1164 = uint(int(uint(_1162) >> uint(2)));
            float _1166 = as_type<float>(_26[int(_1164)]);
            float _1168 = precise::min(_1138, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1170 = -_1110;
            float _1172 = _1170 + 1.0;
            float _1174 = -_1106;
            float _1176 = exp2(_1174);
            float _1178 = -_309;
            float _1180 = _1168 + _1178;
            float _1182 = precise::min(_1172, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1184 = _1180 * _1044;
            float _1186 = -_1168;
            float _1188 = _1186 + _1182;
            float _1190 = _1114 * _1184;
            float _1192 = _1118 * _1184;
            float _1194 = _1122 * _1184;
            float _1196 = _1188 * _1070;
            float _1198 = fma(_950, _1180, _1190);
            float _1200 = fma(_956, _1180, _1192);
            float _1202 = fma(_962, _1180, _1194);
            float _1204 = -_1176;
            float _1206 = _1204 + 1.0;
            float _1208 = _1126 * _1196;
            int _1210 = _272 << 4;
            int _1212 = _1210 + 48;
            uint _1214 = uint(int(uint(_1212) >> uint(2)));
            float _1216 = as_type<float>(_26[int(_1214)]);
            int _1218 = _1210 + 52;
            uint _1220 = uint(int(uint(_1218) >> uint(2)));
            float _1222 = as_type<float>(_26[int(_1220)]);
            int _1224 = _1210 + 56;
            uint _1226 = uint(int(uint(_1224) >> uint(2)));
            float _1228 = as_type<float>(_26[int(_1226)]);
            int _1230 = _1210 + 60;
            uint _1232 = uint(int(uint(_1230) >> uint(2)));
            float _1234 = as_type<float>(_26[int(_1232)]);
            float _1236 = _1130 * _1196;
            float _1238 = _1134 * _1196;
            float _1240 = precise::min(_1206, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            int _1242 = _272 << 2;
            int _1244 = _1242 + 1024;
            uint _1246 = uint(int(uint(_1244) >> uint(2)));
            float _1248 = as_type<float>(_26[int(_1246)]);
            float _1250 = fma(_976, _1188, _1236);
            float _1252 = fma(_982, _1188, _1208);
            float _1254 = -_1140;
            float _1256 = exp2(_1254);
            int _1258 = _272 << 2;
            int _1260 = _1258 + 1028;
            uint _1262 = uint(int(uint(_1260) >> uint(2)));
            float _1264 = as_type<float>(_26[int(_1262)]);
            float _1266 = -_1182;
            float _1268 = _1266 + _1240;
            float _1270 = fma(_988, _1188, _1238);
            float _1272 = _1198 + as_type<float>(_301);
            int _1274 = _272 << 2;
            int _1276 = _1274 + 1032;
            uint _1278 = uint(int(uint(_1276) >> uint(2)));
            float _1280 = as_type<float>(_26[int(_1278)]);
            float _1282 = _1202 + as_type<float>(_305);
            float _1284 = -_1002;
            float _1286 = _1284 + _1148;
            float _1288 = _1268 * _1166;
            int _1290 = _272 << 2;
            int _1292 = _1290 + 1036;
            uint _1294 = uint(int(uint(_1292) >> uint(2)));
            float _1296 = as_type<float>(_26[int(_1294)]);
            float _1298 = -_1008;
            float _1300 = _1298 + _1154;
            float _1302 = -_1014;
            float _1304 = _1302 + _1160;
            float _1306 = _1286 * _1288;
            float _1308 = _1282 + _1270;
            float _1310 = _1300 * _1288;
            float _1312 = _1304 * _1288;
            float _1314 = -_1256;
            float _1316 = _1314 + 1.0;
            float _1318 = fma(_1002, _1268, _1306);
            float _1320 = _1272 + _1250;
            float _1322 = fma(_1014, _1268, _1312);
            float _1324 = _1200 + as_type<float>(_303);
            float _1326 = precise::min(_1316, (*spvDescriptorSet0.cp_c3)._m0[8].y);
            float _1328 = _1320 + _1318;
            float _1330 = _1308 + _1322;
            float _1332 = fma(_1008, _1268, _1310);
            float _1334 = _1324 + _1252;
            float _1336 = -_1240;
            float _1338 = _1326 + _1336;
            int _1340 = _272 << 4;
            int _1342 = _1340 + 1280;
            uint _1344 = uint(int(uint(_1342) >> uint(2)));
            _26[int(_1344)] = as_type<uint>(_1272);
            int _1346 = _1340 + 1284;
            uint _1348 = uint(int(uint(_1346) >> uint(2)));
            _26[int(_1348)] = as_type<uint>(_1324);
            int _1350 = _1340 + 1288;
            uint _1352 = uint(int(uint(_1350) >> uint(2)));
            _26[int(_1352)] = as_type<uint>(_1282);
            int _1354 = _1340 + 1292;
            uint _1356 = uint(int(uint(_1354) >> uint(2)));
            _26[int(_1356)] = as_type<uint>(_1098);
            float _1358 = _1334 + _1332;
            int _1360 = _272 << 4;
            int _1362 = _1360 + 1296;
            uint _1364 = uint(int(uint(_1362) >> uint(2)));
            _26[int(_1364)] = as_type<uint>(_1320);
            int _1366 = _1360 + 1300;
            uint _1368 = uint(int(uint(_1366) >> uint(2)));
            _26[int(_1368)] = as_type<uint>(_1334);
            int _1370 = _1360 + 1304;
            uint _1372 = uint(int(uint(_1370) >> uint(2)));
            _26[int(_1372)] = as_type<uint>(_1308);
            int _1374 = _1360 + 1308;
            uint _1376 = uint(int(uint(_1374) >> uint(2)));
            _26[int(_1376)] = as_type<uint>(_1104);
            float _1378 = -_1078;
            float _1380 = _1378 + _1216;
            float _1382 = _1338 * _1234;
            float _1384 = -_1084;
            float _1386 = _1384 + _1222;
            float _1388 = -_1090;
            float _1390 = _1388 + _1228;
            float _1392 = _1248 + _311;
            float _1394 = _1380 * _1382;
            float _1396 = _1386 * _1382;
            float _1398 = _1390 * _1382;
            float _1400 = _1392 + _1264;
            float _1402 = fma(_1078, _1338, _1394);
            float _1404 = fma(_1084, _1338, _1396);
            float _1406 = fma(_1090, _1338, _1398);
            float _1408 = _1400 + _1280;
            float _1410 = _1402 + _1328;
            float _1412 = _1404 + _1358;
            float _1414 = _1406 + _1330;
            float _1416 = _1408 + _1296;
            int _1418 = _272 << 4;
            int _1420 = _1418 + 1312;
            uint _1422 = uint(int(uint(_1420) >> uint(2)));
            _26[int(_1422)] = as_type<uint>(_1328);
            int _1424 = _1418 + 1316;
            uint _1426 = uint(int(uint(_1424) >> uint(2)));
            _26[int(_1426)] = as_type<uint>(_1358);
            int _1428 = _1418 + 1320;
            uint _1430 = uint(int(uint(_1428) >> uint(2)));
            _26[int(_1430)] = as_type<uint>(_1330);
            int _1432 = _1418 + 1324;
            uint _1434 = uint(int(uint(_1432) >> uint(2)));
            _26[int(_1434)] = as_type<uint>(_1106);
            int _1436 = _272 << 2;
            int _1438 = _1436 + 1024;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            _26[int(_1440)] = as_type<uint>(_1392);
            int _1442 = _272 << 2;
            int _1444 = _1442 + 1028;
            uint _1446 = uint(int(uint(_1444) >> uint(2)));
            _26[int(_1446)] = as_type<uint>(_1400);
            int _1448 = _272 << 2;
            int _1450 = _1448 + 1032;
            uint _1452 = uint(int(uint(_1450) >> uint(2)));
            _26[int(_1452)] = as_type<uint>(_1408);
            int _1454 = _272 << 2;
            int _1456 = _1454 + 1036;
            uint _1458 = uint(int(uint(_1456) >> uint(2)));
            _26[int(_1458)] = as_type<uint>(_1416);
            int _1460 = _272 << 4;
            int _1462 = _1460 + 1328;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            _26[int(_1464)] = as_type<uint>(_1410);
            int _1466 = _1460 + 1332;
            uint _1468 = uint(int(uint(_1466) >> uint(2)));
            _26[int(_1468)] = as_type<uint>(_1412);
            int _1470 = _1460 + 1336;
            uint _1472 = uint(int(uint(_1470) >> uint(2)));
            _26[int(_1472)] = as_type<uint>(_1414);
            int _1474 = _1460 + 1340;
            uint _1476 = uint(int(uint(_1474) >> uint(2)));
            _26[int(_1476)] = as_type<uint>(_1140);
            _876 = _1382;
            _434 = _1326;
            _436 = _1416;
            _886 = as_type<int>(_1410);
            _890 = as_type<int>(_1412);
            _904 = as_type<int>(_1414);
            _942 = as_type<int>(_1140);
        }
        float _1478 = _876;
        float _1480 = _434;
        float _1482 = _436;
        int _1484 = _886;
        int _1486 = _890;
        int _1488 = _904;
        int _1490 = _942;
        threadgroup_barrier(mem_flags::mem_threadgroup);
        int _1492 = _830 << 4;
        int _1494 = _1492 + 1280;
        uint _1496 = uint(int(uint(_1494) >> uint(2)));
        float _1498 = as_type<float>(_26[int(_1496)]);
        int _1500 = _1492 + 1284;
        uint _1502 = uint(int(uint(_1500) >> uint(2)));
        float _1504 = as_type<float>(_26[int(_1502)]);
        int _1506 = _1492 + 1288;
        uint _1508 = uint(int(uint(_1506) >> uint(2)));
        float _1510 = as_type<float>(_26[int(_1508)]);
        int _1512 = _1492 + 1292;
        uint _1514 = uint(int(uint(_1512) >> uint(2)));
        float _1516 = as_type<float>(_26[int(_1514)]);
        float _1518 = 1.0 / _400;
        int _1520 = _830 << 2;
        int _1522 = _1520 + 1024;
        uint _1524 = uint(int(uint(_1522) >> uint(2)));
        float _1526 = as_type<float>(_26[int(_1524)]);
        float _1528 = -_1516;
        float _1530 = exp2(_1528);
        float _1532 = _1526 * _1518;
        float _1534 = precise::max(_1530, _276);
        spvDescriptorSet0.cp_i_tcb_48_.write(float4(_1498, _1504, _1510, _1534), uint3(int3(_72, _66, int(_297))));
        spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_1532, _1532, _1532, _1532), uint3(int3(_72, _66, int(_297))));
        int _1536 = int(_297) + 4;
        bool _1538 = uint(_1536) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].w);
        _281 = uint(_1536);
        _283 = _1478;
        _285 = _1484;
        _287 = _1486;
        _289 = _1488;
        _291 = _1490;
        _293 = _1480;
        _295 = _1482;
        if (_1538)
        {
            _1540 = true;
            if (_1540)
            {
                break;
            }
        }
    } while (true);
    _1540 = false;
}

