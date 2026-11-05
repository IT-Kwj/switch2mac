#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c5 [[id(0)]];
    constant _16* vp_c11 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c6 [[id(3)]];
    constant _16* vp_c4 [[id(4)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_38 [[attribute(4)]];
    uint4 m_31 [[attribute(6)]];
    float4 m_40 [[attribute(10)]];
    float4 m_36 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_31.x);
    float _59 = as_type<float>(in.m_31.y);
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = in.m_34.z;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    int _76 = as_type<int>(_59) * 48;
    int _78 = as_type<int>(_57) * 48;
    int _80 = _76 + 16;
    uint _83 = uint(int(uint(_80) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = _65 + (-0.2599999904632568359375);
    float _101 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _103 = _99 * _99;
    float _105 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _109 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _107;
    int _111 = _78 + 16;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    int _121 = int(_113) + 1;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    int _125 = _121 & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    float _129 = fma(_61, _61, _103);
    float _131 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _101);
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _135 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _133;
    float _137 = _109 * _109;
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _105);
    float _141 = _131 + _63;
    float _143 = rsqrt(_129);
    uint _145 = uint(int(uint(_76) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    float _161 = fma(_135, _135, _137);
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _165 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _163;
    uint _167 = uint(int(uint(_78) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = fma(_165, _165, _161);
    float _185 = _143 * _61;
    int _187 = _76 + 32;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    uint _191 = uint(int(uint(int(_189)) >> uint(2)));
    int _193 = int(_189) & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = int(_189) + 1;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    int _201 = _197 & 3;
    float _203 = (*spvDescriptorSet0.vp_c5)._m0[int(_199)][_201];
    float _205 = _99 * _143;
    float _207 = sqrt(_183);
    float _209 = fma(_185, _139, _61);
    float _211 = in.m_38.x;
    float _213 = in.m_38.y;
    float _215 = fma(_205, _105, _65);
    int _217 = _76 + 24;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.vp_c5)._m0[int(_221)][_223];
    int _227 = int(_219) + 1;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    int _231 = _227 & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = _78 + 32;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c5)._m0[int(_239)][_241];
    int _245 = int(_237) + 1;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    int _249 = _245 & 3;
    float _251 = (*spvDescriptorSet0.vp_c5)._m0[int(_247)][_249];
    float _253 = _141 * _97;
    bool _257 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _259 = isnan(_207);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _265 = _261 || _263;
    float _267 = fma(_209, _89, _253);
    int _269 = _78 + 24;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    uint _273 = uint(int(uint(int(_271)) >> uint(2)));
    int _275 = int(_271) & 3;
    float _277 = (*spvDescriptorSet0.vp_c5)._m0[int(_273)][_275];
    int _279 = int(_271) + 1;
    uint _281 = uint(int(uint(_279) >> uint(2)));
    int _283 = _279 & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    float _287 = _141 * _127;
    float _289 = fma(_209, _119, _287);
    int _291 = _76 + 8;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c5)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    float _309 = _141 * _159;
    float _311 = fma(_209, _151, _309);
    int _313 = _78 + 8;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    uint _317 = uint(int(uint(int(_315)) >> uint(2)));
    int _319 = int(_315) & 3;
    float _321 = (*spvDescriptorSet0.vp_c5)._m0[int(_317)][_319];
    int _323 = int(_315) + 1;
    uint _325 = uint(int(uint(_323) >> uint(2)));
    int _327 = _323 & 3;
    float _329 = (*spvDescriptorSet0.vp_c5)._m0[int(_325)][_327];
    float _331 = _141 * _181;
    float _333 = fma(_209, _173, _331);
    int _335 = _76 + 40;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    uint _339 = uint(int(uint(int(_337)) >> uint(2)));
    int _341 = int(_337) & 3;
    float _343 = (*spvDescriptorSet0.vp_c5)._m0[int(_339)][_341];
    int _345 = int(_337) + 1;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    int _349 = _345 & 3;
    float _351 = (*spvDescriptorSet0.vp_c5)._m0[int(_347)][_349];
    float _353 = _141 * _203;
    float _355 = fma(_209, _195, _353);
    int _357 = _78 + 40;
    uint _359 = uint(int(uint(_357) >> uint(2)));
    uint _361 = uint(int(uint(int(_359)) >> uint(2)));
    int _363 = int(_359) & 3;
    float _365 = (*spvDescriptorSet0.vp_c5)._m0[int(_361)][_363];
    int _367 = int(_359) + 1;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    int _371 = _367 & 3;
    float _373 = (*spvDescriptorSet0.vp_c5)._m0[int(_369)][_371];
    float _375 = fma(_215, _225, _267);
    float _377 = _375 + _233;
    float _379 = _141 * _251;
    float _381 = _377 * _213;
    float _383 = fma(_209, _243, _379);
    float _385 = fma(_215, _277, _289);
    float _387 = _385 + _285;
    float _389 = fma(_215, _299, _311);
    float _391 = fma(_387, _211, _381);
    float _393 = _389 + _307;
    float _395 = _391 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _397 = _391 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _399 = fma(_215, _321, _333);
    float _401 = _393 * _213;
    float _403 = _399 + _329;
    float _405 = _391 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _407 = fma(_215, _343, _355);
    float _409 = fma(_403, _211, _401);
    float _411 = _407 + _351;
    float _413 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[3].x, _395);
    float _415 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[4].x, _405);
    float _417 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[5].x, _397);
    float _419 = fma(_215, _365, _383);
    float _421 = _411 * _213;
    float _423 = _419 + _373;
    float _425 = fma(_423, _211, _421);
    float _427 = _211;
    if (!_265)
    {
        _427 = 1.0;
    }
    float _429 = _427;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[3].z, _413);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[4].z, _415);
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[5].z, _417);
    float _437 = _431 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _439 = _433 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _441 = _435 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _443 = !_265;
    float _445 = _429;
    if (!_443)
    {
        bool _447 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _449 = isnan(_207);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _455 = _451 || _453;
        if (!_455)
        {
            float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _459 = _207 + _457;
            float _461 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _463 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _461;
            float _465 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _467 = _465 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _469 = 1.0 / _463;
            float _471 = _459 * _469;
            float _473 = fma(_471, _467, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _445 = _473;
            _475 = true;
        }
        else
        {
            bool _477 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _479 = isnan(_207);
            bool _481 = _477 || _479;
            bool _483 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _489 = _207 + _487;
                float _491 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _493 = _491 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _495 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _497 = _495 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _499 = 1.0 / _493;
                float _501 = _489 * _499;
                float _503 = fma(_501, _497, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _445 = _503;
                _475 = true;
            }
            else
            {
                _445 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _475 = false;
    float _505 = _445;
    float _507 = _505 + (-1.0);
    float _509 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _511 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _515 = fma(_439, _505, _509);
    float _517 = fma(_437, _505, _511);
    float _519 = fma(_441, _505, _513);
    float _521 = _515 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[2].x, _521);
    float _527 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[0].x, _523);
    float _529 = _515 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[2].z, _525);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[0].z, _527);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[1].x, _529);
    float _537 = _531 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _539 = _533 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[1].z, _535);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _545 = _537 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _549 = _539 + _547;
    float _551 = _541 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _553 = _545 * _545;
    float _555 = _551 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _557 = fma(_549, _549, _553);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c4)._m0[2].x, _555);
    float _561 = sqrt(_557);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _559);
    float _565 = _563 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _567 = _561 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _569 = _519;
    float _571 = _563;
    float _573 = _541;
    float _575 = _565;
    if (!_567)
    {
        _569 = _539;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_567)
    {
        _571 = _537;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_567)
    {
        _573 = _551;
    }
    float _585 = _573;
    bool _587 = !_567;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _593 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _595 = _561 + _593;
        float _597 = _551 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _599 = rsqrt(_557);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _619 = fma(_551, _607, _615);
        float _621 = _599 * _617;
        float _623 = _619 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _625 = fma(_549, _621, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _627 = fma(_545, _621, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _629 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[2].x, _623);
        float _631 = fma(_627, (*spvDescriptorSet0.vp_c4)._m0[2].z, _629);
        float _633 = _631 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _589 = _619;
        _579 = _625;
        _583 = _627;
        _575 = _633;
    }
    float _635 = _589;
    float _637 = _579;
    float _639 = _583;
    float _641 = _575;
    float _643 = _635 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _645 = _635 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _647 = in.m_40.x;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[1].x, _643);
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[0].x, _645);
    float _653 = in.m_40.y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[1].z, _649);
    float _657 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[0].z, _651);
    float _659 = _655 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _661 = _657 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _663 = _659 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[8].x, _663);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[7].x, _665);
    float _675 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[9].x, _667);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[10].x, _669);
    float _679 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].z, _671);
    float _681 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].z, _673);
    float _683 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].z, _675);
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].z, _677);
    float _687 = _681 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _689 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.z = _647;
    out.m_43.w = _653;
    out.gl_Position.x = _687;
    out.gl_Position.y = _689;
    out.gl_Position.z = _691;
    out.gl_Position.w = _693;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_31.x);
    float _59 = as_type<float>(in.m_31.y);
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = in.m_34.z;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    int _76 = as_type<int>(_59) * 48;
    int _78 = as_type<int>(_57) * 48;
    int _80 = _76 + 16;
    uint _83 = uint(int(uint(_80) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = _65 + (-0.2599999904632568359375);
    float _101 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _103 = _99 * _99;
    float _105 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _109 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _107;
    int _111 = _78 + 16;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    int _121 = int(_113) + 1;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    int _125 = _121 & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    float _129 = fma(_61, _61, _103);
    float _131 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _101);
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _135 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _133;
    float _137 = _109 * _109;
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _105);
    float _141 = _131 + _63;
    float _143 = rsqrt(_129);
    uint _145 = uint(int(uint(_76) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    float _161 = fma(_135, _135, _137);
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _165 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _163;
    uint _167 = uint(int(uint(_78) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = fma(_165, _165, _161);
    float _185 = _143 * _61;
    int _187 = _76 + 32;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    uint _191 = uint(int(uint(int(_189)) >> uint(2)));
    int _193 = int(_189) & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = int(_189) + 1;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    int _201 = _197 & 3;
    float _203 = (*spvDescriptorSet0.vp_c5)._m0[int(_199)][_201];
    float _205 = _99 * _143;
    float _207 = sqrt(_183);
    float _209 = fma(_185, _139, _61);
    float _211 = in.m_38.x;
    float _213 = in.m_38.y;
    float _215 = fma(_205, _105, _65);
    int _217 = _76 + 24;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.vp_c5)._m0[int(_221)][_223];
    int _227 = int(_219) + 1;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    int _231 = _227 & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = _78 + 32;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c5)._m0[int(_239)][_241];
    int _245 = int(_237) + 1;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    int _249 = _245 & 3;
    float _251 = (*spvDescriptorSet0.vp_c5)._m0[int(_247)][_249];
    float _253 = _141 * _97;
    bool _257 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _259 = isnan(_207);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _265 = _261 || _263;
    float _267 = fma(_209, _89, _253);
    int _269 = _78 + 24;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    uint _273 = uint(int(uint(int(_271)) >> uint(2)));
    int _275 = int(_271) & 3;
    float _277 = (*spvDescriptorSet0.vp_c5)._m0[int(_273)][_275];
    int _279 = int(_271) + 1;
    uint _281 = uint(int(uint(_279) >> uint(2)));
    int _283 = _279 & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    float _287 = _141 * _127;
    float _289 = fma(_209, _119, _287);
    int _291 = _76 + 8;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c5)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    float _309 = _141 * _159;
    float _311 = fma(_209, _151, _309);
    int _313 = _78 + 8;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    uint _317 = uint(int(uint(int(_315)) >> uint(2)));
    int _319 = int(_315) & 3;
    float _321 = (*spvDescriptorSet0.vp_c5)._m0[int(_317)][_319];
    int _323 = int(_315) + 1;
    uint _325 = uint(int(uint(_323) >> uint(2)));
    int _327 = _323 & 3;
    float _329 = (*spvDescriptorSet0.vp_c5)._m0[int(_325)][_327];
    float _331 = _141 * _181;
    float _333 = fma(_209, _173, _331);
    int _335 = _76 + 40;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    uint _339 = uint(int(uint(int(_337)) >> uint(2)));
    int _341 = int(_337) & 3;
    float _343 = (*spvDescriptorSet0.vp_c5)._m0[int(_339)][_341];
    int _345 = int(_337) + 1;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    int _349 = _345 & 3;
    float _351 = (*spvDescriptorSet0.vp_c5)._m0[int(_347)][_349];
    float _353 = _141 * _203;
    float _355 = fma(_209, _195, _353);
    int _357 = _78 + 40;
    uint _359 = uint(int(uint(_357) >> uint(2)));
    uint _361 = uint(int(uint(int(_359)) >> uint(2)));
    int _363 = int(_359) & 3;
    float _365 = (*spvDescriptorSet0.vp_c5)._m0[int(_361)][_363];
    int _367 = int(_359) + 1;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    int _371 = _367 & 3;
    float _373 = (*spvDescriptorSet0.vp_c5)._m0[int(_369)][_371];
    float _375 = fma(_215, _225, _267);
    float _377 = _375 + _233;
    float _379 = _141 * _251;
    float _381 = _377 * _213;
    float _383 = fma(_209, _243, _379);
    float _385 = fma(_215, _277, _289);
    float _387 = _385 + _285;
    float _389 = fma(_215, _299, _311);
    float _391 = fma(_387, _211, _381);
    float _393 = _389 + _307;
    float _395 = _391 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _397 = _391 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _399 = fma(_215, _321, _333);
    float _401 = _393 * _213;
    float _403 = _399 + _329;
    float _405 = _391 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _407 = fma(_215, _343, _355);
    float _409 = fma(_403, _211, _401);
    float _411 = _407 + _351;
    float _413 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[3].x, _395);
    float _415 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[4].x, _405);
    float _417 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[5].x, _397);
    float _419 = fma(_215, _365, _383);
    float _421 = _411 * _213;
    float _423 = _419 + _373;
    float _425 = fma(_423, _211, _421);
    float _427 = _211;
    if (!_265)
    {
        _427 = 1.0;
    }
    float _429 = _427;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[3].z, _413);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[4].z, _415);
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[5].z, _417);
    float _437 = _431 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _439 = _433 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _441 = _435 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _443 = !_265;
    float _445 = _429;
    if (!_443)
    {
        bool _447 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _449 = isnan(_207);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _455 = _451 || _453;
        if (!_455)
        {
            float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _459 = _207 + _457;
            float _461 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _463 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _461;
            float _465 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _467 = _465 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _469 = 1.0 / _463;
            float _471 = _459 * _469;
            float _473 = fma(_471, _467, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _445 = _473;
            _475 = true;
        }
        else
        {
            bool _477 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _479 = isnan(_207);
            bool _481 = _477 || _479;
            bool _483 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _489 = _207 + _487;
                float _491 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _493 = _491 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _495 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _497 = _495 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _499 = 1.0 / _493;
                float _501 = _489 * _499;
                float _503 = fma(_501, _497, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _445 = _503;
                _475 = true;
            }
            else
            {
                _445 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _475 = false;
    float _505 = _445;
    float _507 = _505 + (-1.0);
    float _509 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _511 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _515 = fma(_439, _505, _509);
    float _517 = fma(_437, _505, _511);
    float _519 = fma(_441, _505, _513);
    float _521 = _515 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[2].x, _521);
    float _527 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[0].x, _523);
    float _529 = _515 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[2].z, _525);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[0].z, _527);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[1].x, _529);
    float _537 = _531 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _539 = _533 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[1].z, _535);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _545 = _537 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _549 = _539 + _547;
    float _551 = _541 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _553 = _545 * _545;
    float _555 = _551 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _557 = fma(_549, _549, _553);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c4)._m0[2].x, _555);
    float _561 = sqrt(_557);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _559);
    float _565 = _563 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _567 = _561 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _569 = _519;
    float _571 = _563;
    float _573 = _541;
    float _575 = _565;
    if (!_567)
    {
        _569 = _539;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_567)
    {
        _571 = _537;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_567)
    {
        _573 = _551;
    }
    float _585 = _573;
    bool _587 = !_567;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _593 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _595 = _561 + _593;
        float _597 = _551 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _599 = rsqrt(_557);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _619 = fma(_551, _607, _615);
        float _621 = _599 * _617;
        float _623 = _619 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _625 = fma(_549, _621, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _627 = fma(_545, _621, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _629 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[2].x, _623);
        float _631 = fma(_627, (*spvDescriptorSet0.vp_c4)._m0[2].z, _629);
        float _633 = _631 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _589 = _619;
        _579 = _625;
        _583 = _627;
        _575 = _633;
    }
    float _635 = _589;
    float _637 = _579;
    float _639 = _583;
    float _641 = _575;
    float _643 = _635 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _645 = _635 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _647 = in.m_40.x;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[1].x, _643);
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[0].x, _645);
    float _653 = in.m_40.y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[1].z, _649);
    float _657 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[0].z, _651);
    float _659 = _655 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _661 = _657 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _663 = _659 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[8].x, _663);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[7].x, _665);
    float _675 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[9].x, _667);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[10].x, _669);
    float _679 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].z, _671);
    float _681 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].z, _673);
    float _683 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].z, _675);
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].z, _677);
    float _687 = _681 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _689 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.z = _647;
    out.m_43.w = _653;
    out.gl_Position.x = _687;
    out.gl_Position.y = _689;
    out.gl_Position.z = _691;
    out.gl_Position.w = _693;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _475 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_31.x);
    float _59 = as_type<float>(in.m_31.y);
    float _61 = in.m_34.x;
    float _63 = in.m_34.y;
    float _65 = in.m_34.z;
    float _67 = in.m_36.x;
    float _69 = in.m_36.y;
    float _71 = in.m_36.z;
    float _73 = in.m_36.w;
    int _76 = as_type<int>(_59) * 48;
    int _78 = as_type<int>(_57) * 48;
    int _80 = _76 + 16;
    uint _83 = uint(int(uint(_80) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = _65 + (-0.2599999904632568359375);
    float _101 = _73 * (*spvDescriptorSet0.vp_c11)._m0[21].w;
    float _103 = _99 * _99;
    float _105 = _71 * (*spvDescriptorSet0.vp_c11)._m0[21].z;
    float _107 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _109 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _107;
    int _111 = _78 + 16;
    uint _113 = uint(int(uint(_111) >> uint(2)));
    uint _115 = uint(int(uint(int(_113)) >> uint(2)));
    int _117 = int(_113) & 3;
    float _119 = (*spvDescriptorSet0.vp_c5)._m0[int(_115)][_117];
    int _121 = int(_113) + 1;
    uint _123 = uint(int(uint(_121) >> uint(2)));
    int _125 = _121 & 3;
    float _127 = (*spvDescriptorSet0.vp_c5)._m0[int(_123)][_125];
    float _129 = fma(_61, _61, _103);
    float _131 = fma(_69, (*spvDescriptorSet0.vp_c11)._m0[21].y, _101);
    float _133 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _135 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _133;
    float _137 = _109 * _109;
    float _139 = fma(_67, (*spvDescriptorSet0.vp_c11)._m0[21].x, _105);
    float _141 = _131 + _63;
    float _143 = rsqrt(_129);
    uint _145 = uint(int(uint(_76) >> uint(2)));
    uint _147 = uint(int(uint(int(_145)) >> uint(2)));
    int _149 = int(_145) & 3;
    float _151 = (*spvDescriptorSet0.vp_c5)._m0[int(_147)][_149];
    int _153 = int(_145) + 1;
    uint _155 = uint(int(uint(_153) >> uint(2)));
    int _157 = _153 & 3;
    float _159 = (*spvDescriptorSet0.vp_c5)._m0[int(_155)][_157];
    float _161 = fma(_135, _135, _137);
    float _163 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _165 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _163;
    uint _167 = uint(int(uint(_78) >> uint(2)));
    uint _169 = uint(int(uint(int(_167)) >> uint(2)));
    int _171 = int(_167) & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = int(_167) + 1;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    int _179 = _175 & 3;
    float _181 = (*spvDescriptorSet0.vp_c5)._m0[int(_177)][_179];
    float _183 = fma(_165, _165, _161);
    float _185 = _143 * _61;
    int _187 = _76 + 32;
    uint _189 = uint(int(uint(_187) >> uint(2)));
    uint _191 = uint(int(uint(int(_189)) >> uint(2)));
    int _193 = int(_189) & 3;
    float _195 = (*spvDescriptorSet0.vp_c5)._m0[int(_191)][_193];
    int _197 = int(_189) + 1;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    int _201 = _197 & 3;
    float _203 = (*spvDescriptorSet0.vp_c5)._m0[int(_199)][_201];
    float _205 = _99 * _143;
    float _207 = sqrt(_183);
    float _209 = fma(_185, _139, _61);
    float _211 = in.m_38.x;
    float _213 = in.m_38.y;
    float _215 = fma(_205, _105, _65);
    int _217 = _76 + 24;
    uint _219 = uint(int(uint(_217) >> uint(2)));
    uint _221 = uint(int(uint(int(_219)) >> uint(2)));
    int _223 = int(_219) & 3;
    float _225 = (*spvDescriptorSet0.vp_c5)._m0[int(_221)][_223];
    int _227 = int(_219) + 1;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    int _231 = _227 & 3;
    float _233 = (*spvDescriptorSet0.vp_c5)._m0[int(_229)][_231];
    int _235 = _78 + 32;
    uint _237 = uint(int(uint(_235) >> uint(2)));
    uint _239 = uint(int(uint(int(_237)) >> uint(2)));
    int _241 = int(_237) & 3;
    float _243 = (*spvDescriptorSet0.vp_c5)._m0[int(_239)][_241];
    int _245 = int(_237) + 1;
    uint _247 = uint(int(uint(_245) >> uint(2)));
    int _249 = _245 & 3;
    float _251 = (*spvDescriptorSet0.vp_c5)._m0[int(_247)][_249];
    float _253 = _141 * _97;
    bool _257 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _259 = isnan(_207);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _265 = _261 || _263;
    float _267 = fma(_209, _89, _253);
    int _269 = _78 + 24;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    uint _273 = uint(int(uint(int(_271)) >> uint(2)));
    int _275 = int(_271) & 3;
    float _277 = (*spvDescriptorSet0.vp_c5)._m0[int(_273)][_275];
    int _279 = int(_271) + 1;
    uint _281 = uint(int(uint(_279) >> uint(2)));
    int _283 = _279 & 3;
    float _285 = (*spvDescriptorSet0.vp_c5)._m0[int(_281)][_283];
    float _287 = _141 * _127;
    float _289 = fma(_209, _119, _287);
    int _291 = _76 + 8;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    uint _295 = uint(int(uint(int(_293)) >> uint(2)));
    int _297 = int(_293) & 3;
    float _299 = (*spvDescriptorSet0.vp_c5)._m0[int(_295)][_297];
    int _301 = int(_293) + 1;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    int _305 = _301 & 3;
    float _307 = (*spvDescriptorSet0.vp_c5)._m0[int(_303)][_305];
    float _309 = _141 * _159;
    float _311 = fma(_209, _151, _309);
    int _313 = _78 + 8;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    uint _317 = uint(int(uint(int(_315)) >> uint(2)));
    int _319 = int(_315) & 3;
    float _321 = (*spvDescriptorSet0.vp_c5)._m0[int(_317)][_319];
    int _323 = int(_315) + 1;
    uint _325 = uint(int(uint(_323) >> uint(2)));
    int _327 = _323 & 3;
    float _329 = (*spvDescriptorSet0.vp_c5)._m0[int(_325)][_327];
    float _331 = _141 * _181;
    float _333 = fma(_209, _173, _331);
    int _335 = _76 + 40;
    uint _337 = uint(int(uint(_335) >> uint(2)));
    uint _339 = uint(int(uint(int(_337)) >> uint(2)));
    int _341 = int(_337) & 3;
    float _343 = (*spvDescriptorSet0.vp_c5)._m0[int(_339)][_341];
    int _345 = int(_337) + 1;
    uint _347 = uint(int(uint(_345) >> uint(2)));
    int _349 = _345 & 3;
    float _351 = (*spvDescriptorSet0.vp_c5)._m0[int(_347)][_349];
    float _353 = _141 * _203;
    float _355 = fma(_209, _195, _353);
    int _357 = _78 + 40;
    uint _359 = uint(int(uint(_357) >> uint(2)));
    uint _361 = uint(int(uint(int(_359)) >> uint(2)));
    int _363 = int(_359) & 3;
    float _365 = (*spvDescriptorSet0.vp_c5)._m0[int(_361)][_363];
    int _367 = int(_359) + 1;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    int _371 = _367 & 3;
    float _373 = (*spvDescriptorSet0.vp_c5)._m0[int(_369)][_371];
    float _375 = fma(_215, _225, _267);
    float _377 = _375 + _233;
    float _379 = _141 * _251;
    float _381 = _377 * _213;
    float _383 = fma(_209, _243, _379);
    float _385 = fma(_215, _277, _289);
    float _387 = _385 + _285;
    float _389 = fma(_215, _299, _311);
    float _391 = fma(_387, _211, _381);
    float _393 = _389 + _307;
    float _395 = _391 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _397 = _391 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _399 = fma(_215, _321, _333);
    float _401 = _393 * _213;
    float _403 = _399 + _329;
    float _405 = _391 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _407 = fma(_215, _343, _355);
    float _409 = fma(_403, _211, _401);
    float _411 = _407 + _351;
    float _413 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[3].x, _395);
    float _415 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[4].x, _405);
    float _417 = fma(_409, (*spvDescriptorSet0.vp_c6)._m0[5].x, _397);
    float _419 = fma(_215, _365, _383);
    float _421 = _411 * _213;
    float _423 = _419 + _373;
    float _425 = fma(_423, _211, _421);
    float _427 = _211;
    if (!_265)
    {
        _427 = 1.0;
    }
    float _429 = _427;
    float _431 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[3].z, _413);
    float _433 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[4].z, _415);
    float _435 = fma(_425, (*spvDescriptorSet0.vp_c6)._m0[5].z, _417);
    float _437 = _431 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _439 = _433 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _441 = _435 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _443 = !_265;
    float _445 = _429;
    if (!_443)
    {
        bool _447 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _449 = isnan(_207);
        bool _451 = _447 || _449;
        bool _453 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _455 = _451 || _453;
        if (!_455)
        {
            float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _459 = _207 + _457;
            float _461 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _463 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _461;
            float _465 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _467 = _465 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _469 = 1.0 / _463;
            float _471 = _459 * _469;
            float _473 = fma(_471, _467, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _445 = _473;
            _475 = true;
        }
        else
        {
            bool _477 = _207 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _479 = isnan(_207);
            bool _481 = _477 || _479;
            bool _483 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _485 = _481 || _483;
            if (!_485)
            {
                float _487 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _489 = _207 + _487;
                float _491 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _493 = _491 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _495 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _497 = _495 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _499 = 1.0 / _493;
                float _501 = _489 * _499;
                float _503 = fma(_501, _497, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _445 = _503;
                _475 = true;
            }
            else
            {
                _445 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _475 = false;
    float _505 = _445;
    float _507 = _505 + (-1.0);
    float _509 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _511 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _515 = fma(_439, _505, _509);
    float _517 = fma(_437, _505, _511);
    float _519 = fma(_441, _505, _513);
    float _521 = _515 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _523 = _515 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _525 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[2].x, _521);
    float _527 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[0].x, _523);
    float _529 = _515 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[2].z, _525);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[0].z, _527);
    float _535 = fma(_517, (*spvDescriptorSet0.vp_c6)._m0[1].x, _529);
    float _537 = _531 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _539 = _533 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _541 = fma(_519, (*spvDescriptorSet0.vp_c6)._m0[1].z, _535);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _545 = _537 + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _549 = _539 + _547;
    float _551 = _541 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _553 = _545 * _545;
    float _555 = _551 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _557 = fma(_549, _549, _553);
    float _559 = fma(_539, (*spvDescriptorSet0.vp_c4)._m0[2].x, _555);
    float _561 = sqrt(_557);
    float _563 = fma(_537, (*spvDescriptorSet0.vp_c4)._m0[2].z, _559);
    float _565 = _563 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _567 = _561 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _569 = _519;
    float _571 = _563;
    float _573 = _541;
    float _575 = _565;
    if (!_567)
    {
        _569 = _539;
    }
    float _577 = _569;
    float _579 = _577;
    if (!_567)
    {
        _571 = _537;
    }
    float _581 = _571;
    float _583 = _581;
    if (!_567)
    {
        _573 = _551;
    }
    float _585 = _573;
    bool _587 = !_567;
    float _589 = _585;
    if (!_587)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _593 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _595 = _561 + _593;
        float _597 = _551 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _599 = rsqrt(_557);
        float _601 = _595 * _591;
        float _603 = _601 * 0.15915493667125701904296875;
        float _605 = _603 * 6.283185482025146484375;
        float _607 = cos(_605);
        float _609 = _603 * 6.283185482025146484375;
        float _611 = sin(_609);
        float _613 = _607 + (-1.0);
        float _615 = _613 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _617 = fma(_611, _597, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _619 = fma(_551, _607, _615);
        float _621 = _599 * _617;
        float _623 = _619 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _625 = fma(_549, _621, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _627 = fma(_545, _621, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _629 = fma(_625, (*spvDescriptorSet0.vp_c4)._m0[2].x, _623);
        float _631 = fma(_627, (*spvDescriptorSet0.vp_c4)._m0[2].z, _629);
        float _633 = _631 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _589 = _619;
        _579 = _625;
        _583 = _627;
        _575 = _633;
    }
    float _635 = _589;
    float _637 = _579;
    float _639 = _583;
    float _641 = _575;
    float _643 = _635 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _645 = _635 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _647 = in.m_40.x;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[1].x, _643);
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c4)._m0[0].x, _645);
    float _653 = in.m_40.y;
    float _655 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[1].z, _649);
    float _657 = fma(_639, (*spvDescriptorSet0.vp_c4)._m0[0].z, _651);
    float _659 = _655 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _661 = _657 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _663 = _659 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _669 = _659 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[8].x, _663);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[7].x, _665);
    float _675 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[9].x, _667);
    float _677 = fma(_661, (*spvDescriptorSet0.vp_c4)._m0[10].x, _669);
    float _679 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[8].z, _671);
    float _681 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[7].z, _673);
    float _683 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[9].z, _675);
    float _685 = fma(_641, (*spvDescriptorSet0.vp_c4)._m0[10].z, _677);
    float _687 = _681 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _689 = _679 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _691 = _683 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _693 = _685 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_43.z = _647;
    out.m_43.w = _653;
    out.gl_Position.x = _687;
    out.gl_Position.y = _689;
    out.gl_Position.z = _691;
    out.gl_Position.w = _693;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

