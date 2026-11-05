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
    float4 m_64 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_37 [[user(locn4), flat]];
    float4 m_45 [[user(locn5), flat]];
    float4 m_61 [[user(locn6)]];
    float4 m_57 [[user(locn7), flat]];
    float4 m_55 [[user(locn8), flat]];
    float4 m_47 [[user(locn9), flat]];
    float4 m_49 [[user(locn10)]];
    float4 m_41 [[user(locn11)]];
    float4 m_66 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = in.m_37.y;
    float _75 = in.m_37.x;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = in.m_41.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _89 = in.m_41.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.z;
    float _103 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _87);
    float _105 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _103);
    float _107 = rsqrt(_105);
    float _109 = -_73;
    float _111 = _109 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _113 = -_75;
    float _115 = _113 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _117 = -_77;
    float _119 = _117 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _121 = _111 * _111;
    float _123 = 1.0 / _79;
    float _125 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _127 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _129 = fma(_115, _115, _121);
    float _131 = _107 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _133 = fma(_119, _119, _129);
    float _135 = rsqrt(_133);
    float _137 = _111 * _135;
    float _139 = _119 * _135;
    float _141 = _115 * _135;
    float _143 = _123 * _85;
    float _145 = _137 * _125;
    float _147 = _139 * _127;
    float _149 = -_73;
    float _151 = _143 + _149;
    float _153 = -_145;
    float _155 = fma(_139, _131, _153);
    float _157 = _141 * _131;
    float _159 = -_147;
    float _161 = fma(_141, _125, _159);
    float _163 = _123 * _93;
    float _165 = _123 * _99;
    float _167 = -_157;
    float _169 = fma(_137, _127, _167);
    float _171 = _151 * _161;
    float _173 = -_75;
    float _175 = _163 + _173;
    float _177 = _139 * _161;
    float _179 = _141 * _169;
    float _181 = -_77;
    float _183 = _165 + _181;
    float _185 = fma(_175, _155, _171);
    float _187 = _137 * _155;
    float _189 = -_179;
    float _191 = fma(_139, _155, _189);
    float _193 = -_177;
    float _195 = fma(_137, _169, _193);
    float _197 = fma(_183, _169, _185);
    float _199 = -_187;
    float _201 = fma(_141, _161, _199);
    float _203 = _151 * _191;
    float _205 = in.m_45.y;
    float _207 = _197 * _197;
    float _209 = fma(_175, _195, _203);
    float _211 = in.m_47.y;
    float _213 = fma(_183, _201, _209);
    float _215 = fma(_213, _213, _207);
    float _217 = sqrt(_215);
    float _219 = precise::max(_217, -0.5);
    float _221 = _205 * 0.25;
    float _223 = precise::min(_219, 11.0);
    float _225 = _211 * 2.0;
    float _227 = fma(_223, -0.086956523358821868896484375, 0.9565217494964599609375);
    float _229 = in.m_43.w;
    float _231 = _227 * _227;
    float _233 = _231 + (-0.5);
    float _235 = fma(_225, _233, _211);
    float _237 = _235 * 0.15915493667125701904296875;
    float _239 = fma(_221, (*spvDescriptorSet0.fp_c9)._m0[192].y, (*spvDescriptorSet0.fp_c9)._m0[192].x);
    float _241 = _237 * 6.283185482025146484375;
    float _243 = cos(_241);
    float _245 = _213 * _239;
    float _247 = _197 * _239;
    float _249 = _237 * 6.283185482025146484375;
    float _251 = sin(_249);
    float _253 = _245 * _243;
    float _255 = _245 * _251;
    float _257 = fma(_247, _251, _253);
    float _259 = -_255;
    float _261 = fma(_247, _243, _259);
    float _263 = _229 + _257;
    float _265 = _101 + _261;
    float2 _1503 = float2(_265, _263);
    float _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1503, float2(0.0), isnan(_1503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1503, float2(0.0), isnan(_1503))).w;
    float _269 = in.m_49.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_49.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_49.z;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _289 = _165 + _287;
    float _291 = fma(_231, 0.20000000298023223876953125, 0.800000011920928955078125);
    float _293 = _123 * _273;
    float _295 = _123 * _279;
    float _297 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _299 = _143 + _297;
    float _301 = _123 * _285;
    float _303 = _293 * _293;
    float _305 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _307 = _163 + _305;
    float _309 = _299 * _299;
    float _311 = fma(_295, _295, _303);
    float _313 = fma(_307, _307, _309);
    float _315 = fma(_301, _301, _311);
    float _317 = fma(_289, _289, _313);
    float _319 = rsqrt(_315);
    float _321 = rsqrt(_317);
    float _323 = _293 * _319;
    float _325 = _295 * _319;
    float _327 = _323 * _323;
    float _329 = _299 * _321;
    float _331 = _307 * _321;
    float _333 = _301 * _319;
    float _335 = fma(_325, _325, _327);
    float _337 = _329 * _329;
    float _339 = _289 * _321;
    float _341 = fma(_333, _333, _335);
    float _343 = fma(_331, _331, _337);
    float _345 = fma(_339, _339, _343);
    float _347 = rsqrt(_341);
    float _349 = in.m_51.w;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = rsqrt(_345);
    float _357 = _323 * _347;
    float _359 = _325 * _347;
    float _361 = _333 * _347;
    float _363 = _329 * _355;
    float _365 = _339 * _355;
    float _367 = _357 * _363;
    float _369 = _331 * _355;
    float _371 = fma(_359, _369, _367);
    float _373 = _123 * _353;
    float _375 = in.m_53.w;
    float _377 = gl_FragCoord.w;
    float _379 = _375 * _377;
    float _381 = fma(_361, _365, _371);
    float _383 = in.m_55.x;
    float _385 = _373 + (-0.0500000007450580596923828125);
    float _387 = abs(_381);
    float _389 = 0.0 + _387;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _373 + 0.0500000007450580596923828125;
    float _395 = _137 * _151;
    float _397 = fma(_391, -2.0, 3.0);
    float _399 = _391 * _391;
    float _401 = -_385;
    float _403 = _401 + _393;
    float _405 = _397 * _399;
    float _407 = precise::clamp(_405, 0.0, 1.0);
    float _409 = fma(_141, _175, _395);
    float _411 = 1.0 / _403;
    float _413 = precise::max(_385, _407);
    float _415 = fma(_139, _183, _409);
    float _417 = precise::min(_393, _413);
    float _419 = in.m_57.z;
    float _421 = precise::max(_415, -1.5);
    float _423 = -_385;
    float _425 = _423 + _417;
    float _427 = precise::max(_415, 3.0);
    float _429 = precise::min(_421, 0.100000001490116119384765625);
    float _431 = -_425;
    float _433 = fma(_431, _411, 1.0);
    float _435 = _123 * _379;
    float _437 = precise::min(_427, 5.0);
    float _439 = fma(_429, 0.625, 0.9375);
    float _441 = _383 * _291;
    float _443 = in.m_59.x;
    float _445 = gl_FragCoord.w;
    float _447 = _443 * _445;
    float _449 = fma(_437, -0.5, 2.5);
    float _451 = _433 * _439;
    float _453 = _441 + 0.0500000007450580596923828125;
    float _455 = fma(_407, -0.39999997615814208984375, -0.12000000476837158203125);
    float _457 = _449 * _451;
    float _459 = fma(_419, _455, 1.0);
    float _461 = _457 + _459;
    float _463 = in.m_61.x;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = precise::max(_441, _267);
    float _471 = precise::min(_469, _453);
    float _473 = -_441;
    float _475 = _473 + _471;
    float _477 = _475 * 20.0;
    float _479 = _461 * _477;
    float _481 = _435 * _479;
    float _483 = _439 * _481;
    float _485 = _123 * _447;
    float _487 = 0.0 + _483;
    float _489 = precise::clamp(_487, 0.0, 1.0);
    float _491 = _489 * _485;
    bool _495 = _491 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _497 = isnan(_491);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _503 = _499 || _501;
    float _505 = in.m_61.w;
    float _507 = gl_FragCoord.w;
    float _509 = _505 * _507;
    if (!_503)
    {
        discard_fragment();
    }
    float _511 = in.m_61.y;
    float _513 = gl_FragCoord.w;
    float _515 = _511 * _513;
    float _517 = _123 * _467;
    float _519 = _123 * _509;
    float _521 = 1.0 / _519;
    float _523 = _123 * _515;
    float _525 = _517 * _521;
    float _527 = _523 * _521;
    float2 _1884 = float2(_525, _527);
    float _529 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1884, float2(0.0), isnan(_1884))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1884, float2(0.0), isnan(_1884))).x;
    float _531 = (*spvDescriptorSet0.fp_c8)._m0[1].x * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _533 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _535 = -_531;
    float _537 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _535);
    float _539 = -_533;
    float _541 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _539);
    float _543 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _545 = _537 * _537;
    float _547 = -_543;
    float _549 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _547);
    float _551 = fma(_541, _541, _545);
    float _553 = fma(_549, _549, _551);
    float _555 = rsqrt(_553);
    float _557 = (*spvDescriptorSet0.fp_c9)._m0[191].y * 0.100000001490116119384765625;
    float _559 = _541 * _555;
    float _561 = _549 * _555;
    float _563 = _537 * _555;
    float _565 = _139 * _559;
    float _567 = _137 * _561;
    float _569 = -_565;
    float _571 = fma(_141, _561, _569);
    float _573 = _141 * _563;
    float _575 = -_567;
    float _577 = fma(_139, _563, _575);
    float _579 = _151 * _571;
    float _581 = -_573;
    float _583 = fma(_137, _559, _581);
    float _585 = fma(_175, _577, _579);
    float _587 = fma(_183, _583, _585);
    float _589 = fma(_587, _587, _207);
    float _591 = abs(_197);
    float _593 = abs(_587);
    float _595 = precise::max(_591, _593);
    float _597 = sqrt(_589);
    bool _599 = _595 >= 16.0;
    float _601 = _197 * 0.0625;
    float _603 = _599 ? _601 : _197;
    float _605 = abs(_603);
    bool _607 = _605 == 0.0;
    float _609 = _557 * _597;
    float _611 = _587 * 0.0625;
    float _613 = abs(_609);
    float _615 = log2(_613);
    float _617 = _599 ? _611 : _587;
    float _619 = abs(_617);
    bool _621 = _619 != 0.0;
    bool _623 = isnan(_619);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    float _631 = abs(_603);
    bool _633 = _631 == 0.0;
    bool _635 = !_629;
    bool _637 = _633 && _635;
    float _639 = _615 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _641 = exp2(_639);
    bool _643 = false;
    int _646 = as_type<int>(_611);
    if (_637)
    {
        bool _648 = as_type<int>(_603) >= 0;
        _643 = _648;
    }
    bool _650 = _643;
    int _652 = _650 ? (-1) : 0;
    if (_637)
    {
        int _654 = _650 ? 0 : 1078530011;
        _646 = _654;
    }
    int _656 = _646;
    int _658 = _656;
    if (_637)
    {
        int _660 = int(0x80000000) & as_type<int>(_617);
        int _662 = _656 | _660;
        _658 = _662;
    }
    int _664 = _658;
    bool _666 = !_629;
    bool _668 = _666 && _607;
    int _670 = _664;
    float _672 = as_type<float>(_664);
    if (!_668)
    {
        float _674 = abs(_617);
        bool _676 = _674 != as_type<float>(0x7f800000u /* inf */);
        bool _678 = isnan(_674);
        bool _680 = _676 || _678;
        bool _682 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _684 = _680 || _682;
        float _686 = abs(_603);
        bool _688 = _686 == as_type<float>(0x7f800000u /* inf */);
        float _690 = abs(_603);
        bool _692 = _690 == as_type<float>(0x7f800000u /* inf */);
        bool _694 = !_684;
        bool _696 = _692 && _694;
        if (_696)
        {
            bool _698 = as_type<int>(_603) >= 0;
            _652 = _698 ? (-1) : 0;
        }
        int _700 = _652;
        if (_696)
        {
            _670 = 1075235812;
        }
        int _702 = _670;
        int _704 = _702;
        if (_696)
        {
            int _706 = ~_700;
            int _708 = (_706 != 0) ? _702 : 1061752795;
            _704 = _708;
        }
        int _710 = _704;
        float _712 = as_type<float>(_710);
        if (_696)
        {
            int _714 = int(0x80000000) & as_type<int>(_617);
            int _716 = _710 | _714;
            _712 = as_type<float>(_716);
        }
        float _718 = _712;
        bool _720 = !_684;
        bool _722 = _720 && _688;
        _672 = _718;
        if (!_722)
        {
            float _724 = abs(_617);
            float _726 = abs(_603);
            float _728 = precise::max(_724, _726);
            float _730 = abs(_617);
            float _732 = abs(_603);
            float _734 = precise::min(_730, _732);
            float _736 = 1.0 / _728;
            float _738 = abs(_617);
            float _740 = abs(_603);
            bool _742 = _738 > _740;
            bool _744 = as_type<int>(_603) >= 0;
            float _746 = _734 * _736;
            float _748 = abs(_617);
            float _750 = abs(_603);
            float _752 = _748 + _750;
            int _754 = as_type<int>(_617) & int(0x80000000);
            float _756 = _746 * _746;
            bool _758 = _752 > as_type<float>(0x7f800000u /* inf */);
            bool _760 = isnan(_752);
            bool _762 = _758 || _760;
            bool _764 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _766 = _762 || _764;
            float _768 = _756 + 11.33538818359375;
            float _770 = fma(_756, _768, 28.84246826171875);
            float _772 = fma(_756, _770, 19.6966705322265625);
            float _774 = fma(_756, -0.82336294651031494140625, -5.674867153167724609375);
            float _776 = fma(_756, _774, -6.565555095672607421875);
            float _778 = 1.0 / _772;
            float _780 = _756 * _776;
            float _782 = _746 * _780;
            float _784 = fma(_782, _778, _746);
            float _786 = _784;
            _672 = _752;
            if (_742)
            {
                float _788 = -_784;
                float _790 = _788 + 1.57079637050628662109375;
                _786 = _790;
            }
            float _792 = _786;
            int _794 = as_type<int>(_792);
            if (!_744)
            {
                float _796 = -_792;
                float _798 = _796 + 3.1415927410125732421875;
                _794 = as_type<int>(_798);
            }
            int _800 = _794;
            if (!_766)
            {
                int _802 = _754 | _800;
                _672 = as_type<float>(_802);
            }
        }
    }
    float _804 = _672;
    float _806 = _101 * 2.0;
    float _808 = _205 * 0.453785598278045654296875;
    float _810 = in.m_43.x;
    float _812 = _806 * 0.15915493667125701904296875;
    float _814 = _808 + 2.85121917724609375;
    float _816 = in.m_43.y;
    float _818 = _808 * 0.15915493667125701904296875;
    float _820 = _812 * 6.283185482025146484375;
    float _822 = cos(_820);
    float _824 = _814 * 0.15915493667125701904296875;
    float _826 = fma(_205, 0.001049999962560832500457763671875, 0.0599999986588954925537109375);
    float _828 = _804 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _830 = _812 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _818 * 6.283185482025146484375;
    float _836 = sin(_834);
    float _838 = _587 * _822;
    float _840 = _824 * 6.283185482025146484375;
    float _842 = sin(_840);
    float _844 = _587 * _832;
    float _846 = fma(_197, _832, _838);
    float _848 = fma(_810, 4.0, _641);
    float _850 = -_844;
    float _852 = fma(_197, _822, _850);
    float _854 = _846 * 0.75128042697906494140625;
    float _856 = _846 * 0.659983098506927490234375;
    float _858 = fma(_836, _826, 0.10999999940395355224609375);
    float _860 = _816 * 4.0;
    float _862 = -_854;
    float _864 = fma(_852, 0.659983098506927490234375, _862);
    float _866 = fma(_852, 0.75128042697906494140625, _856);
    float _868 = fma(_205, 0.00349999987520277500152587890625, _858);
    float _870 = fma(_828, 0.159154951572418212890625, _860);
    float _872 = fma(_826, _842, 0.119999997317790985107421875);
    float _874 = fma(_846, _868, 0.5);
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = fma(_852, _868, 0.5);
    float _880 = precise::clamp(_878, 0.0, 1.0);
    float _882 = _205 * 0.100000001490116119384765625;
    float _884 = fma(_205, 0.00349999987520277500152587890625, _872);
    float _886 = fma(_882, (*spvDescriptorSet0.fp_c9)._m0[191].w, _848);
    float _888 = fma(_864, _884, 0.5);
    float _890 = precise::clamp(_888, 0.0, 1.0);
    float _892 = fma(_866, _884, 0.5);
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float2 _2434 = float2(_880, _876);
    float _896 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2434, float2(0.0), isnan(_2434))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2434, float2(0.0), isnan(_2434))).w;
    float2 _2442 = float2(_890, _894);
    float _898 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2442, float2(0.0), isnan(_2442))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2442, float2(0.0), isnan(_2442))).w;
    float2 _2450 = float2(_870, _886);
    float _900 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2450, float2(0.0), isnan(_2450))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2450, float2(0.0), isnan(_2450))).x;
    float _902 = in.m_51.y;
    float _904 = gl_FragCoord.w;
    float _906 = _902 * _904;
    float _908 = in.m_53.y;
    float _910 = gl_FragCoord.w;
    float _912 = _908 * _910;
    float _914 = in.m_53.z;
    float _916 = gl_FragCoord.w;
    float _918 = _914 * _916;
    float _920 = in.m_51.x;
    float _922 = gl_FragCoord.w;
    float _924 = _920 * _922;
    float _926 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 10.0;
    float _928 = fma(_407, -0.5, 0.5);
    float _930 = -_926;
    float _932 = _143 + _930;
    float _934 = _932 * _932;
    float _936 = sqrt(_934);
    float _938 = in.m_53.x;
    float _940 = gl_FragCoord.w;
    float _942 = _938 * _940;
    float _944 = in.m_51.z;
    float _946 = gl_FragCoord.w;
    float _948 = _944 * _946;
    float _950 = fma(_936, 0.100000001490116119384765625, -1.0);
    float _952 = fma(_950, _950, 2.0);
    float _954 = _950 * _952;
    float _956 = fma(_954, 0.5, 0.5);
    float _958 = precise::clamp(_956, 0.0, 1.0);
    float _960 = fma(_958, 2.0, -1.0);
    float _962 = fma(_958, -2.0, 1.0);
    float _964 = precise::clamp(_962, 0.0, 1.0);
    float _966 = _123 * _906;
    float _968 = _123 * _942;
    float _970 = abs(_960);
    float _972 = -_970;
    float _974 = _972 + 1.0;
    float _976 = 0.0 + _960;
    float _978 = precise::clamp(_976, 0.0, 1.0);
    float _980 = _123 * _912;
    float _982 = _964 + _974;
    float _984 = _966 * _978;
    float _986 = _984 * 0.5;
    float _988 = _978 * _980;
    float _990 = _988 * 0.5;
    float _992 = fma(_964, 0.5, _974);
    float _994 = fma(_966, _982, _986);
    float _996 = fma(_982, _980, _990);
    float _998 = fma(_978, 1.2000000476837158203125, _992);
    float _1000 = _123 * _948;
    float _1002 = _123 * _918;
    float _1004 = fma(_978, 0.800000011920928955078125, _992);
    float _1006 = _968 * _998;
    float _1008 = _123 * _924;
    float _1010 = in.m_61.z;
    float _1012 = gl_FragCoord.w;
    float _1014 = _1010 * _1012;
    float _1016 = _1000 * _1004;
    float _1018 = _1002 * _1004;
    float _1020 = _1008 * _998;
    float _1022 = -_994;
    float _1024 = _1022 + _996;
    float _1026 = -_1020;
    float _1028 = _1026 + _1006;
    float _1030 = -_1016;
    float _1032 = _1030 + _1018;
    float _1034 = _123 * _1014;
    float _1036 = _1034 * _521;
    float _1038 = in.m_57.y;
    float _1040 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1042 = fma(_1036, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1040);
    float _1044 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1046 = fma(_529, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1044);
    float _1048 = _441 + 0.1500000059604644775390625;
    float _1050 = 1.0 / _1046;
    float _1052 = precise::min(_1048, _469);
    float _1054 = -_441;
    float _1056 = _1054 + _1052;
    float _1058 = 1.0 / _1042;
    float _1060 = fma(_1056, -6.666666507720947265625, 1.0);
    float _1062 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1064 = _1058 * _1062;
    float _1066 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1068 = -_1064;
    float _1070 = fma(_1050, _1066, _1068);
    float _1072 = fma(_1070, 0.22222222387790679931640625, 0.3333333432674407958984375);
    float _1074 = precise::clamp(_1072, 0.0, 1.0);
    float _1076 = fma(_1074, -2.0, 3.0);
    float _1078 = _1074 * _1074;
    float _1080 = _1076 * _1078;
    float _1082 = fma(_1080, -0.5, 0.5);
    float _1084 = _896 + _898;
    float _1086 = precise::clamp(_1084, 0.0, 1.0);
    float _1088 = fma(_1086, 4.0, _900);
    float _1090 = fma(_1086, 4.0, _1082);
    float _1092 = fma(_1088, _1038, _1060);
    float _1094 = _457 + _1090;
    float _1096 = _457 + _1092;
    float _1098 = _1096 + _928;
    float _1100 = precise::clamp(_1098, 0.0, 1.0);
    float _1102 = fma(_1100, _1028, _1020);
    float _1104 = fma(_1100, _1024, _994);
    float _1106 = fma(_1100, _1032, _1016);
    float _1108 = fma(_1094, 2.0, _1102);
    float _1110 = fma(_1094, 2.0, _1104);
    float _1112 = fma(_1094, 1.2000000476837158203125, _1106);
    float _1114 = _1064;
    if (!_503)
    {
        out.m_64.x = _1108;
        out.m_64.y = _1110;
        out.m_64.z = _1112;
        out.m_64.w = _483;
        return out;
    }
    float _1116 = _1110 * 0.715200006961822509765625;
    float _1118 = in.m_66.w;
    float _1120 = gl_FragCoord.w;
    float _1122 = _1118 * _1120;
    float _1124 = in.m_66.x;
    float _1126 = gl_FragCoord.w;
    float _1128 = _1124 * _1126;
    float _1130 = in.m_66.y;
    float _1132 = gl_FragCoord.w;
    float _1134 = _1130 * _1132;
    float _1136 = fma(_1108, 0.2125999927520751953125, _1116);
    float _1138 = in.m_66.z;
    float _1140 = gl_FragCoord.w;
    float _1142 = _1138 * _1140;
    bool _1144 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _1146 = fma(_1112, 0.072200000286102294921875, _1136);
    float _1148 = 1.0 / _1146;
    if (_1144)
    {
        float _1150 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1152 = _1064 + _1150;
        _1114 = _1152;
    }
    float _1154 = _1114;
    float _1156 = _1154;
    if (_1144)
    {
        float _1158 = _1154 * 8.0;
        float _1160 = precise::clamp(_1158, 0.0, 1.0);
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = _1148 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1166 = precise::clamp(_1164, 0.0, 1.0);
    float _1168 = fma(_1166, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1170 = _123 * _1122;
    float _1172 = _1168 * _1170;
    float _1174 = 0.0 + _491;
    float _1176 = precise::clamp(_1174, 0.0, 1.0);
    float _1178 = _123 * _1128;
    float _1180 = _123 * _1134;
    float _1182 = _123 * _1142;
    float _1184 = _1176;
    if (_1144)
    {
        float _1186 = _1176 * _1162;
        _1184 = _1186;
    }
    float _1188 = _1184;
    float _1190 = fma(_1108, _1172, _1178);
    float _1192 = fma(_1110, _1172, _1180);
    float _1194 = fma(_1112, _1172, _1182);
    float _1196 = 0.0 + _1188;
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    out.m_64.x = _1190;
    out.m_64.y = _1192;
    out.m_64.z = _1194;
    out.m_64.w = _1198;
    return out;
}

