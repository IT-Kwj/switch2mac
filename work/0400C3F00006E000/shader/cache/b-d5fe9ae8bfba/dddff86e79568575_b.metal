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
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_18 [[id(9)]];
    sampler fp_t_tcb_18Smplr [[id(10)]];
    texture3d<float> fp_t_tcb_1A [[id(11)]];
    sampler fp_t_tcb_1ASmplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    texture2d<float> fp_t_tcb_A [[id(17)]];
    sampler fp_t_tcb_ASmplr [[id(18)]];
    texture2d<float> fp_t_tcb_8 [[id(19)]];
    sampler fp_t_tcb_8Smplr [[id(20)]];
    texturecube_array<float> fp_t_tcb_16 [[id(21)]];
    sampler fp_t_tcb_16Smplr [[id(22)]];
    texture3d<float> fp_t_tcb_1C [[id(23)]];
    sampler fp_t_tcb_1CSmplr [[id(24)]];
    texture2d<float> fp_t_tcb_12 [[id(25)]];
    sampler fp_t_tcb_12Smplr [[id(26)]];
    texture2d<float> fp_t_tcb_10 [[id(27)]];
    sampler fp_t_tcb_10Smplr [[id(28)]];
    sampler fp_t_tcb_14Smplr_w [[id(29)]];
    sampler fp_t_tcb_18Smplr_w [[id(30)]];
    sampler fp_t_tcb_1ASmplr_w [[id(31)]];
    sampler fp_t_tcb_CSmplr_w [[id(32)]];
    sampler fp_t_tcb_ESmplr_w [[id(33)]];
    sampler fp_t_tcb_ASmplr_w [[id(34)]];
    sampler fp_t_tcb_8Smplr_w [[id(35)]];
    sampler fp_t_tcb_16Smplr_w [[id(36)]];
    sampler fp_t_tcb_1CSmplr_w [[id(37)]];
    sampler fp_t_tcb_12Smplr_w [[id(38)]];
    sampler fp_t_tcb_10Smplr_w [[id(39)]];
    constant dm_border_t* dm_border [[id(40)]];
};

struct main0_out
{
    float4 m_82 [[color(0)]];
    float4 m_84 [[color(1)]];
};

struct main0_in
{
    float4 m_75 [[user(locn0)]];
    float4 m_77 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_79 [[user(locn6)]];
};

