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
    texture2d<float> fp_t_tcb_36 [[id(8)]];
    sampler fp_t_tcb_36Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    texturecube<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_36Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_1ESmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_67 [[color(0)]];
};

struct main0_in
{
    float4 m_77 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_60 [[user(locn4), flat]];
    float4 m_48 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
    float4 m_58 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _84 = gl_FragCoord.w;
    float _86 = in.m_48.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_48.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _100 = (*spvDescriptorSet0.fp_c10)._m0[8].w + _98;
    float _102 = in.m_50.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _110 = (*spvDescriptorSet0.fp_c10)._m0[10].w + _108;
    float _112 = in.m_50.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_52.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_52.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = abs(_100);
    float _132 = abs(_110);
    float _134 = precise::max(_130, _132);
    float _136 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _140 = _134 >= 16.0;
    float _142 = _110;
    float _144 = _100;
    float _146 = _134;
    if (_140)
    {
        float _148 = _110 * 0.0625;
        _142 = _148;
    }
    float _150 = _142;
    if (_140)
    {
        float _152 = _100 * 0.0625;
        _144 = _152;
    }
    float _154 = _144;
    float _156 = 1.0 / _84;
    float _158 = abs(_150);
    bool _160 = _158 != 0.0;
    bool _162 = isnan(_158);
    bool _164 = _160 || _162;
    bool _166 = isnan(0.0);
    bool _168 = _164 || _166;
    float _170 = abs(_154);
    bool _172 = _170 == 0.0;
    float _174 = abs(_154);
    bool _176 = _174 == 0.0;
    bool _178 = !_168;
    bool _180 = _176 && _178;
    bool _182 = false;
    if (_180)
    {
        bool _184 = as_type<int>(_154) >= 0;
        _182 = _184;
    }
    bool _186 = _182;
    int _189 = 0;
    int _191 = _186 ? (-1) : 0;
    if (_180)
    {
        int _193 = _186 ? 0 : 1078530011;
        _189 = _193;
    }
    int _195 = _189;
    int _197 = _195;
    if (_180)
    {
        int _199 = int(0x80000000) & as_type<int>(_150);
        int _201 = _195 | _199;
        _146 = as_type<float>(_201);
    }
    float _203 = _146;
    bool _205 = !_168;
    bool _207 = _205 && _172;
    float _209 = _203;
    float _211 = _203;
    if (!_207)
    {
        float _213 = abs(_150);
        bool _215 = _213 != as_type<float>(0x7f800000u /* inf */);
        bool _217 = isnan(_213);
        bool _219 = _215 || _217;
        bool _221 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _223 = _219 || _221;
        float _225 = abs(_154);
        bool _227 = _225 == as_type<float>(0x7f800000u /* inf */);
        float _229 = abs(_154);
        bool _231 = _229 == as_type<float>(0x7f800000u /* inf */);
        bool _233 = !_223;
        bool _235 = _231 && _233;
        if (_235)
        {
            bool _237 = as_type<int>(_154) >= 0;
            _191 = _237 ? (-1) : 0;
        }
        int _239 = _191;
        if (_235)
        {
            _197 = 1075235812;
        }
        int _241 = _197;
        int _243 = _241;
        if (_235)
        {
            int _245 = ~_239;
            int _247 = (_245 != 0) ? _241 : 1061752795;
            _243 = _247;
        }
        int _249 = _243;
        if (_235)
        {
            int _251 = int(0x80000000) & as_type<int>(_150);
            int _253 = _249 | _251;
            _209 = as_type<float>(_253);
        }
        float _255 = _209;
        bool _257 = !_223;
        bool _259 = _257 && _227;
        _211 = _255;
        if (!_259)
        {
            float _261 = abs(_150);
            float _263 = abs(_154);
            float _265 = precise::max(_261, _263);
            float _267 = abs(_150);
            float _269 = abs(_154);
            float _271 = precise::min(_267, _269);
            float _273 = 1.0 / _265;
            float _275 = abs(_150);
            float _277 = abs(_154);
            bool _279 = _275 > _277;
            bool _281 = as_type<int>(_154) >= 0;
            float _283 = _271 * _273;
            float _285 = abs(_150);
            float _287 = abs(_154);
            float _289 = _285 + _287;
            int _291 = as_type<int>(_150) & int(0x80000000);
            float _293 = _283 * _283;
            bool _295 = _289 > as_type<float>(0x7f800000u /* inf */);
            bool _297 = isnan(_289);
            bool _299 = _295 || _297;
            bool _301 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _303 = _299 || _301;
            float _305 = _293 + 11.33538818359375;
            float _307 = fma(_293, _305, 28.84246826171875);
            float _309 = fma(_293, _307, 19.6966705322265625);
            float _311 = fma(_293, -0.82336294651031494140625, -5.674867153167724609375);
            float _313 = fma(_293, _311, -6.565555095672607421875);
            float _315 = 1.0 / _309;
            float _317 = _293 * _313;
            float _319 = _283 * _317;
            float _321 = fma(_319, _315, _283);
            float _323 = _321;
            _211 = _289;
            if (_279)
            {
                float _325 = -_321;
                float _327 = _325 + 1.57079637050628662109375;
                _323 = _327;
            }
            float _329 = _323;
            int _331 = as_type<int>(_329);
            if (!_281)
            {
                float _333 = -_329;
                float _335 = _333 + 3.1415927410125732421875;
                _331 = as_type<int>(_335);
            }
            int _337 = _331;
            if (!_303)
            {
                int _339 = _291 | _337;
                _211 = as_type<float>(_339);
            }
        }
    }
    float _341 = _211;
    float _343 = _156 * _106;
    float _345 = _156 * _116;
    float _347 = _156 * _90;
    float _349 = _156 * _96;
    float _351 = _136 * (*spvDescriptorSet0.fp_c9)._m0[191].z;
    float _353 = _156 * _122;
    float2 _1502 = float2(_343, _345);
    float _355 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1502, float2(0.0), isnan(_1502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1502, float2(0.0), isnan(_1502))).w;
    float _357 = fma(_341, -0.3183098733425140380859375, _347);
    float _359 = fma(_349, (*spvDescriptorSet0.fp_c9)._m0[191].y, _351);
    float _361 = _156 * _128;
    float _363 = fma(_341, -0.9549295902252197265625, _353);
    float _365 = _357 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float2 _1532 = float2(_365, _359);
    float2 _369 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1532, float2(0.0), isnan(_1532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1532, float2(0.0), isnan(_1532))).xz;
    float _371 = _369.x;
    float _373 = _369.y;
    float2 _1544 = float2(_363, _361);
    float _375 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_1544, float2(0.0), isnan(_1544))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_1544, float2(0.0), isnan(_1544))).w;
    float _377 = in.m_54.x;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = fma(_347, 2.0, -1.0);
    float _385 = abs(_383);
    float _387 = -_385;
    float _389 = _387 + 1.0;
    float _391 = precise::max(0.0, _389);
    float _393 = precise::min(_391, 0.5);
    float _395 = precise::max(_355, 0.25);
    float _397 = precise::max(0.0, _355);
    float _399 = fma(_355, 2.5, 0.25);
    float _401 = precise::clamp(_399, 0.0, 1.0);
    float _403 = precise::min(_395, 0.3499999940395355224609375);
    float _405 = precise::min(_397, 0.25);
    float _407 = fma(_403, 10.00000095367431640625, -2.5000002384185791015625);
    float _409 = _373 * _373;
    float _411 = _405 * 4.0;
    float _413 = _407 * _407;
    float _415 = _411 * _411;
    float _417 = precise::max(_409, _413);
    float _419 = fma(_401, -2.0, 3.0);
    float _421 = _401 * _401;
    float _423 = _393 * 2.0;
    float _425 = _375 * _415;
    float _427 = -_413;
    float _429 = _427 + _417;
    float _431 = _419 * _421;
    float _433 = _156 * _381;
    float _435 = fma(_423, _429, _413);
    float _437 = fma(_431, _431, -1.0);
    float _439 = precise::max(0.0, _425);
    float _441 = _435 + _437;
    float _443 = precise::min(_439, 0.5);
    float _445 = precise::max(0.0, _441);
    float _447 = precise::min(_445, 0.3499999940395355224609375);
    float _449 = _443 * 1.60000002384185791015625;
    float _451 = fma(_447, 2.857142925262451171875, _449);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = _453 * _433;
    bool _457 = _455 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _459 = isnan(_455);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _465 = _461 || _463;
    float _467 = in.m_48.z;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_48.w;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    if (!_465)
    {
        discard_fragment();
    }
    float _479 = _156 * _471;
    float _481 = _156 * _477;
    float _483 = in.m_56.y;
    float _485 = gl_FragCoord.w;
    float _487 = _483 * _485;
    float _489 = fma(_341, -0.3183098733425140380859375, _479);
    float _491 = fma(_481, (*spvDescriptorSet0.fp_c9)._m0[191].y, _351);
    float _493 = in.m_56.x;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = _489 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _501 = _156 * _487;
    float _503 = _156 * _497;
    float2 _1733 = float2(_503, _501);
    float2 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1733, float2(0.0), isnan(_1733))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1733, float2(0.0), isnan(_1733))).xy;
    float _507 = _505.x;
    float _509 = _505.y;
    float2 _1745 = float2(_499, _491);
    float2 _511 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1745, float2(0.0), isnan(_1745))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1745, float2(0.0), isnan(_1745))).xy;
    float _513 = _511.x;
    float _515 = _511.y;
    float _517 = in.m_58.y;
    float _519 = gl_FragCoord.w;
    float _521 = _517 * _519;
    float _523 = in.m_58.x;
    float _525 = gl_FragCoord.w;
    float _527 = _523 * _525;
    float _529 = in.m_60.y;
    float _531 = in.m_62.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_58.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_62.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = in.m_62.z;
    float _551 = gl_FragCoord.w;
    float _553 = _549 * _551;
    float _555 = in.m_64.y;
    float _557 = gl_FragCoord.w;
    float _559 = _555 * _557;
    float _561 = in.m_64.x;
    float _563 = gl_FragCoord.w;
    float _565 = _561 * _563;
    float _567 = in.m_64.z;
    float _569 = gl_FragCoord.w;
    float _571 = _567 * _569;
    float _573 = _371 * _371;
    float _575 = precise::clamp(_573, 0.0, 1.0);
    float _577 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _579 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _577;
    float _581 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _583 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _581;
    float _585 = 1.0 / _579;
    float _587 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _589 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _587;
    float _591 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _591;
    float _595 = _156 * _521;
    float _597 = _156 * _527;
    float _599 = _529 * 0.001745329238474369049072265625;
    float _601 = _156 * _535;
    float _603 = _595 * _595;
    float _605 = _156 * _547;
    float _607 = _599 * 0.15915493667125701904296875;
    float _609 = _601 * _601;
    float _611 = fma(_597, _597, _603);
    float _613 = _156 * _541;
    float _615 = _607 * 6.283185482025146484375;
    float _617 = cos(_615);
    float _619 = fma(_605, _605, _609);
    float _621 = _156 * _565;
    float _623 = fma(_613, _613, _611);
    float _625 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _627 = _575 + _625;
    float _629 = _156 * _553;
    float _631 = _156 * _571;
    float _633 = _627 * _585;
    float _635 = fma(_629, _629, _619);
    bool _637 = _575 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _639 = isnan(_575);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = rsqrt(_623);
    float _651 = _156 * _559;
    bool _653 = _575 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _655 = isnan(_575);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = fma(_583, _633, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _667 = -_647;
    float _669 = _667 + 1.0;
    float _671 = _651 * _651;
    float _673 = fma(_589, _633, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _675 = fma(_593, _633, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _677 = rsqrt(_635);
    float _679 = _663 * _669;
    float _681 = fma(_621, _621, _671);
    float _683 = -_663;
    float _685 = _683 + 1.0;
    float _687 = _665 * _679;
    float _689 = fma(_631, _631, _681);
    float _691 = _673 * _679;
    float _693 = _607 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = _675 * _679;
    float _699 = fma(_685, (*spvDescriptorSet0.fp_c9)._m0[107].x, _687);
    float _701 = _595 * _649;
    float _703 = fma(_685, (*spvDescriptorSet0.fp_c9)._m0[107].y, _691);
    float _705 = fma(_685, (*spvDescriptorSet0.fp_c9)._m0[107].z, _697);
    float _707 = rsqrt(_689);
    float _709 = _601 * _677;
    float _711 = fma(_647, (*spvDescriptorSet0.fp_c9)._m0[108].x, _699);
    float _713 = fma(_647, (*spvDescriptorSet0.fp_c9)._m0[108].y, _703);
    float _715 = fma(_647, (*spvDescriptorSet0.fp_c9)._m0[108].z, _705);
    float _717 = _621 * _707;
    float _719 = _631 * _707;
    float _721 = _509 * _617;
    float _723 = _509 * _695;
    float _725 = fma(_507, _695, _721);
    float _727 = -_723;
    float _729 = fma(_507, _617, _727);
    float _731 = _651 * _707;
    float _733 = fma(_515, -0.5, 0.5);
    float _735 = fma(_725, -0.5, 0.5);
    float _737 = fma(_729, -0.5, 0.5);
    float _739 = fma(_513, -0.5, 0.5);
    float _741 = fma(_725, 0.5, 0.5);
    float _743 = _733 * _735;
    float _745 = fma(_515, 0.5, 0.5);
    float _747 = _739 * _737;
    float _749 = fma(_729, 0.5, 0.5);
    float _751 = fma(_513, 0.5, 0.5);
    float _753 = _745 * _741;
    float _755 = _753 * 2.0;
    float _757 = precise::clamp(_755, 0.0, 1.0);
    float _759 = fma(_743, -2.0, 1.0);
    float _761 = precise::clamp(_759, 0.0, 1.0);
    float _763 = fma(_747, -2.0, 1.0);
    float _765 = precise::clamp(_763, 0.0, 1.0);
    float _767 = _751 * _749;
    float _769 = _767 * 2.0;
    float _771 = precise::clamp(_769, 0.0, 1.0);
    bool _773 = _741 >= 0.5;
    bool _775 = isnan(_741);
    bool _777 = _773 || _775;
    bool _779 = isnan(0.5);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -_757;
    float _787 = _785 + _761;
    bool _789 = _749 >= 0.5;
    bool _791 = isnan(_749);
    bool _793 = _789 || _791;
    bool _795 = isnan(0.5);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_771;
    float _803 = _801 + _765;
    float _805 = _731 * _731;
    float _807 = fma(_783, _787, _757);
    float _809 = fma(_799, _803, _771);
    float _811 = fma(_717, _717, _805);
    float _813 = fma(_807, 2.0, -1.0);
    float _815 = fma(_809, 2.0, -1.0);
    float _817 = fma(_719, _719, _811);
    float _819 = _813 * _813;
    float _821 = _813 * _709;
    float _823 = fma(_815, _815, _819);
    float _825 = precise::clamp(_823, 0.0, 1.0);
    float _827 = rsqrt(_817);
    float _829 = fma(_815, _701, _821);
    float _831 = -_825;
    float _833 = _831 + 1.0;
    float _835 = sqrt(_833);
    float _837 = _731 * _827;
    if (!_465)
    {
        out.m_67.x = _711;
        out.m_67.y = _713;
        out.m_67.z = _715;
        out.m_67.w = _453;
        return out;
    }
    float _839 = abs(_717);
    float _841 = abs(_731);
    float _843 = precise::max(_839, _841);
    float _845 = fma(_837, _835, _829);
    float _847 = abs(_719);
    float _849 = precise::max(_847, _843);
    float _851 = fma(_845, -0.5, 0.5);
    float _853 = 1.0 / _849;
    float _855 = precise::max(_851, 0.100000001490116119384765625);
    float _857 = precise::min(_855, 0.699999988079071044921875);
    float _859 = fma(_857, 1.6666667461395263671875, -0.16666667163372039794921875);
    float _861 = _717 * _853;
    float _863 = _731 * _853;
    float _865 = -_853;
    float _867 = _719 * _865;
    float _869 = precise::min(_859, 1.0);
    float3 _2267 = float3(_861, _863, _867);
    float3 _873 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2267, float3(0.0), isnan(_2267)), level(_869)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2267, float3(0.0), isnan(_2267)), level(_869)).xyz;
    float _875 = _873.x;
    float _877 = _873.y;
    float _879 = _873.z;
    float _881 = in.m_69.y;
    float _883 = gl_FragCoord.w;
    float _885 = _881 * _883;
    float _887 = in.m_69.x;
    float _889 = gl_FragCoord.w;
    float _891 = _887 * _889;
    float _893 = in.m_69.z;
    float _895 = gl_FragCoord.w;
    float _897 = _893 * _895;
    float _899 = precise::max(_389, 0.20000000298023223876953125);
    float _901 = -_845;
    float _903 = 0.0 + _901;
    float _905 = precise::clamp(_903, 0.0, 1.0);
    float _907 = in.m_71.y;
    float _909 = gl_FragCoord.w;
    float _911 = _907 * _909;
    float _913 = precise::min(_899, 1.0);
    float _915 = _905 * _905;
    float _917 = in.m_71.z;
    float _919 = gl_FragCoord.w;
    float _921 = _917 * _919;
    float _923 = in.m_73.x;
    float _925 = gl_FragCoord.w;
    float _927 = _923 * _925;
    float _929 = in.m_73.y;
    float _931 = gl_FragCoord.w;
    float _933 = _929 * _931;
    float _935 = fma(_913, 1.25, -0.25);
    float _937 = in.m_73.z;
    float _939 = gl_FragCoord.w;
    float _941 = _937 * _939;
    float _943 = 0.0 + _455;
    float _945 = precise::clamp(_943, 0.0, 1.0);
    float _947 = _935 * _915;
    bool _949 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _951 = _156 * _885;
    float _953 = _156 * _891;
    float _955 = _156 * _897;
    float _957 = in.m_75.x;
    float _959 = gl_FragCoord.w;
    float _961 = _957 * _959;
    float _963 = _951 * _947;
    float _965 = _953 * _947;
    float _967 = in.m_71.x;
    float _969 = gl_FragCoord.w;
    float _971 = _967 * _969;
    float _973 = _955 * _947;
    float _975 = _963 * 0.715200006961822509765625;
    float _977 = in.m_75.w;
    float _979 = gl_FragCoord.w;
    float _981 = _977 * _979;
    float _983 = in.m_75.y;
    float _985 = gl_FragCoord.w;
    float _987 = _983 * _985;
    float _989 = _156 * _921;
    float _991 = fma(_965, 0.2125999927520751953125, _975);
    float _993 = fma(_973, 0.072200000286102294921875, _991);
    float _995 = in.m_75.z;
    float _997 = gl_FragCoord.w;
    float _999 = _995 * _997;
    float _1001 = 1.0 / _993;
    float _1003 = _156 * _961;
    float _1005 = _1001 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1007 = precise::clamp(_1005, 0.0, 1.0);
    float _1009 = _156 * _971;
    float _1011 = fma(_1007, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1013 = _156 * _911;
    float _1015 = _156 * _981;
    float _1017 = _965 * _1011;
    float _1019 = _963 * _1011;
    float _1021 = _973 * _1011;
    float _1023 = _156 * _933;
    float _1025 = _156 * _941;
    float _1027 = _156 * _999;
    float _1029 = fma(_875, 0.20999999344348907470703125, _1009);
    float _1031 = fma(_877, 0.20999999344348907470703125, _1013);
    float _1033 = fma(_879, 0.20999999344348907470703125, _989);
    float _1035 = _156 * _927;
    float _1037 = _1031 + _1023;
    float _1039 = _1033 + _1025;
    float _1041 = _1029 + _1035;
    float _1043 = _156 * _987;
    float _1045 = fma(_713, _1037, _1019);
    float _1047 = fma(_715, _1039, _1021);
    float _1049 = fma(_711, _1041, _1017);
    float _1051 = _1039;
    if (!_949)
    {
        _1051 = _945;
    }
    float _1053 = _1051;
    float _1055 = fma(_1045, _1015, _1043);
    float _1057 = fma(_1047, _1015, _1027);
    float _1059 = fma(_1049, _1015, _1003);
    bool _1061 = !_949;
    float _1063 = _1053;
    if (!_1061)
    {
        float _1065 = in.m_77.w;
        float _1067 = gl_FragCoord.w;
        float _1069 = _1065 * _1067;
        float _1071 = in.m_77.z;
        float _1073 = gl_FragCoord.w;
        float _1075 = _1071 * _1073;
        float _1077 = _156 * _1069;
        float _1079 = _156 * _1075;
        float _1081 = 1.0 / _1077;
        float _1083 = _1079 * _1081;
        float _1085 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1087 = fma(_1083, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1085);
        float _1089 = 1.0 / _1087;
        float _1091 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1093 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1095 = fma(_1089, _1091, _1093);
        float _1097 = _1095 * 8.0;
        float _1099 = precise::clamp(_1097, 0.0, 1.0);
        float _1101 = _945 * _1099;
        _1063 = _1101;
    }
    float _1103 = _1063;
    float _1105 = 0.0 + _1103;
    float _1107 = precise::clamp(_1105, 0.0, 1.0);
    out.m_67.x = _1059;
    out.m_67.y = _1055;
    out.m_67.z = _1057;
    out.m_67.w = _1107;
    return out;
}

