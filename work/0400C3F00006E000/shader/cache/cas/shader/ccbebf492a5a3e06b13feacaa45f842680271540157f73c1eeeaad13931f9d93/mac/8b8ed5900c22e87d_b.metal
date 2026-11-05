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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_44 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _575 = false;
    bool _411 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1453 = as_type<float>(_93);
        out.gl_Position.z = _1453;
    }
    if (!_81)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1522 = as_type<float>(_129);
        out.gl_Position.z = _1522;
    }
    if (_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _135 = as_type<int>(_131) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_131) & 2;
    bool _141 = _139 != 0;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_133;
    float _169;
    if (!_151)
    {
        float _153 = in.m_42.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_77);
        float _175 = 1.0 / _173;
        float _177 = _111 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _179 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _209 = 1.0 / _195;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _213 = 1.0 / _203;
    float _215 = 1.0 / _199;
    float _217 = _187 * _209;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _179 + _219;
    float _223 = 1.0 / _207;
    float _225 = _183 * _213;
    bool _227 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = isnan(_179);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -_237;
    float _241 = _239 + 1.0;
    float _243 = _191 * _215;
    bool _245 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_179);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_179);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _255 * _241;
    bool _271 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_179);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _221 * _223;
    float _285 = -_255;
    float _287 = _285 + 1.0;
    bool _289 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_179);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _267 * _287;
    float _311 = -_267;
    float _313 = _311 + 1.0;
    float _315 = fma(_303, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_307, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _281 * _313;
    float _325 = -_281;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    float _337 = fma(_321, _243, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _299 * _327;
    float _341 = fma(_331, _243, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = _315 * _339;
    float _353 = _317 * _339;
    float _355 = fma(_345, _225, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _225, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _371 = fma(_341, _323, _359);
    float _373 = fma(_337, _323, _361);
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _379 = fma(_355, _309, _371);
    float _381 = fma(_357, _309, _373);
    float _383 = fma(_375, _269, _379);
    float _385 = fma(_377, _269, _381);
    float _387 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].x, _383);
    float _389 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].y, _385);
    bool _391 = !_211;
    float _409;
    if (!_391)
    {
        float _393 = in.m_42.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_77);
        float _415 = 1.0 / _413;
        float _417 = _111 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _419 + _421;
    float _425 = in.m_42.x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_419);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _429;
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _457 * _469;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = 1.0 / _445;
    float _479 = _461 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = fma(_479, _423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _487 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_419);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _483 * _477;
    float _501 = _485 * _471;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _419 + _503;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _513 = fma(_499, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _515 = _441 * _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = in.m_44.x;
    float _521 = in.m_44.y;
    float _523 = fma(_513, _515, _511);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _531 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _531 * _425;
    out.m_46.x = _527;
    out.m_46.y = _535;
    out.m_46.z = _539;
    out.m_46.w = _537;
    float _543 = trunc(_541);
    int _545 = int(_543);
    float _547 = _389 * _521;
    float _549 = _387 * _519;
    int _551 = _545 << 4;
    int _553 = _551 + 1968;
    bool _555 = !_463;
    float _557 = _549;
    float _573;
    if (!_555)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_77);
        float _579 = 1.0 / _577;
        float _581 = _111 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = in.m_32.x;
    float _587 = in.m_32.y;
    float _589 = in.m_32.z;
    bool _591 = _425 > 0.5;
    float _593 = in.m_48.x;
    float _595 = in.m_48.y;
    float _597 = in.m_48.z;
    float _599 = in.m_48.w;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = in.m_50.x;
    float _611 = in.m_50.y;
    float _613 = in.m_50.z;
    float _615 = in.m_50.w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_42.w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _629 = in.m_52.x;
    float _631 = in.m_52.y;
    float _633 = in.m_52.z;
    float _635 = in.m_52.w;
    float _637 = in.m_42.z;
    float _639 = in.m_42.y;
    float _641 = _587 * _595;
    float _643 = _587 * _611;
    float _645 = fma(_585, _593, _641);
    bool _647 = _625 > 0.5;
    float _649 = fma(_585, _609, _643);
    float _651 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _587 * _631;
    float _655 = fma(_589, _613, _649);
    float _657 = fma(_589, _597, _645);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _661 = _637 > 0.5;
    float _663 = fma(_585, _629, _653);
    float _665 = -_659;
    float _667 = fma(_651, 2.0, _665);
    float _669 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    float _685 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    float _687 = fma(_669, -2.0, _677);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _583 + _689;
    bool _693 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_583);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = fma(_589, _633, _663);
    float _707 = -_145;
    int _709 = _591 ? as_type<int>(_707) : as_type<int>(_145);
    float _711 = 1.0 / _673;
    bool _713 = _639 > 0.5;
    float _715 = _655 + _615;
    float _717 = _657 + _599;
    float _719 = -_149;
    int _721 = _713 ? as_type<int>(_719) : as_type<int>(_149);
    float _723 = -_111;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _667);
    float _727 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _685);
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    uint _732 = uint(int(uint(_553) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[int(_742)][_744];
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_727;
    float _752 = _750 + 1.0;
    float _754 = _683 * _711;
    bool _756 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = isnan(_583);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    int _768 = _553 + 8;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    float _778 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].w, _729);
    float _780 = fma(_754, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = -_766;
    float _786 = _784 + 1.0;
    float _788 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    float _790 = _703 * _786;
    float _792 = -_703;
    float _794 = _792 + 1.0;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _798 = _715 + _796;
    float _800 = _780 * _790;
    float _802 = _705 + _635;
    bool _804 = !_603;
    float _806 = _804 ? _145 : as_type<float>(_709);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _717 + _808;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _800);
    bool _814 = !_607;
    float _816 = _814 ? _149 : as_type<float>(_721);
    float _818 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _820 = _806 + 0.5;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _826 = _816 + (-0.5);
    float _828 = fma(_818, _820, _725);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _802 + _830;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _836 = -_782;
    float _838 = -_824;
    float _840 = fma(_836, _826, _838);
    float _842 = _798 * _798;
    float _844 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _848 = -_145;
    int _850 = _661 ? as_type<int>(_848) : as_type<int>(_145);
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _854 = _846 >= 0.0;
    float _856 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _858 = !_619;
    float _860 = _858 ? _145 : as_type<float>(_850);
    float _862 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _864 = -_149;
    int _866 = _647 ? as_type<int>(_864) : as_type<int>(_149);
    float _868 = _860 + 0.5;
    float _870 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = -_788;
    float _874 = _872 + 1.0;
    bool _876 = !_623;
    float _878 = _876 ? _149 : as_type<float>(_866);
    float _880 = -_752;
    float _882 = fma(_806, _880, _828);
    float _884 = fma(_810, _810, _842);
    int _886 = as_type<int>(_844);
    if (_854)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _557;
    float _890 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = -_878;
    float _894 = _892 + 0.5;
    float _896 = fma(_832, _832, _884);
    float _898 = _868 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _900 = fma(_816, _874, _840);
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _904 = rsqrt(_896);
    float _906 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _908 = _898 * _748;
    float _910 = _902 * _852;
    float _912 = _856 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _914 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _908;
    if (_854)
    {
        float _922 = _888 * 5.0;
        _886 = as_type<int>(_922);
    }
    int _924 = _886;
    out.m_54.x = _882;
    out.m_54.y = _900;
    out.m_54.z = _908;
    out.m_54.w = _910;
    out.m_56.x = _914;
    out.m_56.y = _916;
    out.m_56.z = _918;
    out.m_56.w = _906;
    float _926 = _912 * _904;
    if (_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_924);
        out.gl_Position.z = _2827;
    }
    float _928 = _810 * _926;
    float _930 = _798 * _926;
    if (_854)
    {
        out.m_35.x = 0.0;
    }
    if (_854)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _932 = -_930;
    float _934 = _715 + _932;
    float _936 = _832 * _926;
    float _938 = -_928;
    float _940 = _717 + _938;
    float _942 = -_930;
    float _944 = _798 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _934 + _946;
    float _950 = -_936;
    float _952 = _802 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _940 + _954;
    float _958 = -_928;
    float _960 = _810 + _958;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = _944 * _944;
    float _970 = -_936;
    float _972 = _832 + _970;
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].x, _962);
    float _976 = fma(_960, _960, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    float _980 = fma(_972, _972, _976);
    bool _982 = _978 >= 0.0;
    float _984 = sqrt(_980);
    if (_982)
    {
        _920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _986 = _920;
    int _988 = as_type<int>(_986);
    if (_982)
    {
        out.m_35.x = 0.0;
    }
    if (_982)
    {
        float _990 = _986 * 5.0;
        _988 = as_type<int>(_990);
    }
    int _992 = _988;
    float _994 = _904 * _984;
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2951 = as_type<float>(_992);
        out.gl_Position.z = _2951;
    }
    if (_982)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _996 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _149);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _145);
    float _1002 = _856 * _994;
    float _1004 = _994 * _996;
    float _1006 = _994 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1008 = _1006 * 0.5;
    float _1010 = _1000 * _1002;
    float _1012 = _998 * _1004;
    float _1014 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1016 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1014);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1018);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1020);
    float _1026 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1030 = _717 + _1026;
    float _1032 = _802 + _1028;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1034);
    float _1046 = _1038 * _1038;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1044);
    float _1052 = _1046 + _1048;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1056 = sqrt(_1052);
    float _1058 = _715 + _1054;
    bool _1060 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1054;
    float _1064 = _1050;
    float _1066 = _1034;
    float _1068 = _1048;
    float _1070 = _1030;
    if (!_1060)
    {
        _1062 = _1046;
    }
    float _1072 = _1062;
    float _1074 = _1072;
    if (!_1060)
    {
        _1064 = _1032;
    }
    float _1076 = _1064;
    float _1078 = _1076;
    if (!_1060)
    {
        _1066 = _1058;
    }
    float _1080 = _1066;
    bool _1082 = !_1060;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1056 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1038, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1058, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1074 = _1130;
        _1068 = _1132;
        _1070 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1074;
    float _1138 = _1068;
    float _1140 = _1070;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1238 = _1142 + _1236;
    bool _1240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1252 = _1134 + _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1258 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1260 = -_928;
    float _1262 = _1260 + _1254;
    float _1264 = -_936;
    float _1266 = _1264 + _1256;
    float _1268 = -_930;
    float _1270 = _1268 + _1258;
    float _1272 = _1270;
    float _1274 = _1262;
    float _1276 = _1266;
    if (!_1248)
    {
        float _1278 = _948 * _948;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_802;
        float _1284 = _1282 + _1256;
        float _1286 = -_717;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_956, _956, _1278);
        float _1292 = fma(_966, _966, _1290);
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = sqrt(_1292);
        float _1298 = 1.0 / _994;
        float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = precise::min(_1296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1304 = _1302 * _1280;
        float _1306 = _1304 * _1298;
        float _1308 = -_715;
        float _1310 = _1308 + _1258;
        float _1312 = _1300 * _1306;
        float _1314 = _1284 * _1306;
        float _1316 = fma(_1310, _1312, _934);
        float _1318 = fma(_1288, _1312, _940);
        float _1320 = fma(_1300, _1314, _952);
        _1272 = _1316;
        _1274 = _1318;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1330 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1330);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1342);
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1354 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1370);
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1386 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1378);
    float _1388 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1392 = _1384 + _1386;
    float _1394 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1396 = _1392 * 0.5;
    out.m_35.x = _1394;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_58.z = _1396;
    out.m_58.w = _1386;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _575 = false;
    bool _411 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1453 = as_type<float>(_93);
        out.gl_Position.z = _1453;
    }
    if (!_81)
    {
        return out;
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1522 = as_type<float>(_129);
        out.gl_Position.z = _1522;
    }
    if (_121)
    {
        return out;
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _135 = as_type<int>(_131) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_131) & 2;
    bool _141 = _139 != 0;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_133;
    float _169;
    if (!_151)
    {
        float _153 = in.m_42.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_77);
        float _175 = 1.0 / _173;
        float _177 = _111 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _179 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _209 = 1.0 / _195;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _213 = 1.0 / _203;
    float _215 = 1.0 / _199;
    float _217 = _187 * _209;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _179 + _219;
    float _223 = 1.0 / _207;
    float _225 = _183 * _213;
    bool _227 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = isnan(_179);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -_237;
    float _241 = _239 + 1.0;
    float _243 = _191 * _215;
    bool _245 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_179);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_179);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _255 * _241;
    bool _271 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_179);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _221 * _223;
    float _285 = -_255;
    float _287 = _285 + 1.0;
    bool _289 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_179);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _267 * _287;
    float _311 = -_267;
    float _313 = _311 + 1.0;
    float _315 = fma(_303, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_307, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _281 * _313;
    float _325 = -_281;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    float _337 = fma(_321, _243, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _299 * _327;
    float _341 = fma(_331, _243, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = _315 * _339;
    float _353 = _317 * _339;
    float _355 = fma(_345, _225, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _225, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _371 = fma(_341, _323, _359);
    float _373 = fma(_337, _323, _361);
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _379 = fma(_355, _309, _371);
    float _381 = fma(_357, _309, _373);
    float _383 = fma(_375, _269, _379);
    float _385 = fma(_377, _269, _381);
    float _387 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].x, _383);
    float _389 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].y, _385);
    bool _391 = !_211;
    float _409;
    if (!_391)
    {
        float _393 = in.m_42.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_77);
        float _415 = 1.0 / _413;
        float _417 = _111 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _419 + _421;
    float _425 = in.m_42.x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_419);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _429;
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _457 * _469;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = 1.0 / _445;
    float _479 = _461 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = fma(_479, _423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _487 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_419);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _483 * _477;
    float _501 = _485 * _471;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _419 + _503;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _513 = fma(_499, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _515 = _441 * _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = in.m_44.x;
    float _521 = in.m_44.y;
    float _523 = fma(_513, _515, _511);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _531 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _531 * _425;
    out.m_46.x = _527;
    out.m_46.y = _535;
    out.m_46.z = _539;
    out.m_46.w = _537;
    float _543 = trunc(_541);
    int _545 = int(_543);
    float _547 = _389 * _521;
    float _549 = _387 * _519;
    int _551 = _545 << 4;
    int _553 = _551 + 1968;
    bool _555 = !_463;
    float _557 = _549;
    float _573;
    if (!_555)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_77);
        float _579 = 1.0 / _577;
        float _581 = _111 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = in.m_32.x;
    float _587 = in.m_32.y;
    float _589 = in.m_32.z;
    bool _591 = _425 > 0.5;
    float _593 = in.m_48.x;
    float _595 = in.m_48.y;
    float _597 = in.m_48.z;
    float _599 = in.m_48.w;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = in.m_50.x;
    float _611 = in.m_50.y;
    float _613 = in.m_50.z;
    float _615 = in.m_50.w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_42.w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _629 = in.m_52.x;
    float _631 = in.m_52.y;
    float _633 = in.m_52.z;
    float _635 = in.m_52.w;
    float _637 = in.m_42.z;
    float _639 = in.m_42.y;
    float _641 = _587 * _595;
    float _643 = _587 * _611;
    float _645 = fma(_585, _593, _641);
    bool _647 = _625 > 0.5;
    float _649 = fma(_585, _609, _643);
    float _651 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _587 * _631;
    float _655 = fma(_589, _613, _649);
    float _657 = fma(_589, _597, _645);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _661 = _637 > 0.5;
    float _663 = fma(_585, _629, _653);
    float _665 = -_659;
    float _667 = fma(_651, 2.0, _665);
    float _669 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    float _685 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    float _687 = fma(_669, -2.0, _677);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _583 + _689;
    bool _693 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_583);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = fma(_589, _633, _663);
    float _707 = -_145;
    int _709 = _591 ? as_type<int>(_707) : as_type<int>(_145);
    float _711 = 1.0 / _673;
    bool _713 = _639 > 0.5;
    float _715 = _655 + _615;
    float _717 = _657 + _599;
    float _719 = -_149;
    int _721 = _713 ? as_type<int>(_719) : as_type<int>(_149);
    float _723 = -_111;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _667);
    float _727 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _685);
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    uint _732 = uint(int(uint(_553) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[int(_742)][_744];
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_727;
    float _752 = _750 + 1.0;
    float _754 = _683 * _711;
    bool _756 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = isnan(_583);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    int _768 = _553 + 8;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    float _778 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].w, _729);
    float _780 = fma(_754, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = -_766;
    float _786 = _784 + 1.0;
    float _788 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    float _790 = _703 * _786;
    float _792 = -_703;
    float _794 = _792 + 1.0;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _798 = _715 + _796;
    float _800 = _780 * _790;
    float _802 = _705 + _635;
    bool _804 = !_603;
    float _806 = _804 ? _145 : as_type<float>(_709);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _717 + _808;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _800);
    bool _814 = !_607;
    float _816 = _814 ? _149 : as_type<float>(_721);
    float _818 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _820 = _806 + 0.5;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _826 = _816 + (-0.5);
    float _828 = fma(_818, _820, _725);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _802 + _830;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _836 = -_782;
    float _838 = -_824;
    float _840 = fma(_836, _826, _838);
    float _842 = _798 * _798;
    float _844 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _848 = -_145;
    int _850 = _661 ? as_type<int>(_848) : as_type<int>(_145);
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _854 = _846 >= 0.0;
    float _856 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _858 = !_619;
    float _860 = _858 ? _145 : as_type<float>(_850);
    float _862 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _864 = -_149;
    int _866 = _647 ? as_type<int>(_864) : as_type<int>(_149);
    float _868 = _860 + 0.5;
    float _870 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = -_788;
    float _874 = _872 + 1.0;
    bool _876 = !_623;
    float _878 = _876 ? _149 : as_type<float>(_866);
    float _880 = -_752;
    float _882 = fma(_806, _880, _828);
    float _884 = fma(_810, _810, _842);
    int _886 = as_type<int>(_844);
    if (_854)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _557;
    float _890 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = -_878;
    float _894 = _892 + 0.5;
    float _896 = fma(_832, _832, _884);
    float _898 = _868 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _900 = fma(_816, _874, _840);
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _904 = rsqrt(_896);
    float _906 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _908 = _898 * _748;
    float _910 = _902 * _852;
    float _912 = _856 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _914 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _908;
    if (_854)
    {
        float _922 = _888 * 5.0;
        _886 = as_type<int>(_922);
    }
    int _924 = _886;
    out.m_54.x = _882;
    out.m_54.y = _900;
    out.m_54.z = _908;
    out.m_54.w = _910;
    out.m_56.x = _914;
    out.m_56.y = _916;
    out.m_56.z = _918;
    out.m_56.w = _906;
    float _926 = _912 * _904;
    if (_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_924);
        out.gl_Position.z = _2827;
    }
    float _928 = _810 * _926;
    float _930 = _798 * _926;
    if (_854)
    {
        out.m_35.x = 0.0;
    }
    if (_854)
    {
        return out;
    }
    float _932 = -_930;
    float _934 = _715 + _932;
    float _936 = _832 * _926;
    float _938 = -_928;
    float _940 = _717 + _938;
    float _942 = -_930;
    float _944 = _798 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _934 + _946;
    float _950 = -_936;
    float _952 = _802 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _940 + _954;
    float _958 = -_928;
    float _960 = _810 + _958;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = _944 * _944;
    float _970 = -_936;
    float _972 = _832 + _970;
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].x, _962);
    float _976 = fma(_960, _960, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    float _980 = fma(_972, _972, _976);
    bool _982 = _978 >= 0.0;
    float _984 = sqrt(_980);
    if (_982)
    {
        _920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _986 = _920;
    int _988 = as_type<int>(_986);
    if (_982)
    {
        out.m_35.x = 0.0;
    }
    if (_982)
    {
        float _990 = _986 * 5.0;
        _988 = as_type<int>(_990);
    }
    int _992 = _988;
    float _994 = _904 * _984;
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2951 = as_type<float>(_992);
        out.gl_Position.z = _2951;
    }
    if (_982)
    {
        return out;
    }
    float _996 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _149);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _145);
    float _1002 = _856 * _994;
    float _1004 = _994 * _996;
    float _1006 = _994 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1008 = _1006 * 0.5;
    float _1010 = _1000 * _1002;
    float _1012 = _998 * _1004;
    float _1014 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1016 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1014);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1018);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1020);
    float _1026 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1030 = _717 + _1026;
    float _1032 = _802 + _1028;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1034);
    float _1046 = _1038 * _1038;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1044);
    float _1052 = _1046 + _1048;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1056 = sqrt(_1052);
    float _1058 = _715 + _1054;
    bool _1060 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1054;
    float _1064 = _1050;
    float _1066 = _1034;
    float _1068 = _1048;
    float _1070 = _1030;
    if (!_1060)
    {
        _1062 = _1046;
    }
    float _1072 = _1062;
    float _1074 = _1072;
    if (!_1060)
    {
        _1064 = _1032;
    }
    float _1076 = _1064;
    float _1078 = _1076;
    if (!_1060)
    {
        _1066 = _1058;
    }
    float _1080 = _1066;
    bool _1082 = !_1060;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1056 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1038, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1058, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1074 = _1130;
        _1068 = _1132;
        _1070 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1074;
    float _1138 = _1068;
    float _1140 = _1070;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1238 = _1142 + _1236;
    bool _1240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1252 = _1134 + _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1258 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1260 = -_928;
    float _1262 = _1260 + _1254;
    float _1264 = -_936;
    float _1266 = _1264 + _1256;
    float _1268 = -_930;
    float _1270 = _1268 + _1258;
    float _1272 = _1270;
    float _1274 = _1262;
    float _1276 = _1266;
    if (!_1248)
    {
        float _1278 = _948 * _948;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_802;
        float _1284 = _1282 + _1256;
        float _1286 = -_717;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_956, _956, _1278);
        float _1292 = fma(_966, _966, _1290);
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = sqrt(_1292);
        float _1298 = 1.0 / _994;
        float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = precise::min(_1296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1304 = _1302 * _1280;
        float _1306 = _1304 * _1298;
        float _1308 = -_715;
        float _1310 = _1308 + _1258;
        float _1312 = _1300 * _1306;
        float _1314 = _1284 * _1306;
        float _1316 = fma(_1310, _1312, _934);
        float _1318 = fma(_1288, _1312, _940);
        float _1320 = fma(_1300, _1314, _952);
        _1272 = _1316;
        _1274 = _1318;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1330 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1330);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1342);
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1354 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1370);
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1386 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1378);
    float _1388 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1392 = _1384 + _1386;
    float _1394 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1396 = _1392 * 0.5;
    out.m_35.x = _1394;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_58.z = _1396;
    out.m_58.w = _1386;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1200 = false;
    bool _575 = false;
    bool _411 = false;
    bool _171 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _72 = in.m_32.w;
    float _74 = trunc(_72);
    int _77 = int(_74);
    bool _81 = _77 >= 1;
    float _83 = 0.0;
    if (!_81)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _85 = _83;
    float _87 = _85;
    if (!_81)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_81)
    {
        float _91 = _85 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_81)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1453 = as_type<float>(_93);
        out.gl_Position.z = _1453;
    }
    if (!_81)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    bool _99 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _107 = _103 || _105;
    float _109 = -_97;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_107)
    {
        float _113 = float(_77);
        _87 = _113;
    }
    float _115 = _87;
    bool _117 = _111 >= _115;
    bool _119 = !_107;
    bool _121 = _117 || _119;
    float _123 = _115;
    if (_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (_121)
    {
        out.m_35.x = 0.0;
    }
    if (_121)
    {
        float _127 = _125 * 5.0;
        _95 = as_type<int>(_127);
    }
    int _129 = _95;
    if (_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1522 = as_type<float>(_129);
        out.gl_Position.z = _1522;
    }
    if (_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = as_type<float>(int(gl_VertexIndex));
    bool _133 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _135 = as_type<int>(_131) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_131) & 2;
    bool _141 = _139 != 0;
    bool _143 = !_137;
    float _145 = _143 ? (-0.5) : 0.5;
    bool _147 = !_141;
    float _149 = _147 ? (-0.5) : 0.5;
    bool _151 = !_133;
    float _169;
    if (!_151)
    {
        float _153 = in.m_42.x;
        float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _157 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _159 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _161 = _159 * _155;
        float _163 = floor(_161);
        float _165 = -_163;
        float _167 = _161 + _165;
        _169 = _167;
        _171 = true;
    }
    else
    {
        float _173 = float(_77);
        float _175 = 1.0 / _173;
        float _177 = _111 * _175;
        _169 = _177;
    }
    _171 = false;
    float _179 = _169;
    float _181 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _183 = _179 + _181;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = _179 + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _179 + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _193;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _199 = _197 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _209 = 1.0 / _195;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _213 = 1.0 / _203;
    float _215 = 1.0 / _199;
    float _217 = _187 * _209;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _221 = _179 + _219;
    float _223 = 1.0 / _207;
    float _225 = _183 * _213;
    bool _227 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = isnan(_179);
    bool _231 = _227 || _229;
    bool _233 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _235 = _231 || _233;
    float _237 = float(_235);
    float _239 = -_237;
    float _241 = _239 + 1.0;
    float _243 = _191 * _215;
    bool _245 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _247 = isnan(_179);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    bool _257 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_179);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _255 * _241;
    bool _271 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _273 = isnan(_179);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _221 * _223;
    float _285 = -_255;
    float _287 = _285 + 1.0;
    bool _289 = _179 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_179);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _305;
    float _309 = _267 * _287;
    float _311 = -_267;
    float _313 = _311 + 1.0;
    float _315 = fma(_303, _217, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_307, _217, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _281 * _313;
    float _325 = -_281;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = -_299;
    float _335 = _333 + 1.0;
    float _337 = fma(_321, _243, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _299 * _327;
    float _341 = fma(_331, _243, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _347;
    float _351 = _315 * _339;
    float _353 = _317 * _339;
    float _355 = fma(_345, _225, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _357 = fma(_349, _225, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _371 = fma(_341, _323, _359);
    float _373 = fma(_337, _323, _361);
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _379 = fma(_355, _309, _371);
    float _381 = fma(_357, _309, _373);
    float _383 = fma(_375, _269, _379);
    float _385 = fma(_377, _269, _381);
    float _387 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].x, _383);
    float _389 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[147].y, _385);
    bool _391 = !_211;
    float _409;
    if (!_391)
    {
        float _393 = in.m_42.x;
        float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _397 = _393 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _399 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _401 = _399 * _395;
        float _403 = floor(_401);
        float _405 = -_403;
        float _407 = _401 + _405;
        _409 = _407;
        _411 = true;
    }
    else
    {
        float _413 = float(_77);
        float _415 = 1.0 / _413;
        float _417 = _111 * _415;
        _409 = _417;
    }
    _411 = false;
    float _419 = _409;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _419 + _421;
    float _425 = in.m_42.x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _431 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _433 = isnan(_419);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _447 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _459;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _429;
    float _467 = -_441;
    float _469 = _467 + 1.0;
    float _471 = _457 * _469;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = 1.0 / _445;
    float _479 = _461 * _465;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _485 = fma(_479, _423, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _487 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _489 = isnan(_419);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = _483 * _477;
    float _501 = _485 * _471;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _505 = _419 + _503;
    float _507 = -_497;
    float _509 = _507 + 1.0;
    float _511 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[115].x, _501);
    float _513 = fma(_499, _505, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _515 = _441 * _509;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = in.m_44.x;
    float _521 = in.m_44.y;
    float _523 = fma(_513, _515, _511);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _529 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[117].x, _523);
    float _531 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _537 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _539 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _531 * _425;
    out.m_46.x = _527;
    out.m_46.y = _535;
    out.m_46.z = _539;
    out.m_46.w = _537;
    float _543 = trunc(_541);
    int _545 = int(_543);
    float _547 = _389 * _521;
    float _549 = _387 * _519;
    int _551 = _545 << 4;
    int _553 = _551 + 1968;
    bool _555 = !_463;
    float _557 = _549;
    float _573;
    if (!_555)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _561 = _425 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[11].w, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        float _577 = float(_77);
        float _579 = 1.0 / _577;
        float _581 = _111 * _579;
        _573 = _581;
    }
    _575 = false;
    float _583 = _573;
    float _585 = in.m_32.x;
    float _587 = in.m_32.y;
    float _589 = in.m_32.z;
    bool _591 = _425 > 0.5;
    float _593 = in.m_48.x;
    float _595 = in.m_48.y;
    float _597 = in.m_48.z;
    float _599 = in.m_48.w;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _607 = _605 != 0;
    float _609 = in.m_50.x;
    float _611 = in.m_50.y;
    float _613 = in.m_50.z;
    float _615 = in.m_50.w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _623 = _621 != 0;
    float _625 = in.m_42.w;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _629 = in.m_52.x;
    float _631 = in.m_52.y;
    float _633 = in.m_52.z;
    float _635 = in.m_52.w;
    float _637 = in.m_42.z;
    float _639 = in.m_42.y;
    float _641 = _587 * _595;
    float _643 = _587 * _611;
    float _645 = fma(_585, _593, _641);
    bool _647 = _625 > 0.5;
    float _649 = fma(_585, _609, _643);
    float _651 = _425 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = _587 * _631;
    float _655 = fma(_589, _613, _649);
    float _657 = fma(_589, _597, _645);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _661 = _637 > 0.5;
    float _663 = fma(_585, _629, _653);
    float _665 = -_659;
    float _667 = fma(_651, 2.0, _665);
    float _669 = _639 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _679 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _681;
    float _685 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    float _687 = fma(_669, -2.0, _677);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _691 = _583 + _689;
    bool _693 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _695 = isnan(_583);
    bool _697 = _693 || _695;
    bool _699 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _701 = _697 || _699;
    float _703 = float(_701);
    float _705 = fma(_589, _633, _663);
    float _707 = -_145;
    int _709 = _591 ? as_type<int>(_707) : as_type<int>(_145);
    float _711 = 1.0 / _673;
    bool _713 = _639 > 0.5;
    float _715 = _655 + _615;
    float _717 = _657 + _599;
    float _719 = -_149;
    int _721 = _713 ? as_type<int>(_719) : as_type<int>(_149);
    float _723 = -_111;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[76].x, _667);
    float _727 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _685);
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    uint _732 = uint(int(uint(_553) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[int(_742)][_744];
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _750 = -_727;
    float _752 = _750 + 1.0;
    float _754 = _683 * _711;
    bool _756 = _583 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = isnan(_583);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _764 = _760 || _762;
    float _766 = float(_764);
    int _768 = _553 + 8;
    uint _770 = uint(int(uint(_768) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    float _778 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[78].w, _729);
    float _780 = fma(_754, _691, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _627 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _784 = -_766;
    float _786 = _784 + 1.0;
    float _788 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _778);
    float _790 = _703 * _786;
    float _792 = -_703;
    float _794 = _792 + 1.0;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _798 = _715 + _796;
    float _800 = _780 * _790;
    float _802 = _705 + _635;
    bool _804 = !_603;
    float _806 = _804 ? _145 : as_type<float>(_709);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _717 + _808;
    float _812 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[131].x, _800);
    bool _814 = !_607;
    float _816 = _814 ? _149 : as_type<float>(_721);
    float _818 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _820 = _806 + 0.5;
    float _822 = _798 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _824 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _687);
    float _826 = _816 + (-0.5);
    float _828 = fma(_818, _820, _725);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _802 + _830;
    float _834 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _822);
    float _836 = -_782;
    float _838 = -_824;
    float _840 = fma(_836, _826, _838);
    float _842 = _798 * _798;
    float _844 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[132].x, _812);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[28].z, _834);
    float _848 = -_145;
    int _850 = _661 ? as_type<int>(_848) : as_type<int>(_145);
    float _852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _854 = _846 >= 0.0;
    float _856 = _549 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _858 = !_619;
    float _860 = _858 ? _145 : as_type<float>(_850);
    float _862 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _864 = -_149;
    int _866 = _647 ? as_type<int>(_864) : as_type<int>(_149);
    float _868 = _860 + 0.5;
    float _870 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _872 = -_788;
    float _874 = _872 + 1.0;
    bool _876 = !_623;
    float _878 = _876 ? _149 : as_type<float>(_866);
    float _880 = -_752;
    float _882 = fma(_806, _880, _828);
    float _884 = fma(_810, _810, _842);
    int _886 = as_type<int>(_844);
    if (_854)
    {
        _557 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _888 = _557;
    float _890 = _776 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _892 = -_878;
    float _894 = _892 + 0.5;
    float _896 = fma(_832, _832, _884);
    float _898 = _868 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _900 = fma(_816, _874, _840);
    float _902 = _894 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _904 = rsqrt(_896);
    float _906 = _844 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _908 = _898 * _748;
    float _910 = _902 * _852;
    float _912 = _856 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _914 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _916 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _918 = _890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _920 = _908;
    if (_854)
    {
        float _922 = _888 * 5.0;
        _886 = as_type<int>(_922);
    }
    int _924 = _886;
    out.m_54.x = _882;
    out.m_54.y = _900;
    out.m_54.z = _908;
    out.m_54.w = _910;
    out.m_56.x = _914;
    out.m_56.y = _916;
    out.m_56.z = _918;
    out.m_56.w = _906;
    float _926 = _912 * _904;
    if (_854)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_924);
        out.gl_Position.z = _2827;
    }
    float _928 = _810 * _926;
    float _930 = _798 * _926;
    if (_854)
    {
        out.m_35.x = 0.0;
    }
    if (_854)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _932 = -_930;
    float _934 = _715 + _932;
    float _936 = _832 * _926;
    float _938 = -_928;
    float _940 = _717 + _938;
    float _942 = -_930;
    float _944 = _798 + _942;
    float _946 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _948 = _934 + _946;
    float _950 = -_936;
    float _952 = _802 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _956 = _940 + _954;
    float _958 = -_928;
    float _960 = _810 + _958;
    float _962 = _948 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _966 = _952 + _964;
    float _968 = _944 * _944;
    float _970 = -_936;
    float _972 = _832 + _970;
    float _974 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[28].x, _962);
    float _976 = fma(_960, _960, _968);
    float _978 = fma(_966, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    float _980 = fma(_972, _972, _976);
    bool _982 = _978 >= 0.0;
    float _984 = sqrt(_980);
    if (_982)
    {
        _920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _986 = _920;
    int _988 = as_type<int>(_986);
    if (_982)
    {
        out.m_35.x = 0.0;
    }
    if (_982)
    {
        float _990 = _986 * 5.0;
        _988 = as_type<int>(_990);
    }
    int _992 = _988;
    float _994 = _904 * _984;
    if (_982)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2951 = as_type<float>(_992);
        out.gl_Position.z = _2951;
    }
    if (_982)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _996 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _149);
    float _1000 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _145);
    float _1002 = _856 * _994;
    float _1004 = _994 * _996;
    float _1006 = _994 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1008 = _1006 * 0.5;
    float _1010 = _1000 * _1002;
    float _1012 = _998 * _1004;
    float _1014 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1016 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1018 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1014);
    float _1020 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1016);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1018);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1020);
    float _1026 = _1022 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1028 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1030 = _717 + _1026;
    float _1032 = _802 + _1028;
    float _1034 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1038 = _1030 + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1034);
    float _1046 = _1038 * _1038;
    float _1048 = _1042 * _1042;
    float _1050 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1044);
    float _1052 = _1046 + _1048;
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1056 = sqrt(_1052);
    float _1058 = _715 + _1054;
    bool _1060 = _1056 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1062 = _1054;
    float _1064 = _1050;
    float _1066 = _1034;
    float _1068 = _1048;
    float _1070 = _1030;
    if (!_1060)
    {
        _1062 = _1046;
    }
    float _1072 = _1062;
    float _1074 = _1072;
    if (!_1060)
    {
        _1064 = _1032;
    }
    float _1076 = _1064;
    float _1078 = _1076;
    if (!_1060)
    {
        _1066 = _1058;
    }
    float _1080 = _1066;
    bool _1082 = !_1060;
    float _1084 = _1080;
    if (!_1082)
    {
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1090 = _1056 + _1088;
        float _1092 = rsqrt(_1052);
        float _1094 = _1090 * _1086;
        float _1096 = _1058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1098 = _1094 * 0.15915493667125701904296875;
        float _1100 = _1098 * 6.283185482025146484375;
        float _1102 = sin(_1100);
        float _1104 = _1098 * 6.283185482025146484375;
        float _1106 = cos(_1104);
        float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1110 = _1092 * _1108;
        float _1112 = _1106 + (-1.0);
        float _1114 = fma(_1038, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1116 = fma(_1042, _1110, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1118 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1120 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1122 = _1114 + _1120;
        float _1124 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1126 = _1116 + _1124;
        float _1128 = fma(_1058, _1106, _1118);
        float _1130 = _1122 * _1122;
        float _1132 = _1126 * _1126;
        _1084 = _1128;
        _1074 = _1130;
        _1068 = _1132;
        _1070 = _1114;
        _1078 = _1116;
    }
    float _1134 = _1084;
    float _1136 = _1074;
    float _1138 = _1068;
    float _1140 = _1070;
    float _1142 = _1078;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1146 = _1134 + _1144;
    float _1148 = fma(_1146, _1146, _1136);
    float _1150 = _1148 + _1138;
    float _1152 = sqrt(_1150);
    bool _1154 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1156 = isnan(_1152);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1162 = _1158 || _1160;
    float _1164 = _1148;
    if (!_1162)
    {
        _1164 = 1.0;
    }
    float _1166 = _1164;
    bool _1168 = !_1162;
    float _1170 = _1166;
    if (!_1168)
    {
        bool _1172 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1174 = isnan(_1152);
        bool _1176 = _1172 || _1174;
        bool _1178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1180 = _1176 || _1178;
        if (!_1180)
        {
            float _1182 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1184 = _1152 + _1182;
            float _1186 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1188 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1186;
            float _1190 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1192 = _1190 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1194 = 1.0 / _1188;
            float _1196 = _1184 * _1194;
            float _1198 = fma(_1196, _1192, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1170 = _1198;
            _1200 = true;
        }
        else
        {
            bool _1202 = _1152 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1204 = isnan(_1152);
            bool _1206 = _1202 || _1204;
            bool _1208 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1210 = _1206 || _1208;
            if (!_1210)
            {
                float _1212 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1214 = _1152 + _1212;
                float _1216 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1218 = _1216 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1220 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1222 = _1220 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1224 = 1.0 / _1218;
                float _1226 = _1214 * _1224;
                float _1228 = fma(_1226, _1222, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1170 = _1228;
                _1200 = true;
            }
            else
            {
                _1170 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1200 = false;
    float _1230 = _1170;
    float _1232 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1234 = _1140 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1238 = _1142 + _1236;
    bool _1240 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.5);
    bool _1248 = _1244 || _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1252 = _1134 + _1250;
    float _1254 = fma(_1234, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1256 = fma(_1238, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1258 = fma(_1252, _1230, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1260 = -_928;
    float _1262 = _1260 + _1254;
    float _1264 = -_936;
    float _1266 = _1264 + _1256;
    float _1268 = -_930;
    float _1270 = _1268 + _1258;
    float _1272 = _1270;
    float _1274 = _1262;
    float _1276 = _1266;
    if (!_1248)
    {
        float _1278 = _948 * _948;
        float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1282 = -_802;
        float _1284 = _1282 + _1256;
        float _1286 = -_717;
        float _1288 = _1286 + _1254;
        float _1290 = fma(_956, _956, _1278);
        float _1292 = fma(_966, _966, _1290);
        float _1294 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1296 = sqrt(_1292);
        float _1298 = 1.0 / _994;
        float _1300 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1302 = precise::min(_1296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1304 = _1302 * _1280;
        float _1306 = _1304 * _1298;
        float _1308 = -_715;
        float _1310 = _1308 + _1258;
        float _1312 = _1300 * _1306;
        float _1314 = _1284 * _1306;
        float _1316 = fma(_1310, _1312, _934);
        float _1318 = fma(_1288, _1312, _940);
        float _1320 = fma(_1300, _1314, _952);
        _1272 = _1316;
        _1274 = _1318;
        _1276 = _1320;
    }
    float _1322 = _1272;
    float _1324 = _1274;
    float _1326 = _1276;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1330 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1328);
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1330);
    float _1340 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1342 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1334);
    float _1344 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1336);
    float _1346 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1348 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1350 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1342);
    float _1352 = _1344 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1354 = _1346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1360 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1366 = _1352 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1368 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1360);
    float _1370 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1372 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1364);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1366);
    float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1368);
    float _1378 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1370);
    float _1380 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1372);
    float _1382 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1374);
    float _1384 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1376);
    float _1386 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1378);
    float _1388 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1380);
    float _1390 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1382);
    float _1392 = _1384 + _1386;
    float _1394 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1396 = _1392 * 0.5;
    out.m_35.x = _1394;
    out.gl_Position.x = _1388;
    out.gl_Position.y = _1390;
    out.gl_Position.z = _1384;
    out.gl_Position.w = _1386;
    out.m_58.z = _1396;
    out.m_58.w = _1386;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

