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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    constant _16* fp_c4 [[id(4)]];
    constant _16* fp_c13 [[id(5)]];
    const device _31* fp_s0 [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture3d<float> fp_t_tcb_16 [[id(11)]];
    sampler fp_t_tcb_16Smplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    texturecube_array<float> fp_t_tcb_12 [[id(15)]];
    sampler fp_t_tcb_12Smplr [[id(16)]];
    texture3d<float> fp_t_tcb_18 [[id(17)]];
    sampler fp_t_tcb_18Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_8 [[id(19)]];
    sampler fp_t_tcb_8Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_E [[id(21)]];
    sampler fp_t_tcb_ESmplr [[id(22)]];
    texture2d<float> fp_t_tcb_C [[id(23)]];
    sampler fp_t_tcb_CSmplr [[id(24)]];
    sampler fp_t_tcb_10Smplr_w [[id(25)]];
    sampler fp_t_tcb_14Smplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_ASmplr_w [[id(28)]];
    sampler fp_t_tcb_12Smplr_w [[id(29)]];
    sampler fp_t_tcb_18Smplr_w [[id(30)]];
    sampler fp_t_tcb_8Smplr_w [[id(31)]];
    sampler fp_t_tcb_ESmplr_w [[id(32)]];
    sampler fp_t_tcb_CSmplr_w [[id(33)]];
    constant dm_border_t* dm_border [[id(34)]];
};

struct main0_out
{
    float4 m_78 [[color(0)]];
    float4 m_80 [[color(1)]];
};

