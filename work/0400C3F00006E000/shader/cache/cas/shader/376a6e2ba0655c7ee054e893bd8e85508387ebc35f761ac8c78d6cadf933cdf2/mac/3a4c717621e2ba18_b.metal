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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_43 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_41 [[attribute(4)]];
    float4 m_39 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _911 = false;
    bool _527 = false;
    bool _415 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    bool _425 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _427 = isnan(_423);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _423 + _457;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _467 = 1.0 / _439;
    float _469 = _451 * _463;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = _455 * _467;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _481 = _477 * _469;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _485 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[116].x, _487);
    float _495 = in.m_39.x;
    float _497 = in.m_39.y;
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _499;
    out.m_43.y = _491;
    out.m_43.z = _485;
    out.m_43.w = _501;
    float _503 = _393 * _497;
    float _505 = _391 * _495;
    bool _507 = !_465;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_71);
        float _531 = 1.0 / _529;
        float _533 = _105 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = in.m_41.x;
    float _543 = in.m_41.y;
    int _545 = as_type<int>(_537) & 1;
    bool _547 = _545 != 0;
    int _549 = as_type<int>(_537) & 2;
    bool _551 = _549 != 0;
    float _553 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _557 = _541 > 0.5;
    bool _559 = !_551;
    float _561 = _559 ? (-0.5) : 0.5;
    bool _563 = !_547;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = _543 > 0.5;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _561);
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _565);
    float _573 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _575 = _539 * _569;
    float _577 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _553 * _571;
    float _581 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _587 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _585);
    float _595 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _597 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _591);
    float _601 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = _601 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _617 = _605 + _607;
    float _619 = _603 + _609;
    float _621 = 1.0 / _613;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _625 = _617 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _629 = _619 + _627;
    float _631 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _633 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
    float _635 = _625 * _625;
    float _637 = _629 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    bool _643 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = isnan(_535);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _631);
    float _657 = _635 + _637;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _535 + _659;
    bool _663 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_535);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -_653;
    float _677 = _675 + 1.0;
    float _679 = sqrt(_657);
    float _681 = _641 * _621;
    float _683 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _685 = _673 * _677;
    float _687 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _689 = fma(_681, _661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _691 = -_673;
    float _693 = _691 + 1.0;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _689 * _685;
    float _699 = _683 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _703 = _701 != 0;
    float _705 = -_565;
    float _707 = _557 ? _705 : _565;
    float _709 = _699 + _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    bool _717 = _679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _719 = !_703;
    float _721 = _719 ? _565 : _707;
    float _723 = _697;
    float _725 = _693;
    float _727 = _707;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _731 = _565;
    if (!_717)
    {
        _723 = _637;
    }
    float _733 = _723;
    float _735 = _733;
    if (!_717)
    {
        _725 = _635;
    }
    float _737 = _725;
    float _739 = _737;
    if (!_717)
    {
        _727 = _617;
    }
    float _741 = _727;
    float _743 = _741;
    if (!_717)
    {
        _729 = _619;
    }
    float _745 = _729;
    float _747 = _745;
    if (!_717)
    {
        _731 = _709;
    }
    float _749 = _731;
    bool _751 = !_717;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _679 + _757;
        float _761 = _709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = rsqrt(_657);
        float _765 = _759 * _755;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = cos(_773);
        float _777 = fma(_771, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _779 = _763 * _777;
        float _781 = _775 + (-1.0);
        float _783 = fma(_625, _779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _785 = fma(_629, _779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _787 = _781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _791 = _783 + _789;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _795 = _785 + _793;
        float _797 = fma(_709, _775, _787);
        float _799 = _791 * _791;
        float _801 = _795 * _795;
        _753 = _797;
        _739 = _799;
        _735 = _801;
        _743 = _783;
        _747 = _785;
    }
    float _803 = _753;
    float _805 = _739;
    float _807 = _735;
    float _809 = _743;
    float _811 = _747;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _815 = _803 + _813;
    float _817 = -_561;
    int _819 = _567 ? as_type<int>(_817) : as_type<int>(_561);
    float _821 = _721 + 0.5;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_815, _815, _805);
    bool _827 = !_713;
    float _829 = _827 ? _561 : as_type<float>(_819);
    float _831 = _821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[132].x, _715);
    float _835 = _825 + _807;
    float _837 = _831 * _555;
    float _839 = -_829;
    float _841 = _839 + 0.5;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = sqrt(_835);
    float _847 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _855 = _847 * _823;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _837;
    out.m_48.y = _855;
    out.m_50.x = _857;
    out.m_50.y = _859;
    out.m_50.z = _861;
    out.m_50.w = _843;
    bool _863 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _865 = isnan(_845);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _871 = _867 || _869;
    float _873 = _849;
    float _875 = _811;
    if (!_871)
    {
        _873 = 1.0;
    }
    float _877 = _873;
    bool _879 = !_871;
    float _881 = _877;
    if (!_879)
    {
        bool _883 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _885 = isnan(_845);
        bool _887 = _883 || _885;
        bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _891 = _887 || _889;
        if (!_891)
        {
            float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _895 = _845 + _893;
            float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _899 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _897;
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _905 = 1.0 / _899;
            float _907 = _895 * _905;
            float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _881 = _909;
            _911 = true;
        }
        else
        {
            bool _913 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _915 = isnan(_845);
            bool _917 = _913 || _915;
            bool _919 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _921 = _917 || _919;
            if (!_921)
            {
                float _923 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _925 = _845 + _923;
                float _927 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _929 = _927 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _933 = _931 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _935 = 1.0 / _929;
                float _937 = _925 * _935;
                float _939 = fma(_937, _933, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _881 = _939;
                _911 = true;
            }
            else
            {
                _881 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _911 = false;
    float _941 = _881;
    float _943 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _945 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _947 = _809 + _945;
    float _949 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _943);
    bool _951 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    float _961 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _975 = fma(_947, _941, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _977 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _803 + _979;
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _985 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _987 = _811 + _985;
    float _989 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _991 = fma(_981, _941, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = 1.0 / _983;
    float _995 = fma(_987, _941, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = _941;
    float _1001 = _947;
    if (_959)
    {
        _999 = _975;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (_959)
    {
        _1001 = _991;
    }
    float _1007 = _1001;
    float _1009 = _997 + _983;
    float _1011 = _1007;
    if (_959)
    {
        _875 = _995;
    }
    float _1013 = _875;
    float _1015 = _1013;
    if (!_959)
    {
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1019 = _699 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1023 = _605 + _1021;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = -_603;
        float _1029 = _1027 + _995;
        float _1031 = _1019 * _1019;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1035 = _603 + _1033;
        float _1037 = fma(_1023, _1023, _1031);
        float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1041 = fma(_1035, _1035, _1037);
        float _1043 = sqrt(_1041);
        float _1045 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1047 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1049 = _1047 * _1039;
        float _1051 = -_605;
        float _1053 = _1051 + _975;
        float _1055 = -_699;
        float _1057 = _1055 + _991;
        float _1059 = _1045 * _1049;
        float _1061 = fma(_1053, _1059, _605);
        float _1063 = fma(_1057, _1059, _699);
        float _1065 = fma(_1029, _1059, _603);
        _1011 = _1063;
        _1005 = _1061;
        _1015 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1005;
    float _1071 = _1015;
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1073);
    float _1083 = _1009 * _993;
    float _1085 = _1083 * 0.5;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1077);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1079);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1095 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1099 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1087;
    if (_971)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_971)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1175 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1177 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1179 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1183 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1173);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1175);
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1177);
    float _1189 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1187);
    bool _1199 = _1167 > 0.0;
    bool _1201 = isnan(_1167);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1213 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1193);
    float _1215 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1197);
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1195);
    float _1219 = _1209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1211 + _1215;
    float _1223 = _1217 + _1215;
    float _1225 = _1215 * 0.5;
    float _1227 = _1221 * 0.5;
    float _1229 = _1223 * 0.5;
    float _1231 = fma(_1213, -0.5, _1225);
    out.m_35.x = _1219;
    out.gl_Position.x = _1211;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1217;
    out.gl_Position.w = _1215;
    out.m_52.x = _1227;
    out.m_52.y = _1231;
    out.m_52.z = _1229;
    out.m_52.w = _1215;
    if (_1207)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _911 = false;
    bool _527 = false;
    bool _415 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
    }
    if (!_75)
    {
        return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    bool _425 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _427 = isnan(_423);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _423 + _457;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _467 = 1.0 / _439;
    float _469 = _451 * _463;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = _455 * _467;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _481 = _477 * _469;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _485 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[116].x, _487);
    float _495 = in.m_39.x;
    float _497 = in.m_39.y;
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _499;
    out.m_43.y = _491;
    out.m_43.z = _485;
    out.m_43.w = _501;
    float _503 = _393 * _497;
    float _505 = _391 * _495;
    bool _507 = !_465;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_71);
        float _531 = 1.0 / _529;
        float _533 = _105 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = in.m_41.x;
    float _543 = in.m_41.y;
    int _545 = as_type<int>(_537) & 1;
    bool _547 = _545 != 0;
    int _549 = as_type<int>(_537) & 2;
    bool _551 = _549 != 0;
    float _553 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _557 = _541 > 0.5;
    bool _559 = !_551;
    float _561 = _559 ? (-0.5) : 0.5;
    bool _563 = !_547;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = _543 > 0.5;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _561);
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _565);
    float _573 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _575 = _539 * _569;
    float _577 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _553 * _571;
    float _581 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _587 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _585);
    float _595 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _597 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _591);
    float _601 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = _601 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _617 = _605 + _607;
    float _619 = _603 + _609;
    float _621 = 1.0 / _613;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _625 = _617 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _629 = _619 + _627;
    float _631 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _633 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
    float _635 = _625 * _625;
    float _637 = _629 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    bool _643 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = isnan(_535);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _631);
    float _657 = _635 + _637;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _535 + _659;
    bool _663 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_535);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -_653;
    float _677 = _675 + 1.0;
    float _679 = sqrt(_657);
    float _681 = _641 * _621;
    float _683 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _685 = _673 * _677;
    float _687 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _689 = fma(_681, _661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _691 = -_673;
    float _693 = _691 + 1.0;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _689 * _685;
    float _699 = _683 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _703 = _701 != 0;
    float _705 = -_565;
    float _707 = _557 ? _705 : _565;
    float _709 = _699 + _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    bool _717 = _679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _719 = !_703;
    float _721 = _719 ? _565 : _707;
    float _723 = _697;
    float _725 = _693;
    float _727 = _707;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _731 = _565;
    if (!_717)
    {
        _723 = _637;
    }
    float _733 = _723;
    float _735 = _733;
    if (!_717)
    {
        _725 = _635;
    }
    float _737 = _725;
    float _739 = _737;
    if (!_717)
    {
        _727 = _617;
    }
    float _741 = _727;
    float _743 = _741;
    if (!_717)
    {
        _729 = _619;
    }
    float _745 = _729;
    float _747 = _745;
    if (!_717)
    {
        _731 = _709;
    }
    float _749 = _731;
    bool _751 = !_717;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _679 + _757;
        float _761 = _709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = rsqrt(_657);
        float _765 = _759 * _755;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = cos(_773);
        float _777 = fma(_771, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _779 = _763 * _777;
        float _781 = _775 + (-1.0);
        float _783 = fma(_625, _779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _785 = fma(_629, _779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _787 = _781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _791 = _783 + _789;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _795 = _785 + _793;
        float _797 = fma(_709, _775, _787);
        float _799 = _791 * _791;
        float _801 = _795 * _795;
        _753 = _797;
        _739 = _799;
        _735 = _801;
        _743 = _783;
        _747 = _785;
    }
    float _803 = _753;
    float _805 = _739;
    float _807 = _735;
    float _809 = _743;
    float _811 = _747;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _815 = _803 + _813;
    float _817 = -_561;
    int _819 = _567 ? as_type<int>(_817) : as_type<int>(_561);
    float _821 = _721 + 0.5;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_815, _815, _805);
    bool _827 = !_713;
    float _829 = _827 ? _561 : as_type<float>(_819);
    float _831 = _821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[132].x, _715);
    float _835 = _825 + _807;
    float _837 = _831 * _555;
    float _839 = -_829;
    float _841 = _839 + 0.5;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = sqrt(_835);
    float _847 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _855 = _847 * _823;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _837;
    out.m_48.y = _855;
    out.m_50.x = _857;
    out.m_50.y = _859;
    out.m_50.z = _861;
    out.m_50.w = _843;
    bool _863 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _865 = isnan(_845);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _871 = _867 || _869;
    float _873 = _849;
    float _875 = _811;
    if (!_871)
    {
        _873 = 1.0;
    }
    float _877 = _873;
    bool _879 = !_871;
    float _881 = _877;
    if (!_879)
    {
        bool _883 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _885 = isnan(_845);
        bool _887 = _883 || _885;
        bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _891 = _887 || _889;
        if (!_891)
        {
            float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _895 = _845 + _893;
            float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _899 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _897;
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _905 = 1.0 / _899;
            float _907 = _895 * _905;
            float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _881 = _909;
            _911 = true;
        }
        else
        {
            bool _913 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _915 = isnan(_845);
            bool _917 = _913 || _915;
            bool _919 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _921 = _917 || _919;
            if (!_921)
            {
                float _923 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _925 = _845 + _923;
                float _927 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _929 = _927 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _933 = _931 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _935 = 1.0 / _929;
                float _937 = _925 * _935;
                float _939 = fma(_937, _933, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _881 = _939;
                _911 = true;
            }
            else
            {
                _881 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _911 = false;
    float _941 = _881;
    float _943 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _945 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _947 = _809 + _945;
    float _949 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _943);
    bool _951 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    float _961 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _975 = fma(_947, _941, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _977 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _803 + _979;
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _985 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _987 = _811 + _985;
    float _989 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _991 = fma(_981, _941, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = 1.0 / _983;
    float _995 = fma(_987, _941, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = _941;
    float _1001 = _947;
    if (_959)
    {
        _999 = _975;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (_959)
    {
        _1001 = _991;
    }
    float _1007 = _1001;
    float _1009 = _997 + _983;
    float _1011 = _1007;
    if (_959)
    {
        _875 = _995;
    }
    float _1013 = _875;
    float _1015 = _1013;
    if (!_959)
    {
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1019 = _699 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1023 = _605 + _1021;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = -_603;
        float _1029 = _1027 + _995;
        float _1031 = _1019 * _1019;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1035 = _603 + _1033;
        float _1037 = fma(_1023, _1023, _1031);
        float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1041 = fma(_1035, _1035, _1037);
        float _1043 = sqrt(_1041);
        float _1045 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1047 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1049 = _1047 * _1039;
        float _1051 = -_605;
        float _1053 = _1051 + _975;
        float _1055 = -_699;
        float _1057 = _1055 + _991;
        float _1059 = _1045 * _1049;
        float _1061 = fma(_1053, _1059, _605);
        float _1063 = fma(_1057, _1059, _699);
        float _1065 = fma(_1029, _1059, _603);
        _1011 = _1063;
        _1005 = _1061;
        _1015 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1005;
    float _1071 = _1015;
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1073);
    float _1083 = _1009 * _993;
    float _1085 = _1083 * 0.5;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1077);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1079);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1095 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1099 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1087;
    if (_971)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_971)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1175 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1177 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1179 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1183 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1173);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1175);
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1177);
    float _1189 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1187);
    bool _1199 = _1167 > 0.0;
    bool _1201 = isnan(_1167);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1213 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1193);
    float _1215 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1197);
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1195);
    float _1219 = _1209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1211 + _1215;
    float _1223 = _1217 + _1215;
    float _1225 = _1215 * 0.5;
    float _1227 = _1221 * 0.5;
    float _1229 = _1223 * 0.5;
    float _1231 = fma(_1213, -0.5, _1225);
    out.m_35.x = _1219;
    out.gl_Position.x = _1211;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1217;
    out.gl_Position.w = _1215;
    out.m_52.x = _1227;
    out.m_52.y = _1231;
    out.m_52.z = _1229;
    out.m_52.w = _1215;
    if (_1207)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
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
    out.m_43 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _911 = false;
    bool _527 = false;
    bool _415 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _66 = in.m_32.w;
    float _68 = trunc(_66);
    int _71 = int(_68);
    bool _75 = _71 >= 1;
    float _77 = 0.0;
    if (!_75)
    {
        _77 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _79 = _77;
    float _81 = _79;
    if (!_75)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_75)
    {
        float _85 = _79 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1290 = as_type<float>(_87);
        out.gl_Position.z = _1290;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_101)
    {
        float _107 = float(_71);
        _81 = _107;
    }
    float _109 = _81;
    bool _111 = _105 >= _109;
    bool _113 = !_101;
    bool _115 = _111 || _113;
    float _117 = _109;
    if (_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    if (_115)
    {
        float _121 = _119 * 5.0;
        _89 = as_type<int>(_121);
    }
    int _123 = _89;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1359 = as_type<float>(_123);
        out.gl_Position.z = _1359;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_39.w;
    float _127 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = in.m_37.y;
    float _143 = in.m_37.z;
    float _145 = in.m_32.x;
    float _147 = in.m_32.y;
    float _149 = in.m_32.z;
    float _151 = 0.0;
    float _153 = _127;
    if (!_137)
    {
        float _155 = _127 * _127;
        float _157 = _155 * 0.5;
        _151 = _157;
    }
    float _159 = _151;
    float _161 = _159;
    if (!_137)
    {
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _161 = _163;
    }
    float _165 = _161;
    bool _167 = !_137;
    float _169 = _165;
    if (!_167)
    {
        float _171 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _173 = log2(_171);
        float _175 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _177 = _175 + 1.0;
        float _179 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _181 = _127 * _173;
        float _183 = 1.0 / _177;
        float _185 = _179 * 0.693147182464599609375;
        float _187 = exp2(_181);
        float _189 = 1.0 / _185;
        float _191 = _187 + (-1.0);
        float _193 = -_191;
        float _195 = fma(_193, _189, _127);
        float _197 = _195 * _183;
        float _199 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _169 = _199;
    }
    float _201 = _169;
    bool _203 = !_137;
    if (!_203)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = 1.0 / _211;
        float _215 = _127 * _207;
        float _217 = exp2(_215);
        float _219 = -_217;
        float _221 = _219 + 1.0;
        float _223 = _221 * _213;
        _153 = _223;
    }
    float _225 = _153;
    bool _227 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _229 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _231 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _235 = fma(_225, _139, _229);
    float _237 = fma(_225, _141, _231);
    float _239 = fma(_225, _143, _233);
    float _241 = fma(_235, _125, _145);
    float _243 = fma(_237, _125, _147);
    float _245 = fma(_239, _125, _149);
    bool _247 = !_227;
    float _265;
    if (!_247)
    {
        float _249 = in.m_41.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        float _269 = float(_71);
        float _271 = 1.0 / _269;
        float _273 = _105 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _279 = _275 + _277;
    bool _281 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_275);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_275);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = -_291;
    float _315 = _313 + 1.0;
    float _317 = 1.0 / _311;
    bool _319 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _321 = isnan(_275);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = _303 * _315;
    float _333 = -_303;
    float _335 = _333 + 1.0;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _339 = _329 * _335;
    float _341 = 1.0 / _307;
    float _343 = -_329;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _279 * _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _275 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _361;
    float _365 = _355 * _317;
    float _367 = fma(_359, _351, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _369 = fma(_363, _351, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _375 = fma(_349, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _377 = _367 * _339;
    float _379 = _369 * _339;
    float _381 = fma(_373, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _377);
    float _385 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _379);
    float _387 = fma(_381, _331, _383);
    float _389 = fma(_375, _331, _385);
    float _391 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].x, _387);
    float _393 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[145].y, _389);
    bool _395 = !_337;
    float _413;
    if (!_395)
    {
        float _397 = in.m_41.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        float _417 = float(_71);
        float _419 = 1.0 / _417;
        float _421 = _105 * _419;
        _413 = _421;
    }
    _415 = false;
    float _423 = _413;
    bool _425 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _427 = isnan(_423);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = _423 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _443 = isnan(_423);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _459 = _423 + _457;
    float _461 = -_435;
    float _463 = _461 + 1.0;
    bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _467 = 1.0 / _439;
    float _469 = _451 * _463;
    float _471 = -_451;
    float _473 = _471 + 1.0;
    float _475 = _455 * _467;
    float _477 = fma(_475, _459, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _481 = _477 * _469;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _485 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _487 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[116].x, _487);
    float _495 = in.m_39.x;
    float _497 = in.m_39.y;
    float _499 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_43.x = _499;
    out.m_43.y = _491;
    out.m_43.z = _485;
    out.m_43.w = _501;
    float _503 = _393 * _497;
    float _505 = _391 * _495;
    bool _507 = !_465;
    float _525;
    if (!_507)
    {
        float _509 = in.m_41.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _515 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _517 = _515 * _511;
        float _519 = floor(_517);
        float _521 = -_519;
        float _523 = _517 + _521;
        _525 = _523;
        _527 = true;
    }
    else
    {
        float _529 = float(_71);
        float _531 = 1.0 / _529;
        float _533 = _105 * _531;
        _525 = _533;
    }
    _527 = false;
    float _535 = _525;
    float _537 = as_type<float>(int(gl_VertexIndex));
    float _539 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = in.m_41.x;
    float _543 = in.m_41.y;
    int _545 = as_type<int>(_537) & 1;
    bool _547 = _545 != 0;
    int _549 = as_type<int>(_537) & 2;
    bool _551 = _549 != 0;
    float _553 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _557 = _541 > 0.5;
    bool _559 = !_551;
    float _561 = _559 ? (-0.5) : 0.5;
    bool _563 = !_547;
    float _565 = _563 ? (-0.5) : 0.5;
    bool _567 = _543 > 0.5;
    float _569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _561);
    float _571 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _565);
    float _573 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _575 = _539 * _569;
    float _577 = _243 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _579 = _553 * _571;
    float _581 = _243 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _583 = _575 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _585 = _575 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _587 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[6].x, _577);
    float _589 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
    float _591 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[24].x, _583);
    float _593 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[26].x, _585);
    float _595 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[6].z, _587);
    float _597 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _599 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[24].z, _591);
    float _601 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[26].z, _593);
    float _603 = _595 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _605 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _607 = _599 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _609 = _601 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _615 = _575 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _617 = _605 + _607;
    float _619 = _603 + _609;
    float _621 = 1.0 / _613;
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _625 = _617 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _629 = _619 + _627;
    float _631 = _243 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _633 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
    float _635 = _625 * _625;
    float _637 = _629 * _629;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    bool _643 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _645 = isnan(_535);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = fma(_241, (*spvDescriptorSet0.vp_c10)._m0[5].x, _631);
    float _657 = _635 + _637;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _661 = _535 + _659;
    bool _663 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _665 = isnan(_535);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = -_653;
    float _677 = _675 + 1.0;
    float _679 = sqrt(_657);
    float _681 = _641 * _621;
    float _683 = fma(_245, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _685 = _673 * _677;
    float _687 = fma(_573, (*spvDescriptorSet0.vp_c8)._m0[25].z, _633);
    float _689 = fma(_681, _661, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _691 = -_673;
    float _693 = _691 + 1.0;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _697 = _689 * _685;
    float _699 = _683 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _703 = _701 != 0;
    float _705 = -_565;
    float _707 = _557 ? _705 : _565;
    float _709 = _699 + _695;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _713 = _711 != 0;
    float _715 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[131].x, _697);
    bool _717 = _679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _719 = !_703;
    float _721 = _719 ? _565 : _707;
    float _723 = _697;
    float _725 = _693;
    float _727 = _707;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _731 = _565;
    if (!_717)
    {
        _723 = _637;
    }
    float _733 = _723;
    float _735 = _733;
    if (!_717)
    {
        _725 = _635;
    }
    float _737 = _725;
    float _739 = _737;
    if (!_717)
    {
        _727 = _617;
    }
    float _741 = _727;
    float _743 = _741;
    if (!_717)
    {
        _729 = _619;
    }
    float _745 = _729;
    float _747 = _745;
    if (!_717)
    {
        _731 = _709;
    }
    float _749 = _731;
    bool _751 = !_717;
    float _753 = _749;
    if (!_751)
    {
        float _755 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _759 = _679 + _757;
        float _761 = _709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _763 = rsqrt(_657);
        float _765 = _759 * _755;
        float _767 = _765 * 0.15915493667125701904296875;
        float _769 = _767 * 6.283185482025146484375;
        float _771 = sin(_769);
        float _773 = _767 * 6.283185482025146484375;
        float _775 = cos(_773);
        float _777 = fma(_771, _761, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _779 = _763 * _777;
        float _781 = _775 + (-1.0);
        float _783 = fma(_625, _779, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _785 = fma(_629, _779, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _787 = _781 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _789 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _791 = _783 + _789;
        float _793 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _795 = _785 + _793;
        float _797 = fma(_709, _775, _787);
        float _799 = _791 * _791;
        float _801 = _795 * _795;
        _753 = _797;
        _739 = _799;
        _735 = _801;
        _743 = _783;
        _747 = _785;
    }
    float _803 = _753;
    float _805 = _739;
    float _807 = _735;
    float _809 = _743;
    float _811 = _747;
    float _813 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _815 = _803 + _813;
    float _817 = -_561;
    int _819 = _567 ? as_type<int>(_817) : as_type<int>(_561);
    float _821 = _721 + 0.5;
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_815, _815, _805);
    bool _827 = !_713;
    float _829 = _827 ? _561 : as_type<float>(_819);
    float _831 = _821 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _833 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[132].x, _715);
    float _835 = _825 + _807;
    float _837 = _831 * _555;
    float _839 = -_829;
    float _841 = _839 + 0.5;
    float _843 = _833 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _845 = sqrt(_835);
    float _847 = _841 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _855 = _847 * _823;
    float _857 = _849 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _861 = _853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _837;
    out.m_48.y = _855;
    out.m_50.x = _857;
    out.m_50.y = _859;
    out.m_50.z = _861;
    out.m_50.w = _843;
    bool _863 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _865 = isnan(_845);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _871 = _867 || _869;
    float _873 = _849;
    float _875 = _811;
    if (!_871)
    {
        _873 = 1.0;
    }
    float _877 = _873;
    bool _879 = !_871;
    float _881 = _877;
    if (!_879)
    {
        bool _883 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _885 = isnan(_845);
        bool _887 = _883 || _885;
        bool _889 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _891 = _887 || _889;
        if (!_891)
        {
            float _893 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _895 = _845 + _893;
            float _897 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _899 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _897;
            float _901 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _903 = _901 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _905 = 1.0 / _899;
            float _907 = _895 * _905;
            float _909 = fma(_907, _903, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _881 = _909;
            _911 = true;
        }
        else
        {
            bool _913 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _915 = isnan(_845);
            bool _917 = _913 || _915;
            bool _919 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _921 = _917 || _919;
            if (!_921)
            {
                float _923 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _925 = _845 + _923;
                float _927 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _929 = _927 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _931 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _933 = _931 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _935 = 1.0 / _929;
                float _937 = _925 * _935;
                float _939 = fma(_937, _933, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _881 = _939;
                _911 = true;
            }
            else
            {
                _881 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _911 = false;
    float _941 = _881;
    float _943 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _945 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _947 = _809 + _945;
    float _949 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[11].x, _943);
    bool _951 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.5);
    bool _959 = _955 || _957;
    float _961 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _967 = _963 || _965;
    bool _969 = isnan(0.5);
    bool _971 = _967 || _969;
    float _973 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[11].z, _949);
    float _975 = fma(_947, _941, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _977 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _979 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _981 = _803 + _979;
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _985 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _987 = _811 + _985;
    float _989 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[10].z, _977);
    float _991 = fma(_981, _941, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _993 = 1.0 / _983;
    float _995 = fma(_987, _941, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _997 = _989 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = _941;
    float _1001 = _947;
    if (_959)
    {
        _999 = _975;
    }
    float _1003 = _999;
    float _1005 = _1003;
    if (_959)
    {
        _1001 = _991;
    }
    float _1007 = _1001;
    float _1009 = _997 + _983;
    float _1011 = _1007;
    if (_959)
    {
        _875 = _995;
    }
    float _1013 = _875;
    float _1015 = _1013;
    if (!_959)
    {
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1019 = _699 + _1017;
        float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1023 = _605 + _1021;
        float _1025 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1027 = -_603;
        float _1029 = _1027 + _995;
        float _1031 = _1019 * _1019;
        float _1033 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1035 = _603 + _1033;
        float _1037 = fma(_1023, _1023, _1031);
        float _1039 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1041 = fma(_1035, _1035, _1037);
        float _1043 = sqrt(_1041);
        float _1045 = _1025 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1047 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1049 = _1047 * _1039;
        float _1051 = -_605;
        float _1053 = _1051 + _975;
        float _1055 = -_699;
        float _1057 = _1055 + _991;
        float _1059 = _1045 * _1049;
        float _1061 = fma(_1053, _1059, _605);
        float _1063 = fma(_1057, _1059, _699);
        float _1065 = fma(_1029, _1059, _603);
        _1011 = _1063;
        _1005 = _1061;
        _1015 = _1065;
    }
    float _1067 = _1011;
    float _1069 = _1005;
    float _1071 = _1015;
    float _1073 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1075 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1077 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1073);
    float _1083 = _1009 * _993;
    float _1085 = _1083 * 0.5;
    float _1087 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1075);
    float _1089 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1077);
    float _1091 = fma(_1069, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1079);
    float _1093 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1081);
    float _1095 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1087);
    float _1097 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1089);
    float _1099 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1091);
    float _1101 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1103 = _1087;
    if (_971)
    {
        _1103 = 1.0;
    }
    float _1105 = _1103;
    float _1107 = _1105;
    if (!_971)
    {
        float _1109 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1113 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1111);
        float _1115 = _1109 * 0.15915493667125701904296875;
        float _1117 = _1115 * 6.283185482025146484375;
        float _1119 = cos(_1117);
        float _1121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1123 = _1121 * 0.15915493667125701904296875;
        float _1125 = _1115 * 6.283185482025146484375;
        float _1127 = sin(_1125);
        float _1129 = 1.0 / _1119;
        float _1131 = _1123 * 6.283185482025146484375;
        float _1133 = cos(_1131);
        float _1135 = _1127 * _1129;
        float _1137 = 1.0 / _1113;
        float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1141 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1139;
        float _1143 = _1133 * _1135;
        float _1145 = _1123 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = 1.0 / _1143;
        float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1153 = _1137 * _1151;
        float _1155 = 1.0 / _1141;
        float _1157 = _1147 * _1149;
        float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1161 = fma(_1157, _1153, _1159);
        float _1163 = _1161 * _1155;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1107 = _1165;
    }
    float _1167 = _1107;
    float _1169 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1171 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1173 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1175 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1177 = _1101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1179 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1181 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1171);
    float _1183 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1173);
    float _1185 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1175);
    float _1187 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1177);
    float _1189 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1191 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1181);
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1183);
    float _1195 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1185);
    float _1197 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1187);
    bool _1199 = _1167 > 0.0;
    bool _1201 = isnan(_1167);
    bool _1203 = _1199 || _1201;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    float _1209 = _1167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1211 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1213 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1193);
    float _1215 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1197);
    float _1217 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1195);
    float _1219 = _1209 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1221 = _1211 + _1215;
    float _1223 = _1217 + _1215;
    float _1225 = _1215 * 0.5;
    float _1227 = _1221 * 0.5;
    float _1229 = _1223 * 0.5;
    float _1231 = fma(_1213, -0.5, _1225);
    out.m_35.x = _1219;
    out.gl_Position.x = _1211;
    out.gl_Position.y = _1213;
    out.gl_Position.z = _1217;
    out.gl_Position.w = _1215;
    out.m_52.x = _1227;
    out.m_52.y = _1231;
    out.m_52.z = _1229;
    out.m_52.w = _1215;
    if (_1207)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1233 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1233;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_43.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_43.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_43.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_43.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

