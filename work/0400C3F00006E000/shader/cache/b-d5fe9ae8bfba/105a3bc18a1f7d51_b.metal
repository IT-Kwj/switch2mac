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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_46 [[user(locn2), flat]];
    float4 m_42 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_48 [[user(locn6), flat]];
    float4 m_50 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_46.y;
    float _98 = in.m_48.x;
    float _100 = in.m_48.y;
    float _102 = in.m_44.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = 1.0 / _76;
    float _116 = _96 * (-0.00999999977648258209228515625);
    float _118 = _114 * _82;
    float _120 = _114 * _88;
    float _122 = in.m_42.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = fma(_118, 2.0, -1.0);
    float _130 = fma(_120, 2.0, -1.0);
    float _132 = in.m_42.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _130 * _130;
    float _140 = abs(_128);
    float _142 = abs(_130);
    float _144 = precise::max(_140, _142);
    float _146 = fma(_128, _128, _138);
    bool _150 = _144 >= 16.0;
    float _152 = _114 * _94;
    float _154 = fma(_116, (*spvDescriptorSet0.fp_c9)._m0[191].x, _146);
    float _156 = 1.0 / _152;
    float _158 = _130;
    float _160 = _128;
    int _163 = as_type<int>(_96);
    if (_150)
    {
        float _165 = _130 * 0.0625;
        _158 = _165;
    }
    float _167 = _158;
    if (_150)
    {
        float _169 = _128 * 0.0625;
        _160 = _169;
    }
    float _171 = _160;
    float _173 = abs(_167);
    bool _175 = _173 != 0.0;
    bool _177 = isnan(_173);
    bool _179 = _175 || _177;
    bool _181 = isnan(0.0);
    bool _183 = _179 || _181;
    float _185 = abs(_171);
    bool _187 = _185 == 0.0;
    float _189 = abs(_171);
    bool _191 = _189 == 0.0;
    bool _193 = !_183;
    bool _195 = _191 && _193;
    bool _197 = false;
    if (_195)
    {
        bool _199 = as_type<int>(_171) >= 0;
        _197 = _199;
    }
    bool _201 = _197;
    int _203 = _201 ? (-1) : 0;
    if (_195)
    {
        int _205 = _201 ? 0 : 1078530011;
        _163 = _205;
    }
    int _207 = _163;
    int _209 = _207;
    if (_195)
    {
        int _211 = int(0x80000000) & as_type<int>(_167);
        int _213 = _207 | _211;
        _209 = _213;
    }
    int _215 = _209;
    bool _217 = !_183;
    bool _219 = _217 && _187;
    int _221 = _215;
    float _223 = as_type<float>(_215);
    if (!_219)
    {
        float _225 = abs(_167);
        bool _227 = _225 != as_type<float>(0x7f800000u /* inf */);
        bool _229 = isnan(_225);
        bool _231 = _227 || _229;
        bool _233 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _235 = _231 || _233;
        float _237 = abs(_171);
        bool _239 = _237 == as_type<float>(0x7f800000u /* inf */);
        float _241 = abs(_171);
        bool _243 = _241 == as_type<float>(0x7f800000u /* inf */);
        bool _245 = !_235;
        bool _247 = _243 && _245;
        if (_247)
        {
            bool _249 = as_type<int>(_171) >= 0;
            _203 = _249 ? (-1) : 0;
        }
        int _251 = _203;
        if (_247)
        {
            _221 = 1075235812;
        }
        int _253 = _221;
        int _255 = _253;
        if (_247)
        {
            int _257 = ~_251;
            int _259 = (_257 != 0) ? _253 : 1061752795;
            _255 = _259;
        }
        int _261 = _255;
        float _263 = as_type<float>(_261);
        if (_247)
        {
            int _265 = int(0x80000000) & as_type<int>(_167);
            int _267 = _261 | _265;
            _263 = as_type<float>(_267);
        }
        float _269 = _263;
        bool _271 = !_235;
        bool _273 = _271 && _239;
        _223 = _269;
        if (!_273)
        {
            float _275 = abs(_171);
            float _277 = abs(_167);
            float _279 = precise::max(_275, _277);
            float _281 = abs(_171);
            float _283 = abs(_167);
            float _285 = precise::min(_281, _283);
            float _287 = 1.0 / _279;
            float _289 = abs(_167);
            float _291 = abs(_171);
            bool _293 = _289 > _291;
            bool _295 = as_type<int>(_171) >= 0;
            float _297 = _285 * _287;
            float _299 = _297 * _297;
            float _301 = _299 + 11.33538818359375;
            float _303 = fma(_299, _301, 28.84246826171875);
            float _305 = fma(_299, _303, 19.6966705322265625);
            float _307 = fma(_299, -0.82336294651031494140625, -5.674867153167724609375);
            float _309 = fma(_299, _307, -6.565555095672607421875);
            float _311 = 1.0 / _305;
            float _313 = _299 * _309;
            float _315 = abs(_171);
            float _317 = abs(_167);
            float _319 = _315 + _317;
            int _321 = as_type<int>(_167) & int(0x80000000);
            float _323 = _297 * _313;
            bool _325 = _319 > as_type<float>(0x7f800000u /* inf */);
            bool _327 = isnan(_319);
            bool _329 = _325 || _327;
            bool _331 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _333 = _329 || _331;
            float _335 = fma(_323, _311, _297);
            float _337 = _335;
            _223 = _319;
            if (_293)
            {
                float _339 = -_335;
                float _341 = _339 + 1.57079637050628662109375;
                _337 = _341;
            }
            float _343 = _337;
            int _345 = as_type<int>(_343);
            if (!_295)
            {
                float _347 = -_343;
                float _349 = _347 + 3.1415927410125732421875;
                _345 = as_type<int>(_349);
            }
            int _351 = _345;
            if (!_333)
            {
                int _353 = _321 | _351;
                _223 = as_type<float>(_353);
            }
        }
    }
    float _355 = _223;
    float _357 = _355 * 0.159154951572418212890625;
    float _359 = _114 * _106;
    float _361 = _114 * _112;
    float _363 = _154 + _98;
    float _365 = abs(_357);
    float _367 = _100 + _365;
    float _369 = _359 * _156;
    float _371 = _361 * _156;
    float _373 = _114 * _136;
    float _375 = _114 * _126;
    float2 _1194 = float2(_363, _367);
    float _377 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1194, float2(0.0), isnan(_1194))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1194, float2(0.0), isnan(_1194))).w;
    float2 _1204 = float2(_369, _371);
    float _379 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1204, float2(0.0), isnan(_1204))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1204, float2(0.0), isnan(_1204))).x;
    float2 _1212 = float2(_375, _373);
    float _381 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1212, float2(0.0), isnan(_1212))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1212, float2(0.0), isnan(_1212))).w;
    float _383 = in.m_44.z;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_50.w;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_52.w;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = in.m_54.x;
    float _403 = gl_FragCoord.w;
    float _405 = _401 * _403;
    float _407 = _114 * _387;
    float _409 = _114 * _393;
    float _411 = _407 * _156;
    float _413 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _415 = fma(_411, (*spvDescriptorSet0.fp_c8)._m0[30].w, _413);
    float _417 = 1.0 / _415;
    float _419 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _421 = _417 * _419;
    float _423 = in.m_52.y;
    float _425 = gl_FragCoord.w;
    float _427 = _423 * _425;
    float _429 = in.m_52.z;
    float _431 = gl_FragCoord.w;
    float _433 = _429 * _431;
    float _435 = _377 * _409;
    float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _439 = fma(_379, (*spvDescriptorSet0.fp_c8)._m0[30].w, _437);
    float _441 = precise::max(_435, 0.20000000298023223876953125);
    float _443 = 1.0 / _439;
    float _445 = precise::max(0.0, _381);
    float _447 = precise::min(_441, 0.5);
    float _449 = precise::min(_445, 0.800000011920928955078125);
    float _451 = fma(_447, 0.833333313465118408203125, -0.16666667163372039794921875);
    float _453 = fma(_449, 1.25, _451);
    float _455 = precise::clamp(_453, 0.0, 1.0);
    float _457 = _114 * _399;
    float _459 = _114 * _405;
    float _461 = fma(_409, 0.25, _455);
    float _463 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _465 = -_421;
    float _467 = fma(_443, _463, _465);
    float _469 = _457 * _461;
    float _471 = abs(_467);
    bool _473 = _471 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _475 = float(_473);
    float _477 = 0.0 + _469;
    float _479 = precise::clamp(_477, 0.0, 1.0);
    float _481 = _479 * _475;
    float _483 = _481 * _459;
    bool _485 = _483 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _487 = isnan(_483);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _493 = _489 || _491;
    float _495 = in.m_56.x;
    float _497 = gl_FragCoord.w;
    float _499 = _495 * _497;
    float _501 = in.m_56.y;
    float _503 = gl_FragCoord.w;
    float _505 = _501 * _503;
    float _507 = in.m_56.z;
    float _509 = gl_FragCoord.w;
    float _511 = _507 * _509;
    float _513 = in.m_52.x;
    float _515 = gl_FragCoord.w;
    float _517 = _513 * _515;
    float _519 = _421;
    if (!_493)
    {
        discard_fragment();
    }
    float _521 = _114 * _427;
    float _523 = _114 * _499;
    float _525 = _114 * _505;
    float _527 = _114 * _511;
    float _529 = _114 * _517;
    float _531 = _114 * _433;
    float _533 = -_525;
    float _535 = _533 + _521;
    float _537 = -_523;
    float _539 = _537 + _529;
    float _541 = -_527;
    float _543 = _541 + _531;
    float _545 = fma(_455, _535, _525);
    float _547 = fma(_455, _539, _523);
    float _549 = fma(_455, _543, _527);
    if (!_493)
    {
        out.m_59.x = _547;
        out.m_59.y = _545;
        out.m_59.z = _549;
        out.m_59.w = _469;
        return out;
    }
    float _551 = in.m_61.y;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_61.x;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_61.z;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = _114 * _555;
    float _571 = _114 * _561;
    float _573 = _114 * _567;
    float _575 = _569 * _569;
    float _577 = in.m_63.x;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = fma(_571, _571, _575);
    float _585 = fma(_573, _573, _583);
    float _587 = rsqrt(_585);
    float _589 = _571 * _587;
    float _591 = _569 * _587;
    float _593 = _573 * _587;
    float _595 = _114 * _581;
    float _597 = abs(_589);
    float _599 = abs(_591);
    float _601 = precise::max(_597, _599);
    float _603 = precise::min(_595, 1.0);
    float _605 = abs(_593);
    float _607 = precise::max(_605, _601);
    float _609 = 1.0 / _607;
    float _611 = -_609;
    float _613 = _593 * _611;
    float _615 = _589 * _609;
    float _617 = _591 * _609;
    float3 _1559 = float3(_615, _617, _613);
    float3 _621 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1559, float3(0.0), isnan(_1559)), level(_603)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1559, float3(0.0), isnan(_1559)), level(_603)).xyz;
    float _623 = _621.x;
    float _625 = _621.y;
    float _627 = _621.z;
    float _629 = in.m_65.x;
    float _631 = gl_FragCoord.w;
    float _633 = _629 * _631;
    float _635 = in.m_65.z;
    float _637 = gl_FragCoord.w;
    float _639 = _635 * _637;
    float _641 = in.m_65.y;
    float _643 = gl_FragCoord.w;
    float _645 = _641 * _643;
    float _647 = in.m_67.z;
    float _649 = gl_FragCoord.w;
    float _651 = _647 * _649;
    float _653 = in.m_67.x;
    float _655 = gl_FragCoord.w;
    float _657 = _653 * _655;
    float _659 = in.m_67.y;
    float _661 = gl_FragCoord.w;
    float _663 = _659 * _661;
    float _665 = in.m_69.x;
    float _667 = gl_FragCoord.w;
    float _669 = _665 * _667;
    float _671 = in.m_69.y;
    float _673 = gl_FragCoord.w;
    float _675 = _671 * _673;
    float _677 = in.m_69.z;
    float _679 = gl_FragCoord.w;
    float _681 = _677 * _679;
    float _683 = in.m_69.w;
    float _685 = gl_FragCoord.w;
    float _687 = _683 * _685;
    bool _689 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_689)
    {
        float _691 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _693 = _421 + _691;
        _519 = _693;
    }
    float _695 = _519;
    float _697 = _695;
    if (_689)
    {
        float _699 = _695 * 8.0;
        float _701 = precise::clamp(_699, 0.0, 1.0);
        _697 = _701;
    }
    float _703 = _697;
    float _705 = _114 * _633;
    float _707 = _114 * _639;
    float _709 = _114 * _651;
    float _711 = _114 * _657;
    float _713 = _114 * _663;
    float _715 = _114 * _675;
    float _717 = fma(_623, 0.20999999344348907470703125, _705);
    float _719 = _114 * _645;
    float _721 = fma(_627, 0.20999999344348907470703125, _707);
    float _723 = _114 * _669;
    float _725 = _717 + _711;
    float _727 = fma(_625, 0.20999999344348907470703125, _719);
    float _729 = _721 + _709;
    float _731 = 0.0 + _483;
    float _733 = precise::clamp(_731, 0.0, 1.0);
    float _735 = _114 * _681;
    float _737 = _727 + _713;
    float _739 = _114 * _687;
    float _741 = _547 * _725;
    float _743 = _549 * _729;
    float _745 = _545 * _737;
    float _747 = _733;
    if (_689)
    {
        float _749 = _733 * _703;
        _747 = _749;
    }
    float _751 = _747;
    float _753 = fma(_741, _739, _723);
    float _755 = fma(_743, _739, _735);
    float _757 = fma(_745, _739, _715);
    float _759 = 0.0 + _751;
    float _761 = precise::clamp(_759, 0.0, 1.0);
    out.m_59.x = _753;
    out.m_59.y = _757;
    out.m_59.z = _755;
    out.m_59.w = _761;
    return out;
}

