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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_65 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_47 [[user(locn3), flat]];
    float4 m_63 [[user(locn4), flat]];
    float4 m_61 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_41 [[user(locn8), flat]];
    float4 m_55 [[user(locn9), flat]];
    float4 m_53 [[user(locn10), flat]];
    float4 m_45 [[user(locn11), flat]];
    float4 m_49 [[user(locn12)]];
    float4 m_39 [[user(locn13)]];
    float4 m_70 [[user(locn14)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _93 = in.m_41.y;
    float _95 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _97 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _99 = -_91;
    float _101 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _99);
    float _103 = in.m_41.x;
    float _105 = in.m_39.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = -_95;
    float _113 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _111);
    float _115 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _97);
    float _117 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _119 = _101 * _101;
    float _121 = in.m_41.z;
    float _123 = -_117;
    float _125 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _123);
    float _127 = fma(_113, _113, _119);
    float _129 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _115);
    float _131 = in.m_43.y;
    float _133 = fma(_125, _125, _127);
    float _135 = in.m_43.x;
    float _137 = rsqrt(_129);
    float _139 = 1.0 / _77;
    float _141 = rsqrt(_133);
    float _143 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _145 = _139 * _83;
    float _147 = _139 * _89;
    float _149 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _151 = _137 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _153 = -_93;
    float _155 = _145 + _153;
    float _157 = -_103;
    float _159 = _147 + _157;
    float _161 = _139 * _109;
    float _163 = _101 * _141;
    float _165 = _155 * _143;
    float _167 = _113 * _141;
    float _169 = _125 * _141;
    float _171 = _163 * _155;
    float _173 = fma(_159, _149, _165);
    float _175 = -_121;
    float _177 = _161 + _175;
    float _179 = fma(_167, _159, _171);
    float _181 = fma(_177, _151, _173);
    float _183 = in.m_45.y;
    float _185 = fma(_169, _177, _179);
    float _187 = _181 + _131;
    float _189 = _185 + _135;
    float _191 = _187 * _187;
    float _193 = in.m_43.z;
    float _195 = fma(_189, _189, _191);
    float _197 = in.m_47.y;
    float _199 = sqrt(_195);
    float _201 = _183 * 2.0;
    float _203 = precise::max(_199, -0.5);
    float _205 = in.m_43.w;
    float _207 = precise::min(_203, 11.0);
    float _209 = fma(_207, -0.086956523358821868896484375, 0.9565217494964599609375);
    float _211 = _209 * _209;
    float _213 = _211 + (-0.5);
    float _215 = fma(_201, _213, _183);
    float _217 = _197 * 0.25;
    float _219 = _215 * 0.15915493667125701904296875;
    float _221 = fma(_217, (*spvDescriptorSet0.fp_c9)._m0[192].y, (*spvDescriptorSet0.fp_c9)._m0[192].x);
    float _223 = _219 * 6.283185482025146484375;
    float _225 = sin(_223);
    float _227 = _187 * _221;
    float _229 = _189 * _221;
    float _231 = _219 * 6.283185482025146484375;
    float _233 = cos(_231);
    float _235 = _227 * _225;
    float _237 = _227 * _233;
    float _239 = -_235;
    float _241 = fma(_229, _233, _239);
    float _243 = fma(_229, _225, _237);
    float _245 = _193 + _241;
    float _247 = _205 + _243;
    float2 _1406 = float2(_245, _247);
    float _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1406, float2(0.0), isnan(_1406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1406, float2(0.0), isnan(_1406))).w;
    float _251 = in.m_49.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_49.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_49.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_51.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _277 = _145 + _275;
    float _279 = in.m_51.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _287 = _147 + _285;
    float _289 = in.m_51.z;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _297 = _161 + _295;
    float _299 = _139 * _255;
    float _301 = _139 * _261;
    float _303 = _139 * _267;
    float _305 = _139 * _273;
    float _307 = _299 * _299;
    float _309 = _139 * _283;
    float _311 = _305 * _305;
    float _313 = fma(_301, _301, _307);
    float _315 = _277 * _277;
    float _317 = _139 * _293;
    float _319 = fma(_309, _309, _311);
    float _321 = fma(_303, _303, _313);
    float _323 = fma(_287, _287, _315);
    float _325 = fma(_317, _317, _319);
    float _327 = rsqrt(_321);
    float _329 = fma(_297, _297, _323);
    float _331 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _333 = _331 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _335 = rsqrt(_329);
    float _337 = _299 * _327;
    float _339 = _301 * _327;
    float _341 = _303 * _327;
    float _343 = rsqrt(_325);
    float _345 = _337 * _337;
    float _347 = _277 * _335;
    float _349 = _287 * _335;
    float _351 = fma(_339, _339, _345);
    float _353 = _297 * _335;
    float _355 = _347 * _347;
    float _357 = in.m_53.x;
    float _359 = fma(_341, _341, _351);
    float _361 = fma(_349, _349, _355);
    float _363 = _305 * _343;
    float _365 = fma(_353, _353, _361);
    float _367 = rsqrt(_359);
    float _369 = _309 * _343;
    float _371 = _317 * _343;
    float _373 = _299 * _363;
    float _375 = fma(_301, _369, _373);
    float _377 = rsqrt(_365);
    float _379 = fma(_303, _371, _375);
    float _381 = in.m_55.z;
    float _383 = in.m_57.w;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = abs(_379);
    float _391 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _393 = _389 + _391;
    float _395 = _337 * _367;
    float _397 = _339 * _367;
    float _399 = _341 * _367;
    float _401 = _347 * _377;
    float _403 = _349 * _377;
    float _405 = 1.0 / _333;
    float _407 = _353 * _377;
    float _409 = _395 * _401;
    float _411 = fma(_397, _403, _409);
    float _413 = fma(_399, _407, _411);
    float _415 = abs(_413);
    float _417 = 0.0 + _415;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = fma(_211, 0.20000000298023223876953125, 0.800000011920928955078125);
    float _423 = _393 * _405;
    float _425 = precise::clamp(_423, 0.0, 1.0);
    float _427 = fma(_419, -2.0, 3.0);
    float _429 = _419 * _419;
    float _431 = _357 * _421;
    float _433 = fma(_425, -2.0, 3.0);
    float _435 = _425 * _425;
    float _437 = _427 * _429;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = in.m_59.x;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = _431 + 0.0500000007450580596923828125;
    float _449 = _433 * _435;
    float _451 = _139 * _445;
    float _453 = precise::max(_431, _249);
    float _455 = precise::min(_453, _447);
    float _457 = fma(_439, -0.39999997615814208984375, -0.12000000476837158203125);
    float _459 = -_431;
    float _461 = _459 + _455;
    float _463 = fma(_381, _457, 1.0);
    float _465 = _461 * 20.0;
    float _467 = _463 * _465;
    float _469 = _139 * _387;
    float _471 = _469 * _467;
    float _473 = 0.0 + _471;
    float _475 = precise::clamp(_473, 0.0, 1.0);
    float _477 = _475 * _449;
    float _479 = _477 * _451;
    bool _483 = _479 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _485 = isnan(_479);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _491 = _487 || _489;
    float _493 = in.m_61.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    int _500 = as_type<int>(_135);
    float _502 = _479;
    if (!_491)
    {
        discard_fragment();
    }
    float _504 = in.m_61.x;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = in.m_61.y;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = _139 * _497;
    float _518 = 1.0 / _516;
    float _520 = _139 * _508;
    float _522 = _139 * _514;
    float _524 = _520 * _518;
    float _526 = _522 * _518;
    float2 _1809 = float2(_524, _526);
    float _528 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1809, float2(0.0), isnan(_1809))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1809, float2(0.0), isnan(_1809))).x;
    float _530 = in.m_63.y;
    float _532 = _145 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _534 = fma(_147, (*spvDescriptorSet0.fp_c8)._m0[2].x, _532);
    float _536 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[2].z, _534);
    float _538 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _540 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _542 = _536 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _544 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _546 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _538);
    float _548 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _540);
    float _550 = _145 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _552 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _544);
    float _554 = 1.0 / _542;
    float _556 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _546);
    float _558 = _145 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _560 = fma(_147, (*spvDescriptorSet0.fp_c8)._m0[0].x, _550);
    float _562 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _552);
    float _564 = _556 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _566 = fma(_147, (*spvDescriptorSet0.fp_c8)._m0[1].x, _558);
    float _568 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _548);
    float _570 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[0].z, _560);
    float _572 = fma(_161, (*spvDescriptorSet0.fp_c8)._m0[1].z, _566);
    float _574 = _562 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _576 = _568 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _578 = -_530;
    float _580 = _564 + _578;
    float _582 = _572 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _584 = _570 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _586 = _530 * 3.0;
    float _588 = _580 * _554;
    float _590 = -_574;
    float _592 = fma(_582, _588, _590);
    float _594 = -_576;
    float _596 = fma(_584, _588, _594);
    float _598 = _592 * _592;
    float _600 = abs(_596);
    float _602 = abs(_592);
    float _604 = precise::max(_600, _602);
    float _606 = fma(_596, _596, _598);
    bool _608 = _604 >= 16.0;
    float _610 = 1.0 / _586;
    float _612 = sqrt(_606);
    float _614 = _592;
    float _616 = _596;
    if (_608)
    {
        float _618 = _592 * 0.0625;
        _614 = _618;
    }
    float _620 = _614;
    if (_608)
    {
        float _622 = _596 * 0.0625;
        _616 = _622;
    }
    float _624 = _616;
    float _626 = abs(_620);
    bool _628 = _626 != 0.0;
    bool _630 = isnan(_626);
    bool _632 = _628 || _630;
    bool _634 = isnan(0.0);
    bool _636 = _632 || _634;
    float _638 = abs(_624);
    bool _640 = _638 == 0.0;
    float _642 = abs(_624);
    bool _644 = _642 == 0.0;
    bool _646 = !_636;
    bool _648 = _644 && _646;
    float _650 = precise::max(0.0, _612);
    float _652 = precise::min(_586, _650);
    float _654 = -_652;
    float _656 = fma(_654, _610, 1.0);
    bool _658 = false;
    if (_648)
    {
        bool _660 = as_type<int>(_624) >= 0;
        _658 = _660;
    }
    bool _662 = _658;
    float _664 = _656 * _656;
    float _666 = fma(_664, -1.5, 1.5);
    float _668 = _135 + _666;
    int _670 = _662 ? (-1) : 0;
    if (_648)
    {
        int _672 = _662 ? 0 : 1078530011;
        _500 = _672;
    }
    int _674 = _500;
    float _676 = fma(_197, -0.02999999932944774627685546875, _668);
    int _678 = _674;
    if (_648)
    {
        int _680 = int(0x80000000) & as_type<int>(_620);
        int _682 = _674 | _680;
        _678 = _682;
    }
    int _684 = _678;
    bool _686 = !_636;
    bool _688 = _686 && _640;
    int _690 = _684;
    float _692 = as_type<float>(_684);
    if (!_688)
    {
        float _694 = abs(_620);
        bool _696 = _694 != as_type<float>(0x7f800000u /* inf */);
        bool _698 = isnan(_694);
        bool _700 = _696 || _698;
        bool _702 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _704 = _700 || _702;
        float _706 = abs(_624);
        bool _708 = _706 == as_type<float>(0x7f800000u /* inf */);
        float _710 = abs(_624);
        bool _712 = _710 == as_type<float>(0x7f800000u /* inf */);
        bool _714 = !_704;
        bool _716 = _712 && _714;
        if (_716)
        {
            bool _718 = as_type<int>(_624) >= 0;
            _670 = _718 ? (-1) : 0;
        }
        int _720 = _670;
        if (_716)
        {
            _690 = 1075235812;
        }
        int _722 = _690;
        int _724 = _722;
        if (_716)
        {
            int _726 = ~_720;
            int _728 = (_726 != 0) ? _722 : 1061752795;
            _724 = _728;
        }
        int _730 = _724;
        float _732 = as_type<float>(_730);
        if (_716)
        {
            int _734 = int(0x80000000) & as_type<int>(_620);
            int _736 = _730 | _734;
            _732 = as_type<float>(_736);
        }
        float _738 = _732;
        bool _740 = !_704;
        bool _742 = _740 && _708;
        _692 = _738;
        if (!_742)
        {
            float _744 = abs(_624);
            float _746 = abs(_620);
            float _748 = precise::max(_744, _746);
            float _750 = abs(_624);
            float _752 = abs(_620);
            float _754 = precise::min(_750, _752);
            float _756 = 1.0 / _748;
            float _758 = abs(_620);
            float _760 = abs(_624);
            bool _762 = _758 > _760;
            bool _764 = as_type<int>(_624) >= 0;
            float _766 = _754 * _756;
            float _768 = _766 * _766;
            float _770 = _768 + 11.33538818359375;
            float _772 = fma(_768, _770, 28.84246826171875);
            float _774 = fma(_768, _772, 19.6966705322265625);
            float _776 = fma(_768, -0.82336294651031494140625, -5.674867153167724609375);
            float _778 = fma(_768, _776, -6.565555095672607421875);
            float _780 = 1.0 / _774;
            float _782 = _768 * _778;
            float _784 = abs(_624);
            float _786 = abs(_620);
            float _788 = _784 + _786;
            int _790 = as_type<int>(_620) & int(0x80000000);
            float _792 = _766 * _782;
            bool _794 = _788 > as_type<float>(0x7f800000u /* inf */);
            bool _796 = isnan(_788);
            bool _798 = _794 || _796;
            bool _800 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _802 = _798 || _800;
            float _804 = fma(_792, _780, _766);
            float _806 = _804;
            _692 = _788;
            if (_762)
            {
                float _808 = -_804;
                float _810 = _808 + 1.57079637050628662109375;
                _806 = _810;
            }
            float _812 = _806;
            int _814 = as_type<int>(_812);
            if (!_764)
            {
                float _816 = -_812;
                float _818 = _816 + 3.1415927410125732421875;
                _814 = as_type<int>(_818);
            }
            int _820 = _814;
            if (!_802)
            {
                int _822 = _790 | _820;
                _692 = as_type<float>(_822);
            }
        }
    }
    float _824 = _692;
    float _826 = fma(_824, 1.11408460140228271484375, _131);
    float2 _2298 = float2(_826, _676);
    float3 _830 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2298, float2(0.0), isnan(_2298))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2298, float2(0.0), isnan(_2298))).xyz;
    float _832 = _830.x;
    float _834 = _830.y;
    float _836 = _830.z;
    float _838 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 10.0;
    float _840 = in.m_61.z;
    float _842 = gl_FragCoord.w;
    float _844 = _840 * _842;
    float _846 = in.m_65.x;
    float _848 = gl_FragCoord.w;
    float _850 = _846 * _848;
    float _852 = in.m_57.x;
    float _854 = gl_FragCoord.w;
    float _856 = _852 * _854;
    float _858 = -_838;
    float _860 = _145 + _858;
    float _862 = in.m_65.y;
    float _864 = gl_FragCoord.w;
    float _866 = _862 * _864;
    float _868 = in.m_65.z;
    float _870 = gl_FragCoord.w;
    float _872 = _868 * _870;
    float _874 = _860 * _860;
    float _876 = _431 + 0.1500000059604644775390625;
    float _878 = _439 * 0.5;
    float _880 = precise::max(_612, 2.0);
    float _882 = sqrt(_874);
    float _884 = precise::min(_876, _453);
    float _886 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _888 = fma(_528, (*spvDescriptorSet0.fp_c8)._m0[30].w, _886);
    float _890 = precise::min(_880, 6.0);
    float _892 = -_431;
    float _894 = _892 + _884;
    float _896 = fma(_894, 6.666666507720947265625, _878);
    float _898 = -_896;
    float _900 = _898 + 1.5;
    float _902 = precise::clamp(_900, 0.0, 1.0);
    float _904 = fma(_882, 0.100000001490116119384765625, -1.0);
    float _906 = in.m_57.z;
    float _908 = gl_FragCoord.w;
    float _910 = _906 * _908;
    float _912 = fma(_904, _904, 2.0);
    float _914 = _139 * _844;
    float _916 = _139 * _856;
    float _918 = _904 * _912;
    float _920 = in.m_57.y;
    float _922 = gl_FragCoord.w;
    float _924 = _920 * _922;
    float _926 = _914 * _518;
    float _928 = _139 * _866;
    float _930 = _139 * _872;
    float _932 = fma(_918, 0.5, 0.5);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _938 = fma(_926, (*spvDescriptorSet0.fp_c8)._m0[30].w, _936);
    float _940 = fma(_934, 2.0, -1.0);
    float _942 = fma(_934, -2.0, 1.0);
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = 1.0 / _938;
    float _948 = abs(_940);
    float _950 = -_948;
    float _952 = _950 + 1.0;
    float _954 = 0.0 + _940;
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = _139 * _850;
    float _960 = fma(_944, 0.5, _952);
    float _962 = fma(_944, 1.2000000476837158203125, _952);
    float _964 = fma(_956, 1.2000000476837158203125, _960);
    float _966 = fma(_956, 0.25, _962);
    float _968 = fma(_956, 0.800000011920928955078125, _960);
    float _970 = _958 * _964;
    float _972 = _139 * _910;
    float _974 = _928 * _966;
    float _976 = _930 * _968;
    float _978 = -_970;
    float _980 = fma(_916, _964, _978);
    float _982 = -_976;
    float _984 = fma(_972, _968, _982);
    float _986 = fma(_902, _980, _970);
    float _988 = _139 * _924;
    float _990 = 1.0 / _888;
    float _992 = fma(_902, _984, _976);
    float _994 = -_974;
    float _996 = fma(_988, _966, _994);
    float _998 = fma(_902, _996, _974);
    float _1000 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1002 = _946 * _1000;
    float _1004 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1006 = -_1002;
    float _1008 = fma(_990, _1004, _1006);
    float _1010 = fma(_1008, 0.22222222387790679931640625, 0.3333333432674407958984375);
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_1012, -2.0, 3.0);
    float _1016 = _1012 * _1012;
    float _1018 = fma(_890, 0.25, -0.5);
    float _1020 = _1014 * _1016;
    float _1022 = fma(_1020, -0.5, 0.5);
    float _1024 = fma(_1022, 2.0, _986);
    float _1026 = fma(_1022, 2.0, _998);
    float _1028 = fma(_1022, 1.2000000476837158203125, _992);
    float _1030 = _832 * _1018;
    float _1032 = _834 * _1018;
    float _1034 = _836 * _1018;
    float _1036 = fma(_1030, 0.00999999977648258209228515625, _1024);
    float _1038 = fma(_1032, 0.300000011920928955078125, _1026);
    float _1040 = fma(_1034, 0.100000001490116119384765625, _1028);
    if (!_491)
    {
        out.m_68.x = _1036;
        out.m_68.y = _1038;
        out.m_68.z = _1040;
        out.m_68.w = _471;
        return out;
    }
    float _1042 = _1038 * 0.715200006961822509765625;
    float _1044 = in.m_70.w;
    float _1046 = gl_FragCoord.w;
    float _1048 = _1044 * _1046;
    float _1050 = in.m_70.x;
    float _1052 = gl_FragCoord.w;
    float _1054 = _1050 * _1052;
    float _1056 = in.m_70.y;
    float _1058 = gl_FragCoord.w;
    float _1060 = _1056 * _1058;
    float _1062 = fma(_1036, 0.2125999927520751953125, _1042);
    float _1064 = in.m_70.z;
    float _1066 = gl_FragCoord.w;
    float _1068 = _1064 * _1066;
    float _1070 = fma(_1040, 0.072200000286102294921875, _1062);
    bool _1072 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1074 = 1.0 / _1070;
    float _1076 = _1074 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1078 = precise::clamp(_1076, 0.0, 1.0);
    float _1080 = fma(_1078, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1082 = _139 * _1048;
    float _1084 = _1048;
    if (_1072)
    {
        float _1086 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1088 = _1002 + _1086;
        _1084 = _1088;
    }
    float _1090 = _1084;
    float _1092 = _139 * _1054;
    float _1094 = _1080 * _1082;
    float _1096 = 0.0 + _479;
    float _1098 = precise::clamp(_1096, 0.0, 1.0);
    float _1100 = _1098;
    if (_1072)
    {
        float _1102 = _1090 * 8.0;
        float _1104 = precise::clamp(_1102, 0.0, 1.0);
        _502 = _1104;
    }
    float _1106 = _502;
    float _1108 = _139 * _1060;
    float _1110 = _139 * _1068;
    float _1112 = fma(_1036, _1094, _1092);
    if (_1072)
    {
        float _1114 = _1098 * _1106;
        _1100 = _1114;
    }
    float _1116 = _1100;
    float _1118 = fma(_1038, _1094, _1108);
    float _1120 = fma(_1040, _1094, _1110);
    float _1122 = 0.0 + _1116;
    float _1124 = precise::clamp(_1122, 0.0, 1.0);
    out.m_68.x = _1112;
    out.m_68.y = _1118;
    out.m_68.z = _1120;
    out.m_68.w = _1124;
    return out;
}

