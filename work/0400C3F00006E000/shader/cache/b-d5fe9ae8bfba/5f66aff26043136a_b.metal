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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c7 [[id(4)]];
    constant _16* fp_c15 [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_36 [[id(10)]];
    sampler fp_t_tcb_36Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_34 [[id(12)]];
    sampler fp_t_tcb_34Smplr [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_36Smplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_45 [[user(locn4), flat]];
    float4 m_51 [[user(locn5), flat]];
    float4 m_74 [[user(locn6)]];
    float4 m_53 [[user(locn7), flat]];
    float4 m_47 [[user(locn8), flat]];
    float4 m_55 [[user(locn9)]];
    float4 m_43 [[user(locn10)]];
    float4 m_70 [[user(locn11)]];
    float4 m_72 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _81 = gl_FragCoord.w;
    float _83 = in.m_43.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _91 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _93 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _91;
    float _95 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _97 = -_89;
    float _99 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _97);
    float _101 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _103 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _101;
    float _105 = _93 * _93;
    float _107 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _109 = -_95;
    float _111 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _109);
    float _113 = _99 * _99;
    float _115 = fma(_103, _103, _105);
    float _117 = -_107;
    float _119 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _117);
    float _121 = fma(_111, _111, _113);
    float _123 = in.m_43.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _131 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _129;
    float _133 = in.m_43.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = fma(_119, _119, _121);
    float _141 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _143 = fma(_131, _131, _115);
    float _145 = in.m_45.y;
    float _147 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _141);
    float _149 = rsqrt(_143);
    float _151 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _147);
    float _153 = rsqrt(_139);
    float _155 = rsqrt(_151);
    float _157 = _131 * _149;
    float _159 = _103 * _149;
    float _161 = _93 * _149;
    float _163 = 1.0 / _81;
    float _165 = _111 * _153;
    float _167 = _119 * _153;
    float _169 = _99 * _153;
    float _171 = _157 * _165;
    float _173 = _161 * _167;
    float _175 = _159 * _169;
    float _177 = _155 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _179 = -_171;
    float _181 = fma(_159, _167, _179);
    float _183 = _155 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _185 = -_173;
    float _187 = fma(_157, _169, _185);
    float _189 = -_175;
    float _191 = fma(_161, _165, _189);
    float _193 = _155 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _195 = _177 * _161;
    float _197 = _145 * (-0.0199999995529651641845703125);
    float _199 = _163 * _87;
    float _201 = _183 * _157;
    float _203 = _163 * _127;
    float _205 = _163 * _137;
    float _207 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _209 = _199 + _207;
    float _211 = -_201;
    float _213 = fma(_177, _159, _211);
    float _215 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _217 = _203 + _215;
    float _219 = _193 * _159;
    float _221 = -_195;
    float _223 = fma(_193, _157, _221);
    float _225 = _213 * _209;
    float _227 = _209 * _181;
    float _229 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _231 = _205 + _229;
    float _233 = -_219;
    float _235 = fma(_183, _161, _233);
    float _237 = fma(_223, _217, _225);
    float _239 = fma(_217, _187, _227);
    float _241 = fma(_235, _231, _237);
    float _243 = fma(_231, _191, _239);
    float _245 = _243 * _243;
    float _247 = abs(_241);
    float _249 = abs(_243);
    float _251 = precise::max(_247, _249);
    float _253 = fma(_241, _241, _245);
    bool _256 = _251 >= 16.0;
    float _258 = fma(_241, 0.20000000298023223876953125, 0.100000001490116119384765625);
    float _260 = sqrt(_253);
    float _262 = _243;
    float _264 = _241;
    int _267 = as_type<int>(_239);
    float _269 = 0.20000000298023223876953125;
    if (_256)
    {
        float _271 = _243 * 0.0625;
        _262 = _271;
    }
    float _273 = _262;
    if (_256)
    {
        float _275 = _241 * 0.0625;
        _264 = _275;
    }
    float _277 = _264;
    float _279 = abs(_273);
    bool _281 = _279 != 0.0;
    bool _283 = isnan(_279);
    bool _285 = _281 || _283;
    bool _287 = isnan(0.0);
    bool _289 = _285 || _287;
    float _291 = abs(_277);
    bool _293 = _291 == 0.0;
    float _295 = fma(_260, 0.25, _197);
    float _297 = abs(_277);
    bool _299 = _297 == 0.0;
    bool _301 = !_289;
    bool _303 = _299 && _301;
    bool _305 = false;
    if (_303)
    {
        bool _307 = as_type<int>(_277) >= 0;
        _305 = _307;
    }
    bool _309 = _305;
    int _311 = _309 ? (-1) : 0;
    if (_303)
    {
        int _313 = _309 ? 0 : 1078530011;
        _267 = _313;
    }
    int _315 = _267;
    int _317 = _315;
    if (_303)
    {
        int _319 = int(0x80000000) & as_type<int>(_273);
        int _321 = _315 | _319;
        _269 = as_type<float>(_321);
    }
    float _323 = _269;
    bool _325 = !_289;
    bool _327 = _325 && _293;
    float _329 = _323;
    float _331 = _323;
    if (!_327)
    {
        float _333 = abs(_273);
        bool _335 = _333 != as_type<float>(0x7f800000u /* inf */);
        bool _337 = isnan(_333);
        bool _339 = _335 || _337;
        bool _341 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _343 = _339 || _341;
        float _345 = abs(_277);
        bool _347 = _345 == as_type<float>(0x7f800000u /* inf */);
        float _349 = abs(_277);
        bool _351 = _349 == as_type<float>(0x7f800000u /* inf */);
        bool _353 = !_343;
        bool _355 = _351 && _353;
        if (_355)
        {
            bool _357 = as_type<int>(_277) >= 0;
            _311 = _357 ? (-1) : 0;
        }
        int _359 = _311;
        if (_355)
        {
            _317 = 1075235812;
        }
        int _361 = _317;
        int _363 = _361;
        if (_355)
        {
            int _365 = ~_359;
            int _367 = (_365 != 0) ? _361 : 1061752795;
            _363 = _367;
        }
        int _369 = _363;
        if (_355)
        {
            int _371 = int(0x80000000) & as_type<int>(_273);
            int _373 = _369 | _371;
            _329 = as_type<float>(_373);
        }
        float _375 = _329;
        bool _377 = !_343;
        bool _379 = _377 && _347;
        _331 = _375;
        if (!_379)
        {
            float _381 = abs(_273);
            float _383 = abs(_277);
            float _385 = precise::max(_381, _383);
            float _387 = abs(_273);
            float _389 = abs(_277);
            float _391 = precise::min(_387, _389);
            float _393 = 1.0 / _385;
            float _395 = abs(_273);
            float _397 = abs(_277);
            bool _399 = _395 > _397;
            bool _401 = as_type<int>(_277) >= 0;
            float _403 = _391 * _393;
            float _405 = abs(_273);
            float _407 = abs(_277);
            float _409 = _405 + _407;
            int _411 = as_type<int>(_273) & int(0x80000000);
            float _413 = _403 * _403;
            bool _415 = _409 > as_type<float>(0x7f800000u /* inf */);
            bool _417 = isnan(_409);
            bool _419 = _415 || _417;
            bool _421 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _423 = _419 || _421;
            float _425 = _413 + 11.33538818359375;
            float _427 = fma(_413, _425, 28.84246826171875);
            float _429 = fma(_413, _427, 19.6966705322265625);
            float _431 = fma(_413, -0.82336294651031494140625, -5.674867153167724609375);
            float _433 = fma(_413, _431, -6.565555095672607421875);
            float _435 = 1.0 / _429;
            float _437 = _413 * _433;
            float _439 = _403 * _437;
            float _441 = fma(_439, _435, _403);
            float _443 = _441;
            _331 = _409;
            if (_399)
            {
                float _445 = -_441;
                float _447 = _445 + 1.57079637050628662109375;
                _443 = _447;
            }
            float _449 = _443;
            int _451 = as_type<int>(_449);
            if (!_401)
            {
                float _453 = -_449;
                float _455 = _453 + 3.1415927410125732421875;
                _451 = as_type<int>(_455);
            }
            int _457 = _451;
            if (!_423)
            {
                int _459 = _411 | _457;
                _331 = as_type<float>(_459);
            }
        }
    }
    float _461 = _331;
    float _463 = _461 * 4.7746486663818359375;
    float2 _1675 = float2(_295, _463);
    float _465 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1675, float2(0.0), isnan(_1675))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1675, float2(0.0), isnan(_1675))).w;
    float _467 = in.m_47.x;
    float _469 = in.m_49.x;
    float _471 = gl_FragCoord.w;
    float _473 = _469 * _471;
    float _475 = in.m_49.y;
    float _477 = gl_FragCoord.w;
    float _479 = _475 * _477;
    float _481 = _467 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _483 = _163 * _479;
    float _485 = _260 * _465;
    float _487 = _485 * 0.5;
    float _489 = _163 * _473;
    float _491 = _487 * _481;
    float _493 = fma(_295, _491, _489);
    float _495 = fma(_463, _491, _483);
    float2 _1730;
    _1730.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_493, _495));
    _1730.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_493, _495));
    float _497 = _1730.x;
    float _499 = _497 * 256.0;
    int _501 = int(_499);
    float _503 = in.m_51.y;
    float _505 = in.m_51.x;
    float _507 = in.m_51.z;
    float _509 = -_503;
    float _511 = _509 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _513 = -_505;
    float _515 = _513 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _517 = -_507;
    float _519 = _517 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _521 = -_503;
    float _523 = _199 + _521;
    float _525 = _511 * _511;
    float _527 = -_507;
    float _529 = _205 + _527;
    float _531 = fma(_515, _515, _525);
    float _533 = fma(_519, _519, _531);
    float _535 = rsqrt(_533);
    float _537 = _511 * _535;
    float _539 = _519 * _535;
    float _541 = _515 * _535;
    float _543 = _177 * _537;
    float _545 = _183 * _539;
    float _547 = _193 * _541;
    float _549 = -_543;
    float _551 = fma(_193, _539, _549);
    float _553 = _157 * _213;
    float _555 = -_545;
    float _557 = fma(_177, _541, _555);
    float _559 = _159 * _235;
    float _561 = _161 * _223;
    float _563 = -_553;
    float _565 = fma(_161, _235, _563);
    float _567 = -_547;
    float _569 = fma(_183, _537, _567);
    float _571 = in.m_53.y;
    float _573 = -_559;
    float _575 = fma(_157, _223, _573);
    float _577 = _539 * _557;
    float _579 = _541 * _569;
    float _581 = -_561;
    float _583 = fma(_159, _213, _581);
    float _585 = _537 * _551;
    float _587 = -_577;
    float _589 = fma(_537, _569, _587);
    float _591 = -_579;
    float _593 = fma(_539, _551, _591);
    float _595 = -_505;
    float _597 = _203 + _595;
    float _599 = _557 * _523;
    float _601 = -_585;
    float _603 = fma(_541, _557, _601);
    float _605 = _523 * _593;
    float _607 = _209 * _575;
    float _609 = fma(_551, _597, _599);
    float _611 = fma(_597, _589, _605);
    float _613 = fma(_569, _529, _609);
    float _615 = fma(_217, _565, _607);
    float _617 = fma(_529, _603, _611);
    float _619 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.00999999977648258209228515625, (*spvDescriptorSet0.fp_c7)._m0[0].x);
    float _621 = fma(_231, _583, _615);
    float _623 = _619 + _258;
    float _625 = -_621;
    float _627 = _625 + 0.5;
    float _629 = fma(_613, _571, 0.5);
    float _631 = -_617;
    float _633 = fma(_631, _571, 0.5);
    float2 _1938 = float2(_629, _633);
    float _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_1938, float2(0.0), isnan(_1938))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_1938, float2(0.0), isnan(_1938))).w;
    float _637 = float(uint(_501));
    float _639 = _637 * 0.00390625;
    float _641 = precise::min(_639, 2.0);
    float2 _1955 = float2(_493, _495);
    float _643 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1955, float2(0.0), isnan(_1955)), level(_641)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1955, float2(0.0), isnan(_1955)), level(_641)).w;
    float2 _1964 = float2(_623, _627);
    float3 _647 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1964, float2(0.0), isnan(_1964))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1964, float2(0.0), isnan(_1964))).xyz;
    float _649 = _647.x;
    float _651 = _647.y;
    float _653 = _647.z;
    float _655 = in.m_55.y;
    float _657 = gl_FragCoord.w;
    float _659 = _655 * _657;
    float _661 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _663 = in.m_55.x;
    float _665 = gl_FragCoord.w;
    float _667 = _663 * _665;
    float _669 = in.m_55.z;
    float _671 = gl_FragCoord.w;
    float _673 = _669 * _671;
    float _675 = -_199;
    float _677 = _675 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _679 = -_203;
    float _681 = _679 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _683 = -_205;
    float _685 = _683 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _687 = _163 * _659;
    bool _689 = as_type<int>(_661) != 0;
    float _691 = _163 * _667;
    float _693 = in.m_61.w;
    float _695 = gl_FragCoord.w;
    float _697 = _693 * _695;
    bool _699 = !_689;
    float _701 = -_687;
    float _703 = _699 ? _701 : _687;
    float _705 = _163 * _673;
    bool _707 = !_689;
    float _709 = -_691;
    float _711 = _707 ? _709 : _691;
    float _713 = _703 * _703;
    bool _715 = !_689;
    float _717 = -_705;
    float _719 = _715 ? _717 : _705;
    float _721 = fma(_711, _711, _713);
    float _723 = _677 * _677;
    float _725 = fma(_719, _719, _721);
    float _727 = fma(_681, _681, _723);
    float _729 = rsqrt(_725);
    float _731 = fma(_685, _685, _727);
    float _733 = rsqrt(_731);
    float _735 = _703 * _729;
    float _737 = _711 * _729;
    float _739 = _719 * _729;
    float _741 = _735 * _735;
    float _743 = fma(_737, _737, _741);
    float _745 = _677 * _733;
    float _747 = _681 * _733;
    float _749 = _685 * _733;
    float _751 = fma(_739, _739, _743);
    float _753 = rsqrt(_751);
    float _755 = _735 * _753;
    float _757 = _739 * _753;
    float _759 = _745 * _755;
    float _761 = _737 * _753;
    float _763 = in.m_63.x;
    float _765 = gl_FragCoord.w;
    float _767 = _763 * _765;
    float _769 = fma(_747, _761, _759);
    float _771 = fma(_749, _757, _769);
    float _773 = _163 * _697;
    float _775 = fma(_771, 0.5, 0.5);
    float _777 = in.m_61.z;
    float _779 = gl_FragCoord.w;
    float _781 = _777 * _779;
    float _783 = in.m_61.y;
    float _785 = gl_FragCoord.w;
    float _787 = _783 * _785;
    float _789 = in.m_65.z;
    float _791 = gl_FragCoord.w;
    float _793 = _789 * _791;
    float _795 = _163 * _781;
    float _797 = -_635;
    float _799 = _643 + _797;
    float _801 = _773 + 0.300000011920928955078125;
    float _803 = precise::max(_773, _799);
    float _805 = precise::min(_801, _803);
    float _807 = _163 * _767;
    float _809 = -_773;
    float _811 = _809 + _805;
    float _813 = _811 * 5.0;
    float _815 = 0.0 + _813;
    float _817 = precise::clamp(_815, 0.0, 1.0);
    float _819 = _817 * _807;
    bool _821 = _819 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _823 = isnan(_819);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _829 = _825 || _827;
    float _831 = in.m_61.x;
    float _833 = gl_FragCoord.w;
    float _835 = _831 * _833;
    float _837 = in.m_65.x;
    float _839 = gl_FragCoord.w;
    float _841 = _837 * _839;
    float _843 = in.m_65.y;
    float _845 = gl_FragCoord.w;
    float _847 = _843 * _845;
    if (!_829)
    {
        discard_fragment();
    }
    float _849 = _649 * _649;
    float _851 = _653 * _653;
    float _853 = _163 * _787;
    float _855 = _651 * _651;
    float _857 = fma(_851, (*spvDescriptorSet0.fp_c9)._m0[106].x, _795);
    float _859 = _163 * _835;
    float _861 = _163 * _847;
    float _863 = fma(_849, (*spvDescriptorSet0.fp_c9)._m0[106].x, _859);
    float _865 = _163 * _841;
    float _867 = fma(_855, (*spvDescriptorSet0.fp_c9)._m0[106].x, _853);
    float _869 = _163 * _793;
    float _871 = fma(_775, _865, _863);
    float _873 = fma(_775, _861, _867);
    float _875 = fma(_775, _869, _857);
    if (!_829)
    {
        out.m_68.x = _871;
        out.m_68.y = _873;
        out.m_68.z = _875;
        out.m_68.w = _813;
        return out;
    }
    float _877 = in.m_70.w;
    float _879 = gl_FragCoord.w;
    float _881 = _877 * _879;
    float _883 = _163 * _881;
    bool _885 = _883 != 1.0;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = !_893;
    if (!_895)
    {
        float _897 = gl_FragCoord.x;
        float _899 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _901 = _897 / _899;
        float _903 = gl_FragCoord.y;
        float _905 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _907 = _903 / _905;
        float _909 = _883 * 256.0;
        float _911 = trunc(_909);
        int _913 = int(_911);
        uint _916 = uint(int(uint(_913) >> uint(7)));
        int _918 = int(_916) + _913;
        float _920 = trunc(_901);
        int _922 = int(_920);
        float _924 = trunc(_907);
        int _926 = int(_924);
        int _928 = _922 + 2;
        int _930 = _928 >> 1;
        uint _932 = uint(int(uint(_926) >> uint(1)));
        int _934 = _930 ^ int(_932);
        int _936 = _934 << 16;
        int _938 = _936 ^ _930;
        int _940 = 983055 & _938;
        int _942 = _940 << 6;
        int _944 = _942 + _940;
        int _946 = _944 & 13369548;
        uint _948 = uint(int(uint(_946) >> uint(3)));
        int _950 = _946 | int(_948);
        int _952 = _950 & 5570560;
        int _954 = _950 & 85;
        uint _956 = uint(int(uint(_952) >> uint(15)));
        int _958 = int(_956) + _954;
        bool _960 = uint(_918) > uint(_958);
        if (!_960)
        {
            discard_fragment();
        }
        if (!_960)
        {
            out.m_68.x = _871;
            out.m_68.y = _873;
            out.m_68.z = _875;
            out.m_68.w = _819;
            return out;
        }
    }
    float _962 = _873 * 0.715200006961822509765625;
    float _964 = in.m_72.w;
    float _966 = gl_FragCoord.w;
    float _968 = _964 * _966;
    float _970 = in.m_72.z;
    float _972 = gl_FragCoord.w;
    float _974 = _970 * _972;
    float _976 = in.m_72.x;
    float _978 = gl_FragCoord.w;
    float _980 = _976 * _978;
    float _982 = fma(_871, 0.2125999927520751953125, _962);
    float _984 = in.m_72.y;
    float _986 = gl_FragCoord.w;
    float _988 = _984 * _986;
    float _990 = fma(_875, 0.072200000286102294921875, _982);
    bool _992 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _994 = 0.0 + _819;
    float _996 = precise::clamp(_994, 0.0, 1.0);
    float _998 = 1.0 / _990;
    float _1000 = _998 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = fma(_1002, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1006 = _163 * _968;
    float _1008 = _163 * _974;
    float _1010 = _163 * _988;
    float _1012 = _1004 * _1006;
    float _1014 = _163 * _980;
    float _1016 = fma(_875, _1012, _1008);
    float _1018 = fma(_871, _1012, _1014);
    float _1020 = fma(_873, _1012, _1010);
    float _1022 = _1008;
    if (!_992)
    {
        _1022 = _996;
    }
    float _1024 = _1022;
    bool _1026 = !_992;
    float _1028 = _1024;
    if (!_1026)
    {
        float _1030 = in.m_74.w;
        float _1032 = gl_FragCoord.w;
        float _1034 = _1030 * _1032;
        float _1036 = in.m_74.z;
        float _1038 = gl_FragCoord.w;
        float _1040 = _1036 * _1038;
        float _1042 = _163 * _1034;
        float _1044 = _163 * _1040;
        float _1046 = 1.0 / _1042;
        float _1048 = _1044 * _1046;
        float _1050 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _1052 = fma(_1048, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1050);
        float _1054 = 1.0 / _1052;
        float _1056 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _1058 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1060 = fma(_1054, _1056, _1058);
        float _1062 = _1060 * 8.0;
        float _1064 = precise::clamp(_1062, 0.0, 1.0);
        float _1066 = _996 * _1064;
        _1028 = _1066;
    }
    float _1068 = _1028;
    float _1070 = 0.0 + _1068;
    float _1072 = precise::clamp(_1070, 0.0, 1.0);
    out.m_68.x = _1018;
    out.m_68.y = _1020;
    out.m_68.z = _1016;
    out.m_68.w = _1072;
    return out;
}

