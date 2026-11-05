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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_35 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1132 = as_type<float>(_85);
        out.gl_Position.z = _1132;
    }
    if (!_73)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_121);
        out.gl_Position.z = _1201;
    }
    if (_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = in.m_40.x;
    float _299 = in.m_40.y;
    bool _301 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_291);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_311;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = 1.0 / _315;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _341 = _327 * _331;
    float _343 = -_327;
    float _345 = _343 + 1.0;
    float _347 = _295 * _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = fma(_335, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_351, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _353 * _341;
    float _359 = _355 * _341;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _365 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].x, _361);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].y, _363);
    float _369 = _365 * _297;
    float _371 = _367 * _299;
    bool _373 = !_339;
    float _391;
    if (!_373)
    {
        float _375 = in.m_42.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_69);
        float _397 = 1.0 / _395;
        float _399 = _103 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _413 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _415;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _427 = 1.0 / _411;
    float _429 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _431 = 1.0 / _423;
    bool _433 = _405 > 0.5;
    float _435 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _417 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _401 + _439;
    bool _443 = _403 > 0.5;
    float _445 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _451 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _453 = isnan(_401);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _467 = _465 != 0;
    float _469 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _449;
    bool _477 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_401);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_461;
    float _491 = _489 + 1.0;
    bool _493 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_401);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_487;
    float _507 = _505 + 1.0;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _503 * _491;
    float _523 = -_503;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _461 * _507;
    float _533 = _463 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = _401 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _401 + _543;
    float _547 = _529 * _475;
    float _549 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    float _551 = _429 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _553 = -_519;
    float _555 = _553 + 1.0;
    float _557 = _537 * _431;
    float _559 = fma(_547, _545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _561 = _469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _565 = _551 + _563;
    float _567 = _487 * _555;
    float _569 = fma(_557, _541, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _573 = -_177;
    int _575 = _443 ? as_type<int>(_573) : as_type<int>(_177);
    float _577 = _549 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _561 + _579;
    float _583 = _565 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _585 = !_467;
    float _587 = _585 ? _177 : as_type<float>(_575);
    float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _591 = -_181;
    int _593 = _433 ? as_type<int>(_591) : as_type<int>(_181);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _577 + _595;
    float _599 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _601 = fma(_569, _531, _571);
    bool _603 = !_473;
    float _605 = _603 ? _181 : as_type<float>(_593);
    float _607 = _587 + 0.5;
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _599);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_559, _567, _601);
    float _615 = _565 * _565;
    float _617 = -_605;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_581, _581, _615);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[118].x, _613);
    float _631 = _623 * _589;
    float _633 = fma(_597, _597, _625);
    float _635 = rsqrt(_633);
    float _637 = _627 * _611;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _611;
    int _647 = as_type<int>(_629);
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_621)
    {
        float _671 = _649 * 5.0;
        _647 = as_type<int>(_671);
    }
    int _673 = _647;
    out.m_44.x = _631;
    out.m_44.y = _637;
    float _675 = _565 * _635;
    float _677 = _581 * _635;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    out.m_48.x = _659;
    out.m_48.y = _661;
    out.m_48.z = _669;
    out.m_48.w = _657;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_673);
        out.gl_Position.z = _2119;
    }
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    if (_621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _679 = -_675;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _683 = _597 * _635;
    float _685 = -_677;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[18].w, _561);
    float _689 = -_675;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _681 + _693;
    float _697 = -_683;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _687 + _701;
    float _705 = -_677;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _709 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = _691 * _691;
    float _717 = -_683;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    float _723 = fma(_707, _707, _715);
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    float _727 = fma(_719, _719, _723);
    bool _729 = _725 >= 0.0;
    float _731 = sqrt(_727);
    float _733 = _713;
    if (_729)
    {
        _733 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _735 = _733;
    int _737 = as_type<int>(_735);
    if (_729)
    {
        out.m_33.x = 0.0;
    }
    float _739 = _635 * _731;
    if (_729)
    {
        float _741 = _735 * 5.0;
        _737 = as_type<int>(_741);
    }
    int _743 = _737;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_743);
        out.gl_Position.z = _2251;
    }
    if (_729)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _745 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _753 = _739 * _745;
    float _755 = _739 * _749;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _747 * _753;
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = _751 * _755;
    float _775 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _779);
    float _785 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _577 + _787;
    float _793 = _561 + _789;
    float _795 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _803 = _793 + _801;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _795);
    float _807 = _799 * _799;
    float _809 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _805);
    float _811 = fma(_803, _803, _807);
    float _813 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _819 = sqrt(_811);
    float _821 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _827 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _823);
    float _829 = 1.0 / _817;
    float _831 = _825 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _835 = _551 + _831;
    float _837 = _833 + _817;
    bool _839 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _841 = _815;
    float _843 = _831;
    float _845 = _759;
    if (!_839)
    {
        _841 = _793;
    }
    float _847 = _841;
    float _849 = _847;
    if (!_839)
    {
        _843 = _791;
    }
    float _851 = _843;
    float _853 = _851;
    if (!_839)
    {
        _845 = _835;
    }
    float _855 = _845;
    bool _857 = !_839;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _819 + _863;
        float _867 = _835 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_811);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _869 * _885;
        float _891 = fma(_835, _877, _887);
        float _893 = fma(_803, _889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_799, _889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _859 = _891;
        _849 = _893;
        _853 = _895;
    }
    float _897 = _859;
    float _899 = _849;
    float _901 = _853;
    float _903 = -_675;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _907 = _837 * _829;
    float _909 = _907 * 0.5;
    float _911 = -_677;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _915 = -_683;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = _897;
    if (_771)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_771)
    {
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _929 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _931 = _927 * 0.15915493667125701904296875;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _931 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _941 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _939);
        float _943 = _931 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = 1.0 / _937;
        float _949 = _933 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _945 * _947;
        float _955 = _933 * 6.283185482025146484375;
        float _957 = sin(_955);
        float _959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _959;
        float _963 = _951 * _953;
        float _965 = 1.0 / _941;
        float _967 = 1.0 / _963;
        float _969 = 1.0 / _961;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _973 = _965 * _971;
        float _975 = _957 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_975, _973, _977);
        float _981 = _979 * _969;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _925 = _983;
    }
    float _985 = _925;
    float _987 = _905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _991 = _905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _995 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _997 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _989);
    float _999 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _991);
    float _1001 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _993);
    float _1003 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[0].z, _995);
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1007 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1009 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1013);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1015);
    float _1027 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1029 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1019);
    float _1031 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1023);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1025);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1027);
    float _1039 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1029);
    bool _1041 = _985 > 0.0;
    bool _1043 = isnan(_985);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1033);
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1035);
    float _1057 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1039);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1063 = _1053 + _1057;
    float _1065 = _1059 + _1057;
    float _1067 = _1057 * 0.5;
    float _1069 = _1063 * 0.5;
    float _1071 = _1065 * 0.5;
    float _1073 = fma(_1055, -0.5, _1067);
    out.m_33.x = _1061;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1057;
    out.m_50.x = _1069;
    out.m_50.y = _1073;
    out.m_50.z = _1071;
    out.m_50.w = _1057;
    if (_1049)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1075 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1075;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1132 = as_type<float>(_85);
        out.gl_Position.z = _1132;
    }
    if (!_73)
    {
        return out;
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_121);
        out.gl_Position.z = _1201;
    }
    if (_113)
    {
        return out;
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = in.m_40.x;
    float _299 = in.m_40.y;
    bool _301 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_291);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_311;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = 1.0 / _315;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _341 = _327 * _331;
    float _343 = -_327;
    float _345 = _343 + 1.0;
    float _347 = _295 * _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = fma(_335, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_351, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _353 * _341;
    float _359 = _355 * _341;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _365 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].x, _361);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].y, _363);
    float _369 = _365 * _297;
    float _371 = _367 * _299;
    bool _373 = !_339;
    float _391;
    if (!_373)
    {
        float _375 = in.m_42.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_69);
        float _397 = 1.0 / _395;
        float _399 = _103 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _413 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _415;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _427 = 1.0 / _411;
    float _429 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _431 = 1.0 / _423;
    bool _433 = _405 > 0.5;
    float _435 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _417 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _401 + _439;
    bool _443 = _403 > 0.5;
    float _445 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _451 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _453 = isnan(_401);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _467 = _465 != 0;
    float _469 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _449;
    bool _477 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_401);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_461;
    float _491 = _489 + 1.0;
    bool _493 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_401);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_487;
    float _507 = _505 + 1.0;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _503 * _491;
    float _523 = -_503;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _461 * _507;
    float _533 = _463 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = _401 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _401 + _543;
    float _547 = _529 * _475;
    float _549 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    float _551 = _429 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _553 = -_519;
    float _555 = _553 + 1.0;
    float _557 = _537 * _431;
    float _559 = fma(_547, _545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _561 = _469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _565 = _551 + _563;
    float _567 = _487 * _555;
    float _569 = fma(_557, _541, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _573 = -_177;
    int _575 = _443 ? as_type<int>(_573) : as_type<int>(_177);
    float _577 = _549 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _561 + _579;
    float _583 = _565 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _585 = !_467;
    float _587 = _585 ? _177 : as_type<float>(_575);
    float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _591 = -_181;
    int _593 = _433 ? as_type<int>(_591) : as_type<int>(_181);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _577 + _595;
    float _599 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _601 = fma(_569, _531, _571);
    bool _603 = !_473;
    float _605 = _603 ? _181 : as_type<float>(_593);
    float _607 = _587 + 0.5;
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _599);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_559, _567, _601);
    float _615 = _565 * _565;
    float _617 = -_605;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_581, _581, _615);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[118].x, _613);
    float _631 = _623 * _589;
    float _633 = fma(_597, _597, _625);
    float _635 = rsqrt(_633);
    float _637 = _627 * _611;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _611;
    int _647 = as_type<int>(_629);
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_621)
    {
        float _671 = _649 * 5.0;
        _647 = as_type<int>(_671);
    }
    int _673 = _647;
    out.m_44.x = _631;
    out.m_44.y = _637;
    float _675 = _565 * _635;
    float _677 = _581 * _635;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    out.m_48.x = _659;
    out.m_48.y = _661;
    out.m_48.z = _669;
    out.m_48.w = _657;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_673);
        out.gl_Position.z = _2119;
    }
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    if (_621)
    {
        return out;
    }
    float _679 = -_675;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _683 = _597 * _635;
    float _685 = -_677;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[18].w, _561);
    float _689 = -_675;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _681 + _693;
    float _697 = -_683;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _687 + _701;
    float _705 = -_677;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _709 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = _691 * _691;
    float _717 = -_683;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    float _723 = fma(_707, _707, _715);
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    float _727 = fma(_719, _719, _723);
    bool _729 = _725 >= 0.0;
    float _731 = sqrt(_727);
    float _733 = _713;
    if (_729)
    {
        _733 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _735 = _733;
    int _737 = as_type<int>(_735);
    if (_729)
    {
        out.m_33.x = 0.0;
    }
    float _739 = _635 * _731;
    if (_729)
    {
        float _741 = _735 * 5.0;
        _737 = as_type<int>(_741);
    }
    int _743 = _737;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_743);
        out.gl_Position.z = _2251;
    }
    if (_729)
    {
        return out;
    }
    float _745 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _753 = _739 * _745;
    float _755 = _739 * _749;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _747 * _753;
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = _751 * _755;
    float _775 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _779);
    float _785 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _577 + _787;
    float _793 = _561 + _789;
    float _795 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _803 = _793 + _801;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _795);
    float _807 = _799 * _799;
    float _809 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _805);
    float _811 = fma(_803, _803, _807);
    float _813 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _819 = sqrt(_811);
    float _821 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _827 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _823);
    float _829 = 1.0 / _817;
    float _831 = _825 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _835 = _551 + _831;
    float _837 = _833 + _817;
    bool _839 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _841 = _815;
    float _843 = _831;
    float _845 = _759;
    if (!_839)
    {
        _841 = _793;
    }
    float _847 = _841;
    float _849 = _847;
    if (!_839)
    {
        _843 = _791;
    }
    float _851 = _843;
    float _853 = _851;
    if (!_839)
    {
        _845 = _835;
    }
    float _855 = _845;
    bool _857 = !_839;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _819 + _863;
        float _867 = _835 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_811);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _869 * _885;
        float _891 = fma(_835, _877, _887);
        float _893 = fma(_803, _889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_799, _889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _859 = _891;
        _849 = _893;
        _853 = _895;
    }
    float _897 = _859;
    float _899 = _849;
    float _901 = _853;
    float _903 = -_675;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _907 = _837 * _829;
    float _909 = _907 * 0.5;
    float _911 = -_677;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _915 = -_683;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = _897;
    if (_771)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_771)
    {
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _929 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _931 = _927 * 0.15915493667125701904296875;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _931 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _941 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _939);
        float _943 = _931 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = 1.0 / _937;
        float _949 = _933 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _945 * _947;
        float _955 = _933 * 6.283185482025146484375;
        float _957 = sin(_955);
        float _959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _959;
        float _963 = _951 * _953;
        float _965 = 1.0 / _941;
        float _967 = 1.0 / _963;
        float _969 = 1.0 / _961;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _973 = _965 * _971;
        float _975 = _957 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_975, _973, _977);
        float _981 = _979 * _969;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _925 = _983;
    }
    float _985 = _925;
    float _987 = _905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _991 = _905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _995 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _997 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _989);
    float _999 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _991);
    float _1001 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _993);
    float _1003 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[0].z, _995);
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1007 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1009 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1013);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1015);
    float _1027 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1029 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1019);
    float _1031 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1023);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1025);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1027);
    float _1039 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1029);
    bool _1041 = _985 > 0.0;
    bool _1043 = isnan(_985);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1033);
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1035);
    float _1057 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1039);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1063 = _1053 + _1057;
    float _1065 = _1059 + _1057;
    float _1067 = _1057 * 0.5;
    float _1069 = _1063 * 0.5;
    float _1071 = _1065 * 0.5;
    float _1073 = fma(_1055, -0.5, _1067);
    out.m_33.x = _1061;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1057;
    out.m_50.x = _1069;
    out.m_50.y = _1073;
    out.m_50.z = _1071;
    out.m_50.w = _1057;
    if (_1049)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1075 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1075;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    bool _393 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _64 = in.m_30.w;
    float _66 = trunc(_64);
    int _69 = int(_66);
    bool _73 = _69 >= 1;
    float _75 = 0.0;
    if (!_73)
    {
        _75 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _77 = _75;
    float _79 = _77;
    if (!_73)
    {
        out.m_33.x = 0.0;
    }
    int _81 = 0;
    if (!_73)
    {
        float _83 = _77 * 5.0;
        _81 = as_type<int>(_83);
    }
    int _85 = _81;
    int _87 = _85;
    if (!_73)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1132 = as_type<float>(_85);
        out.gl_Position.z = _1132;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_35.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_99)
    {
        float _105 = float(_69);
        _79 = _105;
    }
    float _107 = _79;
    bool _109 = _103 >= _107;
    bool _111 = !_99;
    bool _113 = _109 || _111;
    float _115 = _107;
    if (_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (_113)
    {
        out.m_33.x = 0.0;
    }
    if (_113)
    {
        float _119 = _117 * 5.0;
        _87 = as_type<int>(_119);
    }
    int _121 = _87;
    if (_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1201 = as_type<float>(_121);
        out.gl_Position.z = _1201;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = as_type<float>(int(gl_VertexIndex));
    float _125 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _127 = in.m_40.w;
    bool _129 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _131 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _133 = _129 || _131;
    bool _135 = isnan(1.0);
    bool _137 = _133 || _135;
    float _139 = in.m_35.x;
    float _141 = in.m_35.y;
    float _143 = in.m_35.z;
    float _145 = in.m_30.x;
    float _147 = in.m_30.y;
    float _149 = in.m_30.z;
    float _151 = 0.0;
    float _153 = _125;
    if (!_137)
    {
        float _155 = _125 * _125;
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
    int _167 = as_type<int>(_123) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_123) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_137;
    float _185 = _165;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    float _297 = in.m_40.x;
    float _299 = in.m_40.y;
    bool _301 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_291);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _313;
    bool _317 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_291);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_311;
    float _331 = _329 + 1.0;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = 1.0 / _315;
    bool _339 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _341 = _327 * _331;
    float _343 = -_327;
    float _345 = _343 + 1.0;
    float _347 = _295 * _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = fma(_335, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _355 = fma(_351, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _357 = _353 * _341;
    float _359 = _355 * _341;
    float _361 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _363 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _365 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].x, _361);
    float _367 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[144].y, _363);
    float _369 = _365 * _297;
    float _371 = _367 * _299;
    bool _373 = !_339;
    float _391;
    if (!_373)
    {
        float _375 = in.m_42.x;
        float _377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _379 = _375 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _381 = fma(_379, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _383 = _381 * _377;
        float _385 = floor(_383);
        float _387 = -_385;
        float _389 = _383 + _387;
        _391 = _389;
        _393 = true;
    }
    else
    {
        float _395 = float(_69);
        float _397 = 1.0 / _395;
        float _399 = _103 * _397;
        _391 = _399;
    }
    _393 = false;
    float _401 = _391;
    float _403 = in.m_42.x;
    float _405 = in.m_42.y;
    float _407 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _413 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _415;
    float _419 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _407);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _413);
    float _427 = 1.0 / _411;
    float _429 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _419);
    float _431 = 1.0 / _423;
    bool _433 = _405 > 0.5;
    float _435 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _417 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _441 = _401 + _439;
    bool _443 = _403 > 0.5;
    float _445 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _451 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _453 = isnan(_401);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = fma(_437, _441, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _467 = _465 != 0;
    float _469 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _445);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _449;
    bool _477 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_401);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -_461;
    float _491 = _489 + 1.0;
    bool _493 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _495 = isnan(_401);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = -_487;
    float _507 = _505 + 1.0;
    bool _509 = _401 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _511 = isnan(_401);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    float _521 = _503 * _491;
    float _523 = -_503;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _461 * _507;
    float _533 = _463 * _521;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _541 = _401 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _401 + _543;
    float _547 = _529 * _475;
    float _549 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _425);
    float _551 = _429 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _553 = -_519;
    float _555 = _553 + 1.0;
    float _557 = _537 * _431;
    float _559 = fma(_547, _545, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _561 = _469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _565 = _551 + _563;
    float _567 = _487 * _555;
    float _569 = fma(_557, _541, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _571 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[115].x, _533);
    float _573 = -_177;
    int _575 = _443 ? as_type<int>(_573) : as_type<int>(_177);
    float _577 = _549 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _581 = _561 + _579;
    float _583 = _565 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _585 = !_467;
    float _587 = _585 ? _177 : as_type<float>(_575);
    float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _591 = -_181;
    int _593 = _433 ? as_type<int>(_591) : as_type<int>(_181);
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _597 = _577 + _595;
    float _599 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[28].x, _583);
    float _601 = fma(_569, _531, _571);
    bool _603 = !_473;
    float _605 = _603 ? _181 : as_type<float>(_593);
    float _607 = _587 + 0.5;
    float _609 = fma(_597, (*spvDescriptorSet0.vp_c8)._m0[28].z, _599);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = fma(_559, _567, _601);
    float _615 = _565 * _565;
    float _617 = -_605;
    float _619 = _617 + 0.5;
    bool _621 = _609 >= 0.0;
    float _623 = _607 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_581, _581, _615);
    float _627 = _619 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _629 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[118].x, _613);
    float _631 = _623 * _589;
    float _633 = fma(_597, _597, _625);
    float _635 = rsqrt(_633);
    float _637 = _627 * _611;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _645 = _611;
    int _647 = as_type<int>(_629);
    if (_621)
    {
        _645 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _649 = _645;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _657 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _659 = _643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _665 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_621)
    {
        float _671 = _649 * 5.0;
        _647 = as_type<int>(_671);
    }
    int _673 = _647;
    out.m_44.x = _631;
    out.m_44.y = _637;
    float _675 = _565 * _635;
    float _677 = _581 * _635;
    out.m_46.x = _663;
    out.m_46.y = _665;
    out.m_46.z = _667;
    out.m_48.x = _659;
    out.m_48.y = _661;
    out.m_48.z = _669;
    out.m_48.w = _657;
    if (_621)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_673);
        out.gl_Position.z = _2119;
    }
    if (_621)
    {
        out.m_33.x = 0.0;
    }
    if (_621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _679 = -_675;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _551);
    float _683 = _597 * _635;
    float _685 = -_677;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[18].w, _561);
    float _689 = -_675;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _681 + _693;
    float _697 = -_683;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _703 = _687 + _701;
    float _705 = -_677;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _709 = _695 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _699 + _711;
    float _715 = _691 * _691;
    float _717 = -_683;
    float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    float _721 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[28].x, _709);
    float _723 = fma(_707, _707, _715);
    float _725 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].z, _721);
    float _727 = fma(_719, _719, _723);
    bool _729 = _725 >= 0.0;
    float _731 = sqrt(_727);
    float _733 = _713;
    if (_729)
    {
        _733 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _735 = _733;
    int _737 = as_type<int>(_735);
    if (_729)
    {
        out.m_33.x = 0.0;
    }
    float _739 = _635 * _731;
    if (_729)
    {
        float _741 = _735 * 5.0;
        _737 = as_type<int>(_741);
    }
    int _743 = _737;
    if (_729)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_743);
        out.gl_Position.z = _2251;
    }
    if (_729)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _745 = _371 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _749 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _753 = _739 * _745;
    float _755 = _739 * _749;
    float _757 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _759 = _757 * 0.5;
    float _761 = _747 * _753;
    bool _763 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _765 = isnan(0.5);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _771 = _767 || _769;
    float _773 = _751 * _755;
    float _775 = _761 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _777 = _761 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _779 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[26].x, _775);
    float _781 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[24].x, _777);
    float _783 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].z, _779);
    float _785 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].z, _781);
    float _787 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _789 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _791 = _577 + _787;
    float _793 = _561 + _789;
    float _795 = _681 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _799 = _791 + _797;
    float _801 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _803 = _793 + _801;
    float _805 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[11].x, _795);
    float _807 = _799 * _799;
    float _809 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _805);
    float _811 = fma(_803, _803, _807);
    float _813 = _761 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _815 = _681 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _817 = _809 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _819 = sqrt(_811);
    float _821 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[25].x, _813);
    float _823 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[10].x, _815);
    float _825 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].z, _821);
    float _827 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _823);
    float _829 = 1.0 / _817;
    float _831 = _825 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _835 = _551 + _831;
    float _837 = _833 + _817;
    bool _839 = _819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _841 = _815;
    float _843 = _831;
    float _845 = _759;
    if (!_839)
    {
        _841 = _793;
    }
    float _847 = _841;
    float _849 = _847;
    if (!_839)
    {
        _843 = _791;
    }
    float _851 = _843;
    float _853 = _851;
    if (!_839)
    {
        _845 = _835;
    }
    float _855 = _845;
    bool _857 = !_839;
    float _859 = _855;
    if (!_857)
    {
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _863 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _865 = _819 + _863;
        float _867 = _835 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _869 = rsqrt(_811);
        float _871 = _865 * _861;
        float _873 = _871 * 0.15915493667125701904296875;
        float _875 = _873 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = _873 * 6.283185482025146484375;
        float _881 = sin(_879);
        float _883 = _877 + (-1.0);
        float _885 = fma(_881, _867, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _887 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = _869 * _885;
        float _891 = fma(_835, _877, _887);
        float _893 = fma(_803, _889, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _895 = fma(_799, _889, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _859 = _891;
        _849 = _893;
        _853 = _895;
    }
    float _897 = _859;
    float _899 = _849;
    float _901 = _853;
    float _903 = -_675;
    float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _907 = _837 * _829;
    float _909 = _907 * 0.5;
    float _911 = -_677;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _915 = -_683;
    float _917 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _919 = _905 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _921 = _897;
    if (_771)
    {
        _921 = 1.0;
    }
    float _923 = _921;
    float _925 = _923;
    if (!_771)
    {
        float _927 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _929 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _931 = _927 * 0.15915493667125701904296875;
        float _933 = _929 * 0.15915493667125701904296875;
        float _935 = _931 * 6.283185482025146484375;
        float _937 = cos(_935);
        float _939 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _941 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[30].w, _939);
        float _943 = _931 * 6.283185482025146484375;
        float _945 = sin(_943);
        float _947 = 1.0 / _937;
        float _949 = _933 * 6.283185482025146484375;
        float _951 = cos(_949);
        float _953 = _945 * _947;
        float _955 = _933 * 6.283185482025146484375;
        float _957 = sin(_955);
        float _959 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _961 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _959;
        float _963 = _951 * _953;
        float _965 = 1.0 / _941;
        float _967 = 1.0 / _963;
        float _969 = 1.0 / _961;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _973 = _965 * _971;
        float _975 = _957 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_975, _973, _977);
        float _981 = _979 * _969;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _925 = _983;
    }
    float _985 = _925;
    float _987 = _905 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _989 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[1].x, _919);
    float _991 = _905 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _993 = _905 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _995 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[0].x, _987);
    float _997 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[1].z, _989);
    float _999 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[2].x, _991);
    float _1001 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[3].x, _993);
    float _1003 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[0].z, _995);
    float _1005 = _997 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1007 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[2].z, _999);
    float _1009 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1001);
    float _1011 = _1003 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1013 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1017 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1019 = _1005 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1021 = _1007 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1023 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1013);
    float _1025 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1015);
    float _1027 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1017);
    float _1029 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1019);
    float _1031 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1033 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1023);
    float _1035 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1025);
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1027);
    float _1039 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1029);
    bool _1041 = _985 > 0.0;
    bool _1043 = isnan(_985);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan(0.0);
    bool _1049 = _1045 || _1047;
    float _1051 = _985 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1053 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1033);
    float _1055 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1035);
    float _1057 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1039);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1037);
    float _1061 = _1051 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1063 = _1053 + _1057;
    float _1065 = _1059 + _1057;
    float _1067 = _1057 * 0.5;
    float _1069 = _1063 * 0.5;
    float _1071 = _1065 * 0.5;
    float _1073 = fma(_1055, -0.5, _1067);
    out.m_33.x = _1061;
    out.gl_Position.x = _1053;
    out.gl_Position.y = _1055;
    out.gl_Position.z = _1059;
    out.gl_Position.w = _1057;
    out.m_50.x = _1069;
    out.m_50.y = _1073;
    out.m_50.z = _1071;
    out.m_50.w = _1057;
    if (_1049)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1075 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1075;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

