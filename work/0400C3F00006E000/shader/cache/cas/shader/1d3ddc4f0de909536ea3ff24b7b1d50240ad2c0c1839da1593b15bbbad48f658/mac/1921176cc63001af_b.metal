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
    texture2d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_1C [[id(9)]];
    sampler fp_t_tcb_1CSmplr [[id(10)]];
    texture3d<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_A [[id(13)]];
    sampler fp_t_tcb_ASmplr [[id(14)]];
    texture2d<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d_array<float> fp_t_tcb_12 [[id(17)]];
    sampler fp_t_tcb_12Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_8 [[id(19)]];
    sampler fp_t_tcb_8Smplr [[id(20)]];
    texturecube_array<float> fp_t_tcb_1A [[id(21)]];
    sampler fp_t_tcb_1ASmplr [[id(22)]];
    texture3d<float> fp_t_tcb_20 [[id(23)]];
    sampler fp_t_tcb_20Smplr [[id(24)]];
    texture2d<float> fp_t_tcb_E [[id(25)]];
    sampler fp_t_tcb_ESmplr [[id(26)]];
    texture2d<float> fp_t_tcb_16 [[id(27)]];
    sampler fp_t_tcb_16Smplr [[id(28)]];
    texture2d<float> fp_t_tcb_14 [[id(29)]];
    sampler fp_t_tcb_14Smplr [[id(30)]];
    sampler fp_t_tcb_18Smplr_w [[id(31)]];
    sampler fp_t_tcb_1CSmplr_w [[id(32)]];
    sampler fp_t_tcb_1ESmplr_w [[id(33)]];
    sampler fp_t_tcb_ASmplr_w [[id(34)]];
    sampler fp_t_tcb_CSmplr_w [[id(35)]];
    sampler fp_t_tcb_12Smplr_w [[id(36)]];
    sampler fp_t_tcb_8Smplr_w [[id(37)]];
    sampler fp_t_tcb_1ASmplr_w [[id(38)]];
    sampler fp_t_tcb_20Smplr_w [[id(39)]];
    sampler fp_t_tcb_ESmplr_w [[id(40)]];
    sampler fp_t_tcb_16Smplr_w [[id(41)]];
    sampler fp_t_tcb_14Smplr_w [[id(42)]];
    constant dm_border_t* dm_border [[id(43)]];
};

struct main0_out
{
    float4 m_86 [[color(0)]];
    float4 m_88 [[color(1)]];
};

struct main0_in
{
    float4 m_77 [[user(locn0)]];
    float4 m_81 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
};

