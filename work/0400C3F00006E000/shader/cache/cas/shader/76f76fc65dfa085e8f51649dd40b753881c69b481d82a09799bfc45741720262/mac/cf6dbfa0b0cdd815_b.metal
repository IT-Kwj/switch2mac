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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    sampler vp_t_tcb_24Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(0)]];
    float4 m_46 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_37 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_72 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_50 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_62 [[attribute(11)]];
    float4 m_52 [[attribute(12)]];
    float4 m_56 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2710 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_37.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_40.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_121);
        out.gl_Position.z = _2996;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_42.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _113;
    if (_147)
    {
        out.m_40.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _123 = as_type<int>(_151);
    }
    int _153 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_153);
        out.gl_Position.z = _3059;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_44.x;
    float _157 = in.m_44.y;
    float _159 = in.m_44.z;
    float _161 = 1.0 / _127;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_48.x;
    float _171 = in.m_48.y;
    float _173 = in.m_48.z;
    float _175 = _155 * _155;
    float _177 = _157 * _157;
    float _179 = _159 * _159;
    float _181 = fma(_163, _163, _175);
    float _183 = fma(_165, _165, _177);
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = sqrt(_187);
    float _195 = sqrt(_189);
    float _197 = sqrt(_191);
    bool _199 = _193 > 0.0;
    bool _201 = _195 > 0.0;
    float _203 = 0.0;
    float _205 = _195;
    float _207 = _193;
    int _209 = as_type<int>(_167);
    bool _211 = _201;
    if (_199)
    {
        float _213 = rsqrt(_187);
        _203 = _213;
    }
    float _215 = _203;
    if (!_199)
    {
        _205 = 0.0;
    }
    float _217 = _205;
    bool _219 = _197 > 0.0;
    float _221 = _197;
    float _223 = _217;
    bool _225 = _219;
    if (!_199)
    {
        _221 = 0.0;
    }
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    if (!_199)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (_201)
    {
        float _239 = rsqrt(_189);
        _235 = _239;
    }
    float _241 = _235;
    float _243 = 0.0;
    if (!_201)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    float _247 = _131 * _161;
    float _249 = 0.0;
    float _251 = _245;
    if (!_201)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (_219)
    {
        float _259 = rsqrt(_191);
        _255 = _259;
    }
    float _261 = _255;
    float _263 = _215;
    if (_199)
    {
        float _265 = _215 * _155;
        _223 = _265;
    }
    float _267 = _223;
    if (_199)
    {
        float _269 = _215 * _163;
        _231 = _269;
    }
    float _271 = _231;
    if (_199)
    {
        float _273 = _215 * _169;
        _237 = _273;
    }
    float _275 = _237;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_201)
    {
        _263 = 0.0;
    }
    float _279 = _263;
    float _281 = _279;
    if (!_219)
    {
        _207 = 0.0;
    }
    float _283 = _207;
    float _285 = _283;
    if (_201)
    {
        float _287 = _241 * _157;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = 0.0;
    if (!_219)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = _293;
    if (_201)
    {
        float _297 = _241 * _165;
        _281 = _297;
    }
    float _299 = _281;
    float _301 = 0.0;
    if (!_219)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = _303;
    if (_201)
    {
        float _307 = _241 * _171;
        _257 = _307;
    }
    float _309 = _257;
    if (_219)
    {
        float _311 = _261 * _159;
        _285 = _311;
    }
    float _313 = _285;
    if (_219)
    {
        float _315 = _261 * _167;
        _295 = _315;
    }
    float _317 = _295;
    if (_219)
    {
        float _319 = _261 * _173;
        _305 = _319;
    }
    float _321 = _305;
    bool _323 = !_277;
    float _341;
    if (!_323)
    {
        float _325 = in.m_50.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _247;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_37.x;
    float _349 = in.m_37.y;
    float _351 = in.m_37.z;
    float _353 = in.m_46.w;
    float _355 = in.m_48.w;
    float _357 = _165 * _349;
    float _359 = _171 * _349;
    float _361 = fma(_163, _347, _357);
    float _363 = fma(_169, _347, _359);
    float _365 = fma(_167, _351, _361);
    float _367 = fma(_173, _351, _363);
    float _369 = _365 + _353;
    float _371 = _367 + _355;
    float _373 = fma(_369, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _377 = floor(_373);
    float _379 = floor(_375);
    float _381 = -_377;
    float _383 = _373 + _381;
    float _385 = -_379;
    float _387 = _375 + _385;
    float2 _3396 = float2(_383, _387);
    float _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3396, float2(0.0), isnan(_3396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3396, float2(0.0), isnan(_3396)), level(0.0)).x;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _393 = int(_391);
    float _395 = in.m_50.x;
    float _397 = _247 * 3.3333332538604736328125;
    float _399 = in.m_52.x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _405 = int(_403);
    float _407 = in.m_54.y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = 0.0 + _397;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = in.m_50.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _419 = _417 != 0;
    float _421 = -_397;
    float _423 = _421 + 3.3333332538604736328125;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = float(_393);
    float _429 = in.m_56.x;
    float _431 = in.m_56.y;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _435 = _433 != 0;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _427;
    float _441 = _131 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _345 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _345 + _447;
    float _451 = float(uint(_405));
    float _453 = fma(_395, 6.283185482025146484375, _441);
    float _455 = _373;
    if (_419)
    {
        float _457 = in.m_50.z;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = float(_405);
    float _463 = _399;
    if (_419)
    {
        float _465 = -_399;
        float _467 = _465 + 1.0;
        _209 = as_type<int>(_467);
    }
    int _469 = _209;
    int _471 = ~_405;
    int _473 = _471 + 1;
    float _475 = 1.0 / _451;
    if (_435)
    {
        bool _477 = _395 > 0.5;
        _225 = _477;
    }
    bool _479 = _225;
    float _481 = _349 + _407;
    float _483 = 0.0;
    if (!_435)
    {
        _483 = _399;
    }
    float _485 = _483;
    float _487 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _453);
    float _489 = _131 * _439;
    float _491 = _487 * 0.15915493667125701904296875;
    float _493 = abs(_429);
    float _495 = log2(_493);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    out.m_58.x = _429;
    out.m_58.y = _431;
    int _503 = as_type<int>(_475) + (-2);
    float _505 = fma(_501, _395, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _507 = trunc(_489);
    int _509 = int(_507);
    float _511 = in.m_50.y;
    float _513 = _485;
    if (_419)
    {
        bool _515 = _459 > 0.5;
        _211 = _515;
    }
    bool _517 = _211;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = _495 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _529 = _491 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_345);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = float(uint(_509));
    float _551 = exp2(_527);
    float _553 = float(_509);
    float _555 = as_type<float>(_503) * _549;
    bool _557 = _553 >= _461;
    bool _559 = isnan(_553);
    bool _561 = _557 || _559;
    bool _563 = isnan(_461);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _511 * 628.31854248046875;
    float _571 = trunc(_555);
    float _573 = precise::max(_571, 0.0);
    uint _576 = uint(_573);
    float _578 = trunc(_567);
    int _580 = int(_578);
    int _582 = _473 * int(_576);
    int _584 = _582 + _509;
    float _586 = float(uint(_584));
    int _588 = _584;
    if (_435)
    {
        float _590 = -_399;
        float _592 = _590 + 1.0;
        _588 = as_type<int>(_592);
    }
    int _594 = _588;
    int _596 = ~_580;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = as_type<float>(_503) * _586;
    if (_435)
    {
        float _604 = _479 ? as_type<float>(_594) : _399;
        _513 = _604;
    }
    float _606 = _513;
    int _608 = ~_405;
    int _610 = _608 + 1;
    float _612 = trunc(_602);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    if (_419)
    {
        float _618 = _517 ? as_type<float>(_469) : _399;
        _463 = _618;
    }
    float _620 = _463;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _622;
    float _626 = in.m_56.w;
    float _628 = 1.0 / _624;
    int _630 = int(_576) + int(_616);
    float _632 = in.m_56.z;
    int _634 = _610 * _630;
    int _636 = _634 + _509;
    float _638 = _131 * _461;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _646 = _644 != 0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    float _656 = _638 * _161;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = trunc(_656);
    int _666 = int(_664);
    bool _668 = uint(_636) >= uint(_405);
    float _670 = fma(_662, -2.0, _401);
    float _672 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_58.w = _626;
    bool _676 = !_668;
    int _678 = _676 ? 0 : (-1);
    float _680 = -_674;
    float _682 = fma(_672, 2.0, _680);
    bool _684 = !_646;
    int _686 = _684 ? 0 : 1;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _696 = !_642;
    int _698 = _696 ? 0 : 1;
    out.m_58.z = _632;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / _694;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _708 = _706 != 0;
    float _710 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _670);
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    bool _720 = !_650;
    int _722 = _720 ? 0 : 1;
    float _724 = 1.0 / _690;
    bool _726 = _415 > 0.5;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = _445 * _704;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _732;
    out.m_60.y = _734;
    out.m_60.z = _738;
    out.m_60.w = _437;
    float _750 = _449 * _724;
    float _752 = in.m_62.x;
    float _754 = in.m_62.y;
    float _756 = in.m_62.z;
    float _758 = in.m_62.w;
    float _760 = precise::min(_413, _425);
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = _345 + _764;
    out.m_64.x = _744;
    out.m_64.y = _748;
    out.m_64.z = _746;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = fma(_131, _505, _569);
    float _772 = _766 * _628;
    float _774 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _776 = fma(_760, -5.0, 5.0);
    float _778 = fma(_521, _750, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _780 = fma(_525, _742, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _782 = !_654;
    int _784 = _782 ? 0 : 1;
    float _786 = _487 * 0.60000002384185791015625;
    bool _788 = !_660;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    float _792 = _786 * 0.15915493667125701904296875;
    float _794 = _487 * 1.2999999523162841796875;
    bool _796 = _511 > 0.5;
    float _798 = _299 * _756;
    float _800 = _790 * _395;
    float _802 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    float _804 = -_131;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[76].x, _682);
    float _808 = _289 * _756;
    float _810 = _309 * _756;
    float _812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _802);
    float _814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _774);
    float _816 = _794 * 0.15915493667125701904296875;
    float _818 = _487 + 0.52359879016876220703125;
    float _820 = fma(_271, _752, _798);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _824 = fma(_267, _752, _808);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = fma(_487, 0.60000002384185791015625, 0.31415927410125732421875);
    float _830 = fma(_275, _752, _810);
    float _832 = -_754;
    float _834 = fma(_317, _832, _820);
    float _836 = -_754;
    float _838 = fma(_313, _836, _824);
    float _840 = _828 * 0.15915493667125701904296875;
    float _842 = fma(_487, 1.2999999523162841796875, 0.680678427219390869140625);
    float _844 = -_754;
    float _846 = fma(_321, _844, _830);
    float _848 = fma(_822, _551, _441);
    float _850 = _842 * 0.15915493667125701904296875;
    float _852 = in.m_66.x;
    float _854 = in.m_66.y;
    float _856 = in.m_66.z;
    float _858 = fma(_429, 0.261799395084381103515625, -0.261799395084381103515625);
    float _860 = floor(_800);
    out.m_68.x = _834;
    out.m_68.y = _838;
    out.m_68.z = _846;
    float _862 = fma(_395, 6.283185482025146484375, _848);
    float _864 = _770 + _858;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _870 = _862 * 0.15915493667125701904296875;
    float _872 = _864 * 1.10000002384185791015625;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _770 * 0.89999997615814208984375;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _884;
    float _888 = -_860;
    float _890 = _800 + _888;
    float _892 = _878 * 0.15915493667125701904296875;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _898 = fma(_882, _750, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _900 = fma(_886, _750, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _902 = fma(_896, _742, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _904 = fma(_868, _742, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _906 = _770 * 1.10000002384185791015625;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _908;
    float _912 = _770 * 0.15915493667125701904296875;
    float _914 = _770 * 0.699999988079071044921875;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _916;
    float _920 = _906 * 0.15915493667125701904296875;
    float _922 = fma(_910, _772, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _924 = _852 >= 0.0;
    bool _926 = isnan(_852);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = fma(_547, _772, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _936 = fma(_918, _772, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _938 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _940 = isnan(_345);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _890 * _461;
    bool _952 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _954 = isnan(_345);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _792 * 6.283185482025146484375;
    float _966 = sin(_964);
    int _968 = _932 ? 0 : 1;
    float _970 = -_948;
    float _972 = _970 + 1.0;
    bool _974 = _852 > 0.0;
    float _976 = -_962;
    float _978 = _976 + 1.0;
    int _980 = ~_968;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _962 * _972;
    float _988 = _864 * 0.15915493667125701904296875;
    float _990 = _543 * _978;
    int _992 = ~_630;
    int _994 = _992 + _678;
    int _996 = _994 + 1;
    float _998 = -_543;
    float _1000 = _998 + 1.0;
    float _1002 = trunc(_950);
    int _1004 = int(_1002);
    float _1006 = _864 * 0.89999997615814208984375;
    float _1008 = _864 * 0.699999988079071044921875;
    int _1010 = _405 * _996;
    int _1012 = _1010 + _509;
    float _1014 = _914 * 0.15915493667125701904296875;
    int _1016 = _984;
    if (!_974)
    {
        int _1018 = ~_968;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = fma(_966, 0.60000002384185791015625, _531);
    bool _1026 = _405 == 0;
    float _1028 = _826 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1034 = isnan(_345);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1006 * 0.15915493667125701904296875;
    bool _1046 = !_1026;
    int _1048 = _1046 ? _1012 : (-1);
    int _1050 = _405 + (-1);
    float _1052 = _1042 * _1000;
    bool _1054 = !_702;
    int _1056 = _1054 ? 0 : 1;
    int _1058 = _1048 * _600;
    int _1060 = abs(_686);
    float _1062 = _1008 * 0.15915493667125701904296875;
    int _1064 = abs(_1056);
    int _1066 = _580 * _1050;
    int _1068 = _1066 + _1058;
    float _1070 = _862 * 0.60000002384185791015625;
    float _1072 = _862 * 1.2999999523162841796875;
    int _1074 = abs(_698);
    int _1076 = _1068 * _1060;
    float _1078 = _1070 * 0.15915493667125701904296875;
    int _1080 = _1004 * _1064;
    int _1082 = _1080 + _509;
    float _1084 = _481 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1086 = abs(_722);
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_784);
    int _1092 = _666 * _1074;
    int _1094 = _1092 + _1076;
    float _1096 = _816 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1084);
    float _1102 = _898 * _1052;
    float _1104 = -_1042;
    float _1106 = _1104 + 1.0;
    int _1108 = _1082 * _1086;
    int _1110 = _1108 + _1094;
    float _1112 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1100);
    float _1114 = fma(_876, 0.60000002384185791015625, _1030);
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1102);
    int _1118 = _1004 * _1090;
    int _1120 = _1118 + _1110;
    float _1122 = _850 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _481 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1130 = fma(_902, _990, _1116);
    float _1132 = float(uint(_1120));
    float _1134 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = _778 * _1052;
    float _1138 = fma(_1098, 0.300000011920928955078125, _1024);
    float _1140 = 1.0 / _1128;
    float _1142 = as_type<float>(_503) * _1132;
    float _1144 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1136);
    float _1148 = -_429;
    float _1150 = _1148 + 1.0;
    float _1152 = _900 * _1052;
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1156 = fma(_780, _990, _1146);
    float _1158 = trunc(_1142);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = fma(_1124, 0.300000011920928955078125, _1114);
    int _1166 = ~_405;
    int _1168 = _1166 + 1;
    float _1170 = _1154 + _1128;
    float _1172 = float(uint(_1082));
    float _1174 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1152);
    float _1176 = fma(_922, _986, _1130);
    float _1178 = _1014 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1170 * _1140;
    float _1184 = _1182 * 0.5;
    float _1186 = _872 * 0.15915493667125701904296875;
    float _1188 = fma(_904, _990, _1174);
    float _1190 = as_type<float>(_503) * _1172;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1194 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1192);
    float _1196 = -_431;
    float _1198 = _1196 + 1.0;
    float _1200 = _920 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1168 * int(_1162);
    int _1206 = _1204 + _1120;
    float _1208 = fma(_936, _986, _1188);
    float _1210 = _1138 * _1150;
    float _1212 = abs(_1164);
    float _1214 = _1198 * _1212;
    float _1216 = fma(_934, _986, _1156);
    float _1218 = float(uint(_1206));
    float _1220 = _1210 * 0.52359879016876220703125;
    float _1222 = _912 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = _1214 * (-45.0);
    int _1228 = ~_405;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_503) * _1218;
    float _1234 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1208);
    float _1236 = _1220 * 0.15915493667125701904296875;
    float _1238 = in.m_52.y;
    float _1240 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1176);
    float _1242 = _892 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1180 + _1202;
    float _1248 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1216);
    float _1250 = in.m_70.x;
    float _1252 = in.m_70.y;
    float _1254 = in.m_70.z;
    float _1256 = _1226 * 0.01745329238474369049072265625;
    float _1258 = _1214 * (-20.0);
    float _1260 = float(_1022);
    float _1262 = _1062 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = _1260 * _1258;
    float _1270 = _1044 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1224, 1.2000000476837158203125, _1244);
    float _1276 = _1268 * 0.01745329238474369049072265625;
    float _1278 = _870 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1264 * 0.699999988079071044921875;
    float _1284 = _1186 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    float _1288 = _1272 * 0.89999997615814208984375;
    float _1290 = _1078 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = trunc(_1190);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1286, 1.10000002384185791015625, _1282);
    float _1302 = 1.0 / _1194;
    float _1304 = fma(_1292, 0.60000002384185791015625, _1280);
    float _1306 = _988 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    int _1310 = _1230 * int(_1298);
    int _1312 = _1310 + _1082;
    float _1314 = float(uint(_1312));
    float _1316 = _1248 * _1252;
    float _1318 = _1088 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1302 * _1322;
    float _1326 = as_type<float>(_503) * _1314;
    float _1328 = -_1238;
    float _1330 = _1328 + 1.0;
    float _1332 = _1236 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = -_1288;
    float _1338 = fma(_1308, -1.2000000476837158203125, _1336);
    float _1340 = abs(_1338);
    bool _1342 = _1340 > 0.001000000047497451305389404296875;
    bool _1344 = isnan(_1340);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.001000000047497451305389404296875);
    bool _1350 = _1346 || _1348;
    float _1352 = _1236 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1320, 0.300000011920928955078125, _1304);
    float _1358 = _1240 * _1250;
    float _1360 = _1350 ? _1338 : 0.001000000047497451305389404296875;
    float _1362 = _1234 * _1254;
    int _1364 = ~_405;
    int _1366 = _1364 + 1;
    float _1368 = trunc(_1232);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = _1334 * _852;
    float _1376 = _1276 * 0.15915493667125701904296875;
    float _1378 = fma(_1238, 0.5, 0.5);
    float _1380 = abs(_1324);
    float _1382 = log2(_1380);
    float _1384 = -_1374;
    float _1386 = fma(_1354, _856, _1384);
    int _1388 = _726 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1390 = _1354 * _852;
    int _1392 = _796 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1394 = _854 + (-0.0199999995529651641845703125);
    float _1396 = abs(_1300);
    bool _1398 = _1396 != 0.0;
    bool _1400 = isnan(_1396);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1266 * 6.283185482025146484375;
    float _1410 = sin(_1408);
    int _1412 = int(_1162) + int(_1372);
    float _1414 = abs(_1360);
    bool _1416 = _1414 == 0.0;
    bool _1418 = !_1406;
    bool _1420 = _1416 && _1418;
    float _1422 = _718 ? as_type<float>(_1392) : _1238;
    int _1424 = _1366 * _1412;
    int _1426 = _1424 + _1120;
    float _1428 = _1266 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    bool _1432 = uint(_1426) >= uint(_405);
    bool _1434 = !_1432;
    int _1436 = _1434 ? 0 : (-1);
    float _1438 = trunc(_1326);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    float _1444 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1446 = _714 ? as_type<float>(_1388) : _1238;
    float _1448 = _1378 * _1356;
    float _1450 = abs(_1360);
    bool _1452 = _1450 == 0.0;
    float _1454 = fma(_1334, _856, _1390);
    bool _1456 = _1432;
    int _1458 = as_type<int>(_1334);
    int _1460 = _1412;
    if (_1420)
    {
        bool _1462 = as_type<int>(_1360) >= 0;
        _1456 = _1462;
    }
    bool _1464 = _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1468 = exp2(_1444);
    float _1470 = _1386 + 0.02999999932944774627685546875;
    int _1472 = _1464 ? (-1) : 0;
    if (_1420)
    {
        int _1474 = _1464 ? 0 : 1078530011;
        _1458 = _1474;
    }
    int _1476 = _1458;
    int _1478 = ~_1412;
    int _1480 = _1478 + _1436;
    int _1482 = _1480 + 1;
    float _1484 = _1410 * _1470;
    float _1486 = _1430 * _1470;
    float _1488 = _1376 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = -_1484;
    float _1494 = fma(_1430, _1394, _1492);
    float _1496 = fma(_1410, _1394, _1486);
    int _1498 = int(_1298) + int(_1442);
    float _1500 = _1410;
    if (_1420)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1300);
        int _1504 = _1476 | _1502;
        _1500 = as_type<float>(_1504);
    }
    float _1506 = _1500;
    float _1508 = _1376 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    int _1516 = ~_405;
    int _1518 = _1516 + 1;
    bool _1520 = !_1406;
    bool _1522 = _1520 && _1452;
    float _1524 = _1506;
    float _1526 = _1506;
    if (!_1522)
    {
        float _1528 = abs(_1300);
        bool _1530 = _1528 != as_type<float>(0x7f800000u /* inf */);
        bool _1532 = isnan(_1528);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1538 = _1534 || _1536;
        float _1540 = abs(_1360);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        float _1544 = abs(_1360);
        bool _1546 = _1544 == as_type<float>(0x7f800000u /* inf */);
        bool _1548 = !_1538;
        bool _1550 = _1546 && _1548;
        if (_1550)
        {
            bool _1552 = as_type<int>(_1360) >= 0;
            _1472 = _1552 ? (-1) : 0;
        }
        int _1554 = _1472;
        if (_1550)
        {
            _1460 = 1075235812;
        }
        int _1556 = _1460;
        int _1558 = _1556;
        if (_1550)
        {
            int _1560 = ~_1554;
            int _1562 = (_1560 != 0) ? _1556 : 1061752795;
            _1558 = _1562;
        }
        int _1564 = _1558;
        if (_1550)
        {
            int _1566 = int(0x80000000) & as_type<int>(_1300);
            int _1568 = _1564 | _1566;
            _1524 = as_type<float>(_1568);
        }
        float _1570 = _1524;
        bool _1572 = !_1538;
        bool _1574 = _1572 && _1542;
        _1526 = _1570;
        if (!_1574)
        {
            float _1576 = abs(_1300);
            float _1578 = abs(_1360);
            float _1580 = precise::max(_1576, _1578);
            float _1582 = abs(_1300);
            float _1584 = abs(_1360);
            float _1586 = precise::min(_1582, _1584);
            float _1588 = 1.0 / _1580;
            float _1590 = abs(_1300);
            float _1592 = abs(_1360);
            bool _1594 = _1590 > _1592;
            bool _1596 = as_type<int>(_1360) >= 0;
            float _1598 = _1586 * _1588;
            float _1600 = abs(_1300);
            float _1602 = abs(_1360);
            float _1604 = _1600 + _1602;
            int _1606 = as_type<int>(_1300) & int(0x80000000);
            float _1608 = _1598 * _1598;
            bool _1610 = _1604 > as_type<float>(0x7f800000u /* inf */);
            bool _1612 = isnan(_1604);
            bool _1614 = _1610 || _1612;
            bool _1616 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1618 = _1614 || _1616;
            float _1620 = _1608 + 11.33538818359375;
            float _1622 = fma(_1608, _1620, 28.84246826171875);
            float _1624 = fma(_1608, _1622, 19.6966705322265625);
            float _1626 = fma(_1608, -0.82336294651031494140625, -5.674867153167724609375);
            float _1628 = fma(_1608, _1626, -6.565555095672607421875);
            float _1630 = 1.0 / _1624;
            float _1632 = _1608 * _1628;
            float _1634 = _1598 * _1632;
            float _1636 = fma(_1634, _1630, _1598);
            float _1638 = _1636;
            _1526 = _1604;
            if (_1594)
            {
                float _1640 = -_1636;
                float _1642 = _1640 + 1.57079637050628662109375;
                _1638 = _1642;
            }
            float _1644 = _1638;
            int _1646 = as_type<int>(_1644);
            if (!_1596)
            {
                float _1648 = -_1644;
                float _1650 = _1648 + 3.1415927410125732421875;
                _1646 = as_type<int>(_1650);
            }
            int _1652 = _1646;
            if (!_1618)
            {
                int _1654 = _1606 | _1652;
                _1526 = as_type<float>(_1654);
            }
        }
    }
    float _1656 = _1526;
    int _1658 = _405 * _1482;
    int _1660 = _1658 + _1120;
    float _1662 = fma(_1260, -0.100000001490116119384765625, _1454);
    float _1664 = _1494 * _1490;
    float _1666 = _1494 * _1510;
    float _1668 = _1466 * 0.01745329238474369049072265625;
    bool _1670 = !_1026;
    int _1672 = _1670 ? _1660 : (-1);
    float _1674 = -_1664;
    float _1676 = fma(_1510, _1662, _1674);
    float _1678 = fma(_1490, _1662, _1666);
    int _1680 = _1672 >> 31;
    float _1682 = _1668 * 0.15915493667125701904296875;
    int _1684 = _1518 * _1498;
    int _1686 = _1684 + _1082;
    int _1688 = _1680 & 3;
    float _1690 = _1682 * 6.283185482025146484375;
    float _1692 = sin(_1690);
    float _1694 = fma(_1260, 0.100000001490116119384765625, _1676);
    float _1696 = fma(_1514, -2.0, 3.0);
    int _1698 = _1672 + _1688;
    float _1700 = _1514 * _1514;
    bool _1702 = uint(_1686) >= uint(_405);
    float _1704 = _1496 + (-0.02999999932944774627685546875);
    int _1706 = _1698 >> 2;
    float _1708 = _1682 * 6.283185482025146484375;
    float _1710 = cos(_1708);
    float _1712 = _1700 * _1696;
    float _1714 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1716 = _1706 << 4;
    int _1718 = _1716 + 368;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1704);
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = _1678 + 0.0199999995529651641845703125;
    uint _1728 = uint(int(uint(_1718) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    bool _1744 = !_1702;
    int _1746 = _1744 ? 0 : (-1);
    float _1748 = _1714 * _1720;
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1712);
    float _1752 = _1726 * _1692;
    int _1754 = ~_1498;
    int _1756 = _1754 + _1746;
    int _1758 = _1756 + 1;
    float _1760 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1762 = _1324 <= 8000.0;
    bool _1764 = isnan(_1324);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(8000.0);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    float _1774 = _1656 + 1.57079637050628662109375;
    float _1776 = _1726 * _1710;
    float _1778 = -_1752;
    float _1780 = fma(_1694, _1710, _1778);
    int _1782 = _405 * _1758;
    int _1784 = _1782 + _1082;
    float _1786 = _1772 * _1750;
    float _1788 = fma(_1694, _1692, _1776);
    int _1790 = _1672 & 3;
    bool _1792 = _1790 != 0;
    float _1794 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1796 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1780);
    int _1798 = _1718 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    bool _1816 = uint(_1790) > 1u;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1788);
    int _1820 = _1672 & 3;
    bool _1822 = _1820 != 0;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1796);
    bool _1826 = _1788 != 0.0;
    bool _1828 = isnan(_1788);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.0);
    bool _1834 = _1830 || _1832;
    float _1836 = _1760 * _1818;
    int _1838 = _1822 ? 0 : 1;
    float _1840 = _1794 * _1824;
    bool _1842 = _1796 == 0.0;
    bool _1844 = !_1834;
    bool _1846 = _1842 && _1844;
    float _1848 = _1748 * _289;
    int _1850 = ~_1838;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1748 * _309;
    bool _1858 = _1496 == 0.02999999932944774627685546875;
    bool _1860 = _1858 && _1846;
    float _1862 = _1748 * _299;
    int _1864 = _1854;
    float _1866 = as_type<float>(_1784);
    if (!_1816)
    {
        int _1868 = ~_1838;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    float _1874 = fma(_1840, _267, _1848);
    bool _1876 = _1790 != 3;
    float _1878 = fma(_1840, _275, _1856);
    int _1880 = abs(_1872);
    float _1882 = fma(_1840, _271, _1862);
    bool _1884 = !_1792;
    int _1886 = _1884 ? 0 : 1;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1890 = int(_1888);
    bool _1892 = uint(_1790) >= 2u;
    float _1894 = in.m_50.z;
    int _1896 = abs(_1886);
    float _1898 = -_1836;
    float _1900 = fma(_1898, _313, _1874);
    int _1902 = _1892 ? 0 : 1;
    int _1904 = ~_1880;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    float _1910 = _481 + _1900;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * as_type<int>(_1742);
    int _1920 = _1916;
    if (_1876)
    {
        int _1922 = ~_1902;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    int _1928 = ~_1896;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = abs(_1926);
    bool _1936 = _1790 != 3;
    int _1938 = _1932 * as_type<int>(_1734);
    int _1940 = _1938 + _1918;
    float _1942 = in.m_72.x;
    float _1944 = in.m_72.y;
    float _1946 = in.m_72.z;
    bool _1948 = !_1936;
    int _1950 = _1948 ? 0 : (-1);
    bool _1952 = !_708;
    int _1954 = _1952 ? 0 : 1;
    int _1956 = ~_1934;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = abs(_1950);
    int _1964 = abs(_1954);
    int _1966 = _1960 * as_type<int>(_1806);
    int _1968 = _1966 + _1940;
    float _1970 = float(uint(_1890));
    float _1972 = -_1836;
    float _1974 = fma(_1972, _321, _1878);
    int _1976 = abs(_1890);
    int _1978 = ~_1962;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = 1.0 / _1970;
    float _1986 = -_1836;
    float _1988 = fma(_1986, _317, _1882);
    float _1990 = _1774 * (-0.15915493667125701904296875);
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = _1982 * as_type<int>(_1814);
    int _2000 = _1998 + _1968;
    float _2002 = float(uint(_1976));
    bool _2004 = !_1026;
    int _2006 = _2004 ? _1784 : (-1);
    int _2008 = _2000 * _1996;
    float _2010 = 1.0 / _2002;
    float _2012 = as_type<float>(_1962);
    float _2014 = as_type<float>(_1964);
    float _2016 = _2002;
    float _2018 = as_type<float>(_2000);
    float _2020 = as_type<float>(_2008);
    if (_1860)
    {
        _2012 = _1942;
    }
    float _2022 = _2012;
    int _2024 = _2006 * _1964;
    int _2026 = _2024 + _2008;
    float _2028 = _2022;
    if (_1860)
    {
        _2014 = _1946;
    }
    float _2030 = _2014;
    int _2032 = as_type<int>(_1984) + (-2);
    float _2034 = _1990 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _2030;
    if (_1860)
    {
        _2016 = _1944;
    }
    float _2040 = _2016;
    float _2042 = _2040;
    if (_1860)
    {
        _1866 = _2022;
    }
    float _2044 = _1866;
    float _2046 = _2044;
    if (_1860)
    {
        _2018 = _2040;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (!_1860)
    {
        _2042 = _1944;
    }
    float _2052 = _2042;
    float _2054 = _1990 * 6.283185482025146484375;
    float _2056 = sin(_2054);
    float _2058 = float(uint(_2026));
    if (!_1860)
    {
        _2028 = _1942;
    }
    float _2060 = _2028;
    float _2062 = _1894 * 6.283185482025146484375;
    int _2064 = abs(_2026);
    if (!_1860)
    {
        float _2066 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2050 = _2066;
    }
    float _2068 = _2050;
    if (_1860)
    {
        _2020 = _2030;
    }
    float _2070 = _2020;
    float _2072 = _2062 * 0.15915493667125701904296875;
    float _2074 = as_type<float>(_2032) * _2058;
    float _2076 = _2070;
    if (!_1860)
    {
        _2038 = _1946;
    }
    float _2078 = _2038;
    float _2080 = _1988 * _2036;
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    int _2086 = as_type<int>(_2010) + (-2);
    if (!_1860)
    {
        float _2088 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = float(uint(_2064));
    float _2094 = fma(_1974, _2056, _2080);
    float _2096 = _1988 * _2056;
    float _2098 = _756 * _2060;
    int _2100 = ~_1890;
    int _2102 = _2100 + 1;
    float _2104 = trunc(_2074);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = as_type<float>(_2086) * _2092;
    float _2112 = -_2096;
    float _2114 = fma(_1974, _2036, _2112);
    float _2116 = _369 + _2094;
    if (!_1860)
    {
        float _2118 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = -_2098;
    float _2124 = fma(_752, _2078, _2122);
    float _2126 = _754 * _2078;
    float _2128 = trunc(_2110);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    float _2134 = _371 + _2114;
    float _2136 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2116);
    float _2138 = _752 * _2052;
    int _2140 = ~_1976;
    int _2142 = _2140 + 1;
    float _2144 = -_2126;
    float _2146 = fma(_756, _2052, _2144);
    float _2148 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2134);
    float _2150 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2152 = _2136 + _2150;
    float _2154 = _2072 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    int _2158 = _2102 * int(_2108);
    int _2160 = _2158 + _2026;
    float _2162 = -_2138;
    float _2164 = fma(_754, _2060, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2168 = _2148 + _2166;
    float _2170 = _2084 * _2152;
    float _2172 = _2146 * _758;
    float _2174 = float(uint(_2160));
    float _2176 = _2164 * _758;
    float _2178 = as_type<float>(_2032) * _2174;
    float _2180 = _2124 * _758;
    int _2182 = _2142 * int(_2132);
    int _2184 = _2182 + _2064;
    float _2186 = _2156 * _2152;
    float _2188 = -_2170;
    float _2190 = fma(_2156, _2168, _2188);
    float _2192 = float(uint(_2184));
    float _2194 = _2176 * _299;
    float _2196 = fma(_2084, _2168, _2186);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2200 = trunc(_2178);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2086) * _2192;
    float _2208 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _2198 + _2210;
    float _2214 = _299 * _2120;
    float _2216 = fma(_2172, _271, _2194);
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2208 + _2218;
    float _2222 = _2212 * _2212;
    float _2224 = fma(_271, _2090, _2214);
    float _2226 = _309 * _2120;
    float _2228 = _2176 * _289;
    float _2230 = fma(_2220, _2220, _2222);
    float _2232 = _2176 * _309;
    float _2234 = trunc(_2206);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    float _2240 = fma(_275, _2090, _2226);
    float _2242 = fma(_2172, _267, _2228);
    float _2244 = fma(_2172, _275, _2232);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _2248 = _2246 + 1.0;
    float _2250 = -_2180;
    float _2252 = fma(_2250, _317, _2216);
    float _2254 = -_2180;
    float _2256 = fma(_2254, _313, _2242);
    float _2258 = -_2180;
    float _2260 = fma(_2258, _321, _2244);
    float _2262 = sqrt(_2230);
    float _2264 = -_776;
    float _2266 = fma(_2264, _2248, _1910);
    float _2268 = -_2068;
    float _2270 = fma(_321, _2268, _2240);
    int _2272 = ~_1890;
    int _2274 = _2272 + 1;
    float _2276 = _289 * _2120;
    int _2278 = int(_2108) + int(_2204);
    float _2280 = -_2068;
    float _2282 = fma(_317, _2280, _2224);
    int _2284 = ~_1976;
    int _2286 = _2284 + 1;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_74.x = _2252;
    out.m_74.y = _2256;
    out.m_74.z = _2260;
    int _2290 = _2274 * _2278;
    int _2292 = _2290 + _2026;
    int _2294 = int(_2132) + int(_2238);
    float _2296 = _2282 * _2056;
    float _2298 = _2282 * _2036;
    float _2300 = fma(_267, _2090, _2276);
    bool _2302 = uint(_2292) >= uint(_1890);
    float _2304 = -_2296;
    float _2306 = fma(_2270, _2036, _2304);
    bool _2308 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = fma(_2270, _2056, _2298);
    bool _2312 = !_2302;
    int _2314 = _2312 ? 0 : (-1);
    int _2316 = _2286 * _2294;
    int _2318 = _2316 + _2064;
    float _2320 = as_type<float>(_2286);
    float _2322 = _2260;
    float _2324 = _2256;
    float _2326 = _2300;
    if (!_2308)
    {
        _2320 = _2208;
    }
    float _2328 = _2320;
    float _2330 = _2328;
    if (!_2308)
    {
        _2322 = _2198;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2308)
    {
        _2324 = _2266;
    }
    float _2336 = _2324;
    bool _2338 = !_2308;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2262 + _2344;
        float _2348 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = rsqrt(_2230);
        float _2352 = _2346 * _2342;
        float _2354 = _2352 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = sin(_2360);
        float _2364 = _2358 + (-1.0);
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = fma(_2362, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2370 = fma(_2266, _2358, _2366);
        float _2372 = _2350 * _2368;
        float _2374 = fma(_2220, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2376 = fma(_2212, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2340 = _2370;
        _2330 = _2374;
        _2334 = _2376;
    }
    float _2378 = _2340;
    float _2380 = _2330;
    float _2382 = _2334;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2388 = uint(_2318) >= uint(_1976);
    float _2390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2392 = _2026 ^ _1890;
    float _2394 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    int _2396 = ~_2278;
    int _2398 = _2396 + _2314;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    bool _2404 = !_2388;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2394);
    uint _2410 = uint(int(uint(_2392) >> uint(31)));
    float _2412 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2402);
    bool _2414 = _1890 == 0;
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2418 = _1890 == 0;
    int _2420 = _1890 * _2400;
    int _2422 = _2420 + _2026;
    int _2424 = ~_2406;
    int _2426 = _2294 + _2424;
    int _2428 = _2426 + 1;
    float _2430 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2432 = ~int(_2410);
    int _2434 = _2432 + 1;
    float _2436 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _2438 = !_2414;
    int _2440 = _2438 ? _2422 : (-1);
    float _2442 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _2444 = _2428 ^ _2434;
    float _2446 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = float(_2440);
    float _2454 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2436);
    int _2456 = ~_2434;
    int _2458 = _2456 + _2444;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2442);
    float _2464 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2446);
    float _2466 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2448);
    float _2468 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2470 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2472 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2474 = !_2418;
    int _2476 = _2474 ? _2460 : (-1);
    float _2478 = fma(_2468, _2452, _806);
    float _2480 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2482 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2484 = fma(_2468, _606, -0.5);
    float _2486 = float(_2476);
    float _2488 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2490 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2492 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2494 = in.m_54.x;
    float _2496 = fma(_2488, _1422, -0.5);
    float _2498 = -_710;
    float _2500 = fma(_2488, _2486, _2498);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2462);
    float _2506 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2464);
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2466);
    float _2510 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2514 = _2378 + _2512;
    float _2516 = fma(_814, _2496, _2500);
    float _2518 = fma(_812, _2484, _2478);
    float _2520 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2504);
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2526 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2530 = _2380 + _2528;
    float _2532 = _2514 * _2514;
    float _2534 = _2516 + 0.5;
    float _2536 = _2156 * _2310;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = fma(_2530, _2530, _2532);
    float _2542 = _2084 * _2310;
    float _2544 = fma(_2084, _2306, _2536);
    float _2546 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2548 = -_389;
    float _2550 = _2548 + 1.0;
    float _2552 = -_2068;
    float _2554 = fma(_313, _2552, _2300);
    float _2556 = -_2542;
    float _2558 = fma(_2156, _2306, _2556);
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2382 + _2562;
    float _2566 = _2550 * _2546;
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2572 = fma(_2564, _2564, _2540);
    float _2574 = _620 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2576 = -_2568;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2580 = _2518 + 0.5;
    float _2582 = sqrt(_2572);
    float _2584 = _2574 * _2538;
    float _2586 = _2578 * _2494;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2522;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2526;
    float _2588 = _2586 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = _2570 * _2560;
    out.m_76.x = _2544;
    out.m_76.y = _2554;
    out.m_76.z = _2558;
    out.m_78.x = _2580;
    out.m_78.y = _2534;
    out.m_78.z = _2584;
    out.m_78.w = _2590;
    out.m_80.x = _2588;
    bool _2592 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2594 = isnan(_2582);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2600 = _2596 || _2598;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2602 = _2540;
    float _2604 = _2542;
    float _2606 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2608 = _2586;
    float _2610 = _2572;
    if (!_2600)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2602;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2600)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2326;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2600)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2624 = _2604;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2600)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2600)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2636 = _2608;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2600)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2642 = _2610;
    bool _2644 = !_2600;
    float _2646 = _2642;
    float _2648 = _2642;
    if (!_2644)
    {
        bool _2650 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2652 = isnan(_2582);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2658 = _2654 || _2656;
        if (!_2658)
        {
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = _2582 + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = 1.0 / _2666;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2690 = _2662 * _2672;
            float _2692 = precise::clamp(_2690, 0.0, 1.0);
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2698 = fma(_2692, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2692, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2702 = fma(_2692, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2704 = fma(_2692, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2706 = fma(_2692, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2708 = fma(_2692, _2688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2698;
            _2640 = _2706;
            _2616 = _2702;
            _2634 = _2704;
            _2628 = _2700;
            _2648 = _2708;
            _2710 = true;
        }
        else
        {
            bool _2712 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2714 = isnan(_2582);
            bool _2716 = _2712 || _2714;
            bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2720 = _2716 || _2718;
            if (!_2720)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2722 = _2614;
            _2616 = _2722;
            if (!_2720)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2724 = _2620;
            _2622 = _2724;
            if (!_2720)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2726 = _2626;
            _2628 = _2726;
            if (!_2720)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2728 = _2632;
            _2634 = _2728;
            if (!_2720)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2730 = _2638;
            _2640 = _2730;
            if (!_2720)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2732 = _2646;
            bool _2734 = !_2720;
            _2648 = _2732;
            if (!_2734)
            {
                bool _2736 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2738 = isnan(_2582);
                bool _2740 = _2736 || _2738;
                bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2744 = _2740 || _2742;
                if (!_2744)
                {
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = _2582 + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2750;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = 1.0 / _2752;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2776 = _2748 * _2758;
                    float _2778 = precise::clamp(_2776, 0.0, 1.0);
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2784 = fma(_2778, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2778, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2788 = fma(_2778, _2762, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2790 = fma(_2778, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2792 = fma(_2778, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2794 = fma(_2778, _2774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2784;
                    _2640 = _2792;
                    _2616 = _2788;
                    _2634 = _2790;
                    _2628 = _2786;
                    _2648 = _2794;
                    _2710 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2710 = false;
    float _2796 = _2622;
    float _2798 = _2640;
    float _2800 = _2616;
    float _2802 = _2634;
    float _2804 = _2628;
    float _2806 = _2648;
    float _2808 = fma(_2554, -0.5, 0.5);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -_2796;
    float _2814 = _2812 + _2798;
    float _2816 = -_2800;
    float _2818 = _2816 + _2802;
    float _2820 = -_2804;
    float _2822 = _2820 + _2806;
    bool _2824 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2826 = fma(_2810, _2814, _2796);
    float _2828 = fma(_2810, _2818, _2800);
    float _2830 = fma(_2810, _2822, _2804);
    float _2832 = _2826 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2834 = fma(_2828, 0.298911988735198974609375, _2832);
    float _2836 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2838 = fma(_2830, 0.114477999508380889892578125, _2834);
    float _2840 = -_2838;
    float _2842 = _2828 + _2840;
    float _2844 = -_2838;
    float _2846 = _2826 + _2844;
    float _2848 = -_2838;
    float _2850 = _2830 + _2848;
    out.m_80.w = _2836;
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2854 = fma(_2846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2856 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    out.m_86.x = _2852;
    out.m_86.y = _2854;
    out.m_86.z = _2856;
    if (!_2824)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2858 = -_2378;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2862 = -_2380;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2866 = -_2382;
    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2870 = _2860 * _2860;
    float _2872 = fma(_2864, _2864, _2870);
    float _2874 = fma(_2868, _2868, _2872);
    float _2876 = sqrt(_2874);
    float _2878 = rsqrt(_2874);
    float _2880 = -_2876;
    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2886 = precise::clamp(_2884, 0.0, 1.0);
    float _2888 = _2864 * _2878;
    float _2890 = _2860 * _2878;
    float _2892 = abs(_2886);
    float _2894 = log2(_2892);
    float _2896 = _2868 * _2878;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2900 = _2554 * _2890;
    float _2902 = -_2890;
    float _2904 = -_2898;
    float _2906 = fma(_2902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2904);
    float _2908 = fma(_2544, _2888, _2900);
    float _2910 = -_2896;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2906);
    float _2914 = fma(_2558, _2896, _2908);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2920 = _2912 + _2918;
    float _2922 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2924 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2926 = precise::clamp(_2924, 0.0, 1.0);
    float _2928 = exp2(_2922);
    float _2930 = _2928 * _2926;
    float _2932 = _2916 * _2930;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2938 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2934;
    out.m_84.y = _2936;
    out.m_84.z = _2938;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2710 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_37.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_40.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_121);
        out.gl_Position.z = _2996;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_42.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _113;
    if (_147)
    {
        out.m_40.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _123 = as_type<int>(_151);
    }
    int _153 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_153);
        out.gl_Position.z = _3059;
    }
    if (_147)
    {
        return out;
    }
    float _155 = in.m_44.x;
    float _157 = in.m_44.y;
    float _159 = in.m_44.z;
    float _161 = 1.0 / _127;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_48.x;
    float _171 = in.m_48.y;
    float _173 = in.m_48.z;
    float _175 = _155 * _155;
    float _177 = _157 * _157;
    float _179 = _159 * _159;
    float _181 = fma(_163, _163, _175);
    float _183 = fma(_165, _165, _177);
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = sqrt(_187);
    float _195 = sqrt(_189);
    float _197 = sqrt(_191);
    bool _199 = _193 > 0.0;
    bool _201 = _195 > 0.0;
    float _203 = 0.0;
    float _205 = _195;
    float _207 = _193;
    int _209 = as_type<int>(_167);
    bool _211 = _201;
    if (_199)
    {
        float _213 = rsqrt(_187);
        _203 = _213;
    }
    float _215 = _203;
    if (!_199)
    {
        _205 = 0.0;
    }
    float _217 = _205;
    bool _219 = _197 > 0.0;
    float _221 = _197;
    float _223 = _217;
    bool _225 = _219;
    if (!_199)
    {
        _221 = 0.0;
    }
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    if (!_199)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (_201)
    {
        float _239 = rsqrt(_189);
        _235 = _239;
    }
    float _241 = _235;
    float _243 = 0.0;
    if (!_201)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    float _247 = _131 * _161;
    float _249 = 0.0;
    float _251 = _245;
    if (!_201)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (_219)
    {
        float _259 = rsqrt(_191);
        _255 = _259;
    }
    float _261 = _255;
    float _263 = _215;
    if (_199)
    {
        float _265 = _215 * _155;
        _223 = _265;
    }
    float _267 = _223;
    if (_199)
    {
        float _269 = _215 * _163;
        _231 = _269;
    }
    float _271 = _231;
    if (_199)
    {
        float _273 = _215 * _169;
        _237 = _273;
    }
    float _275 = _237;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_201)
    {
        _263 = 0.0;
    }
    float _279 = _263;
    float _281 = _279;
    if (!_219)
    {
        _207 = 0.0;
    }
    float _283 = _207;
    float _285 = _283;
    if (_201)
    {
        float _287 = _241 * _157;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = 0.0;
    if (!_219)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = _293;
    if (_201)
    {
        float _297 = _241 * _165;
        _281 = _297;
    }
    float _299 = _281;
    float _301 = 0.0;
    if (!_219)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = _303;
    if (_201)
    {
        float _307 = _241 * _171;
        _257 = _307;
    }
    float _309 = _257;
    if (_219)
    {
        float _311 = _261 * _159;
        _285 = _311;
    }
    float _313 = _285;
    if (_219)
    {
        float _315 = _261 * _167;
        _295 = _315;
    }
    float _317 = _295;
    if (_219)
    {
        float _319 = _261 * _173;
        _305 = _319;
    }
    float _321 = _305;
    bool _323 = !_277;
    float _341;
    if (!_323)
    {
        float _325 = in.m_50.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _247;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_37.x;
    float _349 = in.m_37.y;
    float _351 = in.m_37.z;
    float _353 = in.m_46.w;
    float _355 = in.m_48.w;
    float _357 = _165 * _349;
    float _359 = _171 * _349;
    float _361 = fma(_163, _347, _357);
    float _363 = fma(_169, _347, _359);
    float _365 = fma(_167, _351, _361);
    float _367 = fma(_173, _351, _363);
    float _369 = _365 + _353;
    float _371 = _367 + _355;
    float _373 = fma(_369, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _377 = floor(_373);
    float _379 = floor(_375);
    float _381 = -_377;
    float _383 = _373 + _381;
    float _385 = -_379;
    float _387 = _375 + _385;
    float2 _3396 = float2(_383, _387);
    float _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3396, float2(0.0), isnan(_3396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3396, float2(0.0), isnan(_3396)), level(0.0)).x;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _393 = int(_391);
    float _395 = in.m_50.x;
    float _397 = _247 * 3.3333332538604736328125;
    float _399 = in.m_52.x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _405 = int(_403);
    float _407 = in.m_54.y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = 0.0 + _397;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = in.m_50.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _419 = _417 != 0;
    float _421 = -_397;
    float _423 = _421 + 3.3333332538604736328125;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = float(_393);
    float _429 = in.m_56.x;
    float _431 = in.m_56.y;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _435 = _433 != 0;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _427;
    float _441 = _131 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _345 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _345 + _447;
    float _451 = float(uint(_405));
    float _453 = fma(_395, 6.283185482025146484375, _441);
    float _455 = _373;
    if (_419)
    {
        float _457 = in.m_50.z;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = float(_405);
    float _463 = _399;
    if (_419)
    {
        float _465 = -_399;
        float _467 = _465 + 1.0;
        _209 = as_type<int>(_467);
    }
    int _469 = _209;
    int _471 = ~_405;
    int _473 = _471 + 1;
    float _475 = 1.0 / _451;
    if (_435)
    {
        bool _477 = _395 > 0.5;
        _225 = _477;
    }
    bool _479 = _225;
    float _481 = _349 + _407;
    float _483 = 0.0;
    if (!_435)
    {
        _483 = _399;
    }
    float _485 = _483;
    float _487 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _453);
    float _489 = _131 * _439;
    float _491 = _487 * 0.15915493667125701904296875;
    float _493 = abs(_429);
    float _495 = log2(_493);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    out.m_58.x = _429;
    out.m_58.y = _431;
    int _503 = as_type<int>(_475) + (-2);
    float _505 = fma(_501, _395, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _507 = trunc(_489);
    int _509 = int(_507);
    float _511 = in.m_50.y;
    float _513 = _485;
    if (_419)
    {
        bool _515 = _459 > 0.5;
        _211 = _515;
    }
    bool _517 = _211;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = _495 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _529 = _491 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_345);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = float(uint(_509));
    float _551 = exp2(_527);
    float _553 = float(_509);
    float _555 = as_type<float>(_503) * _549;
    bool _557 = _553 >= _461;
    bool _559 = isnan(_553);
    bool _561 = _557 || _559;
    bool _563 = isnan(_461);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _511 * 628.31854248046875;
    float _571 = trunc(_555);
    float _573 = precise::max(_571, 0.0);
    uint _576 = uint(_573);
    float _578 = trunc(_567);
    int _580 = int(_578);
    int _582 = _473 * int(_576);
    int _584 = _582 + _509;
    float _586 = float(uint(_584));
    int _588 = _584;
    if (_435)
    {
        float _590 = -_399;
        float _592 = _590 + 1.0;
        _588 = as_type<int>(_592);
    }
    int _594 = _588;
    int _596 = ~_580;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = as_type<float>(_503) * _586;
    if (_435)
    {
        float _604 = _479 ? as_type<float>(_594) : _399;
        _513 = _604;
    }
    float _606 = _513;
    int _608 = ~_405;
    int _610 = _608 + 1;
    float _612 = trunc(_602);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    if (_419)
    {
        float _618 = _517 ? as_type<float>(_469) : _399;
        _463 = _618;
    }
    float _620 = _463;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _622;
    float _626 = in.m_56.w;
    float _628 = 1.0 / _624;
    int _630 = int(_576) + int(_616);
    float _632 = in.m_56.z;
    int _634 = _610 * _630;
    int _636 = _634 + _509;
    float _638 = _131 * _461;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _646 = _644 != 0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    float _656 = _638 * _161;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = trunc(_656);
    int _666 = int(_664);
    bool _668 = uint(_636) >= uint(_405);
    float _670 = fma(_662, -2.0, _401);
    float _672 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_58.w = _626;
    bool _676 = !_668;
    int _678 = _676 ? 0 : (-1);
    float _680 = -_674;
    float _682 = fma(_672, 2.0, _680);
    bool _684 = !_646;
    int _686 = _684 ? 0 : 1;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _696 = !_642;
    int _698 = _696 ? 0 : 1;
    out.m_58.z = _632;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / _694;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _708 = _706 != 0;
    float _710 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _670);
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    bool _720 = !_650;
    int _722 = _720 ? 0 : 1;
    float _724 = 1.0 / _690;
    bool _726 = _415 > 0.5;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = _445 * _704;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _732;
    out.m_60.y = _734;
    out.m_60.z = _738;
    out.m_60.w = _437;
    float _750 = _449 * _724;
    float _752 = in.m_62.x;
    float _754 = in.m_62.y;
    float _756 = in.m_62.z;
    float _758 = in.m_62.w;
    float _760 = precise::min(_413, _425);
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = _345 + _764;
    out.m_64.x = _744;
    out.m_64.y = _748;
    out.m_64.z = _746;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = fma(_131, _505, _569);
    float _772 = _766 * _628;
    float _774 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _776 = fma(_760, -5.0, 5.0);
    float _778 = fma(_521, _750, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _780 = fma(_525, _742, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _782 = !_654;
    int _784 = _782 ? 0 : 1;
    float _786 = _487 * 0.60000002384185791015625;
    bool _788 = !_660;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    float _792 = _786 * 0.15915493667125701904296875;
    float _794 = _487 * 1.2999999523162841796875;
    bool _796 = _511 > 0.5;
    float _798 = _299 * _756;
    float _800 = _790 * _395;
    float _802 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    float _804 = -_131;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[76].x, _682);
    float _808 = _289 * _756;
    float _810 = _309 * _756;
    float _812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _802);
    float _814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _774);
    float _816 = _794 * 0.15915493667125701904296875;
    float _818 = _487 + 0.52359879016876220703125;
    float _820 = fma(_271, _752, _798);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _824 = fma(_267, _752, _808);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = fma(_487, 0.60000002384185791015625, 0.31415927410125732421875);
    float _830 = fma(_275, _752, _810);
    float _832 = -_754;
    float _834 = fma(_317, _832, _820);
    float _836 = -_754;
    float _838 = fma(_313, _836, _824);
    float _840 = _828 * 0.15915493667125701904296875;
    float _842 = fma(_487, 1.2999999523162841796875, 0.680678427219390869140625);
    float _844 = -_754;
    float _846 = fma(_321, _844, _830);
    float _848 = fma(_822, _551, _441);
    float _850 = _842 * 0.15915493667125701904296875;
    float _852 = in.m_66.x;
    float _854 = in.m_66.y;
    float _856 = in.m_66.z;
    float _858 = fma(_429, 0.261799395084381103515625, -0.261799395084381103515625);
    float _860 = floor(_800);
    out.m_68.x = _834;
    out.m_68.y = _838;
    out.m_68.z = _846;
    float _862 = fma(_395, 6.283185482025146484375, _848);
    float _864 = _770 + _858;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _870 = _862 * 0.15915493667125701904296875;
    float _872 = _864 * 1.10000002384185791015625;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _770 * 0.89999997615814208984375;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _884;
    float _888 = -_860;
    float _890 = _800 + _888;
    float _892 = _878 * 0.15915493667125701904296875;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _898 = fma(_882, _750, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _900 = fma(_886, _750, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _902 = fma(_896, _742, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _904 = fma(_868, _742, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _906 = _770 * 1.10000002384185791015625;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _908;
    float _912 = _770 * 0.15915493667125701904296875;
    float _914 = _770 * 0.699999988079071044921875;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _916;
    float _920 = _906 * 0.15915493667125701904296875;
    float _922 = fma(_910, _772, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _924 = _852 >= 0.0;
    bool _926 = isnan(_852);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = fma(_547, _772, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _936 = fma(_918, _772, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _938 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _940 = isnan(_345);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _890 * _461;
    bool _952 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _954 = isnan(_345);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _792 * 6.283185482025146484375;
    float _966 = sin(_964);
    int _968 = _932 ? 0 : 1;
    float _970 = -_948;
    float _972 = _970 + 1.0;
    bool _974 = _852 > 0.0;
    float _976 = -_962;
    float _978 = _976 + 1.0;
    int _980 = ~_968;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _962 * _972;
    float _988 = _864 * 0.15915493667125701904296875;
    float _990 = _543 * _978;
    int _992 = ~_630;
    int _994 = _992 + _678;
    int _996 = _994 + 1;
    float _998 = -_543;
    float _1000 = _998 + 1.0;
    float _1002 = trunc(_950);
    int _1004 = int(_1002);
    float _1006 = _864 * 0.89999997615814208984375;
    float _1008 = _864 * 0.699999988079071044921875;
    int _1010 = _405 * _996;
    int _1012 = _1010 + _509;
    float _1014 = _914 * 0.15915493667125701904296875;
    int _1016 = _984;
    if (!_974)
    {
        int _1018 = ~_968;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = fma(_966, 0.60000002384185791015625, _531);
    bool _1026 = _405 == 0;
    float _1028 = _826 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1034 = isnan(_345);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1006 * 0.15915493667125701904296875;
    bool _1046 = !_1026;
    int _1048 = _1046 ? _1012 : (-1);
    int _1050 = _405 + (-1);
    float _1052 = _1042 * _1000;
    bool _1054 = !_702;
    int _1056 = _1054 ? 0 : 1;
    int _1058 = _1048 * _600;
    int _1060 = abs(_686);
    float _1062 = _1008 * 0.15915493667125701904296875;
    int _1064 = abs(_1056);
    int _1066 = _580 * _1050;
    int _1068 = _1066 + _1058;
    float _1070 = _862 * 0.60000002384185791015625;
    float _1072 = _862 * 1.2999999523162841796875;
    int _1074 = abs(_698);
    int _1076 = _1068 * _1060;
    float _1078 = _1070 * 0.15915493667125701904296875;
    int _1080 = _1004 * _1064;
    int _1082 = _1080 + _509;
    float _1084 = _481 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1086 = abs(_722);
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_784);
    int _1092 = _666 * _1074;
    int _1094 = _1092 + _1076;
    float _1096 = _816 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1084);
    float _1102 = _898 * _1052;
    float _1104 = -_1042;
    float _1106 = _1104 + 1.0;
    int _1108 = _1082 * _1086;
    int _1110 = _1108 + _1094;
    float _1112 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1100);
    float _1114 = fma(_876, 0.60000002384185791015625, _1030);
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1102);
    int _1118 = _1004 * _1090;
    int _1120 = _1118 + _1110;
    float _1122 = _850 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _481 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1130 = fma(_902, _990, _1116);
    float _1132 = float(uint(_1120));
    float _1134 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = _778 * _1052;
    float _1138 = fma(_1098, 0.300000011920928955078125, _1024);
    float _1140 = 1.0 / _1128;
    float _1142 = as_type<float>(_503) * _1132;
    float _1144 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1136);
    float _1148 = -_429;
    float _1150 = _1148 + 1.0;
    float _1152 = _900 * _1052;
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1156 = fma(_780, _990, _1146);
    float _1158 = trunc(_1142);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = fma(_1124, 0.300000011920928955078125, _1114);
    int _1166 = ~_405;
    int _1168 = _1166 + 1;
    float _1170 = _1154 + _1128;
    float _1172 = float(uint(_1082));
    float _1174 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1152);
    float _1176 = fma(_922, _986, _1130);
    float _1178 = _1014 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1170 * _1140;
    float _1184 = _1182 * 0.5;
    float _1186 = _872 * 0.15915493667125701904296875;
    float _1188 = fma(_904, _990, _1174);
    float _1190 = as_type<float>(_503) * _1172;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1194 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1192);
    float _1196 = -_431;
    float _1198 = _1196 + 1.0;
    float _1200 = _920 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1168 * int(_1162);
    int _1206 = _1204 + _1120;
    float _1208 = fma(_936, _986, _1188);
    float _1210 = _1138 * _1150;
    float _1212 = abs(_1164);
    float _1214 = _1198 * _1212;
    float _1216 = fma(_934, _986, _1156);
    float _1218 = float(uint(_1206));
    float _1220 = _1210 * 0.52359879016876220703125;
    float _1222 = _912 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = _1214 * (-45.0);
    int _1228 = ~_405;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_503) * _1218;
    float _1234 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1208);
    float _1236 = _1220 * 0.15915493667125701904296875;
    float _1238 = in.m_52.y;
    float _1240 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1176);
    float _1242 = _892 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1180 + _1202;
    float _1248 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1216);
    float _1250 = in.m_70.x;
    float _1252 = in.m_70.y;
    float _1254 = in.m_70.z;
    float _1256 = _1226 * 0.01745329238474369049072265625;
    float _1258 = _1214 * (-20.0);
    float _1260 = float(_1022);
    float _1262 = _1062 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = _1260 * _1258;
    float _1270 = _1044 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1224, 1.2000000476837158203125, _1244);
    float _1276 = _1268 * 0.01745329238474369049072265625;
    float _1278 = _870 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1264 * 0.699999988079071044921875;
    float _1284 = _1186 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    float _1288 = _1272 * 0.89999997615814208984375;
    float _1290 = _1078 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = trunc(_1190);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1286, 1.10000002384185791015625, _1282);
    float _1302 = 1.0 / _1194;
    float _1304 = fma(_1292, 0.60000002384185791015625, _1280);
    float _1306 = _988 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    int _1310 = _1230 * int(_1298);
    int _1312 = _1310 + _1082;
    float _1314 = float(uint(_1312));
    float _1316 = _1248 * _1252;
    float _1318 = _1088 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1302 * _1322;
    float _1326 = as_type<float>(_503) * _1314;
    float _1328 = -_1238;
    float _1330 = _1328 + 1.0;
    float _1332 = _1236 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = -_1288;
    float _1338 = fma(_1308, -1.2000000476837158203125, _1336);
    float _1340 = abs(_1338);
    bool _1342 = _1340 > 0.001000000047497451305389404296875;
    bool _1344 = isnan(_1340);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.001000000047497451305389404296875);
    bool _1350 = _1346 || _1348;
    float _1352 = _1236 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1320, 0.300000011920928955078125, _1304);
    float _1358 = _1240 * _1250;
    float _1360 = _1350 ? _1338 : 0.001000000047497451305389404296875;
    float _1362 = _1234 * _1254;
    int _1364 = ~_405;
    int _1366 = _1364 + 1;
    float _1368 = trunc(_1232);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = _1334 * _852;
    float _1376 = _1276 * 0.15915493667125701904296875;
    float _1378 = fma(_1238, 0.5, 0.5);
    float _1380 = abs(_1324);
    float _1382 = log2(_1380);
    float _1384 = -_1374;
    float _1386 = fma(_1354, _856, _1384);
    int _1388 = _726 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1390 = _1354 * _852;
    int _1392 = _796 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1394 = _854 + (-0.0199999995529651641845703125);
    float _1396 = abs(_1300);
    bool _1398 = _1396 != 0.0;
    bool _1400 = isnan(_1396);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1266 * 6.283185482025146484375;
    float _1410 = sin(_1408);
    int _1412 = int(_1162) + int(_1372);
    float _1414 = abs(_1360);
    bool _1416 = _1414 == 0.0;
    bool _1418 = !_1406;
    bool _1420 = _1416 && _1418;
    float _1422 = _718 ? as_type<float>(_1392) : _1238;
    int _1424 = _1366 * _1412;
    int _1426 = _1424 + _1120;
    float _1428 = _1266 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    bool _1432 = uint(_1426) >= uint(_405);
    bool _1434 = !_1432;
    int _1436 = _1434 ? 0 : (-1);
    float _1438 = trunc(_1326);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    float _1444 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1446 = _714 ? as_type<float>(_1388) : _1238;
    float _1448 = _1378 * _1356;
    float _1450 = abs(_1360);
    bool _1452 = _1450 == 0.0;
    float _1454 = fma(_1334, _856, _1390);
    bool _1456 = _1432;
    int _1458 = as_type<int>(_1334);
    int _1460 = _1412;
    if (_1420)
    {
        bool _1462 = as_type<int>(_1360) >= 0;
        _1456 = _1462;
    }
    bool _1464 = _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1468 = exp2(_1444);
    float _1470 = _1386 + 0.02999999932944774627685546875;
    int _1472 = _1464 ? (-1) : 0;
    if (_1420)
    {
        int _1474 = _1464 ? 0 : 1078530011;
        _1458 = _1474;
    }
    int _1476 = _1458;
    int _1478 = ~_1412;
    int _1480 = _1478 + _1436;
    int _1482 = _1480 + 1;
    float _1484 = _1410 * _1470;
    float _1486 = _1430 * _1470;
    float _1488 = _1376 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = -_1484;
    float _1494 = fma(_1430, _1394, _1492);
    float _1496 = fma(_1410, _1394, _1486);
    int _1498 = int(_1298) + int(_1442);
    float _1500 = _1410;
    if (_1420)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1300);
        int _1504 = _1476 | _1502;
        _1500 = as_type<float>(_1504);
    }
    float _1506 = _1500;
    float _1508 = _1376 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    int _1516 = ~_405;
    int _1518 = _1516 + 1;
    bool _1520 = !_1406;
    bool _1522 = _1520 && _1452;
    float _1524 = _1506;
    float _1526 = _1506;
    if (!_1522)
    {
        float _1528 = abs(_1300);
        bool _1530 = _1528 != as_type<float>(0x7f800000u /* inf */);
        bool _1532 = isnan(_1528);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1538 = _1534 || _1536;
        float _1540 = abs(_1360);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        float _1544 = abs(_1360);
        bool _1546 = _1544 == as_type<float>(0x7f800000u /* inf */);
        bool _1548 = !_1538;
        bool _1550 = _1546 && _1548;
        if (_1550)
        {
            bool _1552 = as_type<int>(_1360) >= 0;
            _1472 = _1552 ? (-1) : 0;
        }
        int _1554 = _1472;
        if (_1550)
        {
            _1460 = 1075235812;
        }
        int _1556 = _1460;
        int _1558 = _1556;
        if (_1550)
        {
            int _1560 = ~_1554;
            int _1562 = (_1560 != 0) ? _1556 : 1061752795;
            _1558 = _1562;
        }
        int _1564 = _1558;
        if (_1550)
        {
            int _1566 = int(0x80000000) & as_type<int>(_1300);
            int _1568 = _1564 | _1566;
            _1524 = as_type<float>(_1568);
        }
        float _1570 = _1524;
        bool _1572 = !_1538;
        bool _1574 = _1572 && _1542;
        _1526 = _1570;
        if (!_1574)
        {
            float _1576 = abs(_1300);
            float _1578 = abs(_1360);
            float _1580 = precise::max(_1576, _1578);
            float _1582 = abs(_1300);
            float _1584 = abs(_1360);
            float _1586 = precise::min(_1582, _1584);
            float _1588 = 1.0 / _1580;
            float _1590 = abs(_1300);
            float _1592 = abs(_1360);
            bool _1594 = _1590 > _1592;
            bool _1596 = as_type<int>(_1360) >= 0;
            float _1598 = _1586 * _1588;
            float _1600 = abs(_1300);
            float _1602 = abs(_1360);
            float _1604 = _1600 + _1602;
            int _1606 = as_type<int>(_1300) & int(0x80000000);
            float _1608 = _1598 * _1598;
            bool _1610 = _1604 > as_type<float>(0x7f800000u /* inf */);
            bool _1612 = isnan(_1604);
            bool _1614 = _1610 || _1612;
            bool _1616 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1618 = _1614 || _1616;
            float _1620 = _1608 + 11.33538818359375;
            float _1622 = fma(_1608, _1620, 28.84246826171875);
            float _1624 = fma(_1608, _1622, 19.6966705322265625);
            float _1626 = fma(_1608, -0.82336294651031494140625, -5.674867153167724609375);
            float _1628 = fma(_1608, _1626, -6.565555095672607421875);
            float _1630 = 1.0 / _1624;
            float _1632 = _1608 * _1628;
            float _1634 = _1598 * _1632;
            float _1636 = fma(_1634, _1630, _1598);
            float _1638 = _1636;
            _1526 = _1604;
            if (_1594)
            {
                float _1640 = -_1636;
                float _1642 = _1640 + 1.57079637050628662109375;
                _1638 = _1642;
            }
            float _1644 = _1638;
            int _1646 = as_type<int>(_1644);
            if (!_1596)
            {
                float _1648 = -_1644;
                float _1650 = _1648 + 3.1415927410125732421875;
                _1646 = as_type<int>(_1650);
            }
            int _1652 = _1646;
            if (!_1618)
            {
                int _1654 = _1606 | _1652;
                _1526 = as_type<float>(_1654);
            }
        }
    }
    float _1656 = _1526;
    int _1658 = _405 * _1482;
    int _1660 = _1658 + _1120;
    float _1662 = fma(_1260, -0.100000001490116119384765625, _1454);
    float _1664 = _1494 * _1490;
    float _1666 = _1494 * _1510;
    float _1668 = _1466 * 0.01745329238474369049072265625;
    bool _1670 = !_1026;
    int _1672 = _1670 ? _1660 : (-1);
    float _1674 = -_1664;
    float _1676 = fma(_1510, _1662, _1674);
    float _1678 = fma(_1490, _1662, _1666);
    int _1680 = _1672 >> 31;
    float _1682 = _1668 * 0.15915493667125701904296875;
    int _1684 = _1518 * _1498;
    int _1686 = _1684 + _1082;
    int _1688 = _1680 & 3;
    float _1690 = _1682 * 6.283185482025146484375;
    float _1692 = sin(_1690);
    float _1694 = fma(_1260, 0.100000001490116119384765625, _1676);
    float _1696 = fma(_1514, -2.0, 3.0);
    int _1698 = _1672 + _1688;
    float _1700 = _1514 * _1514;
    bool _1702 = uint(_1686) >= uint(_405);
    float _1704 = _1496 + (-0.02999999932944774627685546875);
    int _1706 = _1698 >> 2;
    float _1708 = _1682 * 6.283185482025146484375;
    float _1710 = cos(_1708);
    float _1712 = _1700 * _1696;
    float _1714 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1716 = _1706 << 4;
    int _1718 = _1716 + 368;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1704);
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = _1678 + 0.0199999995529651641845703125;
    uint _1728 = uint(int(uint(_1718) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    bool _1744 = !_1702;
    int _1746 = _1744 ? 0 : (-1);
    float _1748 = _1714 * _1720;
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1712);
    float _1752 = _1726 * _1692;
    int _1754 = ~_1498;
    int _1756 = _1754 + _1746;
    int _1758 = _1756 + 1;
    float _1760 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1762 = _1324 <= 8000.0;
    bool _1764 = isnan(_1324);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(8000.0);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    float _1774 = _1656 + 1.57079637050628662109375;
    float _1776 = _1726 * _1710;
    float _1778 = -_1752;
    float _1780 = fma(_1694, _1710, _1778);
    int _1782 = _405 * _1758;
    int _1784 = _1782 + _1082;
    float _1786 = _1772 * _1750;
    float _1788 = fma(_1694, _1692, _1776);
    int _1790 = _1672 & 3;
    bool _1792 = _1790 != 0;
    float _1794 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1796 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1780);
    int _1798 = _1718 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    bool _1816 = uint(_1790) > 1u;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1788);
    int _1820 = _1672 & 3;
    bool _1822 = _1820 != 0;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1796);
    bool _1826 = _1788 != 0.0;
    bool _1828 = isnan(_1788);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.0);
    bool _1834 = _1830 || _1832;
    float _1836 = _1760 * _1818;
    int _1838 = _1822 ? 0 : 1;
    float _1840 = _1794 * _1824;
    bool _1842 = _1796 == 0.0;
    bool _1844 = !_1834;
    bool _1846 = _1842 && _1844;
    float _1848 = _1748 * _289;
    int _1850 = ~_1838;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1748 * _309;
    bool _1858 = _1496 == 0.02999999932944774627685546875;
    bool _1860 = _1858 && _1846;
    float _1862 = _1748 * _299;
    int _1864 = _1854;
    float _1866 = as_type<float>(_1784);
    if (!_1816)
    {
        int _1868 = ~_1838;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    float _1874 = fma(_1840, _267, _1848);
    bool _1876 = _1790 != 3;
    float _1878 = fma(_1840, _275, _1856);
    int _1880 = abs(_1872);
    float _1882 = fma(_1840, _271, _1862);
    bool _1884 = !_1792;
    int _1886 = _1884 ? 0 : 1;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1890 = int(_1888);
    bool _1892 = uint(_1790) >= 2u;
    float _1894 = in.m_50.z;
    int _1896 = abs(_1886);
    float _1898 = -_1836;
    float _1900 = fma(_1898, _313, _1874);
    int _1902 = _1892 ? 0 : 1;
    int _1904 = ~_1880;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    float _1910 = _481 + _1900;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * as_type<int>(_1742);
    int _1920 = _1916;
    if (_1876)
    {
        int _1922 = ~_1902;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    int _1928 = ~_1896;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = abs(_1926);
    bool _1936 = _1790 != 3;
    int _1938 = _1932 * as_type<int>(_1734);
    int _1940 = _1938 + _1918;
    float _1942 = in.m_72.x;
    float _1944 = in.m_72.y;
    float _1946 = in.m_72.z;
    bool _1948 = !_1936;
    int _1950 = _1948 ? 0 : (-1);
    bool _1952 = !_708;
    int _1954 = _1952 ? 0 : 1;
    int _1956 = ~_1934;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = abs(_1950);
    int _1964 = abs(_1954);
    int _1966 = _1960 * as_type<int>(_1806);
    int _1968 = _1966 + _1940;
    float _1970 = float(uint(_1890));
    float _1972 = -_1836;
    float _1974 = fma(_1972, _321, _1878);
    int _1976 = abs(_1890);
    int _1978 = ~_1962;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = 1.0 / _1970;
    float _1986 = -_1836;
    float _1988 = fma(_1986, _317, _1882);
    float _1990 = _1774 * (-0.15915493667125701904296875);
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = _1982 * as_type<int>(_1814);
    int _2000 = _1998 + _1968;
    float _2002 = float(uint(_1976));
    bool _2004 = !_1026;
    int _2006 = _2004 ? _1784 : (-1);
    int _2008 = _2000 * _1996;
    float _2010 = 1.0 / _2002;
    float _2012 = as_type<float>(_1962);
    float _2014 = as_type<float>(_1964);
    float _2016 = _2002;
    float _2018 = as_type<float>(_2000);
    float _2020 = as_type<float>(_2008);
    if (_1860)
    {
        _2012 = _1942;
    }
    float _2022 = _2012;
    int _2024 = _2006 * _1964;
    int _2026 = _2024 + _2008;
    float _2028 = _2022;
    if (_1860)
    {
        _2014 = _1946;
    }
    float _2030 = _2014;
    int _2032 = as_type<int>(_1984) + (-2);
    float _2034 = _1990 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _2030;
    if (_1860)
    {
        _2016 = _1944;
    }
    float _2040 = _2016;
    float _2042 = _2040;
    if (_1860)
    {
        _1866 = _2022;
    }
    float _2044 = _1866;
    float _2046 = _2044;
    if (_1860)
    {
        _2018 = _2040;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (!_1860)
    {
        _2042 = _1944;
    }
    float _2052 = _2042;
    float _2054 = _1990 * 6.283185482025146484375;
    float _2056 = sin(_2054);
    float _2058 = float(uint(_2026));
    if (!_1860)
    {
        _2028 = _1942;
    }
    float _2060 = _2028;
    float _2062 = _1894 * 6.283185482025146484375;
    int _2064 = abs(_2026);
    if (!_1860)
    {
        float _2066 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2050 = _2066;
    }
    float _2068 = _2050;
    if (_1860)
    {
        _2020 = _2030;
    }
    float _2070 = _2020;
    float _2072 = _2062 * 0.15915493667125701904296875;
    float _2074 = as_type<float>(_2032) * _2058;
    float _2076 = _2070;
    if (!_1860)
    {
        _2038 = _1946;
    }
    float _2078 = _2038;
    float _2080 = _1988 * _2036;
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    int _2086 = as_type<int>(_2010) + (-2);
    if (!_1860)
    {
        float _2088 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = float(uint(_2064));
    float _2094 = fma(_1974, _2056, _2080);
    float _2096 = _1988 * _2056;
    float _2098 = _756 * _2060;
    int _2100 = ~_1890;
    int _2102 = _2100 + 1;
    float _2104 = trunc(_2074);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = as_type<float>(_2086) * _2092;
    float _2112 = -_2096;
    float _2114 = fma(_1974, _2036, _2112);
    float _2116 = _369 + _2094;
    if (!_1860)
    {
        float _2118 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = -_2098;
    float _2124 = fma(_752, _2078, _2122);
    float _2126 = _754 * _2078;
    float _2128 = trunc(_2110);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    float _2134 = _371 + _2114;
    float _2136 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2116);
    float _2138 = _752 * _2052;
    int _2140 = ~_1976;
    int _2142 = _2140 + 1;
    float _2144 = -_2126;
    float _2146 = fma(_756, _2052, _2144);
    float _2148 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2134);
    float _2150 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2152 = _2136 + _2150;
    float _2154 = _2072 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    int _2158 = _2102 * int(_2108);
    int _2160 = _2158 + _2026;
    float _2162 = -_2138;
    float _2164 = fma(_754, _2060, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2168 = _2148 + _2166;
    float _2170 = _2084 * _2152;
    float _2172 = _2146 * _758;
    float _2174 = float(uint(_2160));
    float _2176 = _2164 * _758;
    float _2178 = as_type<float>(_2032) * _2174;
    float _2180 = _2124 * _758;
    int _2182 = _2142 * int(_2132);
    int _2184 = _2182 + _2064;
    float _2186 = _2156 * _2152;
    float _2188 = -_2170;
    float _2190 = fma(_2156, _2168, _2188);
    float _2192 = float(uint(_2184));
    float _2194 = _2176 * _299;
    float _2196 = fma(_2084, _2168, _2186);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2200 = trunc(_2178);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2086) * _2192;
    float _2208 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _2198 + _2210;
    float _2214 = _299 * _2120;
    float _2216 = fma(_2172, _271, _2194);
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2208 + _2218;
    float _2222 = _2212 * _2212;
    float _2224 = fma(_271, _2090, _2214);
    float _2226 = _309 * _2120;
    float _2228 = _2176 * _289;
    float _2230 = fma(_2220, _2220, _2222);
    float _2232 = _2176 * _309;
    float _2234 = trunc(_2206);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    float _2240 = fma(_275, _2090, _2226);
    float _2242 = fma(_2172, _267, _2228);
    float _2244 = fma(_2172, _275, _2232);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _2248 = _2246 + 1.0;
    float _2250 = -_2180;
    float _2252 = fma(_2250, _317, _2216);
    float _2254 = -_2180;
    float _2256 = fma(_2254, _313, _2242);
    float _2258 = -_2180;
    float _2260 = fma(_2258, _321, _2244);
    float _2262 = sqrt(_2230);
    float _2264 = -_776;
    float _2266 = fma(_2264, _2248, _1910);
    float _2268 = -_2068;
    float _2270 = fma(_321, _2268, _2240);
    int _2272 = ~_1890;
    int _2274 = _2272 + 1;
    float _2276 = _289 * _2120;
    int _2278 = int(_2108) + int(_2204);
    float _2280 = -_2068;
    float _2282 = fma(_317, _2280, _2224);
    int _2284 = ~_1976;
    int _2286 = _2284 + 1;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_74.x = _2252;
    out.m_74.y = _2256;
    out.m_74.z = _2260;
    int _2290 = _2274 * _2278;
    int _2292 = _2290 + _2026;
    int _2294 = int(_2132) + int(_2238);
    float _2296 = _2282 * _2056;
    float _2298 = _2282 * _2036;
    float _2300 = fma(_267, _2090, _2276);
    bool _2302 = uint(_2292) >= uint(_1890);
    float _2304 = -_2296;
    float _2306 = fma(_2270, _2036, _2304);
    bool _2308 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = fma(_2270, _2056, _2298);
    bool _2312 = !_2302;
    int _2314 = _2312 ? 0 : (-1);
    int _2316 = _2286 * _2294;
    int _2318 = _2316 + _2064;
    float _2320 = as_type<float>(_2286);
    float _2322 = _2260;
    float _2324 = _2256;
    float _2326 = _2300;
    if (!_2308)
    {
        _2320 = _2208;
    }
    float _2328 = _2320;
    float _2330 = _2328;
    if (!_2308)
    {
        _2322 = _2198;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2308)
    {
        _2324 = _2266;
    }
    float _2336 = _2324;
    bool _2338 = !_2308;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2262 + _2344;
        float _2348 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = rsqrt(_2230);
        float _2352 = _2346 * _2342;
        float _2354 = _2352 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = sin(_2360);
        float _2364 = _2358 + (-1.0);
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = fma(_2362, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2370 = fma(_2266, _2358, _2366);
        float _2372 = _2350 * _2368;
        float _2374 = fma(_2220, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2376 = fma(_2212, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2340 = _2370;
        _2330 = _2374;
        _2334 = _2376;
    }
    float _2378 = _2340;
    float _2380 = _2330;
    float _2382 = _2334;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2388 = uint(_2318) >= uint(_1976);
    float _2390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2392 = _2026 ^ _1890;
    float _2394 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    int _2396 = ~_2278;
    int _2398 = _2396 + _2314;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    bool _2404 = !_2388;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2394);
    uint _2410 = uint(int(uint(_2392) >> uint(31)));
    float _2412 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2402);
    bool _2414 = _1890 == 0;
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2418 = _1890 == 0;
    int _2420 = _1890 * _2400;
    int _2422 = _2420 + _2026;
    int _2424 = ~_2406;
    int _2426 = _2294 + _2424;
    int _2428 = _2426 + 1;
    float _2430 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2432 = ~int(_2410);
    int _2434 = _2432 + 1;
    float _2436 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _2438 = !_2414;
    int _2440 = _2438 ? _2422 : (-1);
    float _2442 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _2444 = _2428 ^ _2434;
    float _2446 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = float(_2440);
    float _2454 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2436);
    int _2456 = ~_2434;
    int _2458 = _2456 + _2444;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2442);
    float _2464 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2446);
    float _2466 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2448);
    float _2468 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2470 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2472 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2474 = !_2418;
    int _2476 = _2474 ? _2460 : (-1);
    float _2478 = fma(_2468, _2452, _806);
    float _2480 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2482 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2484 = fma(_2468, _606, -0.5);
    float _2486 = float(_2476);
    float _2488 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2490 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2492 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2494 = in.m_54.x;
    float _2496 = fma(_2488, _1422, -0.5);
    float _2498 = -_710;
    float _2500 = fma(_2488, _2486, _2498);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2462);
    float _2506 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2464);
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2466);
    float _2510 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2514 = _2378 + _2512;
    float _2516 = fma(_814, _2496, _2500);
    float _2518 = fma(_812, _2484, _2478);
    float _2520 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2504);
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2526 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2530 = _2380 + _2528;
    float _2532 = _2514 * _2514;
    float _2534 = _2516 + 0.5;
    float _2536 = _2156 * _2310;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = fma(_2530, _2530, _2532);
    float _2542 = _2084 * _2310;
    float _2544 = fma(_2084, _2306, _2536);
    float _2546 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2548 = -_389;
    float _2550 = _2548 + 1.0;
    float _2552 = -_2068;
    float _2554 = fma(_313, _2552, _2300);
    float _2556 = -_2542;
    float _2558 = fma(_2156, _2306, _2556);
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2382 + _2562;
    float _2566 = _2550 * _2546;
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2572 = fma(_2564, _2564, _2540);
    float _2574 = _620 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2576 = -_2568;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2580 = _2518 + 0.5;
    float _2582 = sqrt(_2572);
    float _2584 = _2574 * _2538;
    float _2586 = _2578 * _2494;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2522;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2526;
    float _2588 = _2586 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = _2570 * _2560;
    out.m_76.x = _2544;
    out.m_76.y = _2554;
    out.m_76.z = _2558;
    out.m_78.x = _2580;
    out.m_78.y = _2534;
    out.m_78.z = _2584;
    out.m_78.w = _2590;
    out.m_80.x = _2588;
    bool _2592 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2594 = isnan(_2582);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2600 = _2596 || _2598;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2602 = _2540;
    float _2604 = _2542;
    float _2606 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2608 = _2586;
    float _2610 = _2572;
    if (!_2600)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2602;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2600)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2326;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2600)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2624 = _2604;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2600)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2600)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2636 = _2608;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2600)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2642 = _2610;
    bool _2644 = !_2600;
    float _2646 = _2642;
    float _2648 = _2642;
    if (!_2644)
    {
        bool _2650 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2652 = isnan(_2582);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2658 = _2654 || _2656;
        if (!_2658)
        {
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = _2582 + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = 1.0 / _2666;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2690 = _2662 * _2672;
            float _2692 = precise::clamp(_2690, 0.0, 1.0);
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2698 = fma(_2692, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2692, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2702 = fma(_2692, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2704 = fma(_2692, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2706 = fma(_2692, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2708 = fma(_2692, _2688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2698;
            _2640 = _2706;
            _2616 = _2702;
            _2634 = _2704;
            _2628 = _2700;
            _2648 = _2708;
            _2710 = true;
        }
        else
        {
            bool _2712 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2714 = isnan(_2582);
            bool _2716 = _2712 || _2714;
            bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2720 = _2716 || _2718;
            if (!_2720)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2722 = _2614;
            _2616 = _2722;
            if (!_2720)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2724 = _2620;
            _2622 = _2724;
            if (!_2720)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2726 = _2626;
            _2628 = _2726;
            if (!_2720)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2728 = _2632;
            _2634 = _2728;
            if (!_2720)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2730 = _2638;
            _2640 = _2730;
            if (!_2720)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2732 = _2646;
            bool _2734 = !_2720;
            _2648 = _2732;
            if (!_2734)
            {
                bool _2736 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2738 = isnan(_2582);
                bool _2740 = _2736 || _2738;
                bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2744 = _2740 || _2742;
                if (!_2744)
                {
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = _2582 + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2750;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = 1.0 / _2752;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2776 = _2748 * _2758;
                    float _2778 = precise::clamp(_2776, 0.0, 1.0);
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2784 = fma(_2778, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2778, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2788 = fma(_2778, _2762, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2790 = fma(_2778, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2792 = fma(_2778, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2794 = fma(_2778, _2774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2784;
                    _2640 = _2792;
                    _2616 = _2788;
                    _2634 = _2790;
                    _2628 = _2786;
                    _2648 = _2794;
                    _2710 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2710 = false;
    float _2796 = _2622;
    float _2798 = _2640;
    float _2800 = _2616;
    float _2802 = _2634;
    float _2804 = _2628;
    float _2806 = _2648;
    float _2808 = fma(_2554, -0.5, 0.5);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -_2796;
    float _2814 = _2812 + _2798;
    float _2816 = -_2800;
    float _2818 = _2816 + _2802;
    float _2820 = -_2804;
    float _2822 = _2820 + _2806;
    bool _2824 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2826 = fma(_2810, _2814, _2796);
    float _2828 = fma(_2810, _2818, _2800);
    float _2830 = fma(_2810, _2822, _2804);
    float _2832 = _2826 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2834 = fma(_2828, 0.298911988735198974609375, _2832);
    float _2836 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2838 = fma(_2830, 0.114477999508380889892578125, _2834);
    float _2840 = -_2838;
    float _2842 = _2828 + _2840;
    float _2844 = -_2838;
    float _2846 = _2826 + _2844;
    float _2848 = -_2838;
    float _2850 = _2830 + _2848;
    out.m_80.w = _2836;
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2854 = fma(_2846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2856 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    out.m_86.x = _2852;
    out.m_86.y = _2854;
    out.m_86.z = _2856;
    if (!_2824)
    {
        return out;
    }
    float _2858 = -_2378;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2862 = -_2380;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2866 = -_2382;
    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2870 = _2860 * _2860;
    float _2872 = fma(_2864, _2864, _2870);
    float _2874 = fma(_2868, _2868, _2872);
    float _2876 = sqrt(_2874);
    float _2878 = rsqrt(_2874);
    float _2880 = -_2876;
    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2886 = precise::clamp(_2884, 0.0, 1.0);
    float _2888 = _2864 * _2878;
    float _2890 = _2860 * _2878;
    float _2892 = abs(_2886);
    float _2894 = log2(_2892);
    float _2896 = _2868 * _2878;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2900 = _2554 * _2890;
    float _2902 = -_2890;
    float _2904 = -_2898;
    float _2906 = fma(_2902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2904);
    float _2908 = fma(_2544, _2888, _2900);
    float _2910 = -_2896;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2906);
    float _2914 = fma(_2558, _2896, _2908);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2920 = _2912 + _2918;
    float _2922 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2924 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2926 = precise::clamp(_2924, 0.0, 1.0);
    float _2928 = exp2(_2922);
    float _2930 = _2928 * _2926;
    float _2932 = _2916 * _2930;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2938 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2934;
    out.m_84.y = _2936;
    out.m_84.z = _2938;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2710 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_37.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_40.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2996 = as_type<float>(_121);
        out.gl_Position.z = _2996;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_42.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _113;
    if (_147)
    {
        out.m_40.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _123 = as_type<int>(_151);
    }
    int _153 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3059 = as_type<float>(_153);
        out.gl_Position.z = _3059;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_44.x;
    float _157 = in.m_44.y;
    float _159 = in.m_44.z;
    float _161 = 1.0 / _127;
    float _163 = in.m_46.x;
    float _165 = in.m_46.y;
    float _167 = in.m_46.z;
    float _169 = in.m_48.x;
    float _171 = in.m_48.y;
    float _173 = in.m_48.z;
    float _175 = _155 * _155;
    float _177 = _157 * _157;
    float _179 = _159 * _159;
    float _181 = fma(_163, _163, _175);
    float _183 = fma(_165, _165, _177);
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = sqrt(_187);
    float _195 = sqrt(_189);
    float _197 = sqrt(_191);
    bool _199 = _193 > 0.0;
    bool _201 = _195 > 0.0;
    float _203 = 0.0;
    float _205 = _195;
    float _207 = _193;
    int _209 = as_type<int>(_167);
    bool _211 = _201;
    if (_199)
    {
        float _213 = rsqrt(_187);
        _203 = _213;
    }
    float _215 = _203;
    if (!_199)
    {
        _205 = 0.0;
    }
    float _217 = _205;
    bool _219 = _197 > 0.0;
    float _221 = _197;
    float _223 = _217;
    bool _225 = _219;
    if (!_199)
    {
        _221 = 0.0;
    }
    float _227 = _221;
    float _229 = 0.0;
    float _231 = _227;
    if (!_199)
    {
        _229 = 0.0;
    }
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    if (_201)
    {
        float _239 = rsqrt(_189);
        _235 = _239;
    }
    float _241 = _235;
    float _243 = 0.0;
    if (!_201)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    float _247 = _131 * _161;
    float _249 = 0.0;
    float _251 = _245;
    if (!_201)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (_219)
    {
        float _259 = rsqrt(_191);
        _255 = _259;
    }
    float _261 = _255;
    float _263 = _215;
    if (_199)
    {
        float _265 = _215 * _155;
        _223 = _265;
    }
    float _267 = _223;
    if (_199)
    {
        float _269 = _215 * _163;
        _231 = _269;
    }
    float _271 = _231;
    if (_199)
    {
        float _273 = _215 * _169;
        _237 = _273;
    }
    float _275 = _237;
    bool _277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_201)
    {
        _263 = 0.0;
    }
    float _279 = _263;
    float _281 = _279;
    if (!_219)
    {
        _207 = 0.0;
    }
    float _283 = _207;
    float _285 = _283;
    if (_201)
    {
        float _287 = _241 * _157;
        _251 = _287;
    }
    float _289 = _251;
    float _291 = 0.0;
    if (!_219)
    {
        _291 = 0.0;
    }
    float _293 = _291;
    float _295 = _293;
    if (_201)
    {
        float _297 = _241 * _165;
        _281 = _297;
    }
    float _299 = _281;
    float _301 = 0.0;
    if (!_219)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = _303;
    if (_201)
    {
        float _307 = _241 * _171;
        _257 = _307;
    }
    float _309 = _257;
    if (_219)
    {
        float _311 = _261 * _159;
        _285 = _311;
    }
    float _313 = _285;
    if (_219)
    {
        float _315 = _261 * _167;
        _295 = _315;
    }
    float _317 = _295;
    if (_219)
    {
        float _319 = _261 * _173;
        _305 = _319;
    }
    float _321 = _305;
    bool _323 = !_277;
    float _341;
    if (!_323)
    {
        float _325 = in.m_50.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _247;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_37.x;
    float _349 = in.m_37.y;
    float _351 = in.m_37.z;
    float _353 = in.m_46.w;
    float _355 = in.m_48.w;
    float _357 = _165 * _349;
    float _359 = _171 * _349;
    float _361 = fma(_163, _347, _357);
    float _363 = fma(_169, _347, _359);
    float _365 = fma(_167, _351, _361);
    float _367 = fma(_173, _351, _363);
    float _369 = _365 + _353;
    float _371 = _367 + _355;
    float _373 = fma(_369, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _375 = fma(_371, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _377 = floor(_373);
    float _379 = floor(_375);
    float _381 = -_377;
    float _383 = _373 + _381;
    float _385 = -_379;
    float _387 = _375 + _385;
    float2 _3396 = float2(_383, _387);
    float _389 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3396, float2(0.0), isnan(_3396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3396, float2(0.0), isnan(_3396)), level(0.0)).x;
    float _391 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _393 = int(_391);
    float _395 = in.m_50.x;
    float _397 = _247 * 3.3333332538604736328125;
    float _399 = in.m_52.x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _403 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _405 = int(_403);
    float _407 = in.m_54.y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _411 = 0.0 + _397;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = in.m_50.w;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _419 = _417 != 0;
    float _421 = -_397;
    float _423 = _421 + 3.3333332538604736328125;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = float(_393);
    float _429 = in.m_56.x;
    float _431 = in.m_56.y;
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _435 = _433 != 0;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _427;
    float _441 = _131 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _445 = _345 + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _449 = _345 + _447;
    float _451 = float(uint(_405));
    float _453 = fma(_395, 6.283185482025146484375, _441);
    float _455 = _373;
    if (_419)
    {
        float _457 = in.m_50.z;
        _455 = _457;
    }
    float _459 = _455;
    float _461 = float(_405);
    float _463 = _399;
    if (_419)
    {
        float _465 = -_399;
        float _467 = _465 + 1.0;
        _209 = as_type<int>(_467);
    }
    int _469 = _209;
    int _471 = ~_405;
    int _473 = _471 + 1;
    float _475 = 1.0 / _451;
    if (_435)
    {
        bool _477 = _395 > 0.5;
        _225 = _477;
    }
    bool _479 = _225;
    float _481 = _349 + _407;
    float _483 = 0.0;
    if (!_435)
    {
        _483 = _399;
    }
    float _485 = _483;
    float _487 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _453);
    float _489 = _131 * _439;
    float _491 = _487 * 0.15915493667125701904296875;
    float _493 = abs(_429);
    float _495 = log2(_493);
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    out.m_58.x = _429;
    out.m_58.y = _431;
    int _503 = as_type<int>(_475) + (-2);
    float _505 = fma(_501, _395, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _507 = trunc(_489);
    int _509 = int(_507);
    float _511 = in.m_50.y;
    float _513 = _485;
    if (_419)
    {
        bool _515 = _459 > 0.5;
        _211 = _515;
    }
    bool _517 = _211;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _519;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = _495 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _529 = _491 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_345);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _545;
    float _549 = float(uint(_509));
    float _551 = exp2(_527);
    float _553 = float(_509);
    float _555 = as_type<float>(_503) * _549;
    bool _557 = _553 >= _461;
    bool _559 = isnan(_553);
    bool _561 = _557 || _559;
    bool _563 = isnan(_461);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _511 * 628.31854248046875;
    float _571 = trunc(_555);
    float _573 = precise::max(_571, 0.0);
    uint _576 = uint(_573);
    float _578 = trunc(_567);
    int _580 = int(_578);
    int _582 = _473 * int(_576);
    int _584 = _582 + _509;
    float _586 = float(uint(_584));
    int _588 = _584;
    if (_435)
    {
        float _590 = -_399;
        float _592 = _590 + 1.0;
        _588 = as_type<int>(_592);
    }
    int _594 = _588;
    int _596 = ~_580;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = as_type<float>(_503) * _586;
    if (_435)
    {
        float _604 = _479 ? as_type<float>(_594) : _399;
        _513 = _604;
    }
    float _606 = _513;
    int _608 = ~_405;
    int _610 = _608 + 1;
    float _612 = trunc(_602);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    if (_419)
    {
        float _618 = _517 ? as_type<float>(_469) : _399;
        _463 = _618;
    }
    float _620 = _463;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _622;
    float _626 = in.m_56.w;
    float _628 = 1.0 / _624;
    int _630 = int(_576) + int(_616);
    float _632 = in.m_56.z;
    int _634 = _610 * _630;
    int _636 = _634 + _509;
    float _638 = _131 * _461;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _646 = _644 != 0;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _654 = _652 != 0;
    float _656 = _638 * _161;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _660 = _658 != 0;
    float _662 = _511 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _664 = trunc(_656);
    int _666 = int(_664);
    bool _668 = uint(_636) >= uint(_405);
    float _670 = fma(_662, -2.0, _401);
    float _672 = _395 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_58.w = _626;
    bool _676 = !_668;
    int _678 = _676 ? 0 : (-1);
    float _680 = -_674;
    float _682 = fma(_672, 2.0, _680);
    bool _684 = !_646;
    int _686 = _684 ? 0 : 1;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _696 = !_642;
    int _698 = _696 ? 0 : 1;
    out.m_58.z = _632;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / _694;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _708 = _706 != 0;
    float _710 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _670);
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _718 = _716 != 0;
    bool _720 = !_650;
    int _722 = _720 ? 0 : 1;
    float _724 = 1.0 / _690;
    bool _726 = _415 > 0.5;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _732 = _497 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = _445 * _704;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _732;
    out.m_60.y = _734;
    out.m_60.z = _738;
    out.m_60.w = _437;
    float _750 = _449 * _724;
    float _752 = in.m_62.x;
    float _754 = in.m_62.y;
    float _756 = in.m_62.z;
    float _758 = in.m_62.w;
    float _760 = precise::min(_413, _425);
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _766 = _345 + _764;
    out.m_64.x = _744;
    out.m_64.y = _748;
    out.m_64.z = _746;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _770 = fma(_131, _505, _569);
    float _772 = _766 * _628;
    float _774 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[78].w, _768);
    float _776 = fma(_760, -5.0, 5.0);
    float _778 = fma(_521, _750, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _780 = fma(_525, _742, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _782 = !_654;
    int _784 = _782 ? 0 : 1;
    float _786 = _487 * 0.60000002384185791015625;
    bool _788 = !_660;
    float _790 = _788 ? 7.345489978790283203125 : 1.0;
    float _792 = _786 * 0.15915493667125701904296875;
    float _794 = _487 * 1.2999999523162841796875;
    bool _796 = _511 > 0.5;
    float _798 = _299 * _756;
    float _800 = _790 * _395;
    float _802 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    float _804 = -_131;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[76].x, _682);
    float _808 = _289 * _756;
    float _810 = _309 * _756;
    float _812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _802);
    float _814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _774);
    float _816 = _794 * 0.15915493667125701904296875;
    float _818 = _487 + 0.52359879016876220703125;
    float _820 = fma(_271, _752, _798);
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _824 = fma(_267, _752, _808);
    float _826 = _818 * 0.15915493667125701904296875;
    float _828 = fma(_487, 0.60000002384185791015625, 0.31415927410125732421875);
    float _830 = fma(_275, _752, _810);
    float _832 = -_754;
    float _834 = fma(_317, _832, _820);
    float _836 = -_754;
    float _838 = fma(_313, _836, _824);
    float _840 = _828 * 0.15915493667125701904296875;
    float _842 = fma(_487, 1.2999999523162841796875, 0.680678427219390869140625);
    float _844 = -_754;
    float _846 = fma(_321, _844, _830);
    float _848 = fma(_822, _551, _441);
    float _850 = _842 * 0.15915493667125701904296875;
    float _852 = in.m_66.x;
    float _854 = in.m_66.y;
    float _856 = in.m_66.z;
    float _858 = fma(_429, 0.261799395084381103515625, -0.261799395084381103515625);
    float _860 = floor(_800);
    out.m_68.x = _834;
    out.m_68.y = _838;
    out.m_68.z = _846;
    float _862 = fma(_395, 6.283185482025146484375, _848);
    float _864 = _770 + _858;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _870 = _862 * 0.15915493667125701904296875;
    float _872 = _864 * 1.10000002384185791015625;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = sin(_874);
    float _878 = _770 * 0.89999997615814208984375;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _880;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _884;
    float _888 = -_860;
    float _890 = _800 + _888;
    float _892 = _878 * 0.15915493667125701904296875;
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _898 = fma(_882, _750, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _900 = fma(_886, _750, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _902 = fma(_896, _742, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _904 = fma(_868, _742, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _906 = _770 * 1.10000002384185791015625;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _908;
    float _912 = _770 * 0.15915493667125701904296875;
    float _914 = _770 * 0.699999988079071044921875;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _916;
    float _920 = _906 * 0.15915493667125701904296875;
    float _922 = fma(_910, _772, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _924 = _852 >= 0.0;
    bool _926 = isnan(_852);
    bool _928 = _924 || _926;
    bool _930 = isnan(0.0);
    bool _932 = _928 || _930;
    float _934 = fma(_547, _772, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _936 = fma(_918, _772, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _938 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _940 = isnan(_345);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = _890 * _461;
    bool _952 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _954 = isnan(_345);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _792 * 6.283185482025146484375;
    float _966 = sin(_964);
    int _968 = _932 ? 0 : 1;
    float _970 = -_948;
    float _972 = _970 + 1.0;
    bool _974 = _852 > 0.0;
    float _976 = -_962;
    float _978 = _976 + 1.0;
    int _980 = ~_968;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _962 * _972;
    float _988 = _864 * 0.15915493667125701904296875;
    float _990 = _543 * _978;
    int _992 = ~_630;
    int _994 = _992 + _678;
    int _996 = _994 + 1;
    float _998 = -_543;
    float _1000 = _998 + 1.0;
    float _1002 = trunc(_950);
    int _1004 = int(_1002);
    float _1006 = _864 * 0.89999997615814208984375;
    float _1008 = _864 * 0.699999988079071044921875;
    int _1010 = _405 * _996;
    int _1012 = _1010 + _509;
    float _1014 = _914 * 0.15915493667125701904296875;
    int _1016 = _984;
    if (!_974)
    {
        int _1018 = ~_968;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = fma(_966, 0.60000002384185791015625, _531);
    bool _1026 = _405 == 0;
    float _1028 = _826 * 6.283185482025146484375;
    float _1030 = sin(_1028);
    bool _1032 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1034 = isnan(_345);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = _1006 * 0.15915493667125701904296875;
    bool _1046 = !_1026;
    int _1048 = _1046 ? _1012 : (-1);
    int _1050 = _405 + (-1);
    float _1052 = _1042 * _1000;
    bool _1054 = !_702;
    int _1056 = _1054 ? 0 : 1;
    int _1058 = _1048 * _600;
    int _1060 = abs(_686);
    float _1062 = _1008 * 0.15915493667125701904296875;
    int _1064 = abs(_1056);
    int _1066 = _580 * _1050;
    int _1068 = _1066 + _1058;
    float _1070 = _862 * 0.60000002384185791015625;
    float _1072 = _862 * 1.2999999523162841796875;
    int _1074 = abs(_698);
    int _1076 = _1068 * _1060;
    float _1078 = _1070 * 0.15915493667125701904296875;
    int _1080 = _1004 * _1064;
    int _1082 = _1080 + _509;
    float _1084 = _481 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1086 = abs(_722);
    float _1088 = _1072 * 0.15915493667125701904296875;
    int _1090 = abs(_784);
    int _1092 = _666 * _1074;
    int _1094 = _1092 + _1076;
    float _1096 = _816 * 6.283185482025146484375;
    float _1098 = sin(_1096);
    float _1100 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1084);
    float _1102 = _898 * _1052;
    float _1104 = -_1042;
    float _1106 = _1104 + 1.0;
    int _1108 = _1082 * _1086;
    int _1110 = _1108 + _1094;
    float _1112 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1100);
    float _1114 = fma(_876, 0.60000002384185791015625, _1030);
    float _1116 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1102);
    int _1118 = _1004 * _1090;
    int _1120 = _1118 + _1110;
    float _1122 = _850 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = _481 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1128 = _1112 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1130 = fma(_902, _990, _1116);
    float _1132 = float(uint(_1120));
    float _1134 = fma(_369, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1126);
    float _1136 = _778 * _1052;
    float _1138 = fma(_1098, 0.300000011920928955078125, _1024);
    float _1140 = 1.0 / _1128;
    float _1142 = as_type<float>(_503) * _1132;
    float _1144 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1134);
    float _1146 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1136);
    float _1148 = -_429;
    float _1150 = _1148 + 1.0;
    float _1152 = _900 * _1052;
    float _1154 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1156 = fma(_780, _990, _1146);
    float _1158 = trunc(_1142);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    float _1164 = fma(_1124, 0.300000011920928955078125, _1114);
    int _1166 = ~_405;
    int _1168 = _1166 + 1;
    float _1170 = _1154 + _1128;
    float _1172 = float(uint(_1082));
    float _1174 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1152);
    float _1176 = fma(_922, _986, _1130);
    float _1178 = _1014 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = _1170 * _1140;
    float _1184 = _1182 * 0.5;
    float _1186 = _872 * 0.15915493667125701904296875;
    float _1188 = fma(_904, _990, _1174);
    float _1190 = as_type<float>(_503) * _1172;
    float _1192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1194 = fma(_1184, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1192);
    float _1196 = -_431;
    float _1198 = _1196 + 1.0;
    float _1200 = _920 * 6.283185482025146484375;
    float _1202 = sin(_1200);
    int _1204 = _1168 * int(_1162);
    int _1206 = _1204 + _1120;
    float _1208 = fma(_936, _986, _1188);
    float _1210 = _1138 * _1150;
    float _1212 = abs(_1164);
    float _1214 = _1198 * _1212;
    float _1216 = fma(_934, _986, _1156);
    float _1218 = float(uint(_1206));
    float _1220 = _1210 * 0.52359879016876220703125;
    float _1222 = _912 * 6.283185482025146484375;
    float _1224 = cos(_1222);
    float _1226 = _1214 * (-45.0);
    int _1228 = ~_405;
    int _1230 = _1228 + 1;
    float _1232 = as_type<float>(_503) * _1218;
    float _1234 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].z, _1208);
    float _1236 = _1220 * 0.15915493667125701904296875;
    float _1238 = in.m_52.y;
    float _1240 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1176);
    float _1242 = _892 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = _1180 + _1202;
    float _1248 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1216);
    float _1250 = in.m_70.x;
    float _1252 = in.m_70.y;
    float _1254 = in.m_70.z;
    float _1256 = _1226 * 0.01745329238474369049072265625;
    float _1258 = _1214 * (-20.0);
    float _1260 = float(_1022);
    float _1262 = _1062 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    float _1266 = _1256 * 0.15915493667125701904296875;
    float _1268 = _1260 * _1258;
    float _1270 = _1044 * 6.283185482025146484375;
    float _1272 = sin(_1270);
    float _1274 = fma(_1224, 1.2000000476837158203125, _1244);
    float _1276 = _1268 * 0.01745329238474369049072265625;
    float _1278 = _870 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1264 * 0.699999988079071044921875;
    float _1284 = _1186 * 6.283185482025146484375;
    float _1286 = cos(_1284);
    float _1288 = _1272 * 0.89999997615814208984375;
    float _1290 = _1078 * 6.283185482025146484375;
    float _1292 = sin(_1290);
    float _1294 = trunc(_1190);
    float _1296 = precise::max(_1294, 0.0);
    uint _1298 = uint(_1296);
    float _1300 = fma(_1286, 1.10000002384185791015625, _1282);
    float _1302 = 1.0 / _1194;
    float _1304 = fma(_1292, 0.60000002384185791015625, _1280);
    float _1306 = _988 * 6.283185482025146484375;
    float _1308 = sin(_1306);
    int _1310 = _1230 * int(_1298);
    int _1312 = _1310 + _1082;
    float _1314 = float(uint(_1312));
    float _1316 = _1248 * _1252;
    float _1318 = _1088 * 6.283185482025146484375;
    float _1320 = sin(_1318);
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1324 = _1302 * _1322;
    float _1326 = as_type<float>(_503) * _1314;
    float _1328 = -_1238;
    float _1330 = _1328 + 1.0;
    float _1332 = _1236 * 6.283185482025146484375;
    float _1334 = sin(_1332);
    float _1336 = -_1288;
    float _1338 = fma(_1308, -1.2000000476837158203125, _1336);
    float _1340 = abs(_1338);
    bool _1342 = _1340 > 0.001000000047497451305389404296875;
    bool _1344 = isnan(_1340);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.001000000047497451305389404296875);
    bool _1350 = _1346 || _1348;
    float _1352 = _1236 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = fma(_1320, 0.300000011920928955078125, _1304);
    float _1358 = _1240 * _1250;
    float _1360 = _1350 ? _1338 : 0.001000000047497451305389404296875;
    float _1362 = _1234 * _1254;
    int _1364 = ~_405;
    int _1366 = _1364 + 1;
    float _1368 = trunc(_1232);
    float _1370 = precise::max(_1368, 0.0);
    uint _1372 = uint(_1370);
    float _1374 = _1334 * _852;
    float _1376 = _1276 * 0.15915493667125701904296875;
    float _1378 = fma(_1238, 0.5, 0.5);
    float _1380 = abs(_1324);
    float _1382 = log2(_1380);
    float _1384 = -_1374;
    float _1386 = fma(_1354, _856, _1384);
    int _1388 = _726 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1390 = _1354 * _852;
    int _1392 = _796 ? as_type<int>(_1330) : as_type<int>(_1238);
    float _1394 = _854 + (-0.0199999995529651641845703125);
    float _1396 = abs(_1300);
    bool _1398 = _1396 != 0.0;
    bool _1400 = isnan(_1396);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = _1266 * 6.283185482025146484375;
    float _1410 = sin(_1408);
    int _1412 = int(_1162) + int(_1372);
    float _1414 = abs(_1360);
    bool _1416 = _1414 == 0.0;
    bool _1418 = !_1406;
    bool _1420 = _1416 && _1418;
    float _1422 = _718 ? as_type<float>(_1392) : _1238;
    int _1424 = _1366 * _1412;
    int _1426 = _1424 + _1120;
    float _1428 = _1266 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    bool _1432 = uint(_1426) >= uint(_405);
    bool _1434 = !_1432;
    int _1436 = _1434 ? 0 : (-1);
    float _1438 = trunc(_1326);
    float _1440 = precise::max(_1438, 0.0);
    uint _1442 = uint(_1440);
    float _1444 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1446 = _714 ? as_type<float>(_1388) : _1238;
    float _1448 = _1378 * _1356;
    float _1450 = abs(_1360);
    bool _1452 = _1450 == 0.0;
    float _1454 = fma(_1334, _856, _1390);
    bool _1456 = _1432;
    int _1458 = as_type<int>(_1334);
    int _1460 = _1412;
    if (_1420)
    {
        bool _1462 = as_type<int>(_1360) >= 0;
        _1456 = _1462;
    }
    bool _1464 = _1456;
    float _1466 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1468 = exp2(_1444);
    float _1470 = _1386 + 0.02999999932944774627685546875;
    int _1472 = _1464 ? (-1) : 0;
    if (_1420)
    {
        int _1474 = _1464 ? 0 : 1078530011;
        _1458 = _1474;
    }
    int _1476 = _1458;
    int _1478 = ~_1412;
    int _1480 = _1478 + _1436;
    int _1482 = _1480 + 1;
    float _1484 = _1410 * _1470;
    float _1486 = _1430 * _1470;
    float _1488 = _1376 * 6.283185482025146484375;
    float _1490 = sin(_1488);
    float _1492 = -_1484;
    float _1494 = fma(_1430, _1394, _1492);
    float _1496 = fma(_1410, _1394, _1486);
    int _1498 = int(_1298) + int(_1442);
    float _1500 = _1410;
    if (_1420)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1300);
        int _1504 = _1476 | _1502;
        _1500 = as_type<float>(_1504);
    }
    float _1506 = _1500;
    float _1508 = _1376 * 6.283185482025146484375;
    float _1510 = cos(_1508);
    float _1512 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1514 = precise::clamp(_1512, 0.0, 1.0);
    int _1516 = ~_405;
    int _1518 = _1516 + 1;
    bool _1520 = !_1406;
    bool _1522 = _1520 && _1452;
    float _1524 = _1506;
    float _1526 = _1506;
    if (!_1522)
    {
        float _1528 = abs(_1300);
        bool _1530 = _1528 != as_type<float>(0x7f800000u /* inf */);
        bool _1532 = isnan(_1528);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1538 = _1534 || _1536;
        float _1540 = abs(_1360);
        bool _1542 = _1540 == as_type<float>(0x7f800000u /* inf */);
        float _1544 = abs(_1360);
        bool _1546 = _1544 == as_type<float>(0x7f800000u /* inf */);
        bool _1548 = !_1538;
        bool _1550 = _1546 && _1548;
        if (_1550)
        {
            bool _1552 = as_type<int>(_1360) >= 0;
            _1472 = _1552 ? (-1) : 0;
        }
        int _1554 = _1472;
        if (_1550)
        {
            _1460 = 1075235812;
        }
        int _1556 = _1460;
        int _1558 = _1556;
        if (_1550)
        {
            int _1560 = ~_1554;
            int _1562 = (_1560 != 0) ? _1556 : 1061752795;
            _1558 = _1562;
        }
        int _1564 = _1558;
        if (_1550)
        {
            int _1566 = int(0x80000000) & as_type<int>(_1300);
            int _1568 = _1564 | _1566;
            _1524 = as_type<float>(_1568);
        }
        float _1570 = _1524;
        bool _1572 = !_1538;
        bool _1574 = _1572 && _1542;
        _1526 = _1570;
        if (!_1574)
        {
            float _1576 = abs(_1300);
            float _1578 = abs(_1360);
            float _1580 = precise::max(_1576, _1578);
            float _1582 = abs(_1300);
            float _1584 = abs(_1360);
            float _1586 = precise::min(_1582, _1584);
            float _1588 = 1.0 / _1580;
            float _1590 = abs(_1300);
            float _1592 = abs(_1360);
            bool _1594 = _1590 > _1592;
            bool _1596 = as_type<int>(_1360) >= 0;
            float _1598 = _1586 * _1588;
            float _1600 = abs(_1300);
            float _1602 = abs(_1360);
            float _1604 = _1600 + _1602;
            int _1606 = as_type<int>(_1300) & int(0x80000000);
            float _1608 = _1598 * _1598;
            bool _1610 = _1604 > as_type<float>(0x7f800000u /* inf */);
            bool _1612 = isnan(_1604);
            bool _1614 = _1610 || _1612;
            bool _1616 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1618 = _1614 || _1616;
            float _1620 = _1608 + 11.33538818359375;
            float _1622 = fma(_1608, _1620, 28.84246826171875);
            float _1624 = fma(_1608, _1622, 19.6966705322265625);
            float _1626 = fma(_1608, -0.82336294651031494140625, -5.674867153167724609375);
            float _1628 = fma(_1608, _1626, -6.565555095672607421875);
            float _1630 = 1.0 / _1624;
            float _1632 = _1608 * _1628;
            float _1634 = _1598 * _1632;
            float _1636 = fma(_1634, _1630, _1598);
            float _1638 = _1636;
            _1526 = _1604;
            if (_1594)
            {
                float _1640 = -_1636;
                float _1642 = _1640 + 1.57079637050628662109375;
                _1638 = _1642;
            }
            float _1644 = _1638;
            int _1646 = as_type<int>(_1644);
            if (!_1596)
            {
                float _1648 = -_1644;
                float _1650 = _1648 + 3.1415927410125732421875;
                _1646 = as_type<int>(_1650);
            }
            int _1652 = _1646;
            if (!_1618)
            {
                int _1654 = _1606 | _1652;
                _1526 = as_type<float>(_1654);
            }
        }
    }
    float _1656 = _1526;
    int _1658 = _405 * _1482;
    int _1660 = _1658 + _1120;
    float _1662 = fma(_1260, -0.100000001490116119384765625, _1454);
    float _1664 = _1494 * _1490;
    float _1666 = _1494 * _1510;
    float _1668 = _1466 * 0.01745329238474369049072265625;
    bool _1670 = !_1026;
    int _1672 = _1670 ? _1660 : (-1);
    float _1674 = -_1664;
    float _1676 = fma(_1510, _1662, _1674);
    float _1678 = fma(_1490, _1662, _1666);
    int _1680 = _1672 >> 31;
    float _1682 = _1668 * 0.15915493667125701904296875;
    int _1684 = _1518 * _1498;
    int _1686 = _1684 + _1082;
    int _1688 = _1680 & 3;
    float _1690 = _1682 * 6.283185482025146484375;
    float _1692 = sin(_1690);
    float _1694 = fma(_1260, 0.100000001490116119384765625, _1676);
    float _1696 = fma(_1514, -2.0, 3.0);
    int _1698 = _1672 + _1688;
    float _1700 = _1514 * _1514;
    bool _1702 = uint(_1686) >= uint(_405);
    float _1704 = _1496 + (-0.02999999932944774627685546875);
    int _1706 = _1698 >> 2;
    float _1708 = _1682 * 6.283185482025146484375;
    float _1710 = cos(_1708);
    float _1712 = _1700 * _1696;
    float _1714 = _1362 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1716 = _1706 << 4;
    int _1718 = _1716 + 368;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1704);
    float _1722 = -_1712;
    float _1724 = _1722 + 1.0;
    float _1726 = _1678 + 0.0199999995529651641845703125;
    uint _1728 = uint(int(uint(_1718) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    bool _1744 = !_1702;
    int _1746 = _1744 ? 0 : (-1);
    float _1748 = _1714 * _1720;
    float _1750 = fma(_1724, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1712);
    float _1752 = _1726 * _1692;
    int _1754 = ~_1498;
    int _1756 = _1754 + _1746;
    int _1758 = _1756 + 1;
    float _1760 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1762 = _1324 <= 8000.0;
    bool _1764 = isnan(_1324);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(8000.0);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    float _1774 = _1656 + 1.57079637050628662109375;
    float _1776 = _1726 * _1710;
    float _1778 = -_1752;
    float _1780 = fma(_1694, _1710, _1778);
    int _1782 = _405 * _1758;
    int _1784 = _1782 + _1082;
    float _1786 = _1772 * _1750;
    float _1788 = fma(_1694, _1692, _1776);
    int _1790 = _1672 & 3;
    bool _1792 = _1790 != 0;
    float _1794 = _1358 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1796 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1780);
    int _1798 = _1718 + 8;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    bool _1816 = uint(_1790) > 1u;
    float _1818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1788);
    int _1820 = _1672 & 3;
    bool _1822 = _1820 != 0;
    float _1824 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1796);
    bool _1826 = _1788 != 0.0;
    bool _1828 = isnan(_1788);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(0.0);
    bool _1834 = _1830 || _1832;
    float _1836 = _1760 * _1818;
    int _1838 = _1822 ? 0 : 1;
    float _1840 = _1794 * _1824;
    bool _1842 = _1796 == 0.0;
    bool _1844 = !_1834;
    bool _1846 = _1842 && _1844;
    float _1848 = _1748 * _289;
    int _1850 = ~_1838;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1748 * _309;
    bool _1858 = _1496 == 0.02999999932944774627685546875;
    bool _1860 = _1858 && _1846;
    float _1862 = _1748 * _299;
    int _1864 = _1854;
    float _1866 = as_type<float>(_1784);
    if (!_1816)
    {
        int _1868 = ~_1838;
        int _1870 = _1868 + 1;
        _1864 = _1870;
    }
    int _1872 = _1864;
    float _1874 = fma(_1840, _267, _1848);
    bool _1876 = _1790 != 3;
    float _1878 = fma(_1840, _275, _1856);
    int _1880 = abs(_1872);
    float _1882 = fma(_1840, _271, _1862);
    bool _1884 = !_1792;
    int _1886 = _1884 ? 0 : 1;
    float _1888 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1890 = int(_1888);
    bool _1892 = uint(_1790) >= 2u;
    float _1894 = in.m_50.z;
    int _1896 = abs(_1886);
    float _1898 = -_1836;
    float _1900 = fma(_1898, _313, _1874);
    int _1902 = _1892 ? 0 : 1;
    int _1904 = ~_1880;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    float _1910 = _481 + _1900;
    int _1912 = ~_1902;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    int _1918 = _1908 * as_type<int>(_1742);
    int _1920 = _1916;
    if (_1876)
    {
        int _1922 = ~_1902;
        int _1924 = _1922 + 1;
        _1920 = _1924;
    }
    int _1926 = _1920;
    int _1928 = ~_1896;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = abs(_1926);
    bool _1936 = _1790 != 3;
    int _1938 = _1932 * as_type<int>(_1734);
    int _1940 = _1938 + _1918;
    float _1942 = in.m_72.x;
    float _1944 = in.m_72.y;
    float _1946 = in.m_72.z;
    bool _1948 = !_1936;
    int _1950 = _1948 ? 0 : (-1);
    bool _1952 = !_708;
    int _1954 = _1952 ? 0 : 1;
    int _1956 = ~_1934;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = abs(_1950);
    int _1964 = abs(_1954);
    int _1966 = _1960 * as_type<int>(_1806);
    int _1968 = _1966 + _1940;
    float _1970 = float(uint(_1890));
    float _1972 = -_1836;
    float _1974 = fma(_1972, _321, _1878);
    int _1976 = abs(_1890);
    int _1978 = ~_1962;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = 1.0 / _1970;
    float _1986 = -_1836;
    float _1988 = fma(_1986, _317, _1882);
    float _1990 = _1774 * (-0.15915493667125701904296875);
    int _1992 = ~_1964;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = _1982 * as_type<int>(_1814);
    int _2000 = _1998 + _1968;
    float _2002 = float(uint(_1976));
    bool _2004 = !_1026;
    int _2006 = _2004 ? _1784 : (-1);
    int _2008 = _2000 * _1996;
    float _2010 = 1.0 / _2002;
    float _2012 = as_type<float>(_1962);
    float _2014 = as_type<float>(_1964);
    float _2016 = _2002;
    float _2018 = as_type<float>(_2000);
    float _2020 = as_type<float>(_2008);
    if (_1860)
    {
        _2012 = _1942;
    }
    float _2022 = _2012;
    int _2024 = _2006 * _1964;
    int _2026 = _2024 + _2008;
    float _2028 = _2022;
    if (_1860)
    {
        _2014 = _1946;
    }
    float _2030 = _2014;
    int _2032 = as_type<int>(_1984) + (-2);
    float _2034 = _1990 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    float _2038 = _2030;
    if (_1860)
    {
        _2016 = _1944;
    }
    float _2040 = _2016;
    float _2042 = _2040;
    if (_1860)
    {
        _1866 = _2022;
    }
    float _2044 = _1866;
    float _2046 = _2044;
    if (_1860)
    {
        _2018 = _2040;
    }
    float _2048 = _2018;
    float _2050 = _2048;
    if (!_1860)
    {
        _2042 = _1944;
    }
    float _2052 = _2042;
    float _2054 = _1990 * 6.283185482025146484375;
    float _2056 = sin(_2054);
    float _2058 = float(uint(_2026));
    if (!_1860)
    {
        _2028 = _1942;
    }
    float _2060 = _2028;
    float _2062 = _1894 * 6.283185482025146484375;
    int _2064 = abs(_2026);
    if (!_1860)
    {
        float _2066 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2050 = _2066;
    }
    float _2068 = _2050;
    if (_1860)
    {
        _2020 = _2030;
    }
    float _2070 = _2020;
    float _2072 = _2062 * 0.15915493667125701904296875;
    float _2074 = as_type<float>(_2032) * _2058;
    float _2076 = _2070;
    if (!_1860)
    {
        _2038 = _1946;
    }
    float _2078 = _2038;
    float _2080 = _1988 * _2036;
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    int _2086 = as_type<int>(_2010) + (-2);
    if (!_1860)
    {
        float _2088 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = float(uint(_2064));
    float _2094 = fma(_1974, _2056, _2080);
    float _2096 = _1988 * _2056;
    float _2098 = _756 * _2060;
    int _2100 = ~_1890;
    int _2102 = _2100 + 1;
    float _2104 = trunc(_2074);
    float _2106 = precise::max(_2104, 0.0);
    uint _2108 = uint(_2106);
    float _2110 = as_type<float>(_2086) * _2092;
    float _2112 = -_2096;
    float _2114 = fma(_1974, _2036, _2112);
    float _2116 = _369 + _2094;
    if (!_1860)
    {
        float _2118 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2076 = _2118;
    }
    float _2120 = _2076;
    float _2122 = -_2098;
    float _2124 = fma(_752, _2078, _2122);
    float _2126 = _754 * _2078;
    float _2128 = trunc(_2110);
    float _2130 = precise::max(_2128, 0.0);
    uint _2132 = uint(_2130);
    float _2134 = _371 + _2114;
    float _2136 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2116);
    float _2138 = _752 * _2052;
    int _2140 = ~_1976;
    int _2142 = _2140 + 1;
    float _2144 = -_2126;
    float _2146 = fma(_756, _2052, _2144);
    float _2148 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[191].z, _2134);
    float _2150 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2152 = _2136 + _2150;
    float _2154 = _2072 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    int _2158 = _2102 * int(_2108);
    int _2160 = _2158 + _2026;
    float _2162 = -_2138;
    float _2164 = fma(_754, _2060, _2162);
    float _2166 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2168 = _2148 + _2166;
    float _2170 = _2084 * _2152;
    float _2172 = _2146 * _758;
    float _2174 = float(uint(_2160));
    float _2176 = _2164 * _758;
    float _2178 = as_type<float>(_2032) * _2174;
    float _2180 = _2124 * _758;
    int _2182 = _2142 * int(_2132);
    int _2184 = _2182 + _2064;
    float _2186 = _2156 * _2152;
    float _2188 = -_2170;
    float _2190 = fma(_2156, _2168, _2188);
    float _2192 = float(uint(_2184));
    float _2194 = _2176 * _299;
    float _2196 = fma(_2084, _2168, _2186);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2200 = trunc(_2178);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2086) * _2192;
    float _2208 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2212 = _2198 + _2210;
    float _2214 = _299 * _2120;
    float _2216 = fma(_2172, _271, _2194);
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2208 + _2218;
    float _2222 = _2212 * _2212;
    float _2224 = fma(_271, _2090, _2214);
    float _2226 = _309 * _2120;
    float _2228 = _2176 * _289;
    float _2230 = fma(_2220, _2220, _2222);
    float _2232 = _2176 * _309;
    float _2234 = trunc(_2206);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    float _2240 = fma(_275, _2090, _2226);
    float _2242 = fma(_2172, _267, _2228);
    float _2244 = fma(_2172, _275, _2232);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _2248 = _2246 + 1.0;
    float _2250 = -_2180;
    float _2252 = fma(_2250, _317, _2216);
    float _2254 = -_2180;
    float _2256 = fma(_2254, _313, _2242);
    float _2258 = -_2180;
    float _2260 = fma(_2258, _321, _2244);
    float _2262 = sqrt(_2230);
    float _2264 = -_776;
    float _2266 = fma(_2264, _2248, _1910);
    float _2268 = -_2068;
    float _2270 = fma(_321, _2268, _2240);
    int _2272 = ~_1890;
    int _2274 = _2272 + 1;
    float _2276 = _289 * _2120;
    int _2278 = int(_2108) + int(_2204);
    float _2280 = -_2068;
    float _2282 = fma(_317, _2280, _2224);
    int _2284 = ~_1976;
    int _2286 = _2284 + 1;
    float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_74.x = _2252;
    out.m_74.y = _2256;
    out.m_74.z = _2260;
    int _2290 = _2274 * _2278;
    int _2292 = _2290 + _2026;
    int _2294 = int(_2132) + int(_2238);
    float _2296 = _2282 * _2056;
    float _2298 = _2282 * _2036;
    float _2300 = fma(_267, _2090, _2276);
    bool _2302 = uint(_2292) >= uint(_1890);
    float _2304 = -_2296;
    float _2306 = fma(_2270, _2036, _2304);
    bool _2308 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = fma(_2270, _2056, _2298);
    bool _2312 = !_2302;
    int _2314 = _2312 ? 0 : (-1);
    int _2316 = _2286 * _2294;
    int _2318 = _2316 + _2064;
    float _2320 = as_type<float>(_2286);
    float _2322 = _2260;
    float _2324 = _2256;
    float _2326 = _2300;
    if (!_2308)
    {
        _2320 = _2208;
    }
    float _2328 = _2320;
    float _2330 = _2328;
    if (!_2308)
    {
        _2322 = _2198;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2308)
    {
        _2324 = _2266;
    }
    float _2336 = _2324;
    bool _2338 = !_2308;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2262 + _2344;
        float _2348 = _2266 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = rsqrt(_2230);
        float _2352 = _2346 * _2342;
        float _2354 = _2352 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = sin(_2360);
        float _2364 = _2358 + (-1.0);
        float _2366 = _2364 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = fma(_2362, _2348, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2370 = fma(_2266, _2358, _2366);
        float _2372 = _2350 * _2368;
        float _2374 = fma(_2220, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2376 = fma(_2212, _2372, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2340 = _2370;
        _2330 = _2374;
        _2334 = _2376;
    }
    float _2378 = _2340;
    float _2380 = _2330;
    float _2382 = _2334;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _2388 = uint(_2318) >= uint(_1976);
    float _2390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2392 = _2026 ^ _1890;
    float _2394 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    int _2396 = ~_2278;
    int _2398 = _2396 + _2314;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2386);
    bool _2404 = !_2388;
    int _2406 = _2404 ? 0 : (-1);
    float _2408 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2394);
    uint _2410 = uint(int(uint(_2392) >> uint(31)));
    float _2412 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2402);
    bool _2414 = _1890 == 0;
    float _2416 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2418 = _1890 == 0;
    int _2420 = _1890 * _2400;
    int _2422 = _2420 + _2026;
    int _2424 = ~_2406;
    int _2426 = _2294 + _2424;
    int _2428 = _2426 + 1;
    float _2430 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    int _2432 = ~int(_2410);
    int _2434 = _2432 + 1;
    float _2436 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _2438 = !_2414;
    int _2440 = _2438 ? _2422 : (-1);
    float _2442 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    int _2444 = _2428 ^ _2434;
    float _2446 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2448 = _2416 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2450 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = float(_2440);
    float _2454 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2436);
    int _2456 = ~_2434;
    int _2458 = _2456 + _2444;
    int _2460 = _2458 + 1;
    float _2462 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2442);
    float _2464 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2446);
    float _2466 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2448);
    float _2468 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2470 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2472 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _2474 = !_2418;
    int _2476 = _2474 ? _2460 : (-1);
    float _2478 = fma(_2468, _2452, _806);
    float _2480 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2482 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2484 = fma(_2468, _606, -0.5);
    float _2486 = float(_2476);
    float _2488 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2490 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2492 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2482);
    float _2494 = in.m_54.x;
    float _2496 = fma(_2488, _1422, -0.5);
    float _2498 = -_710;
    float _2500 = fma(_2488, _2486, _2498);
    float _2502 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2454);
    float _2504 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2462);
    float _2506 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2464);
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2466);
    float _2510 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2514 = _2378 + _2512;
    float _2516 = fma(_814, _2496, _2500);
    float _2518 = fma(_812, _2484, _2478);
    float _2520 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2522 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2504);
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2506);
    float _2526 = fma(_2510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2530 = _2380 + _2528;
    float _2532 = _2514 * _2514;
    float _2534 = _2516 + 0.5;
    float _2536 = _2156 * _2310;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2540 = fma(_2530, _2530, _2532);
    float _2542 = _2084 * _2310;
    float _2544 = fma(_2084, _2306, _2536);
    float _2546 = _1786 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2548 = -_389;
    float _2550 = _2548 + 1.0;
    float _2552 = -_2068;
    float _2554 = fma(_313, _2552, _2300);
    float _2556 = -_2542;
    float _2558 = fma(_2156, _2306, _2556);
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2382 + _2562;
    float _2566 = _2550 * _2546;
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2572 = fma(_2564, _2564, _2540);
    float _2574 = _620 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2576 = -_2568;
    float _2578 = fma(_2576, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2580 = _2518 + 0.5;
    float _2582 = sqrt(_2572);
    float _2584 = _2574 * _2538;
    float _2586 = _2578 * _2494;
    out.gl_Position.x = _2520;
    out.gl_Position.y = _2522;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2526;
    float _2588 = _2586 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2590 = _2570 * _2560;
    out.m_76.x = _2544;
    out.m_76.y = _2554;
    out.m_76.z = _2558;
    out.m_78.x = _2580;
    out.m_78.y = _2534;
    out.m_78.z = _2584;
    out.m_78.w = _2590;
    out.m_80.x = _2588;
    bool _2592 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2594 = isnan(_2582);
    bool _2596 = _2592 || _2594;
    bool _2598 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2600 = _2596 || _2598;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2602 = _2540;
    float _2604 = _2542;
    float _2606 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2608 = _2586;
    float _2610 = _2572;
    if (!_2600)
    {
        _2602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2612 = _2602;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2600)
    {
        _2326 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2618 = _2326;
    float _2620 = _2618;
    float _2622 = _2618;
    if (!_2600)
    {
        _2604 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2624 = _2604;
    float _2626 = _2624;
    float _2628 = _2624;
    if (!_2600)
    {
        _2606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2630 = _2606;
    float _2632 = _2630;
    float _2634 = _2630;
    if (!_2600)
    {
        _2608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2636 = _2608;
    float _2638 = _2636;
    float _2640 = _2636;
    if (!_2600)
    {
        _2610 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2642 = _2610;
    bool _2644 = !_2600;
    float _2646 = _2642;
    float _2648 = _2642;
    if (!_2644)
    {
        bool _2650 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2652 = isnan(_2582);
        bool _2654 = _2650 || _2652;
        bool _2656 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2658 = _2654 || _2656;
        if (!_2658)
        {
            float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2662 = _2582 + _2660;
            float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2666 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2664;
            float _2668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2670 = _2668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2672 = 1.0 / _2666;
            float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2680 = _2678 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2682 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2684 = _2682 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2686 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2688 = _2686 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2690 = _2662 * _2672;
            float _2692 = precise::clamp(_2690, 0.0, 1.0);
            float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2696 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2698 = fma(_2692, _2670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2700 = fma(_2692, _2696, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2702 = fma(_2692, _2676, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2704 = fma(_2692, _2680, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2706 = fma(_2692, _2684, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2708 = fma(_2692, _2688, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2622 = _2698;
            _2640 = _2706;
            _2616 = _2702;
            _2634 = _2704;
            _2628 = _2700;
            _2648 = _2708;
            _2710 = true;
        }
        else
        {
            bool _2712 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2714 = isnan(_2582);
            bool _2716 = _2712 || _2714;
            bool _2718 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2720 = _2716 || _2718;
            if (!_2720)
            {
                _2614 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2722 = _2614;
            _2616 = _2722;
            if (!_2720)
            {
                _2620 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2724 = _2620;
            _2622 = _2724;
            if (!_2720)
            {
                _2626 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2726 = _2626;
            _2628 = _2726;
            if (!_2720)
            {
                _2632 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2728 = _2632;
            _2634 = _2728;
            if (!_2720)
            {
                _2638 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2730 = _2638;
            _2640 = _2730;
            if (!_2720)
            {
                _2646 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2732 = _2646;
            bool _2734 = !_2720;
            _2648 = _2732;
            if (!_2734)
            {
                bool _2736 = _2582 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2738 = isnan(_2582);
                bool _2740 = _2736 || _2738;
                bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2744 = _2740 || _2742;
                if (!_2744)
                {
                    float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2748 = _2582 + _2746;
                    float _2750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2752 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2750;
                    float _2754 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2758 = 1.0 / _2752;
                    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2766 = _2764 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2772 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2776 = _2748 * _2758;
                    float _2778 = precise::clamp(_2776, 0.0, 1.0);
                    float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2782 = _2780 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2784 = fma(_2778, _2756, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2786 = fma(_2778, _2782, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2788 = fma(_2778, _2762, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2790 = fma(_2778, _2766, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2792 = fma(_2778, _2770, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2794 = fma(_2778, _2774, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2622 = _2784;
                    _2640 = _2792;
                    _2616 = _2788;
                    _2634 = _2790;
                    _2628 = _2786;
                    _2648 = _2794;
                    _2710 = true;
                }
                else
                {
                    _2622 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2640 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2616 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2634 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2628 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2648 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2710 = false;
    float _2796 = _2622;
    float _2798 = _2640;
    float _2800 = _2616;
    float _2802 = _2634;
    float _2804 = _2628;
    float _2806 = _2648;
    float _2808 = fma(_2554, -0.5, 0.5);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -_2796;
    float _2814 = _2812 + _2798;
    float _2816 = -_2800;
    float _2818 = _2816 + _2802;
    float _2820 = -_2804;
    float _2822 = _2820 + _2806;
    bool _2824 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2826 = fma(_2810, _2814, _2796);
    float _2828 = fma(_2810, _2818, _2800);
    float _2830 = fma(_2810, _2822, _2804);
    float _2832 = _2826 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _2834 = fma(_2828, 0.298911988735198974609375, _2832);
    float _2836 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_40.x = 1.0;
    float _2838 = fma(_2830, 0.114477999508380889892578125, _2834);
    float _2840 = -_2838;
    float _2842 = _2828 + _2840;
    float _2844 = -_2838;
    float _2846 = _2826 + _2844;
    float _2848 = -_2838;
    float _2850 = _2830 + _2848;
    out.m_80.w = _2836;
    float _2852 = fma(_2842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2854 = fma(_2846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    float _2856 = fma(_2850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2838);
    out.m_86.x = _2852;
    out.m_86.y = _2854;
    out.m_86.z = _2856;
    if (!_2824)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2858 = -_2378;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2862 = -_2380;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2866 = -_2382;
    float _2868 = _2866 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2870 = _2860 * _2860;
    float _2872 = fma(_2864, _2864, _2870);
    float _2874 = fma(_2868, _2868, _2872);
    float _2876 = sqrt(_2874);
    float _2878 = rsqrt(_2874);
    float _2880 = -_2876;
    float _2882 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2886 = precise::clamp(_2884, 0.0, 1.0);
    float _2888 = _2864 * _2878;
    float _2890 = _2860 * _2878;
    float _2892 = abs(_2886);
    float _2894 = log2(_2892);
    float _2896 = _2868 * _2878;
    float _2898 = _2888 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2900 = _2554 * _2890;
    float _2902 = -_2890;
    float _2904 = -_2898;
    float _2906 = fma(_2902, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2904);
    float _2908 = fma(_2544, _2888, _2900);
    float _2910 = -_2896;
    float _2912 = fma(_2910, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2906);
    float _2914 = fma(_2558, _2896, _2908);
    float _2916 = precise::clamp(_2914, 0.0, 1.0);
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2920 = _2912 + _2918;
    float _2922 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2924 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2926 = precise::clamp(_2924, 0.0, 1.0);
    float _2928 = exp2(_2922);
    float _2930 = _2928 * _2926;
    float _2932 = _2916 * _2930;
    float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2936 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2938 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2934;
    out.m_84.y = _2936;
    out.m_84.z = _2938;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

