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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_33 [[user(locn3), flat]];
    float4 m_31 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _527 = false;
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_31.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float _85 = fma(_81, 0.5, 0.5);
    float _87 = fma(_83, -0.5, 0.5);
    float2 _971 = float2(_85, _87);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_971, float2(0.0), isnan(_971))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_971, float2(0.0), isnan(_971))).x;
    float _91 = in.m_33.x;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_35.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_37.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_37.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_39.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_39.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    int _142 = as_type<int>(_91) * 192;
    float _144 = _71 * _97;
    float _146 = _71 * _103;
    float _148 = _71 * _109;
    int _150 = _142 + 108;
    uint _153 = uint(int(uint(_150) >> uint(2)));
    uint _155 = uint(int(uint(int(_153)) >> uint(2)));
    int _157 = int(_153) & 3;
    float _159 = (*spvDescriptorSet0.fp_c4)._m0[int(_155)][_157];
    float _161 = _144 * _144;
    float _163 = _71 * _115;
    float _165 = _71 * _121;
    float _167 = _71 * _127;
    float _169 = fma(_146, _146, _161);
    float _171 = _71 * _139;
    float _173 = _165 * _165;
    int _175 = _142 + 140;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    uint _179 = uint(int(uint(int(_177)) >> uint(2)));
    int _181 = int(_177) & 3;
    float _183 = (*spvDescriptorSet0.fp_c4)._m0[int(_179)][_181];
    float _185 = fma(_148, _148, _169);
    float _187 = fma(_167, _167, _173);
    float _189 = rsqrt(_185);
    float _191 = -_159;
    float _193 = _163 + _191;
    float _195 = _144 * _189;
    float _197 = _159 * _183;
    float _199 = _146 * _189;
    float _201 = _148 * _189;
    float _203 = _195 * _195;
    float _205 = _197 * _197;
    float _207 = _159 * _159;
    float _209 = _199 * _199;
    float _211 = _167 * _199;
    float _213 = _205 * _193;
    float _215 = _195 * _205;
    float _217 = _215 * 2.0;
    float _219 = _205 * _203;
    float _221 = _165 * _201;
    float _223 = _193 * _213;
    float _225 = _217 * _193;
    float _227 = _207 * 2.0;
    float _229 = _211 + _221;
    float _231 = -_223;
    float _233 = fma(_207, _187, _231);
    float _235 = _201 * _201;
    float _237 = in.m_39.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = -_225;
    float _245 = fma(_227, _229, _243);
    float _247 = _209 + _235;
    float _249 = -_219;
    float _251 = fma(_207, _247, _249);
    float _253 = _71 * _133;
    float _255 = _251 * _233;
    float _257 = _255 * 4.0;
    float _259 = _251 * 2.0;
    float _261 = _253 * _253;
    float _263 = -_257;
    float _265 = fma(_245, _245, _263);
    float _267 = fma(_171, _171, _261);
    float _269 = 1.0 / _259;
    float _271 = in.m_41.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = fma((*spvDescriptorSet0.fp_c3)._m0[12].x, 0.07999999821186065673828125, 0.0199999995529651641845703125);
    float _279 = sqrt(_265);
    float _281 = _71 * _241;
    float _283 = fma(_281, _281, _267);
    float _285 = _277 * 100.0;
    float _287 = -_245;
    float _289 = -_279;
    float _291 = _287 + _289;
    float _293 = -_245;
    float _295 = _293 + _279;
    float _297 = _83 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _299 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _301 = exp2(_285);
    float _303 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[6].x, _297);
    float _305 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, _299);
    float _307 = _295 * _269;
    float _309 = _291 * _269;
    float _311 = _71 * _275;
    float _313 = fma(_195, _307, _163);
    float _315 = fma(_195, _309, _163);
    bool _319 = _313 > _159;
    bool _321 = _315 == 0.0;
    float _323 = fma(_301, 512.0, -512.0);
    bool _325 = _315 == 0.0;
    bool _327 = _325 && _319;
    float _329 = _275;
    if (_327)
    {
        _329 = _309;
    }
    float _331 = _329;
    float _333 = fma(_89, 2.0, -1.0);
    float _335 = fma(_333, (*spvDescriptorSet0.fp_c3)._m0[7].z, _305);
    float _337 = fma(_333, (*spvDescriptorSet0.fp_c3)._m0[6].z, _303);
    float _339 = _335 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _341 = _337 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _343 = _337;
    float _345 = _331;
    float _347 = _331;
    if (_327)
    {
        _343 = _309;
    }
    float _349 = _343;
    float _351 = 1.0 / _339;
    float _353 = _341 * _351;
    bool _355 = _319 && _321;
    float _357 = _349;
    float _359 = _349;
    if (!_355)
    {
        bool _361 = _315 > _159;
        bool _363 = _313 == 0.0;
        bool _365 = _313 == 0.0;
        bool _367 = _365 && _361;
        if (_367)
        {
            _345 = _307;
        }
        float _369 = _345;
        float _371 = _369;
        _347 = _369;
        if (_367)
        {
            _357 = _307;
        }
        float _373 = _357;
        bool _375 = _361 && _363;
        _359 = _373;
        if (!_375)
        {
            bool _377 = _315 < 0.0;
            bool _379 = _377 || _361;
            float _381 = _373;
            if (_379)
            {
                float _383 = 1.0 / _195;
                _381 = _383;
            }
            float _385 = _381;
            if (_379)
            {
                _371 = _307;
            }
            float _387 = _371;
            float _389 = _385;
            float _391 = _387;
            _347 = _387;
            if (_379)
            {
                float _393 = -_163;
                float _395 = fma(_393, _385, -0.0);
                _389 = _395;
            }
            float _397 = _389;
            float _399 = _397;
            _359 = _397;
            if (!_379)
            {
                bool _401 = _313 < 0.0;
                bool _403 = _401 || _319;
                float _405 = _351;
                if (_403)
                {
                    float _407 = 1.0 / _195;
                    _405 = _407;
                }
                float _409 = _405;
                if (!_403)
                {
                    _391 = _307;
                }
                float _411 = _391;
                _347 = _411;
                if (!_403)
                {
                    _399 = _309;
                }
                float _413 = _399;
                float _415 = _413;
                if (_403)
                {
                    _415 = _309;
                }
                float _417 = _415;
                _359 = _417;
                if (_403)
                {
                    float _419 = -_163;
                    float _421 = fma(_419, _409, -0.0);
                    _347 = _421;
                }
            }
        }
    }
    float _423 = _347;
    float _425 = _359;
    float _427 = _235 * _193;
    float _429 = 1.0 / _323;
    float _431 = _199 * _195;
    float _433 = _195 * _201;
    float _435 = fma(_209, _193, _427);
    float _437 = _221 * _193;
    float _439 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _441 = _311 + _439;
    float _443 = -_431;
    float _445 = fma(_167, _443, _435);
    float _447 = rsqrt(_283);
    float _449 = precise::max(0.0, _441);
    float _451 = -_433;
    float _453 = fma(_165, _451, _445);
    float _455 = _277 * 5115.0;
    float _457 = _167 * _195;
    float _459 = 1.0 / _453;
    float _461 = _455 * _429;
    float _463 = fma(_211, _193, _437);
    float _465 = -_463;
    float _467 = fma(_167, _457, _465);
    float _469 = _165 * _195;
    float _471 = 1.0 / _277;
    float _473 = fma(_165, _469, _467);
    float _475 = _253 * _447;
    float _477 = _473 * _459;
    float _479 = log2(_461);
    bool _481 = _423 >= _477;
    bool _483 = isnan(_423);
    bool _485 = _481 || _483;
    bool _487 = isnan(_477);
    bool _489 = _485 || _487;
    bool _491 = _477 < _425;
    bool _493 = !_489;
    bool _495 = _491 || _493;
    float _497 = fma(_479, _471, 100.0);
    float _499 = -_497;
    float _501 = _449 + _499;
    bool _503 = !_495;
    float _505 = _477;
    float _525;
    if (!_503)
    {
        bool _507 = _195 >= 0.0;
        bool _509 = isnan(_195);
        bool _511 = _507 || _509;
        bool _513 = isnan(0.0);
        bool _515 = _511 || _513;
        if (!_515)
        {
            _505 = _423;
        }
        float _517 = _505;
        float _519 = _517;
        if (_515)
        {
            float _521 = precise::max(_425, (*spvDescriptorSet0.fp_c3)._m0[8].w);
            _519 = _521;
        }
        float _523 = _519;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = precise::max(_477, (*spvDescriptorSet0.fp_c3)._m0[8].w);
        _525 = _529;
    }
    _527 = false;
    float _531 = _525;
    int _533 = _142 + 176;
    uint _535 = uint(int(uint(_533) >> uint(2)));
    uint _537 = uint(int(uint(int(_535)) >> uint(2)));
    int _539 = int(_535) & 3;
    float _541 = (*spvDescriptorSet0.fp_c4)._m0[int(_537)][_539];
    int _543 = int(_535) + 1;
    uint _545 = uint(int(uint(_543) >> uint(2)));
    int _547 = _543 & 3;
    float _549 = (*spvDescriptorSet0.fp_c4)._m0[int(_545)][_547];
    float _551 = precise::max(_425, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _553 = precise::max(_423, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _555 = fma(_195, _551, _163);
    float _557 = fma(_199, _551, _167);
    int _559 = _142 + 184;
    uint _561 = uint(int(uint(_559) >> uint(2)));
    uint _563 = uint(int(uint(int(_561)) >> uint(2)));
    int _565 = int(_561) & 3;
    float _567 = (*spvDescriptorSet0.fp_c4)._m0[int(_563)][_565];
    int _569 = int(_561) + 1;
    uint _571 = uint(int(uint(_569) >> uint(2)));
    int _573 = _569 & 3;
    float _575 = (*spvDescriptorSet0.fp_c4)._m0[int(_571)][_573];
    float _577 = fma(_195, _553, _163);
    float _579 = fma(_199, _553, _167);
    float _581 = _555 * _549;
    float _583 = _577 * _549;
    float _585 = fma(_201, _551, _165);
    float _587 = fma(_557, _541, _581);
    float _589 = fma(_579, _541, _583);
    float _591 = fma(_201, _553, _165);
    float _593 = fma(_585, _567, _587);
    float _595 = fma(_591, _567, _589);
    float _597 = _593 + _575;
    float _599 = _595 + _575;
    bool _601 = _597 >= _353;
    bool _603 = isnan(_597);
    bool _605 = _601 || _603;
    bool _607 = isnan(_353);
    bool _609 = _605 || _607;
    bool _611 = _599 < _353;
    bool _613 = !_609;
    bool _615 = _611 && _613;
    float _617 = _209 + _203;
    float _619 = _235 + _617;
    if (_615)
    {
        discard_fragment();
    }
    bool _621 = _599 < _353;
    float _623 = 1.0 / _619;
    float _625 = -_195;
    float _627 = -_211;
    float _629 = fma(_625, _193, _627);
    if (!_609)
    {
        if (_621)
        {
            out.m_44.x = 0.0;
            out.m_44.y = 0.0;
            out.m_44.z = 0.0;
            out.m_44.w = 0.0;
            return out;
        }
    }
    float _631 = -_221;
    float _633 = _631 + _629;
    int _635 = _142 + 112;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    uint _639 = uint(int(uint(int(_637)) >> uint(2)));
    int _641 = int(_637) & 3;
    float _643 = (*spvDescriptorSet0.fp_c4)._m0[int(_639)][_641];
    int _645 = int(_637) + 1;
    uint _647 = uint(int(uint(_645) >> uint(2)));
    int _649 = _645 & 3;
    float _651 = (*spvDescriptorSet0.fp_c4)._m0[int(_647)][_649];
    float _653 = precise::min(_597, _599);
    float _655 = _277 * _501;
    float _657 = _633 * _623;
    float _659 = precise::max(_597, _599);
    float _661 = precise::max(_353, _653);
    float _663 = fma(_195, _657, _163);
    int _665 = _142 + 120;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.fp_c4)._m0[int(_669)][_671];
    float _675 = precise::max(_353, _659);
    float _677 = -_655;
    float _679 = exp2(_677);
    float _681 = -_159;
    float _683 = _663 + _681;
    float _685 = fma(_199, _657, _167);
    float _687 = fma(_201, _657, _165);
    float _689 = fma(_195, _531, _163);
    float _691 = _683 * _683;
    float _693 = fma(_199, _531, _167);
    float _695 = fma(_201, _531, _165);
    int _697 = _142 + 104;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    uint _701 = uint(int(uint(int(_699)) >> uint(2)));
    int _703 = int(_699) & 3;
    float _705 = (*spvDescriptorSet0.fp_c4)._m0[int(_701)][_703];
    float _707 = fma(_685, _685, _691);
    float _709 = -_661;
    float _711 = _709 + _675;
    float _713 = 1.0 / _159;
    float _715 = fma(_687, _687, _707);
    float _717 = _643 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _719 = _475 * _711;
    float _721 = -_651;
    float _723 = -_717;
    float _725 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[10].y, _723);
    float _727 = sqrt(_715);
    float _729 = abs(_719);
    bool _731 = _729 > 0.00999999977648258209228515625;
    float _733 = -_673;
    float _735 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[10].z, _725);
    float _737 = -_159;
    float _739 = _689 + _737;
    float _741 = fma((*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].y, 1.0);
    float _743 = _731 ? _719 : 0.00999999977648258209228515625;
    float _745 = (*spvDescriptorSet0.fp_c3)._m0[12].y * 2.0;
    float _747 = _277 * _743;
    float _749 = -_745;
    float _751 = fma(_735, _749, _741);
    float _753 = precise::max(_747, -127.0);
    float _755 = _727 * _713;
    float _757 = precise::clamp(_755, 0.0, 1.0);
    float _759 = abs(_751);
    float _761 = log2(_759);
    float _763 = fma((*spvDescriptorSet0.fp_c3)._m0[11].w, -0.99447572231292724609375, 1.0);
    int _765 = _142 + 128;
    uint _767 = uint(int(uint(_765) >> uint(2)));
    uint _769 = uint(int(uint(int(_767)) >> uint(2)));
    int _771 = int(_767) & 3;
    float _773 = (*spvDescriptorSet0.fp_c4)._m0[int(_769)][_771];
    float _775 = -_757;
    float _777 = _775 + 1.0;
    float _779 = -_753;
    float _781 = exp2(_779);
    int _783 = _142 + 124;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.fp_c4)._m0[int(_787)][_789];
    float _793 = 1.0 / _753;
    float _795 = _761 * 1.5;
    float _797 = log2(_763);
    float _799 = -_781;
    float _801 = _799 + 1.0;
    float _803 = _739 * _739;
    float _805 = _679 * _801;
    float _807 = fma(_693, _693, _803);
    float _809 = exp2(_795);
    float _811 = _805 * _793;
    float _813 = fma(_695, _695, _807);
    int _815 = _142 + 136;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.fp_c4)._m0[int(_819)][_821];
    float _825 = _797 * (-0.0199999995529651641845703125);
    float _827 = abs(_777);
    float _829 = log2(_827);
    float _831 = _811 * _825;
    float _833 = -(*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _835 = fma(_833, (*spvDescriptorSet0.fp_c3)._m0[12].y, 1.0);
    float _837 = _711 * _831;
    float _839 = _809 * 12.56637096405029296875;
    float _841 = rsqrt(_813);
    float _843 = _829 * _773;
    float _845 = -_837;
    float _847 = exp2(_845);
    int _849 = _142 + 96;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.fp_c4)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.fp_c4)._m0[int(_861)][_863];
    float _867 = 1.0 / _839;
    float _869 = -_739;
    float _871 = -_791;
    float _873 = fma(_869, _841, _871);
    float _875 = _873 * _823;
    float _877 = precise::clamp(_875, 0.0, 1.0);
    float _879 = exp2(_843);
    float _881 = -_847;
    float _883 = _881 + 1.0;
    float _885 = precise::min(_883, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _887 = _835 * _867;
    float _889 = _885 * _887;
    float _891 = 0.0 + _879;
    float _893 = precise::clamp(_891, 0.0, 1.0);
    float _895 = _889 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _897 = _857 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _899 = _877 * _893;
    float _901 = _865 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _903 = _899 * _895;
    float _905 = _705 * (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _907 = _897 * _903;
    float _909 = _901 * _903;
    float _911 = _905 * _903;
    out.m_44.x = _907;
    out.m_44.y = _909;
    out.m_44.z = _911;
    out.m_44.w = 0.0;
    return out;
}

