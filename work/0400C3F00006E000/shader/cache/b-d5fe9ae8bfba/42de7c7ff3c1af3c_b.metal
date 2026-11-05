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
    bool _441 = false;
    bool _285 = false;
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
        float _1096 = as_type<float>(_85);
        out.gl_Position.z = _1096;
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
        float _1165 = as_type<float>(_121);
        out.gl_Position.z = _1165;
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
    float _187 = 0.5;
    if (!_183)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _125 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _125);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _217;
    }
    float _219 = _185;
    bool _221 = !_137;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _125 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _153 = _241;
    }
    float _243 = _153;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _139, _247);
    float _255 = fma(_243, _141, _249);
    float _257 = fma(_243, _143, _251);
    float _259 = fma(_253, _127, _145);
    float _261 = fma(_255, _127, _147);
    float _263 = fma(_257, _127, _149);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_42.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_69);
        float _289 = 1.0 / _287;
        float _291 = _103 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_40.x;
    float _395 = in.m_40.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_42.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_69);
        float _445 = 1.0 / _443;
        float _447 = _103 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_42.x;
    float _453 = in.m_42.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _473 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = 1.0 / _461;
    float _477 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    bool _493 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = isnan(_449);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _509 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    bool _511 = _451 > 0.5;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _515 = _465 * _475;
    float _517 = 1.0 / _471;
    bool _519 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_449);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_515, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _535 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_449);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = _453 > 0.5;
    float _549 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _553 = _449 + _551;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    float _559 = -_503;
    float _561 = _559 + 1.0;
    float _563 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
    float _565 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _567 = _529 * _557;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _545 * _561;
    float _575 = _485 * _517;
    float _577 = _533 * _567;
    float _579 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = -_177;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_177);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _577);
    float _589 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _579 + _591;
    bool _595 = !_481;
    float _597 = _595 ? _177 : as_type<float>(_583);
    float _599 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _603 = _589 + _601;
    float _605 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_181;
    int _609 = _547 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = _597 + 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _599 + _615;
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    bool _621 = !_489;
    float _623 = _621 ? _181 : as_type<float>(_609);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = fma(_585, _573, _587);
    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _631 = -_623;
    float _633 = _631 + 0.5;
    float _635 = _625 * _507;
    float _637 = _593 * _593;
    bool _639 = _629 >= 0.0;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _645 = fma(_603, _603, _637);
    float _647 = _641 * _611;
    float _649 = fma(_617, _617, _645);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = rsqrt(_649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = _645;
    if (_639)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_639)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_44.x = _635;
    out.m_44.y = _647;
    float _685 = _593 * _653;
    float _687 = _603 * _653;
    out.m_46.x = _671;
    out.m_46.y = _673;
    out.m_46.z = _675;
    out.m_48.x = _667;
    out.m_48.y = _669;
    out.m_48.z = _531;
    out.m_48.w = _677;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2099 = as_type<float>(_683);
        out.gl_Position.z = _2099;
    }
    if (_639)
    {
        out.m_33.x = 0.0;
    }
    if (_639)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _689 = -_685;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _617 * _653;
    float _695 = -_687;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _699 = -_685;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_687;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    float _743 = _723;
    if (_739)
    {
        _743 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _743;
    int _747 = as_type<int>(_745);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _749 = _653 * _741;
    if (_739)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2231 = as_type<float>(_753);
        out.gl_Position.z = _2231;
    }
    if (_739)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _763 = _749 * _755;
    float _765 = _749 * _759;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    bool _773 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _775 = isnan(0.5);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _781 = _777 || _779;
    float _783 = _761 * _765;
    float _785 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _793 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _789);
    float _795 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _801 = _599 + _797;
    float _803 = _589 + _799;
    float _805 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _813 = _803 + _811;
    float _815 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _817 = _809 * _809;
    float _819 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _821 = fma(_813, _813, _817);
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = sqrt(_821);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _833 = _819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _837 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _839 = 1.0 / _833;
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _845 = _579 + _841;
    float _847 = _843 + _833;
    bool _849 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _841;
    float _853 = _769;
    if (!_849)
    {
        _187 = _803;
    }
    float _855 = _187;
    float _857 = _855;
    if (!_849)
    {
        _851 = _801;
    }
    float _859 = _851;
    float _861 = _859;
    if (!_849)
    {
        _853 = _845;
    }
    float _863 = _853;
    bool _865 = !_849;
    float _867 = _863;
    if (!_865)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _873 = _827 + _871;
        float _875 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = rsqrt(_821);
        float _879 = _873 * _869;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _881 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 + (-1.0);
        float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = fma(_889, _875, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _897 = fma(_845, _885, _893);
        float _899 = _877 * _895;
        float _901 = fma(_813, _899, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _903 = fma(_809, _899, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _897;
        _857 = _901;
        _861 = _903;
    }
    float _905 = _867;
    float _907 = _857;
    float _909 = _861;
    float _911 = -_685;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _915 = _847 * _839;
    float _917 = _915 * 0.5;
    float _919 = -_687;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _923 = -_693;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _927 = _913 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _929 = _905;
    if (_781)
    {
        _929 = 1.0;
    }
    float _931 = _929;
    float _933 = _931;
    if (!_781)
    {
        float _935 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _935);
        float _939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _943 = 1.0 / _937;
        float _945 = 1.0 / _941;
        float _947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _951 = fma(_943, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        _933 = _955;
    }
    float _957 = _933;
    float _959 = _913 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[1].x, _927);
    float _963 = _913 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _913 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _969 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _973 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _975 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _979 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _983 = _975 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _985 = _977 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _987 = _977 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _989 = _977 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].x, _985);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].x, _987);
    float _997 = _977 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _999 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = _981 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].z, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].z, _995);
    float _1007 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].x, _997);
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1003);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1005);
    bool _1015 = _957 > 0.0;
    bool _1017 = isnan(_957);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1007);
    float _1027 = _957 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1009);
    float _1031 = _1011 + _1013;
    float _1033 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1025);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1037 = _1031 * 0.5;
    out.m_33.x = _1035;
    out.gl_Position.x = _1029;
    out.gl_Position.y = _1033;
    out.gl_Position.z = _1011;
    out.gl_Position.w = _1013;
    out.m_50.z = _1037;
    out.m_50.w = _1013;
    if (_1023)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1039;
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
    bool _441 = false;
    bool _285 = false;
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
        float _1096 = as_type<float>(_85);
        out.gl_Position.z = _1096;
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
        float _1165 = as_type<float>(_121);
        out.gl_Position.z = _1165;
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
    float _187 = 0.5;
    if (!_183)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _125 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _125);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _217;
    }
    float _219 = _185;
    bool _221 = !_137;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _125 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _153 = _241;
    }
    float _243 = _153;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _139, _247);
    float _255 = fma(_243, _141, _249);
    float _257 = fma(_243, _143, _251);
    float _259 = fma(_253, _127, _145);
    float _261 = fma(_255, _127, _147);
    float _263 = fma(_257, _127, _149);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_42.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_69);
        float _289 = 1.0 / _287;
        float _291 = _103 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_40.x;
    float _395 = in.m_40.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_42.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_69);
        float _445 = 1.0 / _443;
        float _447 = _103 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_42.x;
    float _453 = in.m_42.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _473 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = 1.0 / _461;
    float _477 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    bool _493 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = isnan(_449);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _509 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    bool _511 = _451 > 0.5;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _515 = _465 * _475;
    float _517 = 1.0 / _471;
    bool _519 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_449);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_515, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _535 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_449);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = _453 > 0.5;
    float _549 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _553 = _449 + _551;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    float _559 = -_503;
    float _561 = _559 + 1.0;
    float _563 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
    float _565 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _567 = _529 * _557;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _545 * _561;
    float _575 = _485 * _517;
    float _577 = _533 * _567;
    float _579 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = -_177;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_177);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _577);
    float _589 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _579 + _591;
    bool _595 = !_481;
    float _597 = _595 ? _177 : as_type<float>(_583);
    float _599 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _603 = _589 + _601;
    float _605 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_181;
    int _609 = _547 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = _597 + 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _599 + _615;
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    bool _621 = !_489;
    float _623 = _621 ? _181 : as_type<float>(_609);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = fma(_585, _573, _587);
    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _631 = -_623;
    float _633 = _631 + 0.5;
    float _635 = _625 * _507;
    float _637 = _593 * _593;
    bool _639 = _629 >= 0.0;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _645 = fma(_603, _603, _637);
    float _647 = _641 * _611;
    float _649 = fma(_617, _617, _645);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = rsqrt(_649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = _645;
    if (_639)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_639)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_44.x = _635;
    out.m_44.y = _647;
    float _685 = _593 * _653;
    float _687 = _603 * _653;
    out.m_46.x = _671;
    out.m_46.y = _673;
    out.m_46.z = _675;
    out.m_48.x = _667;
    out.m_48.y = _669;
    out.m_48.z = _531;
    out.m_48.w = _677;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2099 = as_type<float>(_683);
        out.gl_Position.z = _2099;
    }
    if (_639)
    {
        out.m_33.x = 0.0;
    }
    if (_639)
    {
        return out;
    }
    float _689 = -_685;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _617 * _653;
    float _695 = -_687;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _699 = -_685;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_687;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    float _743 = _723;
    if (_739)
    {
        _743 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _743;
    int _747 = as_type<int>(_745);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _749 = _653 * _741;
    if (_739)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2231 = as_type<float>(_753);
        out.gl_Position.z = _2231;
    }
    if (_739)
    {
        return out;
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _763 = _749 * _755;
    float _765 = _749 * _759;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    bool _773 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _775 = isnan(0.5);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _781 = _777 || _779;
    float _783 = _761 * _765;
    float _785 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _793 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _789);
    float _795 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _801 = _599 + _797;
    float _803 = _589 + _799;
    float _805 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _813 = _803 + _811;
    float _815 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _817 = _809 * _809;
    float _819 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _821 = fma(_813, _813, _817);
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = sqrt(_821);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _833 = _819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _837 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _839 = 1.0 / _833;
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _845 = _579 + _841;
    float _847 = _843 + _833;
    bool _849 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _841;
    float _853 = _769;
    if (!_849)
    {
        _187 = _803;
    }
    float _855 = _187;
    float _857 = _855;
    if (!_849)
    {
        _851 = _801;
    }
    float _859 = _851;
    float _861 = _859;
    if (!_849)
    {
        _853 = _845;
    }
    float _863 = _853;
    bool _865 = !_849;
    float _867 = _863;
    if (!_865)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _873 = _827 + _871;
        float _875 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = rsqrt(_821);
        float _879 = _873 * _869;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _881 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 + (-1.0);
        float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = fma(_889, _875, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _897 = fma(_845, _885, _893);
        float _899 = _877 * _895;
        float _901 = fma(_813, _899, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _903 = fma(_809, _899, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _897;
        _857 = _901;
        _861 = _903;
    }
    float _905 = _867;
    float _907 = _857;
    float _909 = _861;
    float _911 = -_685;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _915 = _847 * _839;
    float _917 = _915 * 0.5;
    float _919 = -_687;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _923 = -_693;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _927 = _913 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _929 = _905;
    if (_781)
    {
        _929 = 1.0;
    }
    float _931 = _929;
    float _933 = _931;
    if (!_781)
    {
        float _935 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _935);
        float _939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _943 = 1.0 / _937;
        float _945 = 1.0 / _941;
        float _947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _951 = fma(_943, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        _933 = _955;
    }
    float _957 = _933;
    float _959 = _913 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[1].x, _927);
    float _963 = _913 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _913 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _969 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _973 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _975 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _979 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _983 = _975 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _985 = _977 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _987 = _977 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _989 = _977 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].x, _985);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].x, _987);
    float _997 = _977 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _999 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = _981 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].z, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].z, _995);
    float _1007 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].x, _997);
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1003);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1005);
    bool _1015 = _957 > 0.0;
    bool _1017 = isnan(_957);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1007);
    float _1027 = _957 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1009);
    float _1031 = _1011 + _1013;
    float _1033 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1025);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1037 = _1031 * 0.5;
    out.m_33.x = _1035;
    out.gl_Position.x = _1029;
    out.gl_Position.y = _1033;
    out.gl_Position.z = _1011;
    out.gl_Position.w = _1013;
    out.m_50.z = _1037;
    out.m_50.w = _1013;
    if (_1023)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1039;
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
    bool _441 = false;
    bool _285 = false;
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
        float _1096 = as_type<float>(_85);
        out.gl_Position.z = _1096;
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
        float _1165 = as_type<float>(_121);
        out.gl_Position.z = _1165;
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
    float _187 = 0.5;
    if (!_183)
    {
        float _189 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _191 = log2(_189);
        float _193 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _195 = _193 + 1.0;
        float _197 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = _125 * _191;
        float _201 = 1.0 / _195;
        float _203 = _197 * 0.693147182464599609375;
        float _205 = exp2(_199);
        float _207 = 1.0 / _203;
        float _209 = _205 + (-1.0);
        float _211 = -_209;
        float _213 = fma(_211, _207, _125);
        float _215 = _213 * _201;
        float _217 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _217;
    }
    float _219 = _185;
    bool _221 = !_137;
    if (!_221)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = 1.0 / _229;
        float _233 = _125 * _225;
        float _235 = exp2(_233);
        float _237 = -_235;
        float _239 = _237 + 1.0;
        float _241 = _239 * _231;
        _153 = _241;
    }
    float _243 = _153;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _249 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _251 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = fma(_243, _139, _247);
    float _255 = fma(_243, _141, _249);
    float _257 = fma(_243, _143, _251);
    float _259 = fma(_253, _127, _145);
    float _261 = fma(_255, _127, _147);
    float _263 = fma(_257, _127, _149);
    bool _265 = !_245;
    float _283;
    if (!_265)
    {
        float _267 = in.m_42.x;
        float _269 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _271 = _267 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _275 = _273 * _269;
        float _277 = floor(_275);
        float _279 = -_277;
        float _281 = _275 + _279;
        _283 = _281;
        _285 = true;
    }
    else
    {
        float _287 = float(_69);
        float _289 = 1.0 / _287;
        float _291 = _103 * _289;
        _283 = _291;
    }
    _285 = false;
    float _293 = _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = _293 + _295;
    bool _299 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _301 = isnan(_293);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _293 + _311;
    bool _315 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_293);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -_309;
    float _337 = _335 + 1.0;
    float _339 = 1.0 / _333;
    bool _341 = _293 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_293);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _325 * _337;
    float _355 = -_325;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _361 = _351 * _357;
    float _363 = 1.0 / _329;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_351;
    float _371 = _369 + 1.0;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _377 = _313 * _339;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _383 = fma(_375, _377, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _385 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = _297 * _363;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _389;
    float _393 = in.m_40.x;
    float _395 = in.m_40.y;
    float _397 = fma(_367, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _401 = _397 * _361;
    float _403 = _399 * _361;
    float _405 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _407 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _409 = fma(_385, _353, _405);
    float _411 = fma(_383, _353, _407);
    float _413 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].x, _409);
    float _415 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[145].y, _411);
    float _417 = _413 * _393;
    float _419 = _415 * _395;
    bool _421 = !_359;
    float _439;
    if (!_421)
    {
        float _423 = in.m_42.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_69);
        float _445 = 1.0 / _443;
        float _447 = _103 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_42.x;
    float _453 = in.m_42.y;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _449 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _463;
    float _467 = _261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _473 = _261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = 1.0 / _461;
    float _477 = _261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _481 = _479 != 0;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _467);
    bool _493 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _495 = isnan(_449);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _477);
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _509 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    bool _511 = _451 > 0.5;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _515 = _465 * _475;
    float _517 = 1.0 / _471;
    bool _519 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_449);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = fma(_515, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _535 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _537 = isnan(_449);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    bool _547 = _453 > 0.5;
    float _549 = fma(_259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _553 = _449 + _551;
    float _555 = -_545;
    float _557 = _555 + 1.0;
    float _559 = -_503;
    float _561 = _559 + 1.0;
    float _563 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _549);
    float _565 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _505);
    float _567 = _529 * _557;
    float _569 = -_529;
    float _571 = _569 + 1.0;
    float _573 = _545 * _561;
    float _575 = _485 * _517;
    float _577 = _533 * _567;
    float _579 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = -_177;
    int _583 = _511 ? as_type<int>(_581) : as_type<int>(_177);
    float _585 = fma(_575, _553, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[115].x, _577);
    float _589 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _591 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _593 = _579 + _591;
    bool _595 = !_481;
    float _597 = _595 ? _177 : as_type<float>(_583);
    float _599 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _603 = _589 + _601;
    float _605 = _593 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _607 = -_181;
    int _609 = _547 ? as_type<int>(_607) : as_type<int>(_181);
    float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _613 = _597 + 0.5;
    float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _617 = _599 + _615;
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[28].x, _605);
    bool _621 = !_489;
    float _623 = _621 ? _181 : as_type<float>(_609);
    float _625 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _627 = fma(_585, _573, _587);
    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[28].z, _619);
    float _631 = -_623;
    float _633 = _631 + 0.5;
    float _635 = _625 * _507;
    float _637 = _593 * _593;
    bool _639 = _629 >= 0.0;
    float _641 = _633 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _643 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _645 = fma(_603, _603, _637);
    float _647 = _641 * _611;
    float _649 = fma(_617, _617, _645);
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _653 = rsqrt(_649);
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _657 = _645;
    if (_639)
    {
        _657 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _643 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _679 = as_type<int>(_659);
    if (_639)
    {
        float _681 = _659 * 5.0;
        _679 = as_type<int>(_681);
    }
    int _683 = _679;
    out.m_44.x = _635;
    out.m_44.y = _647;
    float _685 = _593 * _653;
    float _687 = _603 * _653;
    out.m_46.x = _671;
    out.m_46.y = _673;
    out.m_46.z = _675;
    out.m_48.x = _667;
    out.m_48.y = _669;
    out.m_48.z = _531;
    out.m_48.w = _677;
    if (_639)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2099 = as_type<float>(_683);
        out.gl_Position.z = _2099;
    }
    if (_639)
    {
        out.m_33.x = 0.0;
    }
    if (_639)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _689 = -_685;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _579);
    float _693 = _617 * _653;
    float _695 = -_687;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _699 = -_685;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _705 = _691 + _703;
    float _707 = -_693;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _599);
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _697 + _711;
    float _715 = -_687;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _719 = _705 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _723 = _709 + _721;
    float _725 = _701 * _701;
    float _727 = -_693;
    float _729 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _731 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _719);
    float _733 = fma(_717, _717, _725);
    float _735 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[28].z, _731);
    float _737 = fma(_729, _729, _733);
    bool _739 = _735 >= 0.0;
    float _741 = sqrt(_737);
    float _743 = _723;
    if (_739)
    {
        _743 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _745 = _743;
    int _747 = as_type<int>(_745);
    if (_739)
    {
        out.m_33.x = 0.0;
    }
    float _749 = _653 * _741;
    if (_739)
    {
        float _751 = _745 * 5.0;
        _747 = as_type<int>(_751);
    }
    int _753 = _747;
    if (_739)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2231 = as_type<float>(_753);
        out.gl_Position.z = _2231;
    }
    if (_739)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _755 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _757 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _759 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _761 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _763 = _749 * _755;
    float _765 = _749 * _759;
    float _767 = _749 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _767 * 0.5;
    float _771 = _757 * _763;
    bool _773 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _775 = isnan(0.5);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _781 = _777 || _779;
    float _783 = _761 * _765;
    float _785 = _771 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _787 = _771 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _789 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].x, _785);
    float _791 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].x, _787);
    float _793 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _789);
    float _795 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _791);
    float _797 = _793 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _799 = _795 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _801 = _599 + _797;
    float _803 = _589 + _799;
    float _805 = _691 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _809 = _801 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _813 = _803 + _811;
    float _815 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _805);
    float _817 = _809 * _809;
    float _819 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _821 = fma(_813, _813, _817);
    float _823 = _771 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = _691 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = sqrt(_821);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _833 = _819 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _829);
    float _837 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[10].z, _831);
    float _839 = 1.0 / _833;
    float _841 = _835 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _843 = _837 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _845 = _579 + _841;
    float _847 = _843 + _833;
    bool _849 = _827 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _851 = _841;
    float _853 = _769;
    if (!_849)
    {
        _187 = _803;
    }
    float _855 = _187;
    float _857 = _855;
    if (!_849)
    {
        _851 = _801;
    }
    float _859 = _851;
    float _861 = _859;
    if (!_849)
    {
        _853 = _845;
    }
    float _863 = _853;
    bool _865 = !_849;
    float _867 = _863;
    if (!_865)
    {
        float _869 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _873 = _827 + _871;
        float _875 = _845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _877 = rsqrt(_821);
        float _879 = _873 * _869;
        float _881 = _879 * 0.15915493667125701904296875;
        float _883 = _881 * 6.283185482025146484375;
        float _885 = cos(_883);
        float _887 = _881 * 6.283185482025146484375;
        float _889 = sin(_887);
        float _891 = _885 + (-1.0);
        float _893 = _891 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _895 = fma(_889, _875, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _897 = fma(_845, _885, _893);
        float _899 = _877 * _895;
        float _901 = fma(_813, _899, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _903 = fma(_809, _899, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _867 = _897;
        _857 = _901;
        _861 = _903;
    }
    float _905 = _867;
    float _907 = _857;
    float _909 = _861;
    float _911 = -_685;
    float _913 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _915 = _847 * _839;
    float _917 = _915 * 0.5;
    float _919 = -_687;
    float _921 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _923 = -_693;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _909);
    float _927 = _913 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _929 = _905;
    if (_781)
    {
        _929 = 1.0;
    }
    float _931 = _929;
    float _933 = _931;
    if (!_781)
    {
        float _935 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _937 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[30].w, _935);
        float _939 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _943 = 1.0 / _937;
        float _945 = 1.0 / _941;
        float _947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _949 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _951 = fma(_943, _947, _949);
        float _953 = _951 * _945;
        float _955 = precise::clamp(_953, 0.0, 1.0);
        _933 = _955;
    }
    float _957 = _933;
    float _959 = _913 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[1].x, _927);
    float _963 = _913 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _913 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _967 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _969 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[1].z, _961);
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _973 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[3].x, _965);
    float _975 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[0].z, _967);
    float _977 = _969 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _979 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[2].z, _971);
    float _981 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[3].z, _973);
    float _983 = _975 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _985 = _977 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _987 = _977 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _989 = _977 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _991 = _979 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _993 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].x, _985);
    float _995 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].x, _987);
    float _997 = _977 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _999 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].x, _989);
    float _1001 = _981 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1003 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[6].z, _993);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[7].z, _995);
    float _1007 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].x, _997);
    float _1009 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[4].z, _999);
    float _1011 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1003);
    float _1013 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1005);
    bool _1015 = _957 > 0.0;
    bool _1017 = isnan(_957);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan(0.0);
    bool _1023 = _1019 || _1021;
    float _1025 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1007);
    float _1027 = _957 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1029 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1009);
    float _1031 = _1011 + _1013;
    float _1033 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1025);
    float _1035 = _1027 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1037 = _1031 * 0.5;
    out.m_33.x = _1035;
    out.gl_Position.x = _1029;
    out.gl_Position.y = _1033;
    out.gl_Position.z = _1011;
    out.gl_Position.w = _1013;
    out.m_50.z = _1037;
    out.m_50.w = _1013;
    if (_1023)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1039;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

