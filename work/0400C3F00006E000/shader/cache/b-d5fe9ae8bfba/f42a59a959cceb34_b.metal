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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_E [[id(2)]];
    sampler fp_t_tcb_ESmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _583 = false;
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = _89 * _81;
    float _99 = _89 * _87;
    float _101 = 1.0 / _91;
    float _103 = fma(_95, 6.2500002968590706586837768554688e-05, 0.5);
    float _105 = fma(_97, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1036 = float2(_103, _105);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1036, float2(0.0), isnan(_1036))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1036, float2(0.0), isnan(_1036))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _93 * _101;
    float _119 = _99 * _101;
    float _121 = fma(_117, 0.5, 0.5);
    float _123 = fma(_119, -0.5, 0.5);
    float2 _1064 = float2(_121, _123);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1064, float2(0.0), isnan(_1064))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1064, float2(0.0), isnan(_1064))).x;
    float2 _1072 = float2(_103, _105);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1072, float2(0.0), isnan(_1072))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1072, float2(0.0), isnan(_1072))).x;
    float2 _1080 = float2(_103, _105);
    float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1080, float2(0.0), isnan(_1080))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1080, float2(0.0), isnan(_1080))).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float _137 = in.m_41.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_43.x;
    float _145 = in.m_41.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_41.z;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_45.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_45.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_45.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = _89 * _141;
    int _178 = as_type<int>(_143) * 192;
    float _180 = _89 * _149;
    float _182 = _89 * _155;
    float _184 = _175 * _175;
    int _186 = _178 + 108;
    uint _189 = uint(int(uint(_186) >> uint(2)));
    uint _191 = uint(int(uint(int(_189)) >> uint(2)));
    int _193 = int(_189) & 3;
    float _195 = (*spvDescriptorSet0.fp_c4)._m0[int(_191)][_193];
    float _197 = in.m_47.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _89 * _167;
    float _205 = fma(_180, _180, _184);
    float _207 = _89 * _161;
    float _209 = _89 * _173;
    float _211 = fma(_182, _182, _205);
    int _213 = _178 + 140;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.fp_c4)._m0[int(_217)][_219];
    float _223 = in.m_47.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = _209 * _209;
    float _231 = rsqrt(_211);
    float _233 = -_195;
    float _235 = _207 + _233;
    float _237 = _195 * _195;
    float _239 = _175 * _231;
    float _241 = _180 * _231;
    float _243 = _182 * _231;
    float _245 = _195 * _221;
    float _247 = _237 * 2.0;
    float _249 = _203 * _241;
    float _251 = _209 * _243;
    float _253 = _245 * _245;
    float _255 = _89 * _201;
    float _257 = _241 * _241;
    float _259 = _239 * _253;
    float _261 = _259 * 2.0;
    float _263 = _89 * _227;
    float _265 = _255 * _255;
    float _267 = _261 * _235;
    float _269 = _249 + _251;
    float _271 = -_267;
    float _273 = fma(_247, _269, _271);
    float _275 = fma(_263, _263, _265);
    float _277 = in.m_47.z;
    float _279 = gl_FragCoord.w;
    float _281 = _277 * _279;
    float _283 = _243 * _243;
    float _285 = _239 * _239;
    float _287 = _257 + _283;
    float _289 = _253 * _285;
    float _291 = -_289;
    float _293 = fma(_237, _287, _291);
    float _295 = _253 * _235;
    float _297 = fma(_203, _203, _229);
    float _299 = _119 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _301 = _119 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _303 = _235 * _295;
    float _305 = -_303;
    float _307 = fma(_237, _297, _305);
    float _309 = _293 * _307;
    float _311 = _309 * 4.0;
    float _313 = _89 * _281;
    float _315 = -_311;
    float _317 = fma(_273, _273, _315);
    float _319 = _293 * 2.0;
    float _321 = fma(_313, _313, _275);
    float _323 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].x, _299);
    float _325 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[7].x, _301);
    float _327 = sqrt(_317);
    float _329 = 1.0 / _319;
    float _331 = rsqrt(_321);
    float _333 = -_273;
    float _335 = -_327;
    float _337 = _333 + _335;
    float _339 = -_273;
    float _341 = _339 + _327;
    float _343 = in.m_39.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = _337 * _329;
    float _351 = _341 * _329;
    float _353 = _255 * _331;
    float _355 = _89 * _347;
    float _357 = fma(_113, 0.07999999821186065673828125, 0.0199999995529651641845703125);
    float _359 = _357 * 100.0;
    float _361 = exp2(_359);
    float _363 = fma(_125, 2.0, -1.0);
    float _365 = fma(_363, (*spvDescriptorSet0.fp_c3)._m0[7].z, _325);
    float _367 = fma(_363, (*spvDescriptorSet0.fp_c3)._m0[6].z, _323);
    float _369 = fma(_361, 512.0, -512.0);
    float _371 = _357 * 5115.0;
    float _373 = _365 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _375 = _367 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _377 = 1.0 / _369;
    float _379 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[9].y, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _381 = _379 + (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _383 = fma(_239, _351, _207);
    float _385 = 1.0 / _373;
    float _387 = -_381;
    float _389 = _387 + _355;
    bool _393 = _383 > _195;
    float _395 = precise::max(0.0, _389);
    float _397 = _371 * _377;
    float _399 = fma(_111, -0.99447572231292724609375, 1.0);
    float _401 = 1.0 / _357;
    float _403 = fma(_239, _349, _207);
    bool _405 = _403 == 0.0;
    float _407 = log2(_397);
    bool _409 = _403 == 0.0;
    bool _411 = _409 && _393;
    float _413 = log2(_399);
    float _415 = fma(_407, _401, 100.0);
    float _417 = _375 * _385;
    float _419 = -_415;
    float _421 = _419 + _395;
    float _423 = _395;
    float _425 = _383;
    if (_411)
    {
        _423 = _349;
    }
    float _427 = _423;
    float _429 = _413 * (-0.0199999995529651641845703125);
    float _431 = _413;
    float _433 = _427;
    float _435 = _427;
    if (_411)
    {
        _431 = _349;
    }
    float _437 = _431;
    bool _439 = _393 && _405;
    float _441 = _437;
    float _443 = _437;
    if (!_439)
    {
        bool _445 = _403 > _195;
        bool _447 = _383 == 0.0;
        bool _449 = _383 == 0.0;
        bool _451 = _449 && _445;
        if (_451)
        {
            _433 = _351;
        }
        float _453 = _433;
        float _455 = _453;
        _435 = _453;
        if (_451)
        {
            _441 = _351;
        }
        float _457 = _441;
        bool _459 = _445 && _447;
        _443 = _457;
        if (!_459)
        {
            bool _461 = _403 < 0.0;
            bool _463 = _461 || _445;
            float _465 = _457;
            if (_463)
            {
                float _467 = 1.0 / _239;
                _465 = _467;
            }
            float _469 = _465;
            if (_463)
            {
                _455 = _351;
            }
            float _471 = _455;
            float _473 = _469;
            float _475 = _471;
            _435 = _471;
            if (_463)
            {
                float _477 = -_207;
                float _479 = fma(_477, _469, -0.0);
                _473 = _479;
            }
            float _481 = _473;
            float _483 = _481;
            _443 = _481;
            if (!_463)
            {
                bool _485 = _383 < 0.0;
                bool _487 = _485 || _393;
                float _489 = _385;
                if (_487)
                {
                    float _491 = 1.0 / _239;
                    _489 = _491;
                }
                float _493 = _489;
                if (!_487)
                {
                    _475 = _351;
                }
                float _495 = _475;
                _435 = _495;
                if (!_487)
                {
                    _483 = _349;
                }
                float _497 = _483;
                float _499 = _497;
                if (_487)
                {
                    _499 = _349;
                }
                float _501 = _499;
                _443 = _501;
                if (_487)
                {
                    float _503 = -_207;
                    float _505 = fma(_503, _493, -0.0);
                    _435 = _505;
                }
            }
        }
    }
    float _507 = _435;
    float _509 = _443;
    float _511 = _283 * _235;
    float _513 = _241 * _239;
    float _515 = fma(_257, _235, _511);
    float _517 = _239 * _243;
    float _519 = -_513;
    float _521 = fma(_203, _519, _515);
    float _523 = -_517;
    float _525 = fma(_209, _523, _521);
    float _527 = _251 * _235;
    float _529 = _203 * _239;
    float _531 = fma(_249, _235, _527);
    float _533 = 1.0 / _525;
    float _535 = _209 * _239;
    float _537 = -_531;
    float _539 = fma(_203, _529, _537);
    float _541 = fma(_209, _535, _539);
    float _543 = _541 * _533;
    bool _545 = _507 >= _543;
    bool _547 = isnan(_507);
    bool _549 = _545 || _547;
    bool _551 = isnan(_543);
    bool _553 = _549 || _551;
    bool _555 = _543 < _509;
    bool _557 = !_553;
    bool _559 = _555 || _557;
    bool _561 = !_559;
    float _581;
    if (!_561)
    {
        bool _563 = _239 >= 0.0;
        bool _565 = isnan(_239);
        bool _567 = _563 || _565;
        bool _569 = isnan(0.0);
        bool _571 = _567 || _569;
        if (!_571)
        {
            _425 = _507;
        }
        float _573 = _425;
        float _575 = _573;
        if (_571)
        {
            float _577 = precise::max(_509, (*spvDescriptorSet0.fp_c3)._m0[8].w);
            _575 = _577;
        }
        float _579 = _575;
        _581 = _579;
        _583 = true;
    }
    else
    {
        float _585 = precise::max(_543, (*spvDescriptorSet0.fp_c3)._m0[8].w);
        _581 = _585;
    }
    _583 = false;
    float _587 = _581;
    int _589 = _178 + 176;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    uint _593 = uint(int(uint(int(_591)) >> uint(2)));
    int _595 = int(_591) & 3;
    float _597 = (*spvDescriptorSet0.fp_c4)._m0[int(_593)][_595];
    int _599 = int(_591) + 1;
    uint _601 = uint(int(uint(_599) >> uint(2)));
    int _603 = _599 & 3;
    float _605 = (*spvDescriptorSet0.fp_c4)._m0[int(_601)][_603];
    float _607 = precise::max(_509, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _609 = precise::max(_507, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _611 = fma(_239, _607, _207);
    float _613 = fma(_241, _607, _203);
    float _615 = fma(_239, _609, _207);
    float _617 = fma(_243, _607, _209);
    float _619 = _611 * _605;
    float _621 = _615 * _605;
    float _623 = fma(_241, _609, _203);
    float _625 = fma(_243, _609, _209);
    float _627 = fma(_613, _597, _619);
    int _629 = _178 + 184;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    uint _633 = uint(int(uint(int(_631)) >> uint(2)));
    int _635 = int(_631) & 3;
    float _637 = (*spvDescriptorSet0.fp_c4)._m0[int(_633)][_635];
    int _639 = int(_631) + 1;
    uint _641 = uint(int(uint(_639) >> uint(2)));
    int _643 = _639 & 3;
    float _645 = (*spvDescriptorSet0.fp_c4)._m0[int(_641)][_643];
    float _647 = fma(_623, _597, _621);
    float _649 = fma(_617, _637, _627);
    float _651 = fma(_625, _637, _647);
    float _653 = _649 + _645;
    float _655 = _651 + _645;
    bool _657 = _653 >= _417;
    bool _659 = isnan(_653);
    bool _661 = _657 || _659;
    bool _663 = isnan(_417);
    bool _665 = _661 || _663;
    bool _667 = _655 < _417;
    bool _669 = !_665;
    bool _671 = _667 && _669;
    float _673 = _257 + _285;
    float _675 = _283 + _673;
    if (_671)
    {
        discard_fragment();
    }
    bool _677 = _655 < _417;
    float _679 = 1.0 / _675;
    float _681 = -_239;
    float _683 = -_249;
    float _685 = fma(_681, _235, _683);
    if (!_665)
    {
        if (_677)
        {
            out.m_50.x = 0.0;
            out.m_50.y = 0.0;
            out.m_50.z = 0.0;
            out.m_50.w = 0.0;
            return out;
        }
    }
    float _687 = -_251;
    float _689 = _687 + _685;
    int _691 = _178 + 112;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c4)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c4)._m0[int(_703)][_705];
    float _709 = precise::min(_653, _655);
    float _711 = _689 * _679;
    float _713 = precise::max(_653, _655);
    float _715 = fma(_115, _115, 1.0);
    float _717 = precise::max(_417, _709);
    float _719 = fma(_239, _711, _207);
    int _721 = _178 + 120;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    uint _725 = uint(int(uint(int(_723)) >> uint(2)));
    int _727 = int(_723) & 3;
    float _729 = (*spvDescriptorSet0.fp_c4)._m0[int(_725)][_727];
    float _731 = fma(_241, _711, _203);
    float _733 = precise::max(_417, _713);
    float _735 = -_195;
    float _737 = _719 + _735;
    float _739 = fma(_243, _711, _209);
    float _741 = fma(_239, _587, _207);
    float _743 = fma(_241, _587, _203);
    float _745 = _737 * _737;
    int _747 = _178 + 128;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.fp_c4)._m0[int(_751)][_753];
    float _757 = fma(_243, _587, _209);
    float _759 = fma(_731, _731, _745);
    float _761 = -_717;
    float _763 = _761 + _733;
    float _765 = fma(_739, _739, _759);
    float _767 = _353 * _763;
    float _769 = _699 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _771 = 1.0 / _195;
    float _773 = abs(_767);
    bool _775 = _773 > 0.00999999977648258209228515625;
    float _777 = -_707;
    float _779 = -_769;
    float _781 = fma(_777, (*spvDescriptorSet0.fp_c3)._m0[10].y, _779);
    float _783 = _115 * 2.0;
    float _785 = -_115;
    float _787 = fma(_785, _115, 1.0);
    float _789 = _775 ? _767 : 0.00999999977648258209228515625;
    float _791 = -_729;
    float _793 = fma(_791, (*spvDescriptorSet0.fp_c3)._m0[10].z, _781);
    float _795 = _357 * _421;
    float _797 = sqrt(_765);
    float _799 = -_195;
    float _801 = _741 + _799;
    float _803 = _357 * _789;
    float _805 = -_783;
    float _807 = fma(_793, _805, _715);
    int _809 = _178 + 124;
    uint _811 = uint(int(uint(_809) >> uint(2)));
    uint _813 = uint(int(uint(int(_811)) >> uint(2)));
    int _815 = int(_811) & 3;
    float _817 = (*spvDescriptorSet0.fp_c4)._m0[int(_813)][_815];
    float _819 = precise::max(_803, -127.0);
    float _821 = -_795;
    float _823 = exp2(_821);
    int _825 = _178 + 136;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.fp_c4)._m0[int(_829)][_831];
    float _835 = -_819;
    float _837 = exp2(_835);
    float _839 = _797 * _771;
    float _841 = precise::clamp(_839, 0.0, 1.0);
    float _843 = _801 * _801;
    float _845 = -_841;
    float _847 = _845 + 1.0;
    float _849 = fma(_743, _743, _843);
    float _851 = abs(_807);
    float _853 = log2(_851);
    float _855 = fma(_757, _757, _849);
    float _857 = 1.0 / _819;
    float _859 = -_837;
    float _861 = _859 + 1.0;
    float _863 = _823 * _861;
    float _865 = _853 * 1.5;
    float _867 = abs(_847);
    float _869 = log2(_867);
    int _871 = _178 + 104;
    uint _873 = uint(int(uint(_871) >> uint(2)));
    uint _875 = uint(int(uint(int(_873)) >> uint(2)));
    int _877 = int(_873) & 3;
    float _879 = (*spvDescriptorSet0.fp_c4)._m0[int(_875)][_877];
    float _881 = _863 * _857;
    float _883 = exp2(_865);
    float _885 = _429 * _881;
    float _887 = _763 * _885;
    float _889 = _869 * _755;
    float _891 = rsqrt(_855);
    int _893 = _178 + 96;
    uint _895 = uint(int(uint(_893) >> uint(2)));
    uint _897 = uint(int(uint(int(_895)) >> uint(2)));
    int _899 = int(_895) & 3;
    float _901 = (*spvDescriptorSet0.fp_c4)._m0[int(_897)][_899];
    int _903 = int(_895) + 1;
    uint _905 = uint(int(uint(_903) >> uint(2)));
    int _907 = _903 & 3;
    float _909 = (*spvDescriptorSet0.fp_c4)._m0[int(_905)][_907];
    float _911 = _883 * 12.56637096405029296875;
    float _913 = -_887;
    float _915 = exp2(_913);
    float _917 = 1.0 / _911;
    float _919 = -_801;
    float _921 = -_817;
    float _923 = fma(_919, _891, _921);
    float _925 = _923 * _833;
    float _927 = precise::clamp(_925, 0.0, 1.0);
    float _929 = exp2(_889);
    float _931 = -_915;
    float _933 = _931 + 1.0;
    float _935 = _131 * _901;
    float _937 = _133 * _909;
    float _939 = precise::min(_933, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _941 = _787 * _917;
    float _943 = _939 * _941;
    float _945 = 0.0 + _929;
    float _947 = precise::clamp(_945, 0.0, 1.0);
    float _949 = _135 * _879;
    float _951 = _927 * _947;
    float _953 = _943 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _955 = _951 * _953;
    float _957 = _935 * _955;
    float _959 = _937 * _955;
    float _961 = _949 * _955;
    out.m_50.x = _957;
    out.m_50.y = _959;
    out.m_50.z = _961;
    out.m_50.w = 0.0;
    return out;
}

