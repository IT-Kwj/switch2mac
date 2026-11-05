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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c6 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
};

struct main0_out
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_34 [[attribute(0)]];
    float4 m_32 [[attribute(4)]];
    uint4 m_29 [[attribute(6)]];
    float4 m_36 [[attribute(8)]];
    float4 m_38 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_29.x);
    float _59 = as_type<float>(in.m_29.y);
    float _61 = in.m_32.x;
    float _63 = in.m_32.y;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _69;
    float _73 = _67 * _67;
    float _75 = fma(_71, _71, _73);
    int _78 = as_type<int>(_57) * 48;
    int _80 = as_type<int>(_59) * 48;
    uint _83 = uint(int(uint(_78) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = in.m_34.x;
    float _101 = in.m_34.y;
    float _103 = in.m_34.z;
    int _105 = _78 + 16;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = int(_107) + 1;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    int _119 = _115 & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = _78 + 32;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = int(_125) + 1;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    int _137 = _133 & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    uint _141 = uint(int(uint(_80) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = int(_141) + 1;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    int _153 = _149 & 3;
    float _155 = (*spvDescriptorSet0.vp_c5)._m0[int(_151)][_153];
    int _157 = _80 + 16;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    int _167 = int(_159) + 1;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    int _171 = _167 & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = _80 + 32;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    uint _179 = uint(int(uint(int(_177)) >> uint(2)));
    int _181 = int(_177) & 3;
    float _183 = (*spvDescriptorSet0.vp_c5)._m0[int(_179)][_181];
    int _185 = int(_177) + 1;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    int _189 = _185 & 3;
    float _191 = (*spvDescriptorSet0.vp_c5)._m0[int(_187)][_189];
    int _193 = _80 + 24;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = int(_195) + 1;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    int _207 = _203 & 3;
    float _209 = (*spvDescriptorSet0.vp_c5)._m0[int(_205)][_207];
    float _211 = _101 * _97;
    float _213 = fma(_99, _89, _211);
    int _215 = _78 + 24;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = int(_217) + 1;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    int _229 = _225 & 3;
    float _231 = (*spvDescriptorSet0.vp_c5)._m0[int(_227)][_229];
    float _233 = _101 * _121;
    float _235 = fma(_99, _113, _233);
    int _237 = _80 + 8;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    uint _241 = uint(int(uint(int(_239)) >> uint(2)));
    int _243 = int(_239) & 3;
    float _245 = (*spvDescriptorSet0.vp_c5)._m0[int(_241)][_243];
    int _247 = int(_239) + 1;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    int _251 = _247 & 3;
    float _253 = (*spvDescriptorSet0.vp_c5)._m0[int(_249)][_251];
    float _255 = _101 * _139;
    float _257 = fma(_99, _131, _255);
    int _259 = _78 + 8;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c5)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c5)._m0[int(_271)][_273];
    float _277 = _101 * _155;
    float _279 = fma(_99, _147, _277);
    int _281 = _80 + 40;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    uint _285 = uint(int(uint(int(_283)) >> uint(2)));
    int _287 = int(_283) & 3;
    float _289 = (*spvDescriptorSet0.vp_c5)._m0[int(_285)][_287];
    int _291 = int(_283) + 1;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    int _295 = _291 & 3;
    float _297 = (*spvDescriptorSet0.vp_c5)._m0[int(_293)][_295];
    float _299 = _101 * _173;
    float _301 = fma(_99, _165, _299);
    int _303 = _78 + 40;
    uint _305 = uint(int(uint(_303) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c5)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c5)._m0[int(_315)][_317];
    float _321 = _101 * _191;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _325 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _323;
    float _327 = fma(_99, _183, _321);
    float _329 = fma(_325, _325, _75);
    float _331 = fma(_103, _201, _301);
    float _333 = sqrt(_329);
    float _335 = _331 + _209;
    float _337 = fma(_103, _223, _235);
    float _339 = _335 * _63;
    float _341 = _337 + _231;
    float _343 = fma(_103, _245, _279);
    float _345 = fma(_341, _61, _339);
    float _347 = _343 + _253;
    bool _351 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _353 = isnan(_333);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _359 = _355 || _357;
    float _361 = _345 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _363 = _345 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _365 = fma(_103, _267, _213);
    float _367 = _347 * _63;
    float _369 = _345 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _371 = _365 + _275;
    float _373 = fma(_103, _289, _327);
    float _375 = fma(_371, _61, _367);
    float _377 = _373 + _297;
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[3].x, _361);
    float _381 = fma(_103, _311, _257);
    float _383 = _377 * _63;
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[4].x, _363);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[5].x, _369);
    float _389 = _381 + _319;
    float _391 = fma(_389, _61, _383);
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[3].z, _379);
    float _395 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[4].z, _385);
    float _397 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[5].z, _387);
    float _399 = _379;
    if (!_359)
    {
        _399 = 1.0;
    }
    float _401 = _399;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _405 = _395 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _407 = _397 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _409 = !_359;
    float _411 = _401;
    if (!_409)
    {
        bool _413 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _415 = isnan(_333);
        bool _417 = _413 || _415;
        bool _419 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _421 = _417 || _419;
        if (!_421)
        {
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = _333 + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _429 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _427;
            float _431 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _433 = _431 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _435 = 1.0 / _429;
            float _437 = _425 * _435;
            float _439 = fma(_437, _433, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _411 = _439;
            _441 = true;
        }
        else
        {
            bool _443 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _445 = isnan(_333);
            bool _447 = _443 || _445;
            bool _449 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _451 = _447 || _449;
            if (!_451)
            {
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _333 + _453;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _461 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _463 = _461 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _465 = 1.0 / _459;
                float _467 = _455 * _465;
                float _469 = fma(_467, _463, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _411 = _469;
                _441 = true;
            }
            else
            {
                _411 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _441 = false;
    float _471 = _411;
    float _473 = _471 + (-1.0);
    float _475 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _481 = fma(_405, _471, _475);
    float _483 = fma(_403, _471, _477);
    float _485 = fma(_407, _471, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _489 = _481 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _491 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[2].x, _487);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[0].x, _489);
    float _495 = _481 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[2].z, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[0].z, _493);
    float _501 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[1].x, _495);
    float _503 = _497 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _505 = _499 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[1].z, _501);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _515 = _505 + _513;
    float _517 = _507 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _519 = _511 * _511;
    float _521 = _517 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _523 = fma(_515, _515, _519);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[2].x, _521);
    float _527 = sqrt(_523);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[2].z, _525);
    float _531 = _529 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _533 = _527 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _535 = _485;
    float _537 = _529;
    float _539 = _507;
    float _541 = _531;
    if (!_533)
    {
        _535 = _505;
    }
    float _543 = _535;
    float _545 = _543;
    if (!_533)
    {
        _537 = _503;
    }
    float _547 = _537;
    float _549 = _547;
    if (!_533)
    {
        _539 = _517;
    }
    float _551 = _539;
    bool _553 = !_533;
    float _555 = _551;
    if (!_553)
    {
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _561 = _527 + _559;
        float _563 = _517 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _565 = rsqrt(_523);
        float _567 = _561 * _557;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = _569 * 6.283185482025146484375;
        float _573 = cos(_571);
        float _575 = _569 * 6.283185482025146484375;
        float _577 = sin(_575);
        float _579 = _573 + (-1.0);
        float _581 = _579 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = fma(_577, _563, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _585 = fma(_517, _573, _581);
        float _587 = _565 * _583;
        float _589 = _585 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _591 = fma(_515, _587, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _593 = fma(_511, _587, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _595 = fma(_591, (*spvDescriptorSet0.vp_c4)._m0[2].x, _589);
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c4)._m0[2].z, _595);
        float _599 = _597 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _555 = _585;
        _545 = _591;
        _549 = _593;
        _541 = _599;
    }
    float _601 = _555;
    float _603 = _545;
    float _605 = _549;
    float _607 = _541;
    float _609 = _601 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _611 = _601 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _613 = in.m_36.x;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[1].x, _609);
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[0].x, _611);
    float _619 = in.m_36.y;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[1].z, _615);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[0].z, _617);
    float _625 = in.m_38.x;
    float _627 = _621 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _629 = _623 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _631 = _627 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _633 = _627 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _635 = _627 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _637 = _627 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _639 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[8].x, _631);
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[7].x, _633);
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[9].x, _635);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[10].x, _637);
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[8].z, _639);
    float _649 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[7].z, _641);
    float _651 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[9].z, _643);
    float _653 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[10].z, _645);
    float _655 = _649 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _657 = _647 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _613;
    out.m_41.y = _619;
    out.m_43.x = _625;
    out.gl_Position.x = _655;
    out.gl_Position.y = _657;
    out.gl_Position.z = _659;
    out.gl_Position.w = _661;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_29.x);
    float _59 = as_type<float>(in.m_29.y);
    float _61 = in.m_32.x;
    float _63 = in.m_32.y;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _69;
    float _73 = _67 * _67;
    float _75 = fma(_71, _71, _73);
    int _78 = as_type<int>(_57) * 48;
    int _80 = as_type<int>(_59) * 48;
    uint _83 = uint(int(uint(_78) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = in.m_34.x;
    float _101 = in.m_34.y;
    float _103 = in.m_34.z;
    int _105 = _78 + 16;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = int(_107) + 1;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    int _119 = _115 & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = _78 + 32;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = int(_125) + 1;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    int _137 = _133 & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    uint _141 = uint(int(uint(_80) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = int(_141) + 1;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    int _153 = _149 & 3;
    float _155 = (*spvDescriptorSet0.vp_c5)._m0[int(_151)][_153];
    int _157 = _80 + 16;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    int _167 = int(_159) + 1;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    int _171 = _167 & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = _80 + 32;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    uint _179 = uint(int(uint(int(_177)) >> uint(2)));
    int _181 = int(_177) & 3;
    float _183 = (*spvDescriptorSet0.vp_c5)._m0[int(_179)][_181];
    int _185 = int(_177) + 1;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    int _189 = _185 & 3;
    float _191 = (*spvDescriptorSet0.vp_c5)._m0[int(_187)][_189];
    int _193 = _80 + 24;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = int(_195) + 1;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    int _207 = _203 & 3;
    float _209 = (*spvDescriptorSet0.vp_c5)._m0[int(_205)][_207];
    float _211 = _101 * _97;
    float _213 = fma(_99, _89, _211);
    int _215 = _78 + 24;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = int(_217) + 1;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    int _229 = _225 & 3;
    float _231 = (*spvDescriptorSet0.vp_c5)._m0[int(_227)][_229];
    float _233 = _101 * _121;
    float _235 = fma(_99, _113, _233);
    int _237 = _80 + 8;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    uint _241 = uint(int(uint(int(_239)) >> uint(2)));
    int _243 = int(_239) & 3;
    float _245 = (*spvDescriptorSet0.vp_c5)._m0[int(_241)][_243];
    int _247 = int(_239) + 1;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    int _251 = _247 & 3;
    float _253 = (*spvDescriptorSet0.vp_c5)._m0[int(_249)][_251];
    float _255 = _101 * _139;
    float _257 = fma(_99, _131, _255);
    int _259 = _78 + 8;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c5)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c5)._m0[int(_271)][_273];
    float _277 = _101 * _155;
    float _279 = fma(_99, _147, _277);
    int _281 = _80 + 40;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    uint _285 = uint(int(uint(int(_283)) >> uint(2)));
    int _287 = int(_283) & 3;
    float _289 = (*spvDescriptorSet0.vp_c5)._m0[int(_285)][_287];
    int _291 = int(_283) + 1;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    int _295 = _291 & 3;
    float _297 = (*spvDescriptorSet0.vp_c5)._m0[int(_293)][_295];
    float _299 = _101 * _173;
    float _301 = fma(_99, _165, _299);
    int _303 = _78 + 40;
    uint _305 = uint(int(uint(_303) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c5)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c5)._m0[int(_315)][_317];
    float _321 = _101 * _191;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _325 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _323;
    float _327 = fma(_99, _183, _321);
    float _329 = fma(_325, _325, _75);
    float _331 = fma(_103, _201, _301);
    float _333 = sqrt(_329);
    float _335 = _331 + _209;
    float _337 = fma(_103, _223, _235);
    float _339 = _335 * _63;
    float _341 = _337 + _231;
    float _343 = fma(_103, _245, _279);
    float _345 = fma(_341, _61, _339);
    float _347 = _343 + _253;
    bool _351 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _353 = isnan(_333);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _359 = _355 || _357;
    float _361 = _345 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _363 = _345 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _365 = fma(_103, _267, _213);
    float _367 = _347 * _63;
    float _369 = _345 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _371 = _365 + _275;
    float _373 = fma(_103, _289, _327);
    float _375 = fma(_371, _61, _367);
    float _377 = _373 + _297;
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[3].x, _361);
    float _381 = fma(_103, _311, _257);
    float _383 = _377 * _63;
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[4].x, _363);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[5].x, _369);
    float _389 = _381 + _319;
    float _391 = fma(_389, _61, _383);
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[3].z, _379);
    float _395 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[4].z, _385);
    float _397 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[5].z, _387);
    float _399 = _379;
    if (!_359)
    {
        _399 = 1.0;
    }
    float _401 = _399;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _405 = _395 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _407 = _397 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _409 = !_359;
    float _411 = _401;
    if (!_409)
    {
        bool _413 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _415 = isnan(_333);
        bool _417 = _413 || _415;
        bool _419 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _421 = _417 || _419;
        if (!_421)
        {
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = _333 + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _429 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _427;
            float _431 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _433 = _431 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _435 = 1.0 / _429;
            float _437 = _425 * _435;
            float _439 = fma(_437, _433, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _411 = _439;
            _441 = true;
        }
        else
        {
            bool _443 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _445 = isnan(_333);
            bool _447 = _443 || _445;
            bool _449 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _451 = _447 || _449;
            if (!_451)
            {
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _333 + _453;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _461 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _463 = _461 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _465 = 1.0 / _459;
                float _467 = _455 * _465;
                float _469 = fma(_467, _463, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _411 = _469;
                _441 = true;
            }
            else
            {
                _411 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _441 = false;
    float _471 = _411;
    float _473 = _471 + (-1.0);
    float _475 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _481 = fma(_405, _471, _475);
    float _483 = fma(_403, _471, _477);
    float _485 = fma(_407, _471, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _489 = _481 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _491 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[2].x, _487);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[0].x, _489);
    float _495 = _481 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[2].z, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[0].z, _493);
    float _501 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[1].x, _495);
    float _503 = _497 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _505 = _499 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[1].z, _501);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _515 = _505 + _513;
    float _517 = _507 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _519 = _511 * _511;
    float _521 = _517 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _523 = fma(_515, _515, _519);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[2].x, _521);
    float _527 = sqrt(_523);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[2].z, _525);
    float _531 = _529 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _533 = _527 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _535 = _485;
    float _537 = _529;
    float _539 = _507;
    float _541 = _531;
    if (!_533)
    {
        _535 = _505;
    }
    float _543 = _535;
    float _545 = _543;
    if (!_533)
    {
        _537 = _503;
    }
    float _547 = _537;
    float _549 = _547;
    if (!_533)
    {
        _539 = _517;
    }
    float _551 = _539;
    bool _553 = !_533;
    float _555 = _551;
    if (!_553)
    {
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _561 = _527 + _559;
        float _563 = _517 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _565 = rsqrt(_523);
        float _567 = _561 * _557;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = _569 * 6.283185482025146484375;
        float _573 = cos(_571);
        float _575 = _569 * 6.283185482025146484375;
        float _577 = sin(_575);
        float _579 = _573 + (-1.0);
        float _581 = _579 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = fma(_577, _563, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _585 = fma(_517, _573, _581);
        float _587 = _565 * _583;
        float _589 = _585 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _591 = fma(_515, _587, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _593 = fma(_511, _587, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _595 = fma(_591, (*spvDescriptorSet0.vp_c4)._m0[2].x, _589);
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c4)._m0[2].z, _595);
        float _599 = _597 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _555 = _585;
        _545 = _591;
        _549 = _593;
        _541 = _599;
    }
    float _601 = _555;
    float _603 = _545;
    float _605 = _549;
    float _607 = _541;
    float _609 = _601 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _611 = _601 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _613 = in.m_36.x;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[1].x, _609);
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[0].x, _611);
    float _619 = in.m_36.y;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[1].z, _615);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[0].z, _617);
    float _625 = in.m_38.x;
    float _627 = _621 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _629 = _623 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _631 = _627 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _633 = _627 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _635 = _627 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _637 = _627 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _639 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[8].x, _631);
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[7].x, _633);
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[9].x, _635);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[10].x, _637);
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[8].z, _639);
    float _649 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[7].z, _641);
    float _651 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[9].z, _643);
    float _653 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[10].z, _645);
    float _655 = _649 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _657 = _647 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _613;
    out.m_41.y = _619;
    out.m_43.x = _625;
    out.gl_Position.x = _655;
    out.gl_Position.y = _657;
    out.gl_Position.z = _659;
    out.gl_Position.w = _661;
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
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    bool _441 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _57 = as_type<float>(in.m_29.x);
    float _59 = as_type<float>(in.m_29.y);
    float _61 = in.m_32.x;
    float _63 = in.m_32.y;
    float _65 = -(*spvDescriptorSet0.vp_c9)._m0[26].y;
    float _67 = (*spvDescriptorSet0.vp_c6)._m0[1].w + _65;
    float _69 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _71 = (*spvDescriptorSet0.vp_c6)._m0[0].w + _69;
    float _73 = _67 * _67;
    float _75 = fma(_71, _71, _73);
    int _78 = as_type<int>(_57) * 48;
    int _80 = as_type<int>(_59) * 48;
    uint _83 = uint(int(uint(_78) >> uint(2)));
    uint _85 = uint(int(uint(int(_83)) >> uint(2)));
    int _87 = int(_83) & 3;
    float _89 = (*spvDescriptorSet0.vp_c5)._m0[int(_85)][_87];
    int _91 = int(_83) + 1;
    uint _93 = uint(int(uint(_91) >> uint(2)));
    int _95 = _91 & 3;
    float _97 = (*spvDescriptorSet0.vp_c5)._m0[int(_93)][_95];
    float _99 = in.m_34.x;
    float _101 = in.m_34.y;
    float _103 = in.m_34.z;
    int _105 = _78 + 16;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.vp_c5)._m0[int(_109)][_111];
    int _115 = int(_107) + 1;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    int _119 = _115 & 3;
    float _121 = (*spvDescriptorSet0.vp_c5)._m0[int(_117)][_119];
    int _123 = _78 + 32;
    uint _125 = uint(int(uint(_123) >> uint(2)));
    uint _127 = uint(int(uint(int(_125)) >> uint(2)));
    int _129 = int(_125) & 3;
    float _131 = (*spvDescriptorSet0.vp_c5)._m0[int(_127)][_129];
    int _133 = int(_125) + 1;
    uint _135 = uint(int(uint(_133) >> uint(2)));
    int _137 = _133 & 3;
    float _139 = (*spvDescriptorSet0.vp_c5)._m0[int(_135)][_137];
    uint _141 = uint(int(uint(_80) >> uint(2)));
    uint _143 = uint(int(uint(int(_141)) >> uint(2)));
    int _145 = int(_141) & 3;
    float _147 = (*spvDescriptorSet0.vp_c5)._m0[int(_143)][_145];
    int _149 = int(_141) + 1;
    uint _151 = uint(int(uint(_149) >> uint(2)));
    int _153 = _149 & 3;
    float _155 = (*spvDescriptorSet0.vp_c5)._m0[int(_151)][_153];
    int _157 = _80 + 16;
    uint _159 = uint(int(uint(_157) >> uint(2)));
    uint _161 = uint(int(uint(int(_159)) >> uint(2)));
    int _163 = int(_159) & 3;
    float _165 = (*spvDescriptorSet0.vp_c5)._m0[int(_161)][_163];
    int _167 = int(_159) + 1;
    uint _169 = uint(int(uint(_167) >> uint(2)));
    int _171 = _167 & 3;
    float _173 = (*spvDescriptorSet0.vp_c5)._m0[int(_169)][_171];
    int _175 = _80 + 32;
    uint _177 = uint(int(uint(_175) >> uint(2)));
    uint _179 = uint(int(uint(int(_177)) >> uint(2)));
    int _181 = int(_177) & 3;
    float _183 = (*spvDescriptorSet0.vp_c5)._m0[int(_179)][_181];
    int _185 = int(_177) + 1;
    uint _187 = uint(int(uint(_185) >> uint(2)));
    int _189 = _185 & 3;
    float _191 = (*spvDescriptorSet0.vp_c5)._m0[int(_187)][_189];
    int _193 = _80 + 24;
    uint _195 = uint(int(uint(_193) >> uint(2)));
    uint _197 = uint(int(uint(int(_195)) >> uint(2)));
    int _199 = int(_195) & 3;
    float _201 = (*spvDescriptorSet0.vp_c5)._m0[int(_197)][_199];
    int _203 = int(_195) + 1;
    uint _205 = uint(int(uint(_203) >> uint(2)));
    int _207 = _203 & 3;
    float _209 = (*spvDescriptorSet0.vp_c5)._m0[int(_205)][_207];
    float _211 = _101 * _97;
    float _213 = fma(_99, _89, _211);
    int _215 = _78 + 24;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.vp_c5)._m0[int(_219)][_221];
    int _225 = int(_217) + 1;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    int _229 = _225 & 3;
    float _231 = (*spvDescriptorSet0.vp_c5)._m0[int(_227)][_229];
    float _233 = _101 * _121;
    float _235 = fma(_99, _113, _233);
    int _237 = _80 + 8;
    uint _239 = uint(int(uint(_237) >> uint(2)));
    uint _241 = uint(int(uint(int(_239)) >> uint(2)));
    int _243 = int(_239) & 3;
    float _245 = (*spvDescriptorSet0.vp_c5)._m0[int(_241)][_243];
    int _247 = int(_239) + 1;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    int _251 = _247 & 3;
    float _253 = (*spvDescriptorSet0.vp_c5)._m0[int(_249)][_251];
    float _255 = _101 * _139;
    float _257 = fma(_99, _131, _255);
    int _259 = _78 + 8;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    uint _263 = uint(int(uint(int(_261)) >> uint(2)));
    int _265 = int(_261) & 3;
    float _267 = (*spvDescriptorSet0.vp_c5)._m0[int(_263)][_265];
    int _269 = int(_261) + 1;
    uint _271 = uint(int(uint(_269) >> uint(2)));
    int _273 = _269 & 3;
    float _275 = (*spvDescriptorSet0.vp_c5)._m0[int(_271)][_273];
    float _277 = _101 * _155;
    float _279 = fma(_99, _147, _277);
    int _281 = _80 + 40;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    uint _285 = uint(int(uint(int(_283)) >> uint(2)));
    int _287 = int(_283) & 3;
    float _289 = (*spvDescriptorSet0.vp_c5)._m0[int(_285)][_287];
    int _291 = int(_283) + 1;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    int _295 = _291 & 3;
    float _297 = (*spvDescriptorSet0.vp_c5)._m0[int(_293)][_295];
    float _299 = _101 * _173;
    float _301 = fma(_99, _165, _299);
    int _303 = _78 + 40;
    uint _305 = uint(int(uint(_303) >> uint(2)));
    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
    int _309 = int(_305) & 3;
    float _311 = (*spvDescriptorSet0.vp_c5)._m0[int(_307)][_309];
    int _313 = int(_305) + 1;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    int _317 = _313 & 3;
    float _319 = (*spvDescriptorSet0.vp_c5)._m0[int(_315)][_317];
    float _321 = _101 * _191;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _325 = (*spvDescriptorSet0.vp_c6)._m0[2].w + _323;
    float _327 = fma(_99, _183, _321);
    float _329 = fma(_325, _325, _75);
    float _331 = fma(_103, _201, _301);
    float _333 = sqrt(_329);
    float _335 = _331 + _209;
    float _337 = fma(_103, _223, _235);
    float _339 = _335 * _63;
    float _341 = _337 + _231;
    float _343 = fma(_103, _245, _279);
    float _345 = fma(_341, _61, _339);
    float _347 = _343 + _253;
    bool _351 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].x;
    bool _353 = isnan(_333);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].x);
    bool _359 = _355 || _357;
    float _361 = _345 * (*spvDescriptorSet0.vp_c6)._m0[3].y;
    float _363 = _345 * (*spvDescriptorSet0.vp_c6)._m0[4].y;
    float _365 = fma(_103, _267, _213);
    float _367 = _347 * _63;
    float _369 = _345 * (*spvDescriptorSet0.vp_c6)._m0[5].y;
    float _371 = _365 + _275;
    float _373 = fma(_103, _289, _327);
    float _375 = fma(_371, _61, _367);
    float _377 = _373 + _297;
    float _379 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[3].x, _361);
    float _381 = fma(_103, _311, _257);
    float _383 = _377 * _63;
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[4].x, _363);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c6)._m0[5].x, _369);
    float _389 = _381 + _319;
    float _391 = fma(_389, _61, _383);
    float _393 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[3].z, _379);
    float _395 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[4].z, _385);
    float _397 = fma(_391, (*spvDescriptorSet0.vp_c6)._m0[5].z, _387);
    float _399 = _379;
    if (!_359)
    {
        _399 = 1.0;
    }
    float _401 = _399;
    float _403 = _393 + (*spvDescriptorSet0.vp_c6)._m0[3].w;
    float _405 = _395 + (*spvDescriptorSet0.vp_c6)._m0[4].w;
    float _407 = _397 + (*spvDescriptorSet0.vp_c6)._m0[5].w;
    bool _409 = !_359;
    float _411 = _401;
    if (!_409)
    {
        bool _413 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].y;
        bool _415 = isnan(_333);
        bool _417 = _413 || _415;
        bool _419 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].y);
        bool _421 = _417 || _419;
        if (!_421)
        {
            float _423 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _425 = _333 + _423;
            float _427 = -(*spvDescriptorSet0.vp_c6)._m0[6].x;
            float _429 = (*spvDescriptorSet0.vp_c6)._m0[6].y + _427;
            float _431 = -(*spvDescriptorSet0.vp_c6)._m0[7].x;
            float _433 = _431 + (*spvDescriptorSet0.vp_c6)._m0[7].y;
            float _435 = 1.0 / _429;
            float _437 = _425 * _435;
            float _439 = fma(_437, _433, (*spvDescriptorSet0.vp_c6)._m0[7].x);
            _411 = _439;
            _441 = true;
        }
        else
        {
            bool _443 = _333 >= (*spvDescriptorSet0.vp_c6)._m0[6].z;
            bool _445 = isnan(_333);
            bool _447 = _443 || _445;
            bool _449 = isnan((*spvDescriptorSet0.vp_c6)._m0[6].z);
            bool _451 = _447 || _449;
            if (!_451)
            {
                float _453 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _455 = _333 + _453;
                float _457 = -(*spvDescriptorSet0.vp_c6)._m0[6].y;
                float _459 = _457 + (*spvDescriptorSet0.vp_c6)._m0[6].z;
                float _461 = -(*spvDescriptorSet0.vp_c6)._m0[7].y;
                float _463 = _461 + (*spvDescriptorSet0.vp_c6)._m0[7].z;
                float _465 = 1.0 / _459;
                float _467 = _455 * _465;
                float _469 = fma(_467, _463, (*spvDescriptorSet0.vp_c6)._m0[7].y);
                _411 = _469;
                _441 = true;
            }
            else
            {
                _411 = (*spvDescriptorSet0.vp_c6)._m0[7].z;
            }
        }
    }
    _441 = false;
    float _471 = _411;
    float _473 = _471 + (-1.0);
    float _475 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].y;
    float _477 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].x;
    float _479 = _473 * (*spvDescriptorSet0.vp_c6)._m0[8].z;
    float _481 = fma(_405, _471, _475);
    float _483 = fma(_403, _471, _477);
    float _485 = fma(_407, _471, _479);
    float _487 = _481 * (*spvDescriptorSet0.vp_c6)._m0[2].y;
    float _489 = _481 * (*spvDescriptorSet0.vp_c6)._m0[0].y;
    float _491 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[2].x, _487);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[0].x, _489);
    float _495 = _481 * (*spvDescriptorSet0.vp_c6)._m0[1].y;
    float _497 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[2].z, _491);
    float _499 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[0].z, _493);
    float _501 = fma(_483, (*spvDescriptorSet0.vp_c6)._m0[1].x, _495);
    float _503 = _497 + (*spvDescriptorSet0.vp_c6)._m0[2].w;
    float _505 = _499 + (*spvDescriptorSet0.vp_c6)._m0[0].w;
    float _507 = fma(_485, (*spvDescriptorSet0.vp_c6)._m0[1].z, _501);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _515 = _505 + _513;
    float _517 = _507 + (*spvDescriptorSet0.vp_c6)._m0[1].w;
    float _519 = _511 * _511;
    float _521 = _517 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _523 = fma(_515, _515, _519);
    float _525 = fma(_505, (*spvDescriptorSet0.vp_c4)._m0[2].x, _521);
    float _527 = sqrt(_523);
    float _529 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[2].z, _525);
    float _531 = _529 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    bool _533 = _527 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _535 = _485;
    float _537 = _529;
    float _539 = _507;
    float _541 = _531;
    if (!_533)
    {
        _535 = _505;
    }
    float _543 = _535;
    float _545 = _543;
    if (!_533)
    {
        _537 = _503;
    }
    float _547 = _537;
    float _549 = _547;
    if (!_533)
    {
        _539 = _517;
    }
    float _551 = _539;
    bool _553 = !_533;
    float _555 = _551;
    if (!_553)
    {
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _559 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
        float _561 = _527 + _559;
        float _563 = _517 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _565 = rsqrt(_523);
        float _567 = _561 * _557;
        float _569 = _567 * 0.15915493667125701904296875;
        float _571 = _569 * 6.283185482025146484375;
        float _573 = cos(_571);
        float _575 = _569 * 6.283185482025146484375;
        float _577 = sin(_575);
        float _579 = _573 + (-1.0);
        float _581 = _579 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        float _583 = fma(_577, _563, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        float _585 = fma(_517, _573, _581);
        float _587 = _565 * _583;
        float _589 = _585 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        float _591 = fma(_515, _587, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        float _593 = fma(_511, _587, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        float _595 = fma(_591, (*spvDescriptorSet0.vp_c4)._m0[2].x, _589);
        float _597 = fma(_593, (*spvDescriptorSet0.vp_c4)._m0[2].z, _595);
        float _599 = _597 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _555 = _585;
        _545 = _591;
        _549 = _593;
        _541 = _599;
    }
    float _601 = _555;
    float _603 = _545;
    float _605 = _549;
    float _607 = _541;
    float _609 = _601 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _611 = _601 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _613 = in.m_36.x;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[1].x, _609);
    float _617 = fma(_603, (*spvDescriptorSet0.vp_c4)._m0[0].x, _611);
    float _619 = in.m_36.y;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[1].z, _615);
    float _623 = fma(_605, (*spvDescriptorSet0.vp_c4)._m0[0].z, _617);
    float _625 = in.m_38.x;
    float _627 = _621 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _629 = _623 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    float _631 = _627 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _633 = _627 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _635 = _627 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _637 = _627 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _639 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[8].x, _631);
    float _641 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[7].x, _633);
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[9].x, _635);
    float _645 = fma(_629, (*spvDescriptorSet0.vp_c4)._m0[10].x, _637);
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[8].z, _639);
    float _649 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[7].z, _641);
    float _651 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[9].z, _643);
    float _653 = fma(_607, (*spvDescriptorSet0.vp_c4)._m0[10].z, _645);
    float _655 = _649 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _657 = _647 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_41.x = _613;
    out.m_41.y = _619;
    out.m_43.x = _625;
    out.gl_Position.x = _655;
    out.gl_Position.y = _657;
    out.gl_Position.z = _659;
    out.gl_Position.w = _661;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