static inline __attribute__((always_inline))
int _90(thread const int& _5066, const device _31& fp_s0)
{
    uint _5069 = uint(int(uint(_5066) >> uint(2)));
    float _5071 = as_type<float>(fp_s0._m0[int(_5069)]);
    int _5073 = _5066 & 3;
    int _5075 = _5073 << 3;
    int _5077 = as_type<int>(_5071) >> _5075;
    int _5079 = extract_bits(_5077, 0u, 16u);
    return _5079;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _94 = gl_FragCoord.w;
    float _96 = in.m_73.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_73.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = gl_FragCoord.x;
    float _110 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _112 = _108 / _110;
    float _114 = gl_FragCoord.y;
    float _116 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _118 = _114 / _116;
    float _120 = in.m_73.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_75.x;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_75.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = 1.0 / _94;
    float _140 = _112 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _142 = _118 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _144 = _138 * _100;
    float _146 = _138 * _106;
    float _148 = _138 * _124;
    float _150 = _138 * _130;
    float _152 = _144 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _154 = _146 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _156 = _148 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _158 = _138 * _136;
    float _160 = _152 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _162 = _154 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _164 = _156 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _166 = fma(_160, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _168 = fma(_162, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float2 _2180 = float2(_140, _142);
    float2 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2180, float2(0.0), isnan(_2180))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2180, float2(0.0), isnan(_2180))).xy;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = fma(_164, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _180 = fma(_144, 6.2500002968590706586837768554688e-05, 0.5);
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = fma(_148, 6.2500002968590706586837768554688e-05, 0.5);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float2 _2211 = float2(_182, _186);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2211, float2(0.0), isnan(_2211))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2211, float2(0.0), isnan(_2211))).x;
    float3 _2220 = float3(_166, _168, _178);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2220, float3(0.0), isnan(_2220))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2220, float3(0.0), isnan(_2220))).x;
    float2 _2230 = float2(_150, _158);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2230, float2(0.0), isnan(_2230))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2230, float2(0.0), isnan(_2230))).x;
    int _194 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _198 = _194 != 0;
    float _200 = fma(_176, 2.0, -1.0);
    float _202 = fma(_174, 2.0, -1.0);
    float _204 = fma(_200, (*spvDescriptorSet0.fp_c9)._m0[983].w, _142);
    float _206 = fma(_202, (*spvDescriptorSet0.fp_c9)._m0[983].z, _140);
    bool _208 = !_198;
    float _210 = _208 ? _142 : _204;
    bool _212 = !_198;
    float _214 = _212 ? _140 : _206;
    float3 _2275 = float3(_214, _210, float(0));
    float3 _2277 = select(_2275, float3(0.0), isnan(_2275));
    float4 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2277.xy, uint(rint(_2277.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2277.xy, uint(rint(_2277.z))).xyzw;
    float _219 = _217.x;
    float _221 = _217.y;
    float _223 = _217.z;
    float _225 = _217.w;
    float _227 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _229 = _148 + _227;
    float _231 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _233 = _144 + _231;
    float _235 = _142 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _237 = _229 * _229;
    float _239 = _140 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _241 = in.m_77.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _249 = _144 + _247;
    float _251 = fma(_233, _233, _237);
    float _253 = in.m_77.w;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = sqrt(_251);
    bool _261 = _259 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _263 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _265 = _259 + _263;
    float _267 = _138 * _245;
    float _269 = _168;
    float _271 = _251;
    float _273 = _265;
    float _275 = (*spvDescriptorSet0.fp_c9)._m0[71].z;
    float _277 = 0.0;
    if (_261)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _269 = _279;
    }
    float _281 = _269;
    float _283 = _138 * _257;
    float _285 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _287 = 0.0;
    if (_261)
    {
        float _289 = _146 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _287 = _289;
    }
    float _291 = _287;
    float _293 = 0.0 + _283;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _291;
    if (_261)
    {
        float _299 = rsqrt(_251);
        _271 = _299;
    }
    float _301 = _271;
    float _303 = fma(_295, _285, 1.0);
    float _305 = _301;
    if (_261)
    {
        float _307 = _265 * _281;
        _273 = _307;
    }
    float _309 = _273;
    float _311 = log2(_303);
    float _313 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    if (_261)
    {
        float _315 = _309 * 0.15915493667125701904296875;
        _275 = _315;
    }
    float _317 = _275;
    float _319 = precise::min(_235, _313);
    float _321 = 0.0;
    if (_261)
    {
        float _323 = _317 * 6.283185482025146484375;
        float _325 = cos(_323);
        _321 = _325;
    }
    float _327 = _321;
    float _329 = _309;
    if (_261)
    {
        float _331 = _317 * 6.283185482025146484375;
        float _333 = sin(_331);
        _329 = _333;
    }
    float _335 = _329;
    float _337 = _311 * 0.693147182464599609375;
    float _339 = _311;
    if (!_261)
    {
        _339 = _146;
    }
    float _341 = _339;
    float _343 = _337 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = _345;
    float _349 = _341;
    if (_261)
    {
        float _351 = _327 + (-1.0);
        _277 = _351;
    }
    float _353 = _277;
    float _355 = floor(_319);
    float _357 = 0.0;
    if (_261)
    {
        float _359 = fma(_335, _291, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _357 = _359;
    }
    float _361 = _357;
    float _363 = _361;
    if (_261)
    {
        float _365 = _353 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _297 = _365;
    }
    float _367 = _297;
    float _369 = _345 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    if (!_261)
    {
        _347 = _148;
    }
    float _371 = _347;
    float _373 = _371;
    if (_261)
    {
        float _375 = _301 * _361;
        _363 = _375;
    }
    float _377 = _363;
    if (_261)
    {
        float _379 = fma(_146, _327, _367);
        _349 = _379;
    }
    float _381 = _349;
    if (!_261)
    {
        _305 = _144;
    }
    float _383 = _305;
    float _385 = in.m_77.x;
    float _387 = gl_FragCoord.w;
    float _389 = _385 * _387;
    float _391 = _383;
    if (_261)
    {
        float _393 = fma(_233, _377, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _391 = _393;
    }
    float _395 = _391;
    float _397 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _399 = _381 + _397;
    float _401 = precise::min(_285, _369);
    float _403 = _399;
    if (_261)
    {
        float _405 = fma(_229, _377, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _373 = _405;
    }
    float _407 = _373;
    float _409 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _411 = _395 + _409;
    float _413 = _399 * _399;
    float _415 = in.m_77.y;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _423 = _407 + _421;
    float _425 = floor(_401);
    float _427 = fma(_411, _411, _413);
    float _429 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _431 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _433 = _146 + _431;
    float _435 = fma(_423, _423, _427);
    float _437 = precise::min(_239, _429);
    float _439 = rsqrt(_435);
    float _441 = fma(_355, (*spvDescriptorSet0.fp_c9)._m0[71].x, _437);
    float _443 = _433 * _433;
    float _445 = _425 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _447 = fma(_249, _249, _443);
    float _449 = fma(_445, (*spvDescriptorSet0.fp_c9)._m0[71].x, _441);
    float _451 = _138 * _389;
    float _453 = trunc(_449);
    int _455 = int(_453);
    float _457 = _439 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _459 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _461 = _148 + _459;
    float _463 = _138 * _419;
    float _465 = _411 * _457;
    float _467 = _423 * _457;
    float _469 = fma(_461, _461, _447);
    float _471 = _465 * _465;
    float _473 = _467 * _467;
    float _475 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _477 = _471 + _473;
    float _479 = sqrt(_469);
    int _481 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _483 = _481 + _455;
    float _485 = precise::max(0.0, _475);
    float _487 = _463 * _463;
    int _489 = _483 * 136;
    float _491 = fma(_451, _451, _487);
    float _493 = sqrt(_477);
    float _495 = -_457;
    float _497 = -_485;
    float _499 = fma(_399, _495, _497);
    int _501 = _489 + 4;
    uint _504 = uint(int(uint(_489) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_504)];
    float _506 = as_type<float>(_dmw0.x);
    float _508 = fma(_267, _267, _491);
    uint _510 = uint(int(uint(_501) >> uint(2)));
    float _512 = as_type<float>(_dmw0.y);
    bool _514 = _493 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _516 = _447;
    float _518 = _491;
    float _520 = _465;
    float _522 = _467;
    if (!_514)
    {
        _516 = _473;
    }
    float _524 = _516;
    float _526 = _524;
    if (!_514)
    {
        _518 = _471;
    }
    float _528 = _518;
    float _530 = _528;
    if (!_514)
    {
        _403 = _499;
    }
    float _532 = _403;
    bool _534 = !_514;
    float _536 = _532;
    if (!_534)
    {
        float _538 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _540 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _542 = _493 + _540;
        float _544 = rsqrt(_477);
        float _546 = _542 * _538;
        float _548 = _499 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _550 = _546 * 0.15915493667125701904296875;
        float _552 = _550 * 6.283185482025146484375;
        float _554 = sin(_552);
        float _556 = _550 * 6.283185482025146484375;
        float _558 = cos(_556);
        float _560 = fma(_554, _548, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _562 = _544 * _560;
        float _564 = _558 + (-1.0);
        float _566 = _465 * _562;
        float _568 = _467 * _562;
        float _570 = _564 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _572 = _568 * _568;
        float _574 = fma(_499, _558, _570);
        float _576 = _566 * _566;
        _536 = _574;
        _530 = _576;
        _526 = _572;
        _520 = _566;
        _522 = _568;
    }
    float _578 = _536;
    float _580 = _530;
    float _582 = _526;
    float _584 = _520;
    float _586 = _522;
    float _588 = fma(_578, _578, _580);
    float _590 = rsqrt(_508);
    float _592 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _594 = 1.0 + _592;
    float _596 = _588 + _582;
    float _598 = spvFAdd(_479, 9.9999997473787516355514526367188e-06);
    float _600 = fma(_192, 0.0500000007450580596923828125, _158);
    float _602 = rsqrt(_596);
    float _604 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _606 = fma(_479, (*spvDescriptorSet0.fp_c9)._m0[63].x, _604);
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = -_608;
    float _612 = _610 + 1.0;
    float _614 = _451 * _590;
    float _616 = 1.0 / _598;
    float _618 = _463 * _590;
    float _620 = _267 * _590;
    float _622 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _624 = in.m_79.w;
    float _626 = gl_FragCoord.w;
    float _628 = _624 * _626;
    float _630 = _602 * _584;
    float _632 = _602 * _578;
    float _634 = _602 * _586;
    float _636 = abs(_612);
    float _638 = log2(_636);
    float _640 = _630 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _642 = _249 * _616;
    float _644 = _433 * _616;
    float _646 = _461 * _616;
    float _648 = -_640;
    float _650 = fma(_632, (*spvDescriptorSet0.fp_c9)._m0[69].y, _648);
    float _652 = _614 * _642;
    float _654 = _618 * _644;
    float _656 = _620 * _646;
    float _658 = -_634;
    float _660 = fma(_658, (*spvDescriptorSet0.fp_c9)._m0[69].z, _650);
    float _662 = _652 + _654;
    float _664 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _594);
    float _666 = fma(_660, -0.5, 0.5);
    float _668 = _638 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _670 = _656 + _662;
    float _672 = fma((*spvDescriptorSet0.fp_c11)._m0[40].x, 2.0, -0.5);
    float _674 = precise::clamp(_672, 0.0, 1.0);
    float _676 = _664 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _678 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _680 = _678 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _682 = _670 + _670;
    float _684 = sqrt(_666);
    float _686 = _138 * _628;
    float _688 = -_682;
    float _690 = fma(_614, _688, _642);
    float _692 = -_682;
    float _694 = fma(_618, _692, _644);
    float _696 = -_646;
    float _698 = fma(_620, _682, _696);
    float _700 = precise::min(_676, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _702 = _686 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _704 = exp2(_668);
    float _706 = abs(_690);
    float _708 = abs(_694);
    float _710 = precise::max(_706, _708);
    float _712 = -_702;
    float _714 = fma(_622, _712, 1.0);
    float _716 = abs(_698);
    float _718 = precise::max(_716, _710);
    float _720 = fma(_660, 0.5, 0.5);
    float _722 = -_700;
    float _724 = _722 + 1.0;
    float _726 = 1.0 / _718;
    float _728 = fma(_720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _730 = _674 * _724;
    float _732 = fma(_720, _728, -0.212114393711090087890625);
    float _734 = fma(_730, _680, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _736 = precise::max(0.0, _618);
    float _738 = gl_FragCoord.x;
    float _740 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _742 = _738 / _740;
    float _744 = fma(_720, _732, 1.570728778839111328125);
    float _746 = _684 * 0.636619746685028076171875;
    float _748 = _632 + 1.0;
    float _750 = -(*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _752 = fma(_734, (*spvDescriptorSet0.fp_c11)._m0[40].x, _750);
    float _754 = precise::min(_736, 0.100000001490116119384765625);
    float _756 = gl_FragCoord.y;
    float _758 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _760 = _756 / _758;
    float _762 = -_632;
    float _764 = fma(_704, _748, _762);
    float _766 = _690 * _726;
    float _768 = _694 * _726;
    float _770 = _698 * _726;
    float _772 = -_744;
    float _774 = fma(_746, _772, 1.0);
    float _776 = precise::max(_190, 0.25);
    float _778 = fma(_754, 10.0, -1.0);
    float _780 = 0.0 + _188;
    float _782 = precise::clamp(_780, 0.0, 1.0);
    float _784 = log2(_714);
    float _786 = _776 + _778;
    float _788 = _221 * _782;
    float _790 = _786 * 4.0;
    float _792 = precise::clamp(_790, 0.0, 1.0);
    float _794 = _788 * _792;
    float _796 = _150 + (*spvDescriptorSet0.fp_c11)._m0[24].x;
    float _798 = fma(_794, _752, (*spvDescriptorSet0.fp_c11)._m0[40].x);
    float _800 = fma(_192, 0.0500000007450580596923828125, _796);
    float _802 = _784 * 0.693147182464599609375;
    float _804 = _742 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _806 = _798 * 7.0;
    float _808 = fma(_764, 0.5, 0.5);
    float _810 = _802 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float2 _3174 = float2(_800, _600);
    float _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3174, float2(0.0), isnan(_3174))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3174, float2(0.0), isnan(_3174))).x;
    float2 _3182 = float2(_150, _158);
    float3 _816 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3182, float2(0.0), isnan(_3182))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3182, float2(0.0), isnan(_3182))).xyz;
    float _818 = _816.x;
    float _820 = _816.y;
    float _822 = _816.z;
    float3 _3197 = float3(_214, _210, float(1));
    float3 _3199 = select(_3197, float3(0.0), isnan(_3197));
    float _824 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3199.xy, uint(rint(_3199.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3199.xy, uint(rint(_3199.z))).x;
    float4 _3207 = float4(_766, _768, _770, float(1));
    float4 _3211 = select(_3207, float4(0.0), isnan(_3207));
    float3 _826 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, _3211.xyz, uint(rint(_3211.w)), level(_806)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, _3211.xyz, uint(rint(_3211.w)), level(_806)).xyz;
    float _828 = _826.x;
    float _830 = _826.y;
    float _832 = _826.z;
    float _834 = _760 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float3 _3229 = float3(_804, _834, _810);
    float _836 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3229, float3(0.0), isnan(_3229))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3229, float3(0.0), isnan(_3229))).x;
    float2 _3237 = float2(_774, _808);
    float3 _838 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_3237, float2(0.0), isnan(_3237))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_3237, float2(0.0), isnan(_3237))).xyz;
    float _840 = _838.x;
    float _842 = _838.y;
    float _844 = _838.z;
    float2 _3251 = float2(_206, _204);
    float4 _846 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_3251, float2(0.0), isnan(_3251))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_3251, float2(0.0), isnan(_3251))).xyzw;
    float _848 = _846.x;
    float _850 = _846.y;
    float _852 = _846.z;
    float _854 = _846.w;
    float _856 = -(*spvDescriptorSet0.fp_c11)._m0[24].y;
    float _858 = _146 + _856;
    float _860 = in.m_79.x;
    float _862 = gl_FragCoord.w;
    float _864 = _860 * _862;
    float _866 = in.m_79.y;
    float _868 = gl_FragCoord.w;
    float _870 = _866 * _868;
    float _872 = in.m_79.z;
    float _874 = gl_FragCoord.w;
    float _876 = _872 * _874;
    float _878 = _858 * 25.1327419281005859375;
    float _880 = _644 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _882 = _642 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _884 = _219 * _221;
    float _886 = _878 * 0.15915493667125701904296875;
    float _888 = _880 * _880;
    float _890 = _646 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _892 = _886 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = fma(_882, _882, _888);
    float _898 = -_652;
    float _900 = -_654;
    float _902 = _898 + _900;
    float _904 = abs(_670);
    float _906 = fma(_904, -2.5, 1.75);
    float _908 = precise::clamp(_906, 0.0, 1.0);
    float _910 = fma(_890, _890, _896);
    float _912 = -_656;
    float _914 = _912 + _902;
    float _916 = precise::clamp(_914, 0.0, 1.0);
    bool _918 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _920 = -_225;
    float _922 = _920 + 1.0;
    bool _924 = as_type<uint>(_506) > 0u;
    float _926 = rsqrt(_910);
    bool _928 = as_type<uint>(_512) > 0u;
    float _930 = -_922;
    float _932 = fma(_930, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _934 = -_223;
    float _936 = _934 + 1.0;
    float _938 = fma(_894, 0.5, 0.5);
    float _940 = _938 * _938;
    float _942 = _138 * _864;
    float _944 = _138 * _870;
    float _946 = _138 * _876;
    float _948 = _940 * 0.02500000037252902984619140625;
    float _950 = _880 * _926;
    float _952 = _882 * _926;
    float _954 = fma(_940, -0.75, 0.75);
    float _956 = _890 * _926;
    float _958 = _950 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _960 = _614 * _952;
    float _962 = _940 + _954;
    float _964 = fma(_952, (*spvDescriptorSet0.fp_c9)._m0[69].x, _958);
    float _966 = _908 + 1.0;
    float _968 = -_950;
    float _970 = -_960;
    float _972 = fma(_618, _968, _970);
    float _974 = fma(_956, (*spvDescriptorSet0.fp_c9)._m0[69].z, _964);
    float _976 = precise::clamp(_974, 0.0, 1.0);
    float _978 = -_956;
    float _980 = fma(_620, _978, _972);
    float _982 = precise::clamp(_980, 0.0, 1.0);
    float _984 = -_976;
    float _986 = _984 + 1.0;
    float _988 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _594);
    float _990 = _812 * 0.4000000059604644775390625;
    float _992 = fma(_820, _966, _948);
    float _994 = fma(_818, _966, _948);
    float _996 = fma(_822, _966, _948);
    float _998 = -_824;
    float _1000 = _998 + 1.0;
    float _1002 = fma(_990, _962, _992);
    float _1004 = fma(_990, _962, _994);
    float _1006 = fma(_990, _962, _996);
    float _1008 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _594);
    float _1010 = _1002 * 0.17880000174045562744140625;
    float _1012 = _986 * _986;
    float _1014 = fma(_674, -0.449999988079071044921875, 1.0);
    float _1016 = -_1000;
    float _1018 = fma(_1016, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1020 = fma(_1004, 0.053149998188018798828125, _1010);
    float _1022 = _1012 * _1012;
    float _1024 = _818 * _1014;
    float _1026 = _820 * _1014;
    float _1028 = fma(_1006, 0.01805000007152557373046875, _1020);
    float _1030 = _986 * _1022;
    float _1032 = -_1026;
    float _1034 = _820 + _1032;
    float _1036 = 1.0 / _1028;
    float _1038 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1040 = fma(_479, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1038);
    float _1042 = precise::clamp(_1040, 0.0, 1.0);
    float _1044 = -_1008;
    float _1046 = fma(_1044, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1048 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1050 = precise::max(_1046, 1.0);
    float _1052 = _1036 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1054 = _1048 * _1052;
    float _1056 = precise::clamp(_1054, 0.0, 1.0);
    float _1058 = -_1024;
    float _1060 = _818 + _1058;
    float _1062 = fma(_1056, (*spvDescriptorSet0.fp_c9)._m0[40].y, (*spvDescriptorSet0.fp_c9)._m0[40].x);
    float _1064 = fma(_1050, _1060, _1024);
    float _1066 = fma(_1050, _1034, _1026);
    float _1068 = _822 * _1014;
    float _1070 = _916 * (-9.27999973297119140625);
    float _1072 = precise::min(_1052, _1062);
    float _1074 = -_1068;
    float _1076 = _822 + _1074;
    float _1078 = exp2(_1070);
    float _1080 = fma(_1050, _1076, _1068);
    float _1082 = _1072 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1084 = _884 * _932;
    float _1086 = -_818;
    float _1088 = _1086 + _1064;
    float _1090 = fma(_798, _798, 0.00999999977648258209228515625);
    float _1092 = precise::clamp(_1090, 0.0, 1.0);
    float _1094 = fma(_1062, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1082);
    float _1096 = -_936;
    float _1098 = fma(_1096, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1100 = precise::clamp(_1098, 0.0, 1.0);
    float _1102 = -_820;
    float _1104 = _1102 + _1066;
    float _1106 = _1092 * _1092;
    float _1108 = -_798;
    float _1110 = _1108 + 1.0;
    float _1112 = fma(_794, _1088, _818);
    float _1114 = _1084 * _1100;
    float _1116 = fma(_794, _1104, _820);
    float _1118 = _982 * _982;
    float _1120 = _1106 + (-1.0);
    float _1122 = _1110 * _1110;
    float _1124 = fma(_798, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1126 = fma(_798, -0.572000026702880859375, 1.03999996185302734375);
    float _1128 = fma(_1118, _1120, 1.0);
    float _1130 = fma(_798, 0.5, 0.5);
    float _1132 = precise::min(_1122, _1078);
    float _1134 = fma(_798, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1136 = _1128 * _1128;
    float _1138 = _614 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1140 = _1130 * _1130;
    float _1142 = _1140 * 0.5;
    float _1144 = fma(_1110, _1132, _1124);
    float _1146 = _988 + (-1.0);
    float _1148 = -_618;
    float _1150 = -_1138;
    float _1152 = fma(_1148, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1150);
    float _1154 = 1.0 / _1136;
    float _1156 = -_1142;
    float _1158 = _1156 + 1.0;
    float _1160 = -_822;
    float _1162 = _1160 + _1080;
    float _1164 = -_620;
    float _1166 = fma(_1164, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1152);
    float _1168 = precise::clamp(_1166, 0.0, 1.0);
    float _1170 = fma(_794, _1146, 1.0);
    float _1172 = fma(_1144, 1.03999996185302734375, _1134);
    float _1174 = precise::clamp(_1172, 0.0, 1.0);
    float _1176 = fma(_916, _1158, _1142);
    float _1178 = fma(_1168, _1158, _1142);
    float _1180 = fma(_1144, -1.03999996185302734375, _1126);
    float _1182 = precise::clamp(_1180, 0.0, 1.0);
    float _1184 = _1170 * _1174;
    float _1186 = fma(_794, _1162, _822);
    float _1188 = _1106 * 0.31830990314483642578125;
    float _1190 = _1176 * _1178;
    float _1192 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1194 = -_1116;
    float _1196 = _1194 + _1170;
    float _1198 = fma(_1116, _1182, _1184);
    float _1200 = _1188 * _1154;
    float _1202 = fma(_1112, _1182, _1184);
    float _1204 = 1.0 / _1190;
    float _1206 = fma(_1196, _1030, _1116);
    float _1208 = _1168 * _1200;
    float _1210 = _1208 * 0.25;
    float _1212 = _1192 * _828;
    float _1214 = _1192 * 0.31830990314483642578125;
    float _1216 = _1192 * _830;
    float _1218 = _1192 * _832;
    float _1220 = fma(_1186, _1182, _1184);
    float _1222 = -_1112;
    float _1224 = _1222 + _1170;
    float _1226 = -_1186;
    float _1228 = _1226 + _1170;
    float _1230 = -_1212;
    float _1232 = fma(_942, _1214, _1230);
    float _1234 = -_1216;
    float _1236 = fma(_944, _1214, _1234);
    float _1238 = -_1218;
    float _1240 = fma(_946, _1214, _1238);
    float _1242 = fma(_1224, _1030, _1112);
    float _1244 = fma(_1228, _1030, _1186);
    float _1246 = fma(_1042, _1232, _1212);
    float _1248 = _1210 * _1204;
    float _1250 = fma(_1042, _1236, _1216);
    float _1252 = fma(_1042, _1240, _1218);
    float _1254 = _1186;
    float _1256 = _1224;
    float _1258 = _1030;
    float _1260 = 0.0;
    float _1262 = 0.0;
    float _1264 = 0.0;
    float _1266 = 0.0;
    float _1268 = 0.0;
    float _1270 = 0.0;
    if (!_918)
    {
        _1254 = 0.0;
        _1256 = 0.0;
    }
    float _1272 = _1254;
    float _1274 = _1256;
    float _1276 = _1272;
    float _1278 = _1274;
    if (!_918)
    {
        _1258 = 0.0;
    }
    float _1280 = _1258;
    bool _1282 = !_918;
    float _1284 = _1280;
    if (!_1282)
    {
        float _1286 = -_146;
        float _1288 = _1286 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1290 = -_144;
        float _1292 = _1290 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1294 = -_148;
        float _1296 = _1294 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1298 = _1288 * _1288;
        float _1300 = fma(_1292, _1292, _1298);
        float _1302 = fma(_1296, _1296, _1300);
        float _1304 = rsqrt(_1302);
        float _1306 = _1288 * _1304;
        float _1308 = _1292 * _1304;
        float _1310 = _1296 * _1304;
        float _1312 = -_644;
        float _1314 = _1312 + _1306;
        float _1316 = -_642;
        float _1318 = _1316 + _1308;
        float _1320 = -_646;
        float _1322 = _1320 + _1310;
        float _1324 = sqrt(_1302);
        float _1326 = _1314 * _1314;
        float _1328 = fma(_1318, _1318, _1326);
        float _1330 = fma(_1322, _1322, _1328);
        float _1332 = rsqrt(_1330);
        float _1334 = -_1324;
        float _1336 = _1334 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1338 = _1336 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1340 = precise::clamp(_1338, 0.0, 1.0);
        float _1342 = abs(_1340);
        float _1344 = log2(_1342);
        float _1346 = _1314 * _1332;
        float _1348 = _1318 * _1332;
        float _1350 = _1322 * _1332;
        float _1352 = _618 * _1346;
        float _1354 = fma(_614, _1348, _1352);
        float _1356 = _1344 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1358 = fma(_620, _1350, _1354);
        float _1360 = precise::clamp(_1358, 0.0, 1.0);
        float _1362 = _1360 * _1360;
        float _1364 = _1308 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1366 = exp2(_1356);
        float _1368 = fma(_1120, _1362, 1.0);
        float _1370 = -_1306;
        float _1372 = -_1364;
        float _1374 = fma(_1370, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1372);
        float _1376 = _618 * _1306;
        float _1378 = _1368 * _1368;
        float _1380 = -_1310;
        float _1382 = fma(_1380, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1374);
        float _1384 = fma(_614, _1308, _1376);
        float _1386 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1388 = _1382 + _1386;
        float _1390 = 1.0 / _1378;
        float _1392 = fma(_620, _1310, _1384);
        float _1394 = precise::clamp(_1392, 0.0, 1.0);
        float _1396 = _1388 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1398 = precise::clamp(_1396, 0.0, 1.0);
        float _1400 = _1366 * _1398;
        float _1402 = _1394 * _1400;
        float _1404 = _1106 * _1390;
        float _1406 = _1404 * _1402;
        float _1408 = _1406 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1410 = _1406 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1412 = _1406 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1284 = _1408;
        _1276 = _1410;
        _1278 = _1412;
    }
    float _1414 = _1284;
    float _1416 = _1276;
    float _1418 = _1278;
    bool _1420 = !_924;
    if (!_1420)
    {
        int _1422 = 0;
        bool _1424;
        do
        {
            int _1426 = _1422;
            float _1428 = _1260;
            float _1430 = _1262;
            float _1432 = _1264;
            int _1434 = _1426 << 1;
            int _1436 = _1434 + _489;
            int _1438 = _1436 + 8;
            int _1440 = _1438;
            int _1442 = _90(_1440, (*spvDescriptorSet0.fp_s0));
            int _1444 = _1426 + 1;
            bool _1446 = uint(_1444) >= as_type<uint>(_506);
            int _1448 = _1442 & 65535;
            int _1450 = _1448 * 48;
            int _1452 = _1450 + 1168;
            uint _1454 = uint(int(uint(_1452) >> uint(2)));
            uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
            int _1458 = int(_1454) & 3;
            float _1460 = (*spvDescriptorSet0.fp_c9)._m0[int(_1456)][_1458];
            int _1462 = int(_1454) + 1;
            uint _1464 = uint(int(uint(_1462) >> uint(2)));
            int _1466 = _1462 & 3;
            float _1468 = (*spvDescriptorSet0.fp_c9)._m0[int(_1464)][_1466];
            int _1470 = _1450 + 1176;
            uint _1472 = uint(int(uint(_1470) >> uint(2)));
            uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
            int _1476 = int(_1472) & 3;
            float _1478 = (*spvDescriptorSet0.fp_c9)._m0[int(_1474)][_1476];
            int _1480 = int(_1472) + 1;
            uint _1482 = uint(int(uint(_1480) >> uint(2)));
            int _1484 = _1480 & 3;
            float _1486 = (*spvDescriptorSet0.fp_c9)._m0[int(_1482)][_1484];
            float _1488 = -_146;
            float _1490 = _1488 + _1468;
            float _1492 = -_144;
            float _1494 = _1492 + _1460;
            float _1496 = _1490 * _1490;
            float _1498 = -_148;
            float _1500 = _1498 + _1478;
            float _1502 = fma(_1494, _1494, _1496);
            int _1504 = _1450 + 1200;
            uint _1506 = uint(int(uint(_1504) >> uint(2)));
            uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
            int _1510 = int(_1506) & 3;
            float _1512 = (*spvDescriptorSet0.fp_c9)._m0[int(_1508)][_1510];
            float _1514 = fma(_1500, _1500, _1502);
            float _1516 = rsqrt(_1514);
            float _1518 = sqrt(_1514);
            float _1520 = _1490 * _1516;
            float _1522 = _1494 * _1516;
            float _1524 = _1500 * _1516;
            float _1526 = -_644;
            float _1528 = _1526 + _1520;
            float _1530 = _618 * _1520;
            float _1532 = -_646;
            float _1534 = _1532 + _1524;
            float _1536 = -_1518;
            float _1538 = _1536 + _1486;
            float _1540 = -_642;
            float _1542 = _1540 + _1522;
            float _1544 = _1528 * _1528;
            float _1546 = fma(_614, _1522, _1530);
            float _1548 = fma(_1542, _1542, _1544);
            float _1550 = fma(_620, _1524, _1546);
            float _1552 = precise::clamp(_1550, 0.0, 1.0);
            int _1554 = _1450 + 1192;
            uint _1556 = uint(int(uint(_1554) >> uint(2)));
            uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
            int _1560 = int(_1556) & 3;
            float _1562 = (*spvDescriptorSet0.fp_c9)._m0[int(_1558)][_1560];
            int _1564 = int(_1556) + 1;
            uint _1566 = uint(int(uint(_1564) >> uint(2)));
            int _1568 = _1564 & 3;
            float _1570 = (*spvDescriptorSet0.fp_c9)._m0[int(_1566)][_1568];
            float _1572 = fma(_1534, _1534, _1548);
            float _1574 = rsqrt(_1572);
            float _1576 = _1538 * _1512;
            float _1578 = precise::clamp(_1576, 0.0, 1.0);
            float _1580 = abs(_1578);
            float _1582 = log2(_1580);
            float _1584 = _1528 * _1574;
            float _1586 = _1542 * _1574;
            float _1588 = _618 * _1584;
            float _1590 = _1534 * _1574;
            float _1592 = fma(_614, _1586, _1588);
            int _1594 = _1450 + 1184;
            uint _1596 = uint(int(uint(_1594) >> uint(2)));
            uint _1598 = uint(int(uint(int(_1596)) >> uint(2)));
            int _1600 = int(_1596) & 3;
            float _1602 = (*spvDescriptorSet0.fp_c9)._m0[int(_1598)][_1600];
            int _1604 = int(_1596) + 1;
            uint _1606 = uint(int(uint(_1604) >> uint(2)));
            int _1608 = _1604 & 3;
            float _1610 = (*spvDescriptorSet0.fp_c9)._m0[int(_1606)][_1608];
            float _1612 = fma(_620, _1590, _1592);
            float _1614 = precise::clamp(_1612, 0.0, 1.0);
            float _1616 = _1614 * _1614;
            float _1618 = fma(_1120, _1616, 1.0);
            float _1620 = _1618 * _1618;
            float _1622 = _1582 * _1570;
            float _1624 = 1.0 / _1620;
            float _1626 = exp2(_1622);
            float _1628 = _1106 * _1624;
            float _1630 = _1552 * _1626;
            float _1632 = _1628 * _1630;
            float _1634 = fma(_1632, _1602, _1428);
            float _1636 = fma(_1632, _1610, _1430);
            float _1638 = fma(_1632, _1562, _1432);
            _1424 = !_1446;
            _1422 = _1444;
            _1260 = _1634;
            _1262 = _1636;
            _1264 = _1638;
            _1266 = _1634;
            _1268 = _1636;
            _1270 = _1638;
        } while (_1424);
    }
    float _1640 = _1266;
    float _1642 = _1268;
    float _1644 = _1270;
    bool _1646 = !_928;
    float _1648 = _1640;
    float _1650 = _1642;
    float _1652 = _1644;
    float _1654 = _1640;
    float _1656 = _1642;
    float _1658 = _1644;
    if (!_1646)
    {
        int _1660 = 0;
        bool _1662;
        do
        {
            int _1664 = _1660;
            float _1666 = _1648;
            float _1668 = _1650;
            float _1670 = _1652;
            int _1672 = _1664 << 1;
            int _1674 = _1672 + _489;
            int _1676 = _1674 + 72;
            int _1678 = _1676;
            int _1680 = _90(_1678, (*spvDescriptorSet0.fp_s0));
            int _1682 = _1664 + 1;
            bool _1684 = uint(_1682) >= as_type<uint>(_512);
            int _1686 = _1680 << 6;
            int _1688 = 4194240 & _1686;
            int _1690 = _1688 + 10384;
            uint _1692 = uint(int(uint(_1690) >> uint(2)));
            uint _1694 = uint(int(uint(int(_1692)) >> uint(2)));
            int _1696 = int(_1692) & 3;
            float _1698 = (*spvDescriptorSet0.fp_c9)._m0[int(_1694)][_1696];
            int _1700 = int(_1692) + 1;
            uint _1702 = uint(int(uint(_1700) >> uint(2)));
            int _1704 = _1700 & 3;
            float _1706 = (*spvDescriptorSet0.fp_c9)._m0[int(_1702)][_1704];
            int _1708 = _1688 + 10392;
            uint _1710 = uint(int(uint(_1708) >> uint(2)));
            uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
            int _1714 = int(_1710) & 3;
            float _1716 = (*spvDescriptorSet0.fp_c9)._m0[int(_1712)][_1714];
            int _1718 = int(_1710) + 1;
            uint _1720 = uint(int(uint(_1718) >> uint(2)));
            int _1722 = _1718 & 3;
            float _1724 = (*spvDescriptorSet0.fp_c9)._m0[int(_1720)][_1722];
            float _1726 = -_146;
            float _1728 = _1726 + _1706;
            float _1730 = -_144;
            float _1732 = _1730 + _1698;
            float _1734 = _1728 * _1728;
            float _1736 = -_148;
            float _1738 = _1736 + _1716;
            float _1740 = fma(_1732, _1732, _1734);
            float _1742 = fma(_1738, _1738, _1740);
            int _1744 = _1688 + 10400;
            uint _1746 = uint(int(uint(_1744) >> uint(2)));
            uint _1748 = uint(int(uint(int(_1746)) >> uint(2)));
            int _1750 = int(_1746) & 3;
            float _1752 = (*spvDescriptorSet0.fp_c9)._m0[int(_1748)][_1750];
            int _1754 = int(_1746) + 1;
            uint _1756 = uint(int(uint(_1754) >> uint(2)));
            int _1758 = _1754 & 3;
            float _1760 = (*spvDescriptorSet0.fp_c9)._m0[int(_1756)][_1758];
            float _1762 = rsqrt(_1742);
            float _1764 = sqrt(_1742);
            float _1766 = _1728 * _1762;
            float _1768 = _1732 * _1762;
            float _1770 = _1738 * _1762;
            float _1772 = -_644;
            float _1774 = _1772 + _1766;
            float _1776 = -_642;
            float _1778 = _1776 + _1768;
            float _1780 = -_646;
            float _1782 = _1780 + _1770;
            float _1784 = _1774 * _1774;
            float _1786 = fma(_1778, _1778, _1784);
            int _1788 = _1688 + 10436;
            uint _1790 = uint(int(uint(_1788) >> uint(2)));
            uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
            int _1794 = int(_1790) & 3;
            float _1796 = (*spvDescriptorSet0.fp_c9)._m0[int(_1792)][_1794];
            float _1798 = fma(_1782, _1782, _1786);
            float _1800 = -_1764;
            float _1802 = _1800 + _1724;
            float _1804 = rsqrt(_1798);
            float _1806 = _1768 * _1752;
            float _1808 = -_1766;
            float _1810 = -_1806;
            float _1812 = fma(_1808, _1760, _1810);
            float _1814 = _618 * _1766;
            float _1816 = _1774 * _1804;
            float _1818 = _1778 * _1804;
            float _1820 = _1782 * _1804;
            int _1822 = _1688 + 10444;
            uint _1824 = uint(int(uint(_1822) >> uint(2)));
            uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
            int _1828 = int(_1824) & 3;
            float _1830 = (*spvDescriptorSet0.fp_c9)._m0[int(_1826)][_1828];
            float _1832 = _618 * _1816;
            float _1834 = fma(_614, _1768, _1814);
            float _1836 = fma(_614, _1818, _1832);
            float _1838 = fma(_620, _1770, _1834);
            float _1840 = precise::clamp(_1838, 0.0, 1.0);
            int _1842 = _1688 + 10424;
            uint _1844 = uint(int(uint(_1842) >> uint(2)));
            uint _1846 = uint(int(uint(int(_1844)) >> uint(2)));
            int _1848 = int(_1844) & 3;
            float _1850 = (*spvDescriptorSet0.fp_c9)._m0[int(_1846)][_1848];
            int _1852 = int(_1844) + 1;
            uint _1854 = uint(int(uint(_1852) >> uint(2)));
            int _1856 = _1852 & 3;
            float _1858 = (*spvDescriptorSet0.fp_c9)._m0[int(_1854)][_1856];
            float _1860 = fma(_620, _1820, _1836);
            float _1862 = precise::clamp(_1860, 0.0, 1.0);
            float _1864 = _1862 * _1862;
            int _1866 = _1688 + 10408;
            uint _1868 = uint(int(uint(_1866) >> uint(2)));
            uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
            int _1872 = int(_1868) & 3;
            float _1874 = (*spvDescriptorSet0.fp_c9)._m0[int(_1870)][_1872];
            int _1876 = int(_1868) + 1;
            uint _1878 = uint(int(uint(_1876) >> uint(2)));
            int _1880 = _1876 & 3;
            float _1882 = (*spvDescriptorSet0.fp_c9)._m0[int(_1878)][_1880];
            float _1884 = fma(_1120, _1864, 1.0);
            float _1886 = _1884 * _1884;
            float _1888 = _1802 * _1796;
            float _1890 = precise::clamp(_1888, 0.0, 1.0);
            int _1892 = _1688 + 10416;
            uint _1894 = uint(int(uint(_1892) >> uint(2)));
            uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
            int _1898 = int(_1894) & 3;
            float _1900 = (*spvDescriptorSet0.fp_c9)._m0[int(_1896)][_1898];
            int _1902 = int(_1894) + 1;
            uint _1904 = uint(int(uint(_1902) >> uint(2)));
            int _1906 = _1902 & 3;
            float _1908 = (*spvDescriptorSet0.fp_c9)._m0[int(_1904)][_1906];
            float _1910 = abs(_1890);
            float _1912 = log2(_1910);
            float _1914 = _1912 * _1858;
            float _1916 = exp2(_1914);
            float _1918 = -_1770;
            float _1920 = fma(_1918, _1874, _1812);
            float _1922 = -_1882;
            float _1924 = _1920 + _1922;
            float _1926 = 1.0 / _1886;
            float _1928 = _1924 * _1830;
            float _1930 = precise::clamp(_1928, 0.0, 1.0);
            float _1932 = _1916 * _1930;
            float _1934 = _1840 * _1932;
            float _1936 = _1106 * _1926;
            float _1938 = _1936 * _1934;
            float _1940 = fma(_1938, _1900, _1666);
            float _1942 = fma(_1938, _1908, _1668);
            float _1944 = fma(_1938, _1850, _1670);
            _1662 = !_1684;
            _1660 = _1682;
            _1648 = _1940;
            _1650 = _1942;
            _1652 = _1944;
            _1654 = _1940;
            _1656 = _1942;
            _1658 = _1944;
        } while (_1662);
    }
    float _1946 = _1654;
    float _1948 = _1656;
    float _1950 = _1658;
    float _1952 = _638 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1954 = _1946 + _1414;
    float _1956 = _1948 + _1416;
    float _1958 = _1950 + _1418;
    float _1960 = precise::min(_1018, 1.0);
    float _1962 = _1246 + _1954;
    float _1964 = exp2(_1952);
    float _1966 = _1250 + _1956;
    float _1968 = _1252 + _1958;
    float _1970 = precise::min(_223, _1960);
    float _1972 = _1242 * _1248;
    float _1974 = _1202 * _1962;
    float _1976 = _1206 * _1248;
    float _1978 = _1244 * _1248;
    float _1980 = _1198 * _1966;
    float _1982 = _1220 * _1968;
    float _1984 = _1972 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1986 = _1970 * _1974;
    float _1988 = _1976 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1990 = _1970 * _1980;
    float _1992 = _1970 * _1982;
    float _1994 = _1978 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1996 = -_1964;
    float _1998 = _1996 + 1.0;
    float _2000 = fma(_1984, _1114, _1986);
    float _2002 = _1004 * 0.25;
    float _2004 = fma(_1988, _1114, _1990);
    float _2006 = _1998 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _2008 = _1002 * 0.25;
    float _2010 = fma(_1994, _1114, _1992);
    float _2012 = _1006 * 0.25;
    float _2014 = -_2006;
    float _2016 = _2014 + 1.0;
    float _2018 = fma(_2002, _1094, _2000);
    float _2020 = fma(_2008, _1094, _2004);
    float _2022 = _840 * _2006;
    float _2024 = _854 * _2016;
    float _2026 = _842 * _2006;
    float _2028 = fma(_2012, _1094, _2010);
    float _2030 = _854 * _836;
    float _2032 = _844 * _2006;
    float _2034 = precise::max(0.0, _2018);
    float _2036 = fma(_2026, _2030, _850);
    float _2038 = precise::max(0.0, _2020);
    float _2040 = fma(_2022, _2030, _848);
    float _2042 = precise::max(0.0, _2028);
    float _2044 = fma(_2032, _2030, _852);
    float _2046 = fma(_2024, _2034, _2040);
    float _2048 = fma(_2024, _2038, _2036);
    float _2050 = fma(_2024, _2042, _2044);
    out.m_82.x = _2046;
    out.m_82.y = _2048;
    out.m_82.z = _2050;
    out.m_82.w = 1.0;
    out.m_84.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

