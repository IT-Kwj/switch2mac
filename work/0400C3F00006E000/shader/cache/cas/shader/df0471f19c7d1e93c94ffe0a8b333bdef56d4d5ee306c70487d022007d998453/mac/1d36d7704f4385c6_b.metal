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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_48 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_46.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_46.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _94 = (*spvDescriptorSet0.fp_c10)._m0[8].w + _92;
    float _96 = in.m_48.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _104 = (*spvDescriptorSet0.fp_c10)._m0[10].w + _102;
    float _106 = in.m_48.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = abs(_94);
    float _114 = abs(_104);
    float _116 = precise::max(_112, _114);
    float _118 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _122 = _116 >= 16.0;
    float _124 = _104;
    float _126 = _94;
    float _128 = _116;
    if (_122)
    {
        float _130 = _104 * 0.0625;
        _124 = _130;
    }
    float _132 = _124;
    if (_122)
    {
        float _134 = _94 * 0.0625;
        _126 = _134;
    }
    float _136 = _126;
    float _138 = 1.0 / _78;
    float _140 = abs(_132);
    bool _142 = _140 != 0.0;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan(0.0);
    bool _150 = _146 || _148;
    float _152 = abs(_136);
    bool _154 = _152 == 0.0;
    float _156 = abs(_136);
    bool _158 = _156 == 0.0;
    bool _160 = !_150;
    bool _162 = _158 && _160;
    bool _164 = false;
    if (_162)
    {
        bool _166 = as_type<int>(_136) >= 0;
        _164 = _166;
    }
    bool _168 = _164;
    int _171 = 0;
    int _173 = _168 ? (-1) : 0;
    if (_162)
    {
        int _175 = _168 ? 0 : 1078530011;
        _171 = _175;
    }
    int _177 = _171;
    int _179 = _177;
    if (_162)
    {
        int _181 = int(0x80000000) & as_type<int>(_132);
        int _183 = _177 | _181;
        _128 = as_type<float>(_183);
    }
    float _185 = _128;
    bool _187 = !_150;
    bool _189 = _187 && _154;
    float _191 = _185;
    float _193 = _185;
    if (!_189)
    {
        float _195 = abs(_132);
        bool _197 = _195 != as_type<float>(0x7f800000u /* inf */);
        bool _199 = isnan(_195);
        bool _201 = _197 || _199;
        bool _203 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _205 = _201 || _203;
        float _207 = abs(_136);
        bool _209 = _207 == as_type<float>(0x7f800000u /* inf */);
        float _211 = abs(_136);
        bool _213 = _211 == as_type<float>(0x7f800000u /* inf */);
        bool _215 = !_205;
        bool _217 = _213 && _215;
        if (_217)
        {
            bool _219 = as_type<int>(_136) >= 0;
            _173 = _219 ? (-1) : 0;
        }
        int _221 = _173;
        if (_217)
        {
            _179 = 1075235812;
        }
        int _223 = _179;
        int _225 = _223;
        if (_217)
        {
            int _227 = ~_221;
            int _229 = (_227 != 0) ? _223 : 1061752795;
            _225 = _229;
        }
        int _231 = _225;
        if (_217)
        {
            int _233 = int(0x80000000) & as_type<int>(_132);
            int _235 = _231 | _233;
            _191 = as_type<float>(_235);
        }
        float _237 = _191;
        bool _239 = !_205;
        bool _241 = _239 && _209;
        _193 = _237;
        if (!_241)
        {
            float _243 = abs(_132);
            float _245 = abs(_136);
            float _247 = precise::max(_243, _245);
            float _249 = abs(_132);
            float _251 = abs(_136);
            float _253 = precise::min(_249, _251);
            float _255 = 1.0 / _247;
            float _257 = abs(_132);
            float _259 = abs(_136);
            bool _261 = _257 > _259;
            bool _263 = as_type<int>(_136) >= 0;
            float _265 = _253 * _255;
            float _267 = abs(_132);
            float _269 = abs(_136);
            float _271 = _267 + _269;
            int _273 = as_type<int>(_132) & int(0x80000000);
            float _275 = _265 * _265;
            bool _277 = _271 > as_type<float>(0x7f800000u /* inf */);
            bool _279 = isnan(_271);
            bool _281 = _277 || _279;
            bool _283 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _285 = _281 || _283;
            float _287 = _275 + 11.33538818359375;
            float _289 = fma(_275, _287, 28.84246826171875);
            float _291 = fma(_275, _289, 19.6966705322265625);
            float _293 = fma(_275, -0.82336294651031494140625, -5.674867153167724609375);
            float _295 = fma(_275, _293, -6.565555095672607421875);
            float _297 = 1.0 / _291;
            float _299 = _275 * _295;
            float _301 = _265 * _299;
            float _303 = fma(_301, _297, _265);
            float _305 = _303;
            _193 = _271;
            if (_261)
            {
                float _307 = -_303;
                float _309 = _307 + 1.57079637050628662109375;
                _305 = _309;
            }
            float _311 = _305;
            int _313 = as_type<int>(_311);
            if (!_263)
            {
                float _315 = -_311;
                float _317 = _315 + 3.1415927410125732421875;
                _313 = as_type<int>(_317);
            }
            int _319 = _313;
            if (!_285)
            {
                int _321 = _273 | _319;
                _193 = as_type<float>(_321);
            }
        }
    }
    float _323 = _193;
    float _325 = _138 * _110;
    float _327 = _138 * _100;
    float _329 = _138 * _84;
    float _331 = _138 * _90;
    float _333 = _118 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float2 _1395 = float2(_325, _327);
    float _335 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1395, float2(0.0), isnan(_1395))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1395, float2(0.0), isnan(_1395))).w;
    float _337 = fma(_323, -0.3183098733425140380859375, _329);
    float _339 = fma(_331, (*spvDescriptorSet0.fp_c9)._m0[191].y, _333);
    float _341 = _337 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float2 _1418 = float2(_341, _339);
    float2 _345 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1418, float2(0.0), isnan(_1418))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1418, float2(0.0), isnan(_1418))).xz;
    float _347 = _345.x;
    float _349 = _345.y;
    float _351 = in.m_50.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = precise::max(_327, 0.0500000007450580596923828125);
    float _359 = precise::max(_335, 0.25);
    float _361 = _335 * 3.3333332538604736328125;
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = precise::min(_359, 0.300000011920928955078125);
    float _367 = fma(_363, -2.0, 3.0);
    float _369 = _363 * _363;
    float _371 = fma(_365, 19.999996185302734375, -4.99999904632568359375);
    float _373 = _349 * _349;
    float _375 = _367 * _369;
    float _377 = _371 * _371;
    float _379 = fma(_375, _375, -1.0);
    float _381 = precise::max(_373, _377);
    float _383 = _381 + _379;
    float _385 = precise::min(_357, 0.4000000059604644775390625);
    float _387 = precise::max(0.0, _383);
    float _389 = fma(_385, 2.857142925262451171875, -0.14285714924335479736328125);
    float _391 = precise::min(_387, 0.300000011920928955078125);
    float _393 = _391 * 3.3333332538604736328125;
    float _395 = _389 * _393;
    float _397 = _138 * _355;
    float _399 = 0.0 + _395;
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = _401 * _397;
    bool _405 = _403 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _407 = isnan(_403);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _413 = _409 || _411;
    float _415 = in.m_46.z;
    float _417 = gl_FragCoord.w;
    float _419 = _415 * _417;
    float _421 = in.m_46.w;
    float _423 = gl_FragCoord.w;
    float _425 = _421 * _423;
    if (!_413)
    {
        discard_fragment();
    }
    float _427 = _138 * _419;
    float _429 = _138 * _425;
    float _431 = fma(_323, -0.3183098733425140380859375, _427);
    float _433 = fma(_429, (*spvDescriptorSet0.fp_c9)._m0[191].y, _333);
    float _435 = in.m_52.x;
    float _437 = gl_FragCoord.w;
    float _439 = _435 * _437;
    float _441 = in.m_52.y;
    float _443 = gl_FragCoord.w;
    float _445 = _441 * _443;
    float _447 = _431 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _449 = _138 * _439;
    float _451 = _138 * _445;
    float2 _1579 = float2(_449, _451);
    float2 _453 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1579, float2(0.0), isnan(_1579))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1579, float2(0.0), isnan(_1579))).xy;
    float _455 = _453.x;
    float _457 = _453.y;
    float2 _1591 = float2(_447, _433);
    float2 _459 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1591, float2(0.0), isnan(_1591))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1591, float2(0.0), isnan(_1591))).xy;
    float _461 = _459.x;
    float _463 = _459.y;
    float _465 = in.m_54.y;
    float _467 = gl_FragCoord.w;
    float _469 = _465 * _467;
    float _471 = in.m_54.x;
    float _473 = gl_FragCoord.w;
    float _475 = _471 * _473;
    float _477 = in.m_54.z;
    float _479 = gl_FragCoord.w;
    float _481 = _477 * _479;
    float _483 = in.m_56.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = in.m_56.x;
    float _491 = gl_FragCoord.w;
    float _493 = _489 * _491;
    float _495 = in.m_56.z;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_58.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_58.x;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_58.z;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = _138 * _469;
    float _521 = _138 * _475;
    float _523 = _138 * _481;
    float _525 = _138 * _487;
    float _527 = _519 * _519;
    float _529 = _525 * _525;
    float _531 = fma(_521, _521, _527);
    float _533 = _138 * _499;
    float _535 = _138 * _511;
    float _537 = fma(_523, _523, _531);
    float _539 = _138 * _493;
    float _541 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _543 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _541;
    float _545 = rsqrt(_537);
    float _547 = fma(_539, _539, _529);
    float _549 = _347 * _347;
    float _551 = precise::clamp(_549, 0.0, 1.0);
    float _553 = fma(_533, _533, _547);
    float _555 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _557 = _551 + _555;
    float _559 = _138 * _505;
    float _561 = 1.0 / _543;
    float _563 = _138 * _517;
    bool _565 = _551 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _567 = isnan(_551);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = _519 * _545;
    float _579 = rsqrt(_553);
    float _581 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _583 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _581;
    float _585 = _557 * _561;
    float _587 = _559 * _559;
    float _589 = fma(_583, _585, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _591 = fma(_535, _535, _587);
    bool _593 = _551 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _595 = isnan(_551);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _607 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _605;
    float _609 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _611 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _609;
    float _613 = fma(_563, _563, _591);
    float _615 = _525 * _579;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = fma(_607, _585, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _623 = fma(_611, _585, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _625 = _575 * _619;
    float _627 = rsqrt(_613);
    float _629 = -_575;
    float _631 = _629 + 1.0;
    float _633 = _621 * _625;
    float _635 = _589 * _625;
    float _637 = _623 * _625;
    float _639 = fma(_631, (*spvDescriptorSet0.fp_c9)._m0[107].x, _633);
    float _641 = fma(_631, (*spvDescriptorSet0.fp_c9)._m0[107].y, _635);
    float _643 = fma(_631, (*spvDescriptorSet0.fp_c9)._m0[107].z, _637);
    float _645 = fma(_603, (*spvDescriptorSet0.fp_c9)._m0[108].x, _639);
    float _647 = fma(_603, (*spvDescriptorSet0.fp_c9)._m0[108].y, _641);
    float _649 = fma(_603, (*spvDescriptorSet0.fp_c9)._m0[108].z, _643);
    float _651 = _535 * _627;
    float _653 = _559 * _627;
    float _655 = _563 * _627;
    float _657 = fma(_457, -0.5, 0.5);
    float _659 = fma(_463, -0.5, 0.5);
    float _661 = fma(_455, -0.5, 0.5);
    float _663 = fma(_461, -0.5, 0.5);
    float _665 = fma(_457, 0.5, 0.5);
    float _667 = _659 * _657;
    float _669 = fma(_463, 0.5, 0.5);
    float _671 = fma(_455, 0.5, 0.5);
    float _673 = _663 * _661;
    float _675 = fma(_461, 0.5, 0.5);
    float _677 = _669 * _665;
    float _679 = _677 * 2.0;
    float _681 = precise::clamp(_679, 0.0, 1.0);
    float _683 = fma(_667, -2.0, 1.0);
    float _685 = precise::clamp(_683, 0.0, 1.0);
    bool _687 = _665 >= 0.5;
    bool _689 = isnan(_665);
    bool _691 = _687 || _689;
    bool _693 = isnan(0.5);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = _675 * _671;
    float _701 = _699 * 2.0;
    float _703 = precise::clamp(_701, 0.0, 1.0);
    float _705 = fma(_673, -2.0, 1.0);
    float _707 = precise::clamp(_705, 0.0, 1.0);
    float _709 = -_681;
    float _711 = _709 + _685;
    bool _713 = _671 >= 0.5;
    bool _715 = isnan(_671);
    bool _717 = _713 || _715;
    bool _719 = isnan(0.5);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = _653 * _653;
    float _727 = -_703;
    float _729 = _727 + _707;
    float _731 = fma(_697, _711, _681);
    float _733 = fma(_651, _651, _725);
    float _735 = fma(_723, _729, _703);
    float _737 = fma(_731, 2.0, -1.0);
    float _739 = fma(_655, _655, _733);
    float _741 = fma(_735, 2.0, -1.0);
    float _743 = _737 * _737;
    float _745 = _737 * _615;
    float _747 = fma(_741, _741, _743);
    float _749 = precise::clamp(_747, 0.0, 1.0);
    float _751 = rsqrt(_739);
    float _753 = fma(_741, _577, _745);
    float _755 = -_749;
    float _757 = _755 + 1.0;
    float _759 = sqrt(_757);
    float _761 = _653 * _751;
    if (!_413)
    {
        out.m_61.x = _645;
        out.m_61.y = _647;
        out.m_61.z = _649;
        out.m_61.w = _395;
        return out;
    }
    float _763 = abs(_651);
    float _765 = abs(_653);
    float _767 = precise::max(_763, _765);
    float _769 = fma(_761, _759, _753);
    float _771 = abs(_655);
    float _773 = precise::max(_771, _767);
    float _775 = fma(_769, -0.5, 0.5);
    float _777 = 1.0 / _773;
    float _779 = precise::max(_775, 0.100000001490116119384765625);
    float _781 = precise::min(_779, 0.699999988079071044921875);
    float _783 = fma(_781, 1.6666667461395263671875, -0.16666667163372039794921875);
    float _785 = _651 * _777;
    float _787 = _653 * _777;
    float _789 = -_777;
    float _791 = _655 * _789;
    float _793 = precise::min(_783, 1.0);
    float3 _2082 = float3(_785, _787, _791);
    float3 _797 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2082, float3(0.0), isnan(_2082)), level(_793)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2082, float3(0.0), isnan(_2082)), level(_793)).xyz;
    float _799 = _797.x;
    float _801 = _797.y;
    float _803 = _797.z;
    float _805 = in.m_63.y;
    float _807 = gl_FragCoord.w;
    float _809 = _805 * _807;
    float _811 = in.m_63.x;
    float _813 = gl_FragCoord.w;
    float _815 = _811 * _813;
    float _817 = in.m_63.z;
    float _819 = gl_FragCoord.w;
    float _821 = _817 * _819;
    float _823 = _775 * _775;
    float _825 = in.m_65.z;
    float _827 = gl_FragCoord.w;
    float _829 = _825 * _827;
    float _831 = in.m_65.x;
    float _833 = gl_FragCoord.w;
    float _835 = _831 * _833;
    float _837 = in.m_67.y;
    float _839 = gl_FragCoord.w;
    float _841 = _837 * _839;
    float _843 = in.m_67.z;
    float _845 = gl_FragCoord.w;
    float _847 = _843 * _845;
    float _849 = in.m_67.x;
    float _851 = gl_FragCoord.w;
    float _853 = _849 * _851;
    bool _855 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _857 = in.m_65.y;
    float _859 = gl_FragCoord.w;
    float _861 = _857 * _859;
    float _863 = _138 * _809;
    float _865 = _138 * _815;
    float _867 = _138 * _821;
    float _869 = in.m_69.w;
    float _871 = gl_FragCoord.w;
    float _873 = _869 * _871;
    float _875 = _863 * _823;
    float _877 = _865 * _823;
    float _879 = _867 * _823;
    float _881 = in.m_69.x;
    float _883 = gl_FragCoord.w;
    float _885 = _881 * _883;
    float _887 = _875 * 0.715200006961822509765625;
    float _889 = in.m_69.y;
    float _891 = gl_FragCoord.w;
    float _893 = _889 * _891;
    float _895 = _138 * _835;
    float _897 = fma(_877, 0.2125999927520751953125, _887);
    float _899 = fma(_879, 0.072200000286102294921875, _897);
    float _901 = in.m_69.z;
    float _903 = gl_FragCoord.w;
    float _905 = _901 * _903;
    float _907 = 1.0 / _899;
    float _909 = _138 * _873;
    float _911 = _907 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _913 = precise::clamp(_911, 0.0, 1.0);
    float _915 = _138 * _885;
    float _917 = fma(_913, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _919 = _138 * _861;
    float _921 = _138 * _829;
    float _923 = _877 * _917;
    float _925 = _875 * _917;
    float _927 = _879 * _917;
    float _929 = _138 * _841;
    float _931 = _138 * _905;
    float _933 = fma(_801, 0.20999999344348907470703125, _919);
    float _935 = fma(_803, 0.20999999344348907470703125, _921);
    float _937 = fma(_799, 0.20999999344348907470703125, _895);
    float _939 = _138 * _847;
    float _941 = _138 * _853;
    float _943 = _933 + _929;
    float _945 = _935 + _939;
    float _947 = _937 + _941;
    float _949 = fma(_647, _943, _925);
    float _951 = 0.0 + _403;
    float _953 = precise::clamp(_951, 0.0, 1.0);
    float _955 = fma(_649, _945, _927);
    float _957 = fma(_645, _947, _923);
    float _959 = _138 * _893;
    float _961 = fma(_955, _909, _931);
    float _963 = fma(_957, _909, _915);
    float _965 = fma(_949, _909, _959);
    float _967 = _931;
    if (!_855)
    {
        _967 = _953;
    }
    float _969 = _967;
    bool _971 = !_855;
    float _973 = _969;
    if (!_971)
    {
        float _975 = in.m_71.w;
        float _977 = gl_FragCoord.w;
        float _979 = _975 * _977;
        float _981 = in.m_71.z;
        float _983 = gl_FragCoord.w;
        float _985 = _981 * _983;
        float _987 = _138 * _979;
        float _989 = _138 * _985;
        float _991 = 1.0 / _987;
        float _993 = _989 * _991;
        float _995 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _997 = fma(_993, (*spvDescriptorSet0.fp_c8)._m0[30].w, _995);
        float _999 = 1.0 / _997;
        float _1001 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1003 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1005 = fma(_999, _1001, _1003);
        float _1007 = _1005 * 8.0;
        float _1009 = precise::clamp(_1007, 0.0, 1.0);
        float _1011 = _953 * _1009;
        _973 = _1011;
    }
    float _1013 = _973;
    float _1015 = 0.0 + _1013;
    float _1017 = precise::clamp(_1015, 0.0, 1.0);
    out.m_61.x = _963;
    out.m_61.y = _965;
    out.m_61.z = _961;
    out.m_61.w = _1017;
    return out;
}