static inline __attribute__((always_inline))
int _94(thread const int& _5254, const device _31& fp_s0)
{
    uint _5257 = uint(int(uint(_5254) >> uint(2)));
    float _5259 = as_type<float>(fp_s0._m0[int(_5257)]);
    int _5261 = _5254 & 3;
    int _5263 = _5261 << 3;
    int _5265 = as_type<int>(_5259) >> _5263;
    int _5267 = extract_bits(_5265, 0u, 16u);
    return _5267;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _98 = gl_FragCoord.x;
    float _100 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _102 = _98 / _100;
    float _104 = gl_FragCoord.y;
    float _106 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _108 = _104 / _106;
    float _110 = _102 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _112 = _108 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _2166 = float2(_110, _112);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2166, float2(0.0), isnan(_2166))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2166, float2(0.0), isnan(_2166))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = gl_FragCoord.w;
    float _124 = in.m_75.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_75.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_75.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_77.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_77.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = 1.0 / _122;
    float _156 = _154 * _128;
    float _158 = _154 * _134;
    float _160 = _154 * _140;
    float _162 = _154 * _146;
    float _164 = _156 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _166 = _158 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _168 = _160 + (*spvDescriptorSet0.fp_c7)._m0[11].y;
    float _170 = fma(_156, 6.2500002968590706586837768554688e-05, 0.5);
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _164 * (*spvDescriptorSet0.fp_c11)._m0[30].z;
    float _176 = _166 * (*spvDescriptorSet0.fp_c11)._m0[30].x;
    float _178 = _168 * (*spvDescriptorSet0.fp_c11)._m0[30].y;
    float _180 = _154 * _152;
    float _182 = fma(_174, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].z);
    float _184 = fma(_158, 6.2500002968590706586837768554688e-05, 0.5);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = fma(_176, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].x);
    float _190 = fma(_178, (*spvDescriptorSet0.fp_c11)._m0[45].x, (*spvDescriptorSet0.fp_c11)._m0[29].y);
    float2 _2295 = float2(_186, _172);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2295, float2(0.0), isnan(_2295))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2295, float2(0.0), isnan(_2295))).x;
    float3 _2304 = float3(_188, _190, _182);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2304, float3(0.0), isnan(_2304))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2304, float3(0.0), isnan(_2304))).x;
    float2 _2314 = float2(_162, _180);
    float2 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2314, float2(0.0), isnan(_2314))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2314, float2(0.0), isnan(_2314))).xy;
    float _198 = _196.x;
    float _200 = _196.y;
    float2 _2326 = float2(_162, _180);
    float2 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2326, float2(0.0), isnan(_2326))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2326, float2(0.0), isnan(_2326))).xz;
    float _204 = _202.x;
    float _206 = _202.y;
    int _208 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _212 = _208 != 0;
    float _214 = fma(_120, 2.0, -1.0);
    float _216 = fma(_118, 2.0, -1.0);
    float _218 = fma(_214, (*spvDescriptorSet0.fp_c9)._m0[983].w, _112);
    float _220 = fma(_216, (*spvDescriptorSet0.fp_c9)._m0[983].z, _110);
    bool _222 = !_212;
    float _224 = _222 ? _112 : _218;
    bool _226 = !_212;
    float _228 = _226 ? _110 : _220;
    float3 _2375 = float3(_228, _224, float(0));
    float3 _2377 = select(_2375, float3(0.0), isnan(_2375));
    float4 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _2377.xy, uint(rint(_2377.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _2377.xy, uint(rint(_2377.z))).xyzw;
    float _233 = _231.x;
    float _235 = _231.y;
    float _237 = _231.z;
    float _239 = _231.w;
    float _241 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _243 = _156 + _241;
    float _245 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _247 = _158 + _245;
    float _249 = in.m_79.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = _243 * _243;
    float _257 = _112 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _259 = in.m_79.y;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = fma(_247, _247, _255);
    float _267 = (*spvDescriptorSet0.fp_c9)._m0[71].z + (-1.0);
    float _269 = in.m_79.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_81.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = sqrt(_265);
    float _283 = in.m_81.x;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_81.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = _110 * (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _297 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _299 = precise::max(0.0, _297);
    bool _301 = _281 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _303 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _305 = _281 + _303;
    float _307 = _154 * _253;
    float _309 = 0.0 + _307;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    float _313 = 0.0;
    float _315 = _305;
    float _317 = _265;
    float _319 = _293;
    if (_301)
    {
        float _321 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _313 = _321;
    }
    float _323 = _313;
    float _325 = fma(_311, _267, 1.0);
    float _327 = 0.0;
    if (_301)
    {
        float _329 = _160 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _327 = _329;
    }
    float _331 = _327;
    float _333 = _154 * _273;
    float _335 = log2(_325);
    float _337 = _331;
    if (_301)
    {
        float _339 = _305 * _323;
        _315 = _339;
    }
    float _341 = _315;
    if (_301)
    {
        float _343 = rsqrt(_265);
        _317 = _343;
    }
    float _345 = _317;
    float _347 = 0.0;
    float _349 = _345;
    if (_301)
    {
        float _351 = _341 * 0.15915493667125701904296875;
        _347 = _351;
    }
    float _353 = _347;
    float _355 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _357 = _323;
    float _359 = _355;
    float _361 = _353;
    if (_301)
    {
        float _363 = _353 * 6.283185482025146484375;
        float _365 = cos(_363);
        _357 = _365;
    }
    float _367 = _357;
    float _369 = precise::min(_257, _355);
    float _371 = _335 * 0.693147182464599609375;
    float _373 = _335;
    if (!_301)
    {
        _373 = _160;
    }
    float _375 = _373;
    float _377 = _371 * (*spvDescriptorSet0.fp_c9)._m0[72].x;
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = 0.0;
    float _383 = _379;
    float _385 = _375;
    if (_301)
    {
        float _387 = _353 * 6.283185482025146484375;
        float _389 = sin(_387);
        _381 = _389;
    }
    float _391 = _381;
    if (_301)
    {
        float _393 = _367 + (-1.0);
        _359 = _393;
    }
    float _395 = _359;
    float _397 = _391;
    if (_301)
    {
        float _399 = fma(_391, _331, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _337 = _399;
    }
    float _401 = _337;
    if (_301)
    {
        float _403 = _395 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _397 = _403;
    }
    float _405 = _397;
    float _407 = _379 * (*spvDescriptorSet0.fp_c9)._m0[71].z;
    if (!_301)
    {
        _383 = _156;
    }
    float _409 = _383;
    float _411 = _409;
    if (_301)
    {
        float _413 = _345 * _401;
        _361 = _413;
    }
    float _415 = _361;
    if (_301)
    {
        float _417 = fma(_160, _367, _405);
        _385 = _417;
    }
    float _419 = _385;
    if (!_301)
    {
        _349 = _158;
    }
    float _421 = _349;
    float _423 = floor(_369);
    float _425 = _421;
    if (_301)
    {
        float _427 = fma(_247, _415, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _425 = _427;
    }
    float _429 = _425;
    float _431 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _433 = _419 + _431;
    float _435 = _433;
    if (_301)
    {
        float _437 = fma(_243, _415, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _411 = _437;
    }
    float _439 = _411;
    float _441 = precise::min(_267, _407);
    float _443 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _445 = _429 + _443;
    float _447 = _433 * _433;
    float _449 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _451 = _439 + _449;
    float _453 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[71].x;
    float _455 = in.m_79.z;
    float _457 = gl_FragCoord.w;
    float _459 = _455 * _457;
    float _461 = fma(_445, _445, _447);
    float _463 = floor(_441);
    float _465 = precise::min(_295, _453);
    float _467 = fma(_451, _451, _461);
    float _469 = fma(_423, (*spvDescriptorSet0.fp_c9)._m0[71].x, _465);
    float _471 = rsqrt(_467);
    float _473 = _463 * (*spvDescriptorSet0.fp_c9)._m0[71].y;
    float _475 = _154 * _263;
    float _477 = _154 * _287;
    float _479 = fma(_473, (*spvDescriptorSet0.fp_c9)._m0[71].x, _469);
    float _481 = _475 * _475;
    float _483 = _154 * _279;
    float _485 = in.m_81.w;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = _471 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _493 = trunc(_479);
    int _495 = int(_493);
    float _497 = fma(_333, _333, _481);
    float _499 = _483 * _483;
    float _501 = _445 * _491;
    float _503 = _451 * _491;
    float _505 = _154 * _459;
    float _507 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _509 = _160 + _507;
    float _511 = _501 * _501;
    float _513 = _503 * _503;
    float _515 = fma(_505, _505, _497);
    float _517 = _154 * _293;
    float _519 = fma(_477, _477, _499);
    float _521 = _511 + _513;
    float _523 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _525 = _158 + _523;
    float _527 = _509 * _509;
    float _529 = fma(_517, _517, _519);
    float _531 = sqrt(_521);
    int _533 = as_type<int>((*spvDescriptorSet0.fp_c9)._m0[71].w) * as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x);
    int _535 = _533 + _495;
    float _537 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _539 = _156 + _537;
    float _541 = fma(_525, _525, _527);
    float _543 = -_491;
    float _545 = -_299;
    float _547 = fma(_433, _543, _545);
    int _549 = _535 * 136;
    float _551 = fma(_539, _539, _541);
    float _553 = rsqrt(_515);
    int _555 = _549 + 4;
    uint _558 = uint(int(uint(_549) >> uint(2)));
    packed_uint2 _dmw0 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_558)];
    float _560 = as_type<float>(_dmw0.x);
    bool _562 = _531 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _564 = rsqrt(_529);
    uint _566 = uint(int(uint(_555) >> uint(2)));
    float _568 = as_type<float>(_dmw0.y);
    float _570 = sqrt(_551);
    float _572 = _511;
    float _574 = _491;
    float _576 = _513;
    if (!_562)
    {
        _319 = _511;
    }
    float _578 = _319;
    float _580 = _578;
    if (!_562)
    {
        _572 = _501;
    }
    float _582 = _572;
    float _584 = _582;
    if (!_562)
    {
        _574 = _547;
    }
    float _586 = _574;
    float _588 = _586;
    if (!_562)
    {
        _435 = _503;
    }
    float _590 = _435;
    bool _592 = !_562;
    float _594 = _590;
    if (!_592)
    {
        float _596 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _598 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _600 = _531 + _598;
        float _602 = _547 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _604 = rsqrt(_521);
        float _606 = _600 * _596;
        float _608 = _606 * 0.15915493667125701904296875;
        float _610 = _608 * 6.283185482025146484375;
        float _612 = sin(_610);
        float _614 = _608 * 6.283185482025146484375;
        float _616 = cos(_614);
        float _618 = fma(_612, _602, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _620 = _604 * _618;
        float _622 = _616 + (-1.0);
        float _624 = _501 * _620;
        float _626 = _622 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _628 = _503 * _620;
        float _630 = _624 * _624;
        float _632 = fma(_547, _616, _626);
        float _634 = _628 * _628;
        _588 = _632;
        _580 = _630;
        _576 = _634;
        _584 = _624;
        _594 = _628;
    }
    float _636 = _588;
    float _638 = _580;
    float _640 = _576;
    float _642 = _584;
    float _644 = _594;
    float _646 = fma(_636, _636, _638);
    float _648 = _333 * _553;
    float _650 = _517 * _564;
    float _652 = _475 * _553;
    float _654 = _646 + _640;
    float _656 = _477 * _564;
    float _658 = _505 * _553;
    float _660 = _483 * _564;
    float _662 = _648 * _650;
    float _664 = rsqrt(_654);
    float _666 = _652 * _656;
    float _668 = _154 * _489;
    float _670 = _658 * _660;
    float _672 = -_662;
    float _674 = fma(_658, _656, _672);
    float _676 = -_666;
    float _678 = fma(_648, _660, _676);
    float _680 = spvFAdd(_570, 9.9999997473787516355514526367188e-06);
    float _682 = -_670;
    float _684 = fma(_652, _650, _682);
    float _686 = _668 * _674;
    float _688 = _668 * _678;
    float _690 = _668 * _684;
    float _692 = _686 * _686;
    float _694 = 1.0 / _680;
    float _696 = fma(_200, 2.007874011993408203125, -1.007874011993408203125);
    float _698 = fma(_690, _690, _692);
    float _700 = _664 * _642;
    float _702 = _664 * _636;
    float _704 = _664 * _644;
    float _706 = fma(_688, _688, _698);
    float _708 = fma(_198, 2.007874011993408203125, -1.007874011993408203125);
    float _710 = _696 * _696;
    float _712 = _700 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _714 = -(*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _716 = 1.0 + _714;
    float _718 = rsqrt(_706);
    float _720 = fma(_708, _708, _710);
    float _722 = -_712;
    float _724 = fma(_702, (*spvDescriptorSet0.fp_c9)._m0[69].y, _722);
    float _726 = _525 * _694;
    float _728 = _509 * _694;
    float _730 = _539 * _694;
    float _732 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _734 = fma(_570, (*spvDescriptorSet0.fp_c9)._m0[63].x, _732);
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = -_720;
    float _740 = _738 + 1.0;
    float _742 = precise::clamp(_740, 0.0, 1.0);
    float _744 = -_704;
    float _746 = fma(_744, (*spvDescriptorSet0.fp_c9)._m0[69].z, _724);
    float _748 = -_736;
    float _750 = _748 + 1.0;
    float _752 = gl_FragCoord.x;
    float _754 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _756 = _752 / _754;
    float _758 = sqrt(_742);
    float _760 = precise::max(_194, 0.25);
    float _762 = gl_FragCoord.y;
    float _764 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _766 = _762 / _764;
    float _768 = _718 * _696;
    float _770 = 0.0 + _192;
    float _772 = precise::clamp(_770, 0.0, 1.0);
    float _774 = _686 * _768;
    float _776 = abs(_750);
    float _778 = log2(_776);
    float _780 = _690 * _768;
    float _782 = _688 * _768;
    float _784 = fma(_660, _708, _774);
    float _786 = _702 + 1.0;
    float _788 = fma(_656, _708, _780);
    float _790 = fma(_650, _708, _782);
    float3 _3211 = float3(_228, _224, float(1));
    float3 _3213 = select(_3211, float3(0.0), isnan(_3211));
    float _792 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, _3213.xy, uint(rint(_3213.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, _3213.xy, uint(rint(_3213.z))).x;
    float2 _3219 = float2(_162, _180);
    float3 _796 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_3219, float2(0.0), isnan(_3219))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_3219, float2(0.0), isnan(_3219))).xyz;
    float _798 = _796.x;
    float _800 = _796.y;
    float _802 = _796.z;
    float _804 = fma(_652, _758, _784);
    float _806 = fma(_648, _758, _788);
    float _808 = fma(_658, _758, _790);
    float _810 = in.m_83.w;
    float _812 = gl_FragCoord.w;
    float _814 = _810 * _812;
    float _816 = _804 * _804;
    float _818 = _235 * _772;
    float _820 = _778 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _822 = fma(_806, _806, _816);
    float _824 = exp2(_820);
    float _826 = fma(_808, _808, _822);
    float _828 = _756 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _830 = _766 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _832 = rsqrt(_826);
    float _834 = fma(_746, -0.5, 0.5);
    float _836 = fma(_746, 0.5, 0.5);
    float _838 = sqrt(_834);
    float _840 = -_702;
    float _842 = fma(_824, _786, _840);
    float _844 = fma(_842, 0.5, 0.5);
    float _846 = fma(_204, 2.0, -0.5);
    float _848 = precise::clamp(_846, 0.0, 1.0);
    float _850 = fma(_836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _852 = _806 * _832;
    float _854 = _804 * _832;
    float _856 = _808 * _832;
    float _858 = fma(_836, _850, -0.212114393711090087890625);
    float _860 = _726 * _852;
    float _862 = _728 * _854;
    float _864 = _730 * _856;
    float _866 = fma(_836, _858, 1.570728778839111328125);
    float _868 = _838 * 0.636619746685028076171875;
    float _870 = _154 * _814;
    float _872 = -_866;
    float _874 = fma(_868, _872, 1.0);
    float _876 = _860 + _862;
    float _878 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _880 = _870 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _882 = _864 + _876;
    float _884 = -_880;
    float _886 = fma(_878, _884, 1.0);
    float _888 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].y, _716);
    float _890 = _882 + _882;
    float _892 = precise::max(0.0, _854);
    float _894 = _888 * (*spvDescriptorSet0.fp_c11)._m0[39].w;
    float _896 = -_890;
    float _898 = fma(_852, _896, _726);
    float _900 = -_890;
    float _902 = fma(_854, _900, _728);
    float _904 = -_730;
    float _906 = fma(_856, _890, _904);
    float _908 = precise::min(_892, 0.100000001490116119384765625);
    float _910 = log2(_886);
    float _912 = precise::min(_894, (*spvDescriptorSet0.fp_c11)._m0[13].x);
    float _914 = abs(_898);
    float _916 = abs(_902);
    float _918 = precise::max(_914, _916);
    float _920 = abs(_906);
    float _922 = precise::max(_920, _918);
    float _924 = fma(_908, 10.0, -1.0);
    float _926 = _760 + _924;
    float _928 = -_912;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.fp_c11)._m0[13].y;
    float _934 = _932 + (*spvDescriptorSet0.fp_c11)._m0[13].z;
    float _936 = 1.0 / _922;
    float _938 = _926 * 4.0;
    float _940 = precise::clamp(_938, 0.0, 1.0);
    float _942 = _848 * _930;
    float _944 = _910 * 0.693147182464599609375;
    float _946 = _818 * _940;
    float _948 = fma(_942, _934, (*spvDescriptorSet0.fp_c11)._m0[13].y);
    float _950 = _944 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _952 = -_204;
    float _954 = fma(_204, _948, _952);
    float _956 = fma(_946, _954, _204);
    float _958 = _898 * _936;
    float _960 = _902 * _936;
    float _962 = _956 * 7.0;
    float _964 = _906 * _936;
    float4 _3483 = float4(_958, _960, _964, float(1));
    float4 _3487 = select(_3483, float4(0.0), isnan(_3483));
    float3 _966 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, _3487.xyz, uint(rint(_3487.w)), level(_962)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, _3487.xyz, uint(rint(_3487.w)), level(_962)).xyz;
    float _968 = _966.x;
    float _970 = _966.y;
    float _972 = _966.z;
    float3 _3501 = float3(_828, _830, _950);
    float _974 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_3501, float3(0.0), isnan(_3501))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_3501, float3(0.0), isnan(_3501))).x;
    float2 _3509 = float2(_162, _180);
    float3 _976 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3509, float2(0.0), isnan(_3509))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3509, float2(0.0), isnan(_3509))).xyz;
    float _978 = _976.x;
    float _980 = _976.y;
    float _982 = _976.z;
    float2 _3523 = float2(_874, _844);
    float3 _984 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_3523, float2(0.0), isnan(_3523))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_3523, float2(0.0), isnan(_3523))).xyz;
    float _986 = _984.x;
    float _988 = _984.y;
    float _990 = _984.z;
    float2 _3537 = float2(_220, _218);
    float4 _992 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_3537, float2(0.0), isnan(_3537))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_3537, float2(0.0), isnan(_3537))).xyzw;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float _1000 = _992.w;
    float _1002 = _728 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1004 = _726 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1006 = _730 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _1008 = in.m_83.x;
    float _1010 = gl_FragCoord.w;
    float _1012 = _1008 * _1010;
    float _1014 = _1002 * _1002;
    float _1016 = -_860;
    float _1018 = -_862;
    float _1020 = _1016 + _1018;
    float _1022 = fma(_848, -0.449999988079071044921875, 1.0);
    float _1024 = _233 * _235;
    float _1026 = fma(_1004, _1004, _1014);
    bool _1028 = 0.0 < (*spvDescriptorSet0.fp_c9)._m0[43].w;
    float _1030 = in.m_83.y;
    float _1032 = gl_FragCoord.w;
    float _1034 = _1030 * _1032;
    bool _1036 = as_type<uint>(_560) > 0u;
    float _1038 = fma(_1006, _1006, _1026);
    float _1040 = in.m_83.z;
    float _1042 = gl_FragCoord.w;
    float _1044 = _1040 * _1042;
    float _1046 = -_864;
    float _1048 = _1046 + _1020;
    float _1050 = precise::clamp(_1048, 0.0, 1.0);
    float _1052 = rsqrt(_1038);
    bool _1054 = as_type<uint>(_568) > 0u;
    float _1056 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].x, _716);
    float _1058 = fma((*spvDescriptorSet0.fp_c9)._m0[37].y, (*spvDescriptorSet0.fp_c9)._m0[2649].z, _716);
    float _1060 = _1002 * _1052;
    float _1062 = _1004 * _1052;
    float _1064 = _1006 * _1052;
    float _1066 = _154 * _1012;
    float _1068 = _1060 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1070 = fma(_1062, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1068);
    float _1072 = _1062 * _852;
    float _1074 = _154 * _1034;
    float _1076 = fma(_1064, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1070);
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = _154 * _1044;
    float _1082 = -_1060;
    float _1084 = -_1072;
    float _1086 = fma(_1082, _854, _1084);
    float _1088 = -_1078;
    float _1090 = _1088 + 1.0;
    float _1092 = -_1064;
    float _1094 = fma(_1092, _856, _1086);
    float _1096 = precise::clamp(_1094, 0.0, 1.0);
    float _1098 = -_1056;
    float _1100 = fma(_1098, (*spvDescriptorSet0.fp_c11)._m0[36].z, 1.0);
    float _1102 = _1090 * _1090;
    float _1104 = _1102 * _1102;
    float _1106 = _206 * 16.0;
    float _1108 = precise::clamp(_1106, 0.0, 1.0);
    float _1110 = precise::max(_1100, 1.0);
    float _1112 = _1090 * _1104;
    float _1114 = -_792;
    float _1116 = _1114 + 1.0;
    float _1118 = _800 * _1022;
    float _1120 = _798 * _1022;
    float _1122 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1124 = fma(_570, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1122);
    float _1126 = precise::clamp(_1124, 0.0, 1.0);
    float _1128 = -_239;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1118;
    float _1134 = _800 + _1132;
    float _1136 = _802 * _1022;
    float _1138 = -_1120;
    float _1140 = _798 + _1138;
    float _1142 = -_1116;
    float _1144 = fma(_1142, (*spvDescriptorSet0.fp_c11)._m0[46].z, 1.0);
    float _1146 = fma(_1110, _1134, _1118);
    float _1148 = -_1136;
    float _1150 = _802 + _1148;
    float _1152 = fma(_1110, _1140, _1120);
    float _1154 = -_1130;
    float _1156 = fma(_1154, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _1158 = -_237;
    float _1160 = _1158 + 1.0;
    float _1162 = fma(_1110, _1150, _1136);
    float _1164 = _1050 * (-9.27999973297119140625);
    float _1166 = _1024 * _1156;
    float _1168 = -_1160;
    float _1170 = fma(_1168, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1172 = precise::clamp(_1170, 0.0, 1.0);
    float _1174 = precise::min(_1144, 1.0);
    float _1176 = -_798;
    float _1178 = _1176 + _1152;
    float _1180 = exp2(_1164);
    float _1182 = _1166 * _1172;
    float _1184 = -_800;
    float _1186 = _1184 + _1146;
    float _1188 = -_802;
    float _1190 = _1188 + _1162;
    float _1192 = precise::min(_237, _1174);
    float _1194 = -_1108;
    float _1196 = fma(_1108, _1058, _1194);
    float _1198 = fma(_946, _1178, _798);
    float _1200 = fma(_946, _1186, _800);
    float _1202 = fma(_946, _1190, _802);
    float _1204 = fma(_946, _1196, _1108);
    float _1206 = -_956;
    float _1208 = _1206 + 1.0;
    float _1210 = _852 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _1212 = fma(_956, 0.5, 0.5);
    float _1214 = _1208 * _1208;
    float _1216 = fma(_956, _956, 0.00999999977648258209228515625);
    float _1218 = precise::clamp(_1216, 0.0, 1.0);
    float _1220 = fma(_956, -0.572000026702880859375, 1.03999996185302734375);
    float _1222 = -_854;
    float _1224 = -_1210;
    float _1226 = fma(_1222, (*spvDescriptorSet0.fp_c9)._m0[69].y, _1224);
    float _1228 = _1218 * _1218;
    float _1230 = precise::min(_1214, _1180);
    float _1232 = fma(_956, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1234 = fma(_956, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1236 = _1212 * _1212;
    float _1238 = _1236 * 0.5;
    float _1240 = -_856;
    float _1242 = fma(_1240, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1226);
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = _1096 * _1096;
    float _1248 = _1228 + (-1.0);
    float _1250 = fma(_1208, _1230, _1232);
    float _1252 = -_1238;
    float _1254 = _1252 + 1.0;
    float _1256 = -_1198;
    float _1258 = _1256 + _1204;
    float _1260 = fma(_1246, _1248, 1.0);
    float _1262 = fma(_1250, -1.03999996185302734375, _1220);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    float _1266 = fma(_1050, _1254, _1238);
    float _1268 = fma(_1250, 1.03999996185302734375, _1234);
    float _1270 = precise::clamp(_1268, 0.0, 1.0);
    float _1272 = fma(_1244, _1254, _1238);
    float _1274 = _1260 * _1260;
    float _1276 = -_1200;
    float _1278 = _1276 + _1204;
    float _1280 = _1204 * _1270;
    float _1282 = _1272 * _1266;
    float _1284 = -_1202;
    float _1286 = _1284 + _1204;
    float _1288 = precise::min(1.0, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1290 = 1.0 / _1274;
    float _1292 = fma(_1112, _1258, _1198);
    float _1294 = fma(_1112, _1278, _1200);
    float _1296 = fma(_1112, _1286, _1202);
    float _1298 = fma(_1200, _1264, _1280);
    float _1300 = _1288 * 0.31830990314483642578125;
    float _1302 = fma(_1198, _1264, _1280);
    float _1304 = _1228 * 0.31830990314483642578125;
    float _1306 = 1.0 / _1282;
    float _1308 = fma(_1202, _1264, _1280);
    float _1310 = _1260;
    float _1312 = _1300;
    float _1314 = _1126;
    float _1316 = 0.0;
    float _1318 = 0.0;
    if (!_1028)
    {
        _1310 = 0.0;
    }
    float _1320 = _1310;
    float _1322 = _1288 * _968;
    float _1324 = _1288 * _970;
    float _1326 = _1288 * _972;
    float _1328 = -_1322;
    float _1330 = fma(_1066, _1300, _1328);
    float _1332 = -_1324;
    float _1334 = fma(_1074, _1300, _1332);
    float _1336 = -_1326;
    float _1338 = fma(_1080, _1300, _1336);
    float _1340 = _1304 * _1290;
    float _1342 = fma(_1126, _1330, _1322);
    float _1344 = fma(_1126, _1334, _1324);
    float _1346 = fma(_1126, _1338, _1326);
    float _1348 = _1320;
    float _1350 = 0.0;
    float _1352 = 0.0;
    float _1354 = 0.0;
    float _1356 = 0.0;
    if (!_1028)
    {
        _1312 = 0.0;
        _1314 = 0.0;
    }
    float _1358 = _1312;
    float _1360 = _1314;
    bool _1362 = !_1028;
    float _1364 = _1358;
    float _1366 = _1360;
    if (!_1362)
    {
        float _1368 = -_160;
        float _1370 = _1368 + (*spvDescriptorSet0.fp_c9)._m0[43].y;
        float _1372 = -_158;
        float _1374 = _1372 + (*spvDescriptorSet0.fp_c9)._m0[43].x;
        float _1376 = -_156;
        float _1378 = _1376 + (*spvDescriptorSet0.fp_c9)._m0[43].z;
        float _1380 = _1370 * _1370;
        float _1382 = fma(_1374, _1374, _1380);
        float _1384 = fma(_1378, _1378, _1382);
        float _1386 = rsqrt(_1384);
        float _1388 = sqrt(_1384);
        float _1390 = _1370 * _1386;
        float _1392 = _1374 * _1386;
        float _1394 = _1378 * _1386;
        float _1396 = -_728;
        float _1398 = _1396 + _1390;
        float _1400 = -_726;
        float _1402 = _1400 + _1392;
        float _1404 = -_730;
        float _1406 = _1404 + _1394;
        float _1408 = _1398 * _1398;
        float _1410 = -_1388;
        float _1412 = _1410 + (*spvDescriptorSet0.fp_c9)._m0[43].w;
        float _1414 = fma(_1402, _1402, _1408);
        float _1416 = _1412 * (*spvDescriptorSet0.fp_c9)._m0[46].y;
        float _1418 = precise::clamp(_1416, 0.0, 1.0);
        float _1420 = fma(_1406, _1406, _1414);
        float _1422 = abs(_1418);
        float _1424 = log2(_1422);
        float _1426 = rsqrt(_1420);
        float _1428 = _1398 * _1426;
        float _1430 = _1402 * _1426;
        float _1432 = _1406 * _1426;
        float _1434 = _854 * _1428;
        float _1436 = fma(_852, _1430, _1434);
        float _1438 = fma(_856, _1432, _1436);
        float _1440 = precise::clamp(_1438, 0.0, 1.0);
        float _1442 = _1424 * (*spvDescriptorSet0.fp_c9)._m0[45].w;
        float _1444 = _1440 * _1440;
        float _1446 = _1392 * (*spvDescriptorSet0.fp_c9)._m0[44].x;
        float _1448 = exp2(_1442);
        float _1450 = fma(_1248, _1444, 1.0);
        float _1452 = -_1390;
        float _1454 = -_1446;
        float _1456 = fma(_1452, (*spvDescriptorSet0.fp_c9)._m0[44].y, _1454);
        float _1458 = _1450 * _1450;
        float _1460 = -_1394;
        float _1462 = fma(_1460, (*spvDescriptorSet0.fp_c9)._m0[44].z, _1456);
        float _1464 = _854 * _1390;
        float _1466 = 1.0 / _1458;
        float _1468 = -(*spvDescriptorSet0.fp_c9)._m0[44].w;
        float _1470 = _1462 + _1468;
        float _1472 = fma(_852, _1392, _1464);
        float _1474 = _1470 * (*spvDescriptorSet0.fp_c9)._m0[46].w;
        float _1476 = precise::clamp(_1474, 0.0, 1.0);
        float _1478 = fma(_856, _1394, _1472);
        float _1480 = precise::clamp(_1478, 0.0, 1.0);
        float _1482 = _1448 * _1476;
        float _1484 = _1480 * _1482;
        float _1486 = _1228 * _1466;
        float _1488 = _1486 * _1484;
        float _1490 = _1488 * (*spvDescriptorSet0.fp_c9)._m0[45].x;
        float _1492 = _1488 * (*spvDescriptorSet0.fp_c9)._m0[45].y;
        float _1494 = _1488 * (*spvDescriptorSet0.fp_c9)._m0[45].z;
        _1348 = _1490;
        _1364 = _1492;
        _1366 = _1494;
    }
    float _1496 = _1348;
    float _1498 = _1364;
    float _1500 = _1366;
    bool _1502 = !_1036;
    if (!_1502)
    {
        int _1504 = 0;
        bool _1506;
        do
        {
            int _1508 = _1504;
            float _1510 = _1316;
            float _1512 = _1350;
            float _1514 = _1352;
            int _1516 = _1508 << 1;
            int _1518 = _1516 + _549;
            int _1520 = _1518 + 8;
            int _1522 = _1520;
            int _1524 = _94(_1522, (*spvDescriptorSet0.fp_s0));
            int _1526 = _1508 + 1;
            bool _1528 = uint(_1526) >= as_type<uint>(_560);
            int _1530 = _1524 & 65535;
            int _1532 = _1530 * 48;
            int _1534 = _1532 + 1168;
            uint _1536 = uint(int(uint(_1534) >> uint(2)));
            uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
            int _1540 = int(_1536) & 3;
            float _1542 = (*spvDescriptorSet0.fp_c9)._m0[int(_1538)][_1540];
            int _1544 = int(_1536) + 1;
            uint _1546 = uint(int(uint(_1544) >> uint(2)));
            int _1548 = _1544 & 3;
            float _1550 = (*spvDescriptorSet0.fp_c9)._m0[int(_1546)][_1548];
            int _1552 = _1532 + 1176;
            uint _1554 = uint(int(uint(_1552) >> uint(2)));
            uint _1556 = uint(int(uint(int(_1554)) >> uint(2)));
            int _1558 = int(_1554) & 3;
            float _1560 = (*spvDescriptorSet0.fp_c9)._m0[int(_1556)][_1558];
            int _1562 = int(_1554) + 1;
            uint _1564 = uint(int(uint(_1562) >> uint(2)));
            int _1566 = _1562 & 3;
            float _1568 = (*spvDescriptorSet0.fp_c9)._m0[int(_1564)][_1566];
            float _1570 = -_160;
            float _1572 = _1570 + _1550;
            float _1574 = -_158;
            float _1576 = _1574 + _1542;
            float _1578 = _1572 * _1572;
            float _1580 = -_156;
            float _1582 = _1580 + _1560;
            float _1584 = fma(_1576, _1576, _1578);
            int _1586 = _1532 + 1200;
            uint _1588 = uint(int(uint(_1586) >> uint(2)));
            uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
            int _1592 = int(_1588) & 3;
            float _1594 = (*spvDescriptorSet0.fp_c9)._m0[int(_1590)][_1592];
            float _1596 = fma(_1582, _1582, _1584);
            float _1598 = rsqrt(_1596);
            float _1600 = sqrt(_1596);
            float _1602 = _1572 * _1598;
            float _1604 = _1576 * _1598;
            float _1606 = _1582 * _1598;
            float _1608 = -_728;
            float _1610 = _1608 + _1602;
            float _1612 = -_730;
            float _1614 = _1612 + _1606;
            float _1616 = -_1600;
            float _1618 = _1616 + _1568;
            float _1620 = -_726;
            float _1622 = _1620 + _1604;
            float _1624 = _1610 * _1610;
            float _1626 = fma(_1622, _1622, _1624);
            int _1628 = _1532 + 1192;
            uint _1630 = uint(int(uint(_1628) >> uint(2)));
            uint _1632 = uint(int(uint(int(_1630)) >> uint(2)));
            int _1634 = int(_1630) & 3;
            float _1636 = (*spvDescriptorSet0.fp_c9)._m0[int(_1632)][_1634];
            int _1638 = int(_1630) + 1;
            uint _1640 = uint(int(uint(_1638) >> uint(2)));
            int _1642 = _1638 & 3;
            float _1644 = (*spvDescriptorSet0.fp_c9)._m0[int(_1640)][_1642];
            float _1646 = fma(_1614, _1614, _1626);
            float _1648 = rsqrt(_1646);
            float _1650 = _1618 * _1594;
            float _1652 = precise::clamp(_1650, 0.0, 1.0);
            float _1654 = abs(_1652);
            float _1656 = log2(_1654);
            float _1658 = _1610 * _1648;
            float _1660 = _1622 * _1648;
            float _1662 = _1614 * _1648;
            float _1664 = _854 * _1658;
            float _1666 = fma(_852, _1660, _1664);
            int _1668 = _1532 + 1184;
            uint _1670 = uint(int(uint(_1668) >> uint(2)));
            uint _1672 = uint(int(uint(int(_1670)) >> uint(2)));
            int _1674 = int(_1670) & 3;
            float _1676 = (*spvDescriptorSet0.fp_c9)._m0[int(_1672)][_1674];
            int _1678 = int(_1670) + 1;
            uint _1680 = uint(int(uint(_1678) >> uint(2)));
            int _1682 = _1678 & 3;
            float _1684 = (*spvDescriptorSet0.fp_c9)._m0[int(_1680)][_1682];
            float _1686 = fma(_856, _1662, _1666);
            float _1688 = precise::clamp(_1686, 0.0, 1.0);
            float _1690 = _1688 * _1688;
            float _1692 = fma(_1248, _1690, 1.0);
            float _1694 = _1692 * _1692;
            float _1696 = _1656 * _1644;
            float _1698 = _854 * _1602;
            float _1700 = 1.0 / _1694;
            float _1702 = fma(_852, _1604, _1698);
            float _1704 = fma(_856, _1606, _1702);
            float _1706 = precise::clamp(_1704, 0.0, 1.0);
            float _1708 = exp2(_1696);
            float _1710 = _1706 * _1708;
            float _1712 = _1228 * _1700;
            float _1714 = _1712 * _1710;
            float _1716 = fma(_1714, _1676, _1510);
            float _1718 = fma(_1714, _1684, _1512);
            float _1720 = fma(_1714, _1636, _1514);
            _1506 = !_1528;
            _1504 = _1526;
            _1316 = _1716;
            _1350 = _1718;
            _1352 = _1720;
            _1318 = _1716;
            _1354 = _1718;
            _1356 = _1720;
        } while (_1506);
    }
    float _1722 = _1318;
    float _1724 = _1354;
    float _1726 = _1356;
    float _1728 = _1244 * _1340;
    float _1730 = _1728 * 0.25;
    bool _1732 = !_1054;
    float _1734 = _1722;
    float _1736 = _1724;
    float _1738 = _1726;
    float _1740 = _1722;
    float _1742 = _1724;
    float _1744 = _1726;
    if (!_1732)
    {
        int _1746 = 0;
        bool _1748;
        do
        {
            int _1750 = _1746;
            float _1752 = _1734;
            float _1754 = _1736;
            float _1756 = _1738;
            int _1758 = _1750 << 1;
            int _1760 = _1758 + _549;
            int _1762 = _1760 + 72;
            int _1764 = _1762;
            int _1766 = _94(_1764, (*spvDescriptorSet0.fp_s0));
            int _1768 = _1750 + 1;
            bool _1770 = uint(_1768) >= as_type<uint>(_568);
            int _1772 = _1766 << 6;
            int _1774 = 4194240 & _1772;
            int _1776 = _1774 + 10384;
            uint _1778 = uint(int(uint(_1776) >> uint(2)));
            uint _1780 = uint(int(uint(int(_1778)) >> uint(2)));
            int _1782 = int(_1778) & 3;
            float _1784 = (*spvDescriptorSet0.fp_c9)._m0[int(_1780)][_1782];
            int _1786 = int(_1778) + 1;
            uint _1788 = uint(int(uint(_1786) >> uint(2)));
            int _1790 = _1786 & 3;
            float _1792 = (*spvDescriptorSet0.fp_c9)._m0[int(_1788)][_1790];
            int _1794 = _1774 + 10392;
            uint _1796 = uint(int(uint(_1794) >> uint(2)));
            uint _1798 = uint(int(uint(int(_1796)) >> uint(2)));
            int _1800 = int(_1796) & 3;
            float _1802 = (*spvDescriptorSet0.fp_c9)._m0[int(_1798)][_1800];
            int _1804 = int(_1796) + 1;
            uint _1806 = uint(int(uint(_1804) >> uint(2)));
            int _1808 = _1804 & 3;
            float _1810 = (*spvDescriptorSet0.fp_c9)._m0[int(_1806)][_1808];
            int _1812 = _1774 + 10436;
            uint _1814 = uint(int(uint(_1812) >> uint(2)));
            uint _1816 = uint(int(uint(int(_1814)) >> uint(2)));
            int _1818 = int(_1814) & 3;
            float _1820 = (*spvDescriptorSet0.fp_c9)._m0[int(_1816)][_1818];
            float _1822 = -_160;
            float _1824 = _1822 + _1792;
            float _1826 = -_158;
            float _1828 = _1826 + _1784;
            float _1830 = _1824 * _1824;
            float _1832 = -_156;
            float _1834 = _1832 + _1802;
            float _1836 = fma(_1828, _1828, _1830);
            float _1838 = fma(_1834, _1834, _1836);
            float _1840 = rsqrt(_1838);
            float _1842 = _1824 * _1840;
            float _1844 = _1828 * _1840;
            float _1846 = _1834 * _1840;
            float _1848 = -_728;
            float _1850 = _1848 + _1842;
            float _1852 = -_726;
            float _1854 = _1852 + _1844;
            float _1856 = -_730;
            float _1858 = _1856 + _1846;
            float _1860 = sqrt(_1838);
            float _1862 = _1850 * _1850;
            float _1864 = fma(_1854, _1854, _1862);
            float _1866 = fma(_1858, _1858, _1864);
            float _1868 = rsqrt(_1866);
            float _1870 = -_1860;
            float _1872 = _1870 + _1810;
            float _1874 = _1872 * _1820;
            float _1876 = precise::clamp(_1874, 0.0, 1.0);
            int _1878 = _1774 + 10416;
            uint _1880 = uint(int(uint(_1878) >> uint(2)));
            uint _1882 = uint(int(uint(int(_1880)) >> uint(2)));
            int _1884 = int(_1880) & 3;
            float _1886 = (*spvDescriptorSet0.fp_c9)._m0[int(_1882)][_1884];
            int _1888 = int(_1880) + 1;
            uint _1890 = uint(int(uint(_1888) >> uint(2)));
            int _1892 = _1888 & 3;
            float _1894 = (*spvDescriptorSet0.fp_c9)._m0[int(_1890)][_1892];
            float _1896 = abs(_1876);
            float _1898 = log2(_1896);
            float _1900 = _1850 * _1868;
            float _1902 = _1854 * _1868;
            float _1904 = _1858 * _1868;
            int _1906 = _1774 + 10400;
            uint _1908 = uint(int(uint(_1906) >> uint(2)));
            uint _1910 = uint(int(uint(int(_1908)) >> uint(2)));
            int _1912 = int(_1908) & 3;
            float _1914 = (*spvDescriptorSet0.fp_c9)._m0[int(_1910)][_1912];
            int _1916 = int(_1908) + 1;
            uint _1918 = uint(int(uint(_1916) >> uint(2)));
            int _1920 = _1916 & 3;
            float _1922 = (*spvDescriptorSet0.fp_c9)._m0[int(_1918)][_1920];
            float _1924 = _854 * _1900;
            float _1926 = fma(_852, _1902, _1924);
            int _1928 = _1774 + 10424;
            uint _1930 = uint(int(uint(_1928) >> uint(2)));
            uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
            int _1934 = int(_1930) & 3;
            float _1936 = (*spvDescriptorSet0.fp_c9)._m0[int(_1932)][_1934];
            int _1938 = int(_1930) + 1;
            uint _1940 = uint(int(uint(_1938) >> uint(2)));
            int _1942 = _1938 & 3;
            float _1944 = (*spvDescriptorSet0.fp_c9)._m0[int(_1940)][_1942];
            float _1946 = fma(_856, _1904, _1926);
            float _1948 = precise::clamp(_1946, 0.0, 1.0);
            float _1950 = _1948 * _1948;
            int _1952 = _1774 + 10408;
            uint _1954 = uint(int(uint(_1952) >> uint(2)));
            uint _1956 = uint(int(uint(int(_1954)) >> uint(2)));
            int _1958 = int(_1954) & 3;
            float _1960 = (*spvDescriptorSet0.fp_c9)._m0[int(_1956)][_1958];
            int _1962 = int(_1954) + 1;
            uint _1964 = uint(int(uint(_1962) >> uint(2)));
            int _1966 = _1962 & 3;
            float _1968 = (*spvDescriptorSet0.fp_c9)._m0[int(_1964)][_1966];
            float _1970 = fma(_1248, _1950, 1.0);
            float _1972 = _1970 * _1970;
            int _1974 = _1774 + 10444;
            uint _1976 = uint(int(uint(_1974) >> uint(2)));
            uint _1978 = uint(int(uint(int(_1976)) >> uint(2)));
            int _1980 = int(_1976) & 3;
            float _1982 = (*spvDescriptorSet0.fp_c9)._m0[int(_1978)][_1980];
            float _1984 = 1.0 / _1972;
            float _1986 = _1844 * _1914;
            float _1988 = -_1842;
            float _1990 = -_1986;
            float _1992 = fma(_1988, _1922, _1990);
            float _1994 = _854 * _1842;
            float _1996 = _1898 * _1944;
            float _1998 = fma(_852, _1844, _1994);
            float _2000 = fma(_856, _1846, _1998);
            float _2002 = precise::clamp(_2000, 0.0, 1.0);
            float _2004 = exp2(_1996);
            float _2006 = -_1846;
            float _2008 = fma(_2006, _1960, _1992);
            float _2010 = -_1968;
            float _2012 = _2008 + _2010;
            float _2014 = _2012 * _1982;
            float _2016 = precise::clamp(_2014, 0.0, 1.0);
            float _2018 = _2004 * _2016;
            float _2020 = _1228 * _1984;
            float _2022 = _2002 * _2018;
            float _2024 = _2020 * _2022;
            float _2026 = fma(_2024, _1886, _1752);
            float _2028 = fma(_2024, _1894, _1754);
            float _2030 = fma(_2024, _1936, _1756);
            _1748 = !_1770;
            _1746 = _1768;
            _1734 = _2026;
            _1736 = _2028;
            _1738 = _2030;
            _1740 = _2026;
            _1742 = _2028;
            _1744 = _2030;
        } while (_1748);
    }
    float _2032 = _1740;
    float _2034 = _1742;
    float _2036 = _1744;
    float _2038 = _778 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _2040 = _2032 + _1496;
    float _2042 = _1730 * _1306;
    float _2044 = _2034 + _1498;
    float _2046 = _2036 + _1500;
    float _2048 = _1342 + _2040;
    float _2050 = exp2(_2038);
    float _2052 = _1292 * _2042;
    float _2054 = _1344 + _2044;
    float _2056 = _1302 * _2048;
    float _2058 = _1346 + _2046;
    float _2060 = _2052 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _2062 = _1296 * _2042;
    float _2064 = _1192 * _2056;
    float _2066 = _1294 * _2042;
    float _2068 = _1298 * _2054;
    float _2070 = _1308 * _2058;
    float _2072 = fma(_2060, _1182, _2064);
    float _2074 = _2066 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _2076 = _1192 * _2068;
    float _2078 = _1192 * _2070;
    float _2080 = _2062 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _2082 = -_2050;
    float _2084 = _2082 + 1.0;
    float _2086 = _978 * 1.60000002384185791015625;
    float _2088 = fma(_2074, _1182, _2076);
    float _2090 = _980 * 1.60000002384185791015625;
    float _2092 = _2084 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _2094 = fma(_2080, _1182, _2078);
    float _2096 = _982 * 1.60000002384185791015625;
    float _2098 = fma(_2086, (*spvDescriptorSet0.fp_c9)._m0[40].z, _2072);
    float _2100 = -_2092;
    float _2102 = _2100 + 1.0;
    float _2104 = fma(_2090, (*spvDescriptorSet0.fp_c9)._m0[40].z, _2088);
    float _2106 = _986 * _2092;
    float _2108 = _990 * _2092;
    float _2110 = _1000 * _2102;
    float _2112 = _988 * _2092;
    float _2114 = fma(_2096, (*spvDescriptorSet0.fp_c9)._m0[40].z, _2094);
    float _2116 = _1000 * _974;
    float _2118 = precise::max(0.0, _2098);
    float _2120 = precise::max(0.0, _2104);
    float _2122 = fma(_2112, _2116, _996);
    float _2124 = precise::max(0.0, _2114);
    float _2126 = fma(_2106, _2116, _994);
    float _2128 = fma(_2108, _2116, _998);
    float _2130 = fma(_2110, _2120, _2122);
    float _2132 = fma(_2110, _2118, _2126);
    float _2134 = fma(_2110, _2124, _2128);
    out.m_86.x = _2132;
    out.m_86.y = _2130;
    out.m_86.z = _2134;
    out.m_86.w = 1.0;
    out.m_88.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