struct main0_in
{
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _4636, const device _31& fp_s0)
{
    uint _4639 = uint(int(uint(_4636) >> uint(2)));
    float _4641 = as_type<float>(fp_s0._m0[int(_4639)]);
    int _4643 = _4636 & 3;
    int _4645 = _4643 << 3;
    int _4647 = as_type<int>(_4641) >> _4645;
    int _4649 = extract_bits(_4647, 0u, 16u);
    return _4649;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _90 = gl_FragCoord.w;
    float _92 = in.m_69.z;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_69.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = gl_FragCoord.x;
    float _106 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _108 = _104 / _106;
    float _110 = gl_FragCoord.y;
    float _112 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _114 = _110 / _112;
    float _116 = in.m_69.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 1.0 / _90;
    float _124 = _108 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _126 = _122 * _96;
    float _128 = _122 * _102;
    float _130 = _122 * _120;
    float _132 = _126 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _134 = _128 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _136 = _130 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _138 = _132 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _140 = _134 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _142 = _114 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _144 = _136 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _146 = fma(_138, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _148 = fma(_140, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float2 _1996 = float2(_124, _142);
    float2 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1996, float2(0.0), isnan(_1996))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1996, float2(0.0), isnan(_1996))).xy;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = fma(_144, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _160 = fma(_130, 6.2500002968590706586837768554688e-05, 0.5);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = fma(_126, 6.2500002968590706586837768554688e-05, 0.5);
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float2 _2027 = float2(_162, _166);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2027, float2(0.0), isnan(_2027))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2027, float2(0.0), isnan(_2027))).x;
    float3 _2036 = float3(_158, _148, _146);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2036, float3(0.0), isnan(_2036))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2036, float3(0.0), isnan(_2036))).x;
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _176 = _172 != 0;
    float _178 = fma(_156, 2.0, -1.0);
    float _180 = fma(_154, 2.0, -1.0);
    float _182 = fma(_178, (*spvDescriptorSet0.fp_c9)._m0[983].w, _142);
    float _184 = fma(_180, (*spvDescriptorSet0.fp_c9)._m0[983].z, _124);
    bool _186 = !_176;
    float _188 = _186 ? _142 : _182;
    bool _190 = !_176;
    float _192 = _190 ? _124 : _184;
    float3 _2083 = float3(_192, _188, float(0));
    float3 _2085 = select(_2083, float3(0.0), isnan(_2083));
    float4 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2085.xy, uint(rint(_2085.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2085.xy, uint(rint(_2085.z))).xyzw;
    float _197 = _195.x;
    float _199 = _195.y;
    float _201 = _195.z;
    float _203 = _195.w;
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _207 = _126 + _205;
    float _209 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _211 = _130 + _209;
    float _213 = _142 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _215 = _207 * _207;
    float _217 = _124 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _219 = in.m_71.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_71.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = fma(_211, _211, _215);
    float _233 = in.m_71.w;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = sqrt(_231);
    bool _241 = _239 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _243 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _245 = _239 + _243;
    float _247 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _249 = _122 * _223;
    float _251 = 0.0;
    float _253 = _231;
    float _255 = _245;
    if (_241)
    {
        float _257 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _251 = _257;
    }
    float _259 = _251;
    float _261 = _122 * _237;
    float _263 = 0.0;
    if (_241)
    {
        float _265 = _128 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _263 = _265;
    }
    float _267 = _263;
    float _269 = 0.0 + _261;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _267;
    if (_241)
    {
        float _275 = rsqrt(_231);
        _253 = _275;
    }
    float _277 = _253;
    float _279 = fma(_271, _247, 1.0);
    float _281 = _277;
    if (_241)
    {
        float _283 = _245 * _259;
        _255 = _283;
    }
    float _285 = _255;
    float _287 = log2(_279);
    float _289 = 0.0;
    if (_241)
    {
        float _291 = _285 * 0.15915493667125701904296875;
        _289 = _291;
    }
    float _293 = _289;
    float _295 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _297 = _259;
    float _299 = _293;
    if (_241)
    {
        float _301 = _293 * 6.283185482025146484375;
        float _303 = cos(_301);
        _297 = _303;
    }
    float _305 = _297;
    float _307 = precise::min(_213, _295);
    float _309 = (*spvDescriptorSet0.fp_c9)._m0[71].z;
    if (_241)
    {
        float _311 = _293 * 6.283185482025146484375;
        float _313 = sin(_311);
        _309 = _313;
    }
    float _315 = _309;
    float _317 = _287 * 0.693147182464599609375;
    float _319 = _287;
    if (!_241)
    {
        _319 = _128;
    }
    float _321 = _319;
    float _323 = _317 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = 0.0;
    float _329 = _321;
    float _331 = _325;
    if (_241)
    {
        float _333 = _305 + (-1.0);
        _327 = _333;
    }
    float _335 = _327;
    float _337 = _335;
    if (_241)
    {
        float _339 = _335 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _337 = _339;
    }
    float _341 = _337;
    if (_241)
    {
        float _343 = fma(_315, _267, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _273 = _343;
    }
    float _345 = _273;
    if (_241)
    {
        float _347 = fma(_128, _305, _341);
        _329 = _347;
    }
    float _349 = _329;
    float _351 = _325 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    if (!_241)
    {
        _331 = _126;
    }
    float _353 = _331;
    float _355 = _353;
    if (_241)
    {
        float _357 = _277 * _345;
        _299 = _357;
    }
    float _359 = _299;
    if (!_241)
    {
        _281 = _130;
    }
    float _361 = _281;
    float _363 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _365 = _349 + _363;
    float _367 = precise::min(_247, _351);
    float _369 = _361;
    float _371 = _365;
    if (_241)
    {
        float _373 = fma(_211, _359, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _369 = _373;
    }
    float _375 = _369;
    if (_241)
    {
        float _377 = fma(_207, _359, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _355 = _377;
    }
    float _379 = _355;
    float _381 = _365 * _365;
    float _383 = floor(_307);
    float _385 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _387 = _375 + _385;
    float _389 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _391 = _379 + _389;
    float _393 = in.m_71.y;
    float _395 = gl_FragCoord.w;
    float _397 = _393 * _395;
    float _399 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _401 = _128 + _399;
    float _403 = fma(_387, _387, _381);
    float _405 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _407 = _130 + _405;
    float _409 = _122 * _229;
    float _411 = floor(_367);
    float _413 = fma(_391, _391, _403);
    float _415 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _417 = _401 * _401;
    float _419 = precise::min(_217, _415);
    float _421 = rsqrt(_413);
    float _423 = fma(_407, _407, _417);
    float _425 = fma(_383, (*spvDescriptorSet0.fp_c9)._m0[71].x, _419);
    float _427 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _429 = _126 + _427;
    float _431 = _411 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _433 = fma(_429, _429, _423);
    float _435 = fma(_431, (*spvDescriptorSet0.fp_c9)._m0[71].x, _425);
    float _437 = sqrt(_433);
    float _439 = _421 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _441 = _122 * _397;
    float _443 = _387 * _439;
    float _445 = _391 * _439;
    float _447 = trunc(_435);
    int _449 = int(_447);
    float _451 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _453 = _443 * _443;
    float _455 = _445 * _445;
    float _457 = precise::max(0.0, _451);
    float _459 = _453 + _455;
    float _461 = sqrt(_459);
    float _463 = -_439;
    float _465 = -_457;
    float _467 = fma(_365, _463, _465);
    int _469 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _471 = _469 + _449;
    float _473 = _441 * _441;
    int _475 = _471 * 136;
    float _477 = fma(_249, _249, _473);
    int _479 = _475 + 4;
    uint _482 = uint(int(uint(_475) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_482)];
    float _484 = as_type<float>(_dmw0.x);
    bool _486 = _461 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _488 = fma(_409, _409, _477);
    uint _490 = uint(int(uint(_479) >> uint(2)));
    float _492 = as_type<float>(_dmw0.y);
    float _494 = _477;
    float _496 = _457;
    float _498 = _433;
    float _500 = _443;
    if (!_486)
    {
        _494 = _455;
    }
    float _502 = _494;
    float _504 = _502;
    if (!_486)
    {
        _496 = _453;
    }
    float _506 = _496;
    float _508 = _506;
    if (!_486)
    {
        _371 = _467;
    }
    float _510 = _371;
    float _512 = _510;
    if (!_486)
    {
        _498 = _445;
    }
    float _514 = _498;
    bool _516 = !_486;
    float _518 = _514;
    if (!_516)
    {
        float _520 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _522 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _524 = _461 + _522;
        float _526 = _467 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _528 = rsqrt(_459);
        float _530 = _524 * _520;
        float _532 = _530 * 0.15915493667125701904296875;
        float _534 = _532 * 6.283185482025146484375;
        float _536 = sin(_534);
        float _538 = _532 * 6.283185482025146484375;
        float _540 = cos(_538);
        float _542 = fma(_536, _526, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _544 = _528 * _542;
        float _546 = _540 + (-1.0);
        float _548 = _443 * _544;
        float _550 = _445 * _544;
        float _552 = _546 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _554 = _548 * _548;
        float _556 = _550 * _550;
        float _558 = fma(_467, _540, _552);
        _512 = _558;
        _508 = _554;
        _504 = _556;
        _500 = _548;
        _518 = _550;
    }
    float _560 = _512;
    float _562 = _508;
    float _564 = _504;
    float _566 = _500;
    float _568 = _518;
    float _570 = fma(_560, _560, _562);
    float _572 = rsqrt(_488);
    float _574 = spvFAdd(_437, 9.9999997473787516355514526367188e-06);
    float _576 = _570 + _564;
    float _578 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _580 = 1.0 + _578;
    float _582 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _584 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[63].x, _582);
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = 1.0 / _574;
    float _590 = precise::max(_170, 0.25);
    float _592 = 0.0 + _168;
    float _594 = precise::clamp(_592, 0.0, 1.0);
    float _596 = -_586;
    float _598 = _596 + 1.0;
    float _600 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _602 = _199 * _594;
    float _604 = rsqrt(_576);
    float _606 = _249 * _572;
    float _608 = _441 * _572;
    float _610 = _409 * _572;
    float _612 = in.m_73.w;
    float _614 = gl_FragCoord.w;
    float _616 = _612 * _614;
    float _618 = abs(_598);
    float _620 = log2(_618);
    float _622 = _407 * _588;
    float _624 = _401 * _588;
    float _626 = _429 * _588;
    float _628 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _580);
    float _630 = _606 * _622;
    float _632 = _608 * _624;
    float _634 = _610 * _626;
    float _636 = _604 * _566;
    float _638 = _604 * _560;
    float _640 = _604 * _568;
    float _642 = _636 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _644 = _628 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _646 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _648 = _646 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _650 = -_642;
    float _652 = fma(_638, (*spvDescriptorSet0.fp_c9)._m0[69].y, _650);
    float _654 = _620 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _656 = precise::min(_644, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _658 = -_640;
    float _660 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[69].z, _652);
    float _662 = _630 + _632;
    float _664 = exp2(_654);
    float _666 = fma(_660, -0.5, 0.5);
    float _668 = _634 + _662;
    float _670 = fma(_660, 0.5, 0.5);
    float _672 = -_656;
    float _674 = _672 + 1.0;
    float _676 = _668 + _668;
    float _678 = _122 * _616;
    float _680 = sqrt(_666);
    float _682 = fma(_670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _684 = -_676;
    float _686 = fma(_606, _684, _622);
    float _688 = -_676;
    float _690 = fma(_608, _688, _624);
    float _692 = -_626;
    float _694 = fma(_610, _676, _692);
    float _696 = fma(_670, _682, -0.212114393711090087890625);
    float _698 = _678 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _700 = fma(_674, _648, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _702 = abs(_686);
    float _704 = abs(_690);
    float _706 = precise::max(_702, _704);
    float _708 = fma(_670, _696, 1.570728778839111328125);
    float _710 = -_698;
    float _712 = fma(_600, _710, 1.0);
    float _714 = in.m_75.x;
    float _716 = gl_FragCoord.w;
    float _718 = _714 * _716;
    float _720 = abs(_694);
    float _722 = precise::max(_720, _706);
    float _724 = _638 + 1.0;
    float _726 = in.m_75.y;
    float _728 = gl_FragCoord.w;
    float _730 = _726 * _728;
    float _732 = 1.0 / _722;
    float _734 = -_638;
    float _736 = fma(_664, _724, _734);
    float _738 = _680 * 0.636619746685028076171875;
    float _740 = gl_FragCoord.x;
    float _742 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _744 = _740 / _742;
    float _746 = gl_FragCoord.y;
    float _748 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _750 = _746 / _748;
    float _752 = fma(_736, 0.5, 0.5);
    float _754 = -_708;
    float _756 = fma(_738, _754, 1.0);
    float _758 = log2(_712);
    float _760 = precise::max(0.0, _608);
    float _762 = precise::min(_760, 0.100000001490116119384765625);
    float _764 = _686 * _732;
    float _766 = _690 * _732;
    float _768 = _694 * _732;
    float _770 = fma(_762, 10.0, -1.0);
    float3 _2947 = float3(_192, _188, float(1));
    float3 _2949 = select(_2947, float3(0.0), isnan(_2947));
    float _772 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2949.xy, uint(rint(_2949.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2949.xy, uint(rint(_2949.z))).x;
    float _774 = _590 + _770;
    float _776 = _758 * 0.693147182464599609375;
    float _778 = _122 * _718;
    float _780 = _774 * 4.0;
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = _776 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _786 = _602 * _782;
    float _788 = _744 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _790 = _700 + (-1.0);
    float _792 = _750 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _794 = _786 * _790;
    float _796 = _122 * _730;
    float _798 = fma(_794, 7.0, 7.0);
    float4 _2996 = float4(_764, _766, _768, float(1));
    float4 _3000 = select(_2996, float4(0.0), isnan(_2996));
    float3 _802 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _3000.xyz, uint(rint(_3000.w)), level(_798)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _3000.xyz, uint(rint(_3000.w)), level(_798)).xyz;
    float _804 = _802.x;
    float _806 = _802.y;
    float _808 = _802.z;
    float3 _3014 = float3(_788, _792, _784);
    float _810 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_3014, float3(0.0), isnan(_3014))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_3014, float3(0.0), isnan(_3014))).x;
    float2 _3022 = float2(_778, _796);
    float3 _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3022, float2(0.0), isnan(_3022))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3022, float2(0.0), isnan(_3022))).xyz;
    float _814 = _812.x;
    float _816 = _812.y;
    float _818 = _812.z;
    float2 _3036 = float2(_756, _752);
    float3 _820 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3036, float2(0.0), isnan(_3036))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3036, float2(0.0), isnan(_3036))).xyz;
    float _822 = _820.x;
    float _824 = _820.y;
    float _826 = _820.z;
    float2 _3050 = float2(_184, _182);
    float4 _828 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3050, float2(0.0), isnan(_3050))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3050, float2(0.0), isnan(_3050))).xyzw;
    float _830 = _828.x;
    float _832 = _828.y;
    float _834 = _828.z;
    float _836 = _828.w;
    float _838 = _624 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _840 = _622 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _842 = _626 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _844 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _580);
    float _846 = _838 * _838;
    float _848 = -_630;
    float _850 = -_632;
    float _852 = _848 + _850;
    float _854 = _197 * _199;
    float _856 = _844 + (-1.0);
    float _858 = fma(_840, _840, _846);
    float _860 = -_634;
    float _862 = _860 + _852;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = _794 + 1.0;
    float _868 = fma(_786, _856, 1.0);
    float _870 = fma(_842, _842, _858);
    float _872 = in.m_73.y;
    float _874 = gl_FragCoord.w;
    float _876 = _872 * _874;
    float _878 = -_203;
    float _880 = _878 + 1.0;
    bool _882 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _884 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _886 = rsqrt(_870);
    float _888 = _864 * (-9.27999973297119140625);
    bool _890 = as_type<uint>(_484) > 0u;
    bool _892 = as_type<uint>(_492) > 0u;
    float _894 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _896 = fma(_437, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _894);
    float _898 = precise::clamp(_896, 0.0, 1.0);
    float _900 = exp2(_888);
    float _902 = _838 * _886;
    float _904 = _840 * _886;
    float _906 = _842 * _886;
    float _908 = in.m_73.x;
    float _910 = gl_FragCoord.w;
    float _912 = _908 * _910;
    float _914 = _902 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _916 = _606 * _904;
    float _918 = fma(_904, (*spvDescriptorSet0.fp_c9)._m0[69].x, _914);
    float _920 = -_902;
    float _922 = -_916;
    float _924 = fma(_608, _920, _922);
    float _926 = _794 * _794;
    float _928 = fma(_906, (*spvDescriptorSet0.fp_c9)._m0[69].z, _918);
    float _930 = precise::clamp(_928, 0.0, 1.0);
    float _932 = -_906;
    float _934 = fma(_610, _932, _924);
    float _936 = precise::clamp(_934, 0.0, 1.0);
    float _938 = fma(_866, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _940 = precise::min(_926, _900);
    float _942 = -_930;
    float _944 = _942 + 1.0;
    float _946 = fma(_866, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _948 = _944 * _944;
    float _950 = -_794;
    float _952 = fma(_950, _940, _946);
    float _954 = _606 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _956 = in.m_73.z;
    float _958 = gl_FragCoord.w;
    float _960 = _956 * _958;
    float _962 = _948 * _948;
    float _964 = fma(_952, 1.03999996185302734375, _938);
    float _966 = precise::clamp(_964, 0.0, 1.0);
    float _968 = -_608;
    float _970 = -_954;
    float _972 = fma(_968, (*spvDescriptorSet0.fp_c9)._m0[69].y, _970);
    float _974 = _944 * _962;
    float _976 = -_610;
    float _978 = fma(_976, (*spvDescriptorSet0.fp_c9)._m0[69].z, _972);
    float _980 = precise::clamp(_978, 0.0, 1.0);
    float _982 = fma(_866, 0.5, 0.5);
    float _984 = _982 * _982;
    float _986 = _984 * 0.5;
    float _988 = fma(_786, _856, 0.959999978542327880859375);
    float _990 = fma(_866, _866, 0.00999999977648258209228515625);
    float _992 = precise::clamp(_990, 0.0, 1.0);
    float _994 = -_986;
    float _996 = _994 + 1.0;
    float _998 = fma(_988, _974, 0.039999999105930328369140625);
    float _1000 = _992 * _992;
    float _1002 = _936 * _936;
    float _1004 = fma(_864, _996, _986);
    float _1006 = fma(_980, _996, _986);
    float _1008 = _1000 + (-1.0);
    float _1010 = _1004 * _1006;
    float _1012 = fma(_1002, _1008, 1.0);
    float _1014 = _1012 * _1012;
    float _1016 = 1.0 / _1010;
    float _1018 = fma(_866, -0.572000026702880859375, 1.03999996185302734375);
    float _1020 = _122 * _912;
    float _1022 = _122 * _876;
    float _1024 = _122 * _960;
    float _1026 = fma(_952, -1.03999996185302734375, _1018);
    float _1028 = precise::clamp(_1026, 0.0, 1.0);
    float _1030 = _1000 * 0.31830990314483642578125;
    float _1032 = 1.0 / _1014;
    float _1034 = -_772;
    float _1036 = _1034 + 1.0;
    float _1038 = -_1036;
    float _1040 = fma(_1038, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1042 = _1030 * _1032;
    float _1044 = -_201;
    float _1046 = _1044 + 1.0;
    float _1048 = _980 * _1042;
    float _1050 = _868 * _966;
    float _1052 = -_880;
    float _1054 = fma(_1052, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _1056 = precise::min(_1040, 1.0);
    float _1058 = _1048 * _1016;
    float _1060 = _1058 * 0.25;
    float _1062 = -_1046;
    float _1064 = fma(_1062, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1066 = precise::clamp(_1064, 0.0, 1.0);
    float _1068 = _854 * _1054;
    float _1070 = fma(_1028, 0.039999999105930328369140625, _1050);
    float _1072 = _998 * _1060;
    float _1074 = _620 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1076 = _884 * 0.31830990314483642578125;
    float _1078 = precise::min(_201, _1056);
    float _1080 = exp2(_1074);
    float _1082 = _884 * _804;
    float _1084 = _884 * _806;
    float _1086 = _884 * _808;
    float _1088 = -_1082;
    float _1090 = fma(_1020, _1076, _1088);
    float _1092 = -_1084;
    float _1094 = fma(_1022, _1076, _1092);
    float _1096 = -_1086;
    float _1098 = fma(_1024, _1076, _1096);
    float _1100 = fma(_898, _1090, _1082);
    float _1102 = fma(_898, _1094, _1084);
    float _1104 = fma(_898, _1098, _1086);
    float _1106 = _1082;
    float _1108 = _1084;
    float _1110 = _1076;
    float _1112 = 0.0;
    float _1114 = 0.0;
    float _1116 = 0.0;
    float _1118 = 0.0;
    float _1120 = 0.0;
    float _1122 = 0.0;
    if (!_882)
    {
        _1106 = 0.0;
    }
    float _1124 = _1106;
    float _1126 = _1124;
    if (!_882)
    {
        _1108 = 0.0;
        _1110 = 0.0;
    }
    float _1128 = _1108;
    float _1130 = _1110;
    bool _1132 = !_882;
    float _1134 = _1128;
    float _1136 = _1130;
    if (!_1132)
    {
        float _1138 = -_128;
        float _1140 = _1138 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1142 = -_130;
        float _1144 = _1142 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1146 = -_126;
        float _1148 = _1146 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1150 = _1140 * _1140;
        float _1152 = fma(_1144, _1144, _1150);
        float _1154 = fma(_1148, _1148, _1152);
        float _1156 = rsqrt(_1154);
        float _1158 = _1140 * _1156;
        float _1160 = _1144 * _1156;
        float _1162 = _1148 * _1156;
        float _1164 = -_624;
        float _1166 = _1164 + _1158;
        float _1168 = -_622;
        float _1170 = _1168 + _1160;
        float _1172 = -_626;
        float _1174 = _1172 + _1162;
        float _1176 = sqrt(_1154);
        float _1178 = _1166 * _1166;
        float _1180 = fma(_1170, _1170, _1178);
        float _1182 = fma(_1174, _1174, _1180);
        float _1184 = rsqrt(_1182);
        float _1186 = -_1176;
        float _1188 = _1186 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1190 = _1188 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1192 = precise::clamp(_1190, 0.0, 1.0);
        float _1194 = abs(_1192);
        float _1196 = log2(_1194);
        float _1198 = _1166 * _1184;
        float _1200 = _1170 * _1184;
        float _1202 = _1174 * _1184;
        float _1204 = _608 * _1198;
        float _1206 = fma(_606, _1200, _1204);
        float _1208 = _1196 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1210 = fma(_610, _1202, _1206);
        float _1212 = precise::clamp(_1210, 0.0, 1.0);
        float _1214 = _1212 * _1212;
        float _1216 = _1160 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1218 = exp2(_1208);
        float _1220 = fma(_1008, _1214, 1.0);
        float _1222 = -_1158;
        float _1224 = -_1216;
        float _1226 = fma(_1222, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1224);
        float _1228 = _608 * _1158;
        float _1230 = _1220 * _1220;
        float _1232 = -_1162;
        float _1234 = fma(_1232, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1226);
        float _1236 = fma(_606, _1160, _1228);
        float _1238 = 1.0 / _1230;
        float _1240 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1242 = _1234 + _1240;
        float _1244 = fma(_610, _1162, _1236);
        float _1246 = precise::clamp(_1244, 0.0, 1.0);
        float _1248 = _1242 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1250 = precise::clamp(_1248, 0.0, 1.0);
        float _1252 = _1218 * _1250;
        float _1254 = _1246 * _1252;
        float _1256 = _1000 * _1238;
        float _1258 = _1256 * _1254;
        float _1260 = _1258 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1262 = _1258 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1264 = _1258 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1126 = _1260;
        _1134 = _1262;
        _1136 = _1264;
    }
    float _1266 = _1126;
    float _1268 = _1134;
    float _1270 = _1136;
    bool _1272 = !_890;
    if (!_1272)
    {
        int _1274 = 0;
        bool _1276;
        do
        {
            int _1278 = _1274;
            float _1280 = _1112;
            float _1282 = _1114;
            float _1284 = _1116;
            int _1286 = _1278 << 1;
            int _1288 = _1286 + _475;
            int _1290 = _1288 + 8;
            int _1292 = _1290;
            int _1294 = _86(_1292, (*spvDescriptorSet0.fp_s0));
            int _1296 = _1278 + 1;
            bool _1298 = uint(_1296) >= as_type<uint>(_484);
            int _1300 = _1294 & 65535;
            int _1302 = _1300 * 48;
            int _1304 = _1302 + 1168;
            uint _1306 = uint(int(uint(_1304) >> uint(2)));
            uint _1308 = uint(int(uint(int(_1306)) >> uint(2)));
            int _1310 = int(_1306) & 3;
            float _1312 = (*spvDescriptorSet0.fp_c9)._m0[int(_1308)][_1310];
            int _1314 = int(_1306) + 1;
            uint _1316 = uint(int(uint(_1314) >> uint(2)));
            int _1318 = _1314 & 3;
            float _1320 = (*spvDescriptorSet0.fp_c9)._m0[int(_1316)][_1318];
            int _1322 = _1302 + 1176;
            uint _1324 = uint(int(uint(_1322) >> uint(2)));
            uint _1326 = uint(int(uint(int(_1324)) >> uint(2)));
            int _1328 = int(_1324) & 3;
            float _1330 = (*spvDescriptorSet0.fp_c9)._m0[int(_1326)][_1328];
            int _1332 = int(_1324) + 1;
            uint _1334 = uint(int(uint(_1332) >> uint(2)));
            int _1336 = _1332 & 3;
            float _1338 = (*spvDescriptorSet0.fp_c9)._m0[int(_1334)][_1336];
            float _1340 = -_130;
            float _1342 = _1340 + _1312;
            float _1344 = -_128;
            float _1346 = _1344 + _1320;
            int _1348 = _1302 + 1200;
            uint _1350 = uint(int(uint(_1348) >> uint(2)));
            uint _1352 = uint(int(uint(int(_1350)) >> uint(2)));
            int _1354 = int(_1350) & 3;
            float _1356 = (*spvDescriptorSet0.fp_c9)._m0[int(_1352)][_1354];
            float _1358 = _1346 * _1346;
            float _1360 = -_126;
            float _1362 = _1360 + _1330;
            float _1364 = fma(_1342, _1342, _1358);
            float _1366 = fma(_1362, _1362, _1364);
            float _1368 = rsqrt(_1366);
            float _1370 = sqrt(_1366);
            float _1372 = _1346 * _1368;
            float _1374 = _1342 * _1368;
            float _1376 = _1362 * _1368;
            float _1378 = -_624;
            float _1380 = _1378 + _1372;
            float _1382 = -_626;
            float _1384 = _1382 + _1376;
            float _1386 = -_1370;
            float _1388 = _1386 + _1338;
            float _1390 = -_622;
            float _1392 = _1390 + _1374;
            float _1394 = _1380 * _1380;
            float _1396 = fma(_1392, _1392, _1394);
            float _1398 = _1388 * _1356;
            float _1400 = precise::clamp(_1398, 0.0, 1.0);
            float _1402 = fma(_1384, _1384, _1396);
            int _1404 = _1302 + 1192;
            uint _1406 = uint(int(uint(_1404) >> uint(2)));
            uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
            int _1410 = int(_1406) & 3;
            float _1412 = (*spvDescriptorSet0.fp_c9)._m0[int(_1408)][_1410];
            int _1414 = int(_1406) + 1;
            uint _1416 = uint(int(uint(_1414) >> uint(2)));
            int _1418 = _1414 & 3;
            float _1420 = (*spvDescriptorSet0.fp_c9)._m0[int(_1416)][_1418];
            float _1422 = abs(_1400);
            float _1424 = log2(_1422);
            float _1426 = rsqrt(_1402);
            float _1428 = _1380 * _1426;
            float _1430 = _1392 * _1426;
            float _1432 = _1384 * _1426;
            float _1434 = _608 * _1428;
            float _1436 = fma(_606, _1430, _1434);
            int _1438 = _1302 + 1184;
            uint _1440 = uint(int(uint(_1438) >> uint(2)));
            uint _1442 = uint(int(uint(int(_1440)) >> uint(2)));
            int _1444 = int(_1440) & 3;
            float _1446 = (*spvDescriptorSet0.fp_c9)._m0[int(_1442)][_1444];
            int _1448 = int(_1440) + 1;
            uint _1450 = uint(int(uint(_1448) >> uint(2)));
            int _1452 = _1448 & 3;
            float _1454 = (*spvDescriptorSet0.fp_c9)._m0[int(_1450)][_1452];
            float _1456 = fma(_610, _1432, _1436);
            float _1458 = precise::clamp(_1456, 0.0, 1.0);
            float _1460 = _1458 * _1458;
            float _1462 = fma(_1008, _1460, 1.0);
            float _1464 = _1424 * _1420;
            float _1466 = _1462 * _1462;
            float _1468 = _608 * _1372;
            float _1470 = exp2(_1464);
            float _1472 = fma(_606, _1374, _1468);
            float _1474 = fma(_610, _1376, _1472);
            float _1476 = precise::clamp(_1474, 0.0, 1.0);
            float _1478 = 1.0 / _1466;
            float _1480 = _1476 * _1470;
            float _1482 = _1000 * _1478;
            float _1484 = _1482 * _1480;
            float _1486 = fma(_1484, _1446, _1280);
            float _1488 = fma(_1484, _1454, _1282);
            float _1490 = fma(_1484, _1412, _1284);
            _1276 = !_1298;
            _1274 = _1296;
            _1112 = _1486;
            _1114 = _1488;
            _1116 = _1490;
            _1118 = _1490;
            _1120 = _1486;
            _1122 = _1488;
        } while (_1276);
    }
    float _1492 = _1118;
    float _1494 = _1120;
    float _1496 = _1122;
    bool _1498 = !_892;
    float _1500 = _1492;
    float _1502 = _1494;
    float _1504 = _1496;
    float _1506 = _1494;
    float _1508 = _1496;
    float _1510 = _1492;
    if (!_1498)
    {
        int _1512 = 0;
        bool _1514;
        do
        {
            int _1516 = _1512;
            float _1518 = _1500;
            float _1520 = _1502;
            float _1522 = _1504;
            int _1524 = _1516 << 1;
            int _1526 = _1524 + _475;
            int _1528 = _1526 + 72;
            int _1530 = _1528;
            int _1532 = _86(_1530, (*spvDescriptorSet0.fp_s0));
            int _1534 = _1516 + 1;
            bool _1536 = uint(_1534) >= as_type<uint>(_492);
            int _1538 = _1532 << 6;
            int _1540 = 4194240 & _1538;
            int _1542 = _1540 + 10384;
            uint _1544 = uint(int(uint(_1542) >> uint(2)));
            uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
            int _1548 = int(_1544) & 3;
            float _1550 = (*spvDescriptorSet0.fp_c9)._m0[int(_1546)][_1548];
            int _1552 = int(_1544) + 1;
            uint _1554 = uint(int(uint(_1552) >> uint(2)));
            int _1556 = _1552 & 3;
            float _1558 = (*spvDescriptorSet0.fp_c9)._m0[int(_1554)][_1556];
            int _1560 = _1540 + 10392;
            uint _1562 = uint(int(uint(_1560) >> uint(2)));
            uint _1564 = uint(int(uint(int(_1562)) >> uint(2)));
            int _1566 = int(_1562) & 3;
            float _1568 = (*spvDescriptorSet0.fp_c9)._m0[int(_1564)][_1566];
            int _1570 = int(_1562) + 1;
            uint _1572 = uint(int(uint(_1570) >> uint(2)));
            int _1574 = _1570 & 3;
            float _1576 = (*spvDescriptorSet0.fp_c9)._m0[int(_1572)][_1574];
            int _1578 = _1540 + 10400;
            uint _1580 = uint(int(uint(_1578) >> uint(2)));
            uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
            int _1584 = int(_1580) & 3;
            float _1586 = (*spvDescriptorSet0.fp_c9)._m0[int(_1582)][_1584];
            int _1588 = int(_1580) + 1;
            uint _1590 = uint(int(uint(_1588) >> uint(2)));
            int _1592 = _1588 & 3;
            float _1594 = (*spvDescriptorSet0.fp_c9)._m0[int(_1590)][_1592];
            float _1596 = -_128;
            float _1598 = _1596 + _1558;
            float _1600 = -_130;
            float _1602 = _1600 + _1550;
            float _1604 = _1598 * _1598;
            float _1606 = -_126;
            float _1608 = _1606 + _1568;
            float _1610 = fma(_1602, _1602, _1604);
            float _1612 = fma(_1608, _1608, _1610);
            float _1614 = rsqrt(_1612);
            float _1616 = sqrt(_1612);
            float _1618 = _1602 * _1614;
            float _1620 = _1598 * _1614;
            float _1622 = _1608 * _1614;
            float _1624 = _1618 * _1586;
            float _1626 = -_624;
            float _1628 = _1626 + _1620;
            float _1630 = -_1620;
            float _1632 = -_1624;
            float _1634 = fma(_1630, _1594, _1632);
            float _1636 = -_622;
            float _1638 = _1636 + _1618;
            float _1640 = _1628 * _1628;
            float _1642 = -_626;
            float _1644 = _1642 + _1622;
            float _1646 = -_1616;
            float _1648 = _1646 + _1576;
            float _1650 = fma(_1638, _1638, _1640);
            float _1652 = fma(_1644, _1644, _1650);
            int _1654 = _1540 + 10436;
            uint _1656 = uint(int(uint(_1654) >> uint(2)));
            uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
            int _1660 = int(_1656) & 3;
            float _1662 = (*spvDescriptorSet0.fp_c9)._m0[int(_1658)][_1660];
            float _1664 = rsqrt(_1652);
            float _1666 = _1628 * _1664;
            float _1668 = _1638 * _1664;
            float _1670 = _1644 * _1664;
            float _1672 = _608 * _1666;
            float _1674 = fma(_606, _1668, _1672);
            int _1676 = _1540 + 10408;
            uint _1678 = uint(int(uint(_1676) >> uint(2)));
            uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
            int _1682 = int(_1678) & 3;
            float _1684 = (*spvDescriptorSet0.fp_c9)._m0[int(_1680)][_1682];
            int _1686 = int(_1678) + 1;
            uint _1688 = uint(int(uint(_1686) >> uint(2)));
            int _1690 = _1686 & 3;
            float _1692 = (*spvDescriptorSet0.fp_c9)._m0[int(_1688)][_1690];
            float _1694 = fma(_610, _1670, _1674);
            float _1696 = precise::clamp(_1694, 0.0, 1.0);
            float _1698 = _1696 * _1696;
            float _1700 = fma(_1008, _1698, 1.0);
            float _1702 = _1700 * _1700;
            float _1704 = _1648 * _1662;
            float _1706 = precise::clamp(_1704, 0.0, 1.0);
            float _1708 = 1.0 / _1702;
            int _1710 = _1540 + 10424;
            uint _1712 = uint(int(uint(_1710) >> uint(2)));
            uint _1714 = uint(int(uint(int(_1712)) >> uint(2)));
            int _1716 = int(_1712) & 3;
            float _1718 = (*spvDescriptorSet0.fp_c9)._m0[int(_1714)][_1716];
            int _1720 = int(_1712) + 1;
            uint _1722 = uint(int(uint(_1720) >> uint(2)));
            int _1724 = _1720 & 3;
            float _1726 = (*spvDescriptorSet0.fp_c9)._m0[int(_1722)][_1724];
            float _1728 = -_1622;
            float _1730 = fma(_1728, _1684, _1634);
            float _1732 = abs(_1706);
            float _1734 = log2(_1732);
            int _1736 = _1540 + 10444;
            uint _1738 = uint(int(uint(_1736) >> uint(2)));
            uint _1740 = uint(int(uint(int(_1738)) >> uint(2)));
            int _1742 = int(_1738) & 3;
            float _1744 = (*spvDescriptorSet0.fp_c9)._m0[int(_1740)][_1742];
            float _1746 = -_1692;
            float _1748 = _1730 + _1746;
            float _1750 = _608 * _1620;
            float _1752 = fma(_606, _1618, _1750);
            float _1754 = fma(_610, _1622, _1752);
            float _1756 = precise::clamp(_1754, 0.0, 1.0);
            float _1758 = _1734 * _1726;
            int _1760 = _1540 + 10416;
            uint _1762 = uint(int(uint(_1760) >> uint(2)));
            uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
            int _1766 = int(_1762) & 3;
            float _1768 = (*spvDescriptorSet0.fp_c9)._m0[int(_1764)][_1766];
            int _1770 = int(_1762) + 1;
            uint _1772 = uint(int(uint(_1770) >> uint(2)));
            int _1774 = _1770 & 3;
            float _1776 = (*spvDescriptorSet0.fp_c9)._m0[int(_1772)][_1774];
            float _1778 = exp2(_1758);
            float _1780 = _1748 * _1744;
            float _1782 = precise::clamp(_1780, 0.0, 1.0);
            float _1784 = _1778 * _1782;
            float _1786 = _1756 * _1784;
            float _1788 = _1000 * _1708;
            float _1790 = _1788 * _1786;
            float _1792 = fma(_1790, _1718, _1518);
            float _1794 = fma(_1790, _1768, _1520);
            float _1796 = fma(_1790, _1776, _1522);
            _1514 = !_1536;
            _1512 = _1534;
            _1500 = _1792;
            _1502 = _1794;
            _1504 = _1796;
            _1506 = _1794;
            _1508 = _1796;
            _1510 = _1792;
        } while (_1514);
    }
    float _1798 = _1506;
    float _1800 = _1508;
    float _1802 = _1510;
    float _1804 = _1798 + _1266;
    float _1806 = _1800 + _1268;
    float _1808 = _1802 + _1270;
    float _1810 = _1070 * _1078;
    float _1812 = _1100 + _1804;
    float _1814 = _1102 + _1806;
    float _1816 = _1104 + _1808;
    float _1818 = -_1080;
    float _1820 = _1818 + 1.0;
    float _1822 = _1068 * _1066;
    float _1824 = _1814 * _1810;
    float _1826 = _1816 * _1810;
    float _1828 = _1072 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1830 = _1812 * _1810;
    float _1832 = _1072 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1834 = _1820 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1836 = _1072 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1838 = fma(_1828, _1822, _1824);
    float _1840 = fma(_1832, _1822, _1830);
    float _1842 = -_1834;
    float _1844 = _1842 + 1.0;
    float _1846 = fma(_1836, _1822, _1826);
    float _1848 = _814 * 1.60000002384185791015625;
    float _1850 = _816 * 1.60000002384185791015625;
    float _1852 = _818 * 1.60000002384185791015625;
    float _1854 = _822 * _1834;
    float _1856 = _824 * _1834;
    float _1858 = _826 * _1834;
    float _1860 = _836 * _1844;
    float _1862 = _836 * _810;
    float _1864 = fma(_1848, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1840);
    float _1866 = fma(_1850, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1838);
    float _1868 = fma(_1852, (*spvDescriptorSet0.fp_c9)._m0[40].z, _1846);
    float _1870 = fma(_1854, _1862, _830);
    float _1872 = fma(_1856, _1862, _832);
    float _1874 = precise::max(0.0, _1864);
    float _1876 = precise::max(0.0, _1866);
    float _1878 = precise::max(0.0, _1868);
    float _1880 = fma(_1858, _1862, _834);
    float _1882 = fma(_1860, _1874, _1870);
    float _1884 = fma(_1860, _1876, _1872);
    float _1886 = fma(_1860, _1878, _1880);
    out.m_78.x = _1882;
    out.m_78.y = _1884;
    out.m_78.z = _1886;
    out.m_78.w = 1.0;
    out.m_80.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

