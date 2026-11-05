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
    float4 m_54 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_58 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_50 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _947 = false;
    bool _453 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_95);
        out.gl_Position.z = _1382;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _99 = in.m_37.w;
    float _101 = in.m_39.z;
    bool _103 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_99;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _101;
    if (_111)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1455 = as_type<float>(_133);
        out.gl_Position.z = _1455;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    float _159 = _155 * 0.15915493667125701904296875;
    bool _161 = !_153;
    int _163 = _161 ? (-1090519040) : 1056964608;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _159 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_149;
    int _179 = _177 ? (-1090519040) : 1056964608;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_179);
    out.m_46.y = as_type<float>(_163);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = fma(_175, 0.5, 0.5);
    float _209 = float(_197);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _209 * _219;
    int _223 = abs(_213);
    float _225 = -_207;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_199);
    float _231 = -_217;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_223);
    float _237 = fma(_229, _227, _221);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_205;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        float _263 = float(_79);
        float _265 = 1.0 / _263;
        float _267 = _115 * _265;
        _259 = _267;
    }
    _261 = false;
    float _269 = _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _285;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _289;
    float _315 = _273 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_305;
    float _331 = _329 + 1.0;
    float _333 = _327 * _331;
    float _335 = _277 * _311;
    bool _337 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_269);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = _281 * _313;
    bool _365 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_269);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = fma(_355, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = fma(_379, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _361;
    float _395 = fma(_385, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_375;
    float _401 = _399 + 1.0;
    float _403 = _391 * _393;
    float _405 = _395 * _393;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_381, _357, _411);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_397, _357, _417);
    float _427 = fma(_419, _333, _421);
    float _429 = fma(_423, _333, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_79);
        float _457 = 1.0 / _455;
        float _459 = _115 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_32.x;
    float _465 = in.m_32.y;
    float _467 = in.m_32.z;
    float _469 = in.m_48.x;
    float _471 = in.m_48.y;
    float _473 = in.m_48.z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = in.m_50.x;
    float _481 = in.m_50.y;
    float _483 = in.m_50.z;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = 1.0 / _477;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _487;
    float _499 = _465 * _471;
    float _501 = _465 * _481;
    float _503 = fma(_463, _469, _499);
    bool _505 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _507 = isnan(_461);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = _465 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = fma(_463, _479, _501);
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = fma(_463, _491, _517);
    float _539 = _521 * _489;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _461 + _541;
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = fma(_467, _473, _503);
    float _555 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = _535 * _547;
    float _559 = _551 * _497;
    float _561 = fma(_467, _483, _523);
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _565 = fma(_467, _495, _537);
    float _567 = _555 * _557;
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _573 = _563 + _571;
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _577 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_461);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _569 + _589;
    float _593 = _573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _461 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _575 + _599;
    float _603 = -_535;
    float _605 = _603 + 1.0;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _593);
    float _609 = -_587;
    float _611 = _609 + 1.0;
    float _613 = fma(_559, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _615 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _607);
    float _619 = _573 * _573;
    float _621 = _515 * _611;
    bool _623 = _617 >= 0.0;
    float _625 = fma(_591, _591, _619);
    float _627 = fma(_613, _621, _615);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _631 = fma(_601, _601, _625);
    float _633 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = rsqrt(_631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _587;
    if (_623)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _645 = _643;
    float _647 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_645);
    if (_623)
    {
        out.m_35.x = 0.0;
    }
    if (_623)
    {
        float _655 = _645 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_54.x = _641;
    out.m_54.y = _647;
    out.m_54.z = _649;
    out.m_54.w = _651;
    if (_623)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_657);
        out.gl_Position.z = _2298;
    }
    float _659 = _573 * _637;
    float _661 = _591 * _637;
    if (_623)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _663 = -_659;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _667 = _601 * _637;
    float _669 = -_661;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _673 = in.m_56.x;
    float _675 = in.m_56.y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _679 = _665 + _677;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _687 = _671 + _685;
    float _689 = -_659;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _697 = _683 + _695;
    float _699 = -_661;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = _691 * _691;
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[28].x, _693);
    float _707 = -_667;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _711 = fma(_701, _701, _703);
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _715 = fma(_709, _709, _711);
    bool _717 = _713 >= 0.0;
    float _719 = sqrt(_715);
    float _721 = _431 * _673;
    float _723 = _433 * _675;
    float _725 = _241 * _721;
    float _727 = _241 * _723;
    float _729 = _713;
    if (_717)
    {
        _729 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _731 = _729;
    int _733 = as_type<int>(_731);
    if (_717)
    {
        out.m_35.x = 0.0;
    }
    if (_717)
    {
        float _735 = _731 * 5.0;
        _733 = as_type<int>(_735);
    }
    int _737 = _733;
    float _739 = _637 * _719;
    if (_717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_737);
        out.gl_Position.z = _2448;
    }
    if (_717)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _741 = _727 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_179));
    float _749 = _739 * _741;
    float _751 = _739 * _743;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _755 = _753 * 0.5;
    float _757 = _745 * _749;
    float _759 = _747 * _751;
    float _761 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _785 = _569 + _779;
    float _787 = _575 + _781;
    float _789 = _563 + _783;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _793 = _785 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _797 = _787 + _795;
    float _799 = _793 * _793;
    float _801 = _797 * _797;
    float _803 = _799 + _801;
    float _805 = sqrt(_803);
    bool _807 = _805 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _759;
    float _811 = _783;
    float _813 = _755;
    float _815 = _801;
    float _817 = _785;
    if (!_807)
    {
        _809 = _799;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_807)
    {
        _811 = _787;
    }
    float _823 = _811;
    float _825 = _823;
    if (!_807)
    {
        _813 = _789;
    }
    float _827 = _813;
    bool _829 = !_807;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _805 + _835;
        float _839 = rsqrt(_803);
        float _841 = _837 * _833;
        float _843 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = fma(_849, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _857 = _839 * _855;
        float _859 = _853 + (-1.0);
        float _861 = fma(_793, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _863 = fma(_797, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _865 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _869 = _861 + _867;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _873 = _863 + _871;
        float _875 = fma(_789, _853, _865);
        float _877 = _869 * _869;
        float _879 = _873 * _873;
        _831 = _875;
        _821 = _877;
        _815 = _879;
        _825 = _863;
        _817 = _861;
    }
    float _881 = _831;
    float _883 = _821;
    float _885 = _815;
    float _887 = _825;
    float _889 = _817;
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _893 = _881 + _891;
    float _895 = fma(_893, _893, _883);
    float _897 = _895 + _885;
    float _899 = sqrt(_897);
    bool _901 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _903 = isnan(_899);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _909 = _905 || _907;
    float _911 = _895;
    if (!_909)
    {
        _911 = 1.0;
    }
    float _913 = _911;
    bool _915 = !_909;
    float _917 = _913;
    if (!_915)
    {
        bool _919 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _921 = isnan(_899);
        bool _923 = _919 || _921;
        bool _925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _927 = _923 || _925;
        if (!_927)
        {
            float _929 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _931 = _899 + _929;
            float _933 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _935 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _933;
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _939 = _937 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _941 = 1.0 / _935;
            float _943 = _931 * _941;
            float _945 = fma(_943, _939, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _917 = _945;
            _947 = true;
        }
        else
        {
            bool _949 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _951 = isnan(_899);
            bool _953 = _949 || _951;
            bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _957 = _953 || _955;
            if (!_957)
            {
                float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _961 = _899 + _959;
                float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _971 = 1.0 / _965;
                float _973 = _961 * _971;
                float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _917 = _975;
                _947 = true;
            }
            else
            {
                _917 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _947 = false;
    float _977 = _917;
    float _979 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _981 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _887 + _983;
    float _987 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _979);
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _991 = _889 + _989;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _981);
    float _1005 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _987);
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1009 = _881 + _1007;
    float _1011 = fma(_991, _977, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1013 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1017 = fma(_1009, _977, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_985, _977, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = 1.0 / _1015;
    float _1025 = -_661;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1029 = -_659;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = -_667;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1037 = _1021 + _1015;
    float _1039 = _1031;
    float _1041 = _1027;
    float _1043 = _1035;
    if (!_1001)
    {
        float _1045 = _679 * _679;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = -_575;
        float _1051 = _1049 + _1019;
        float _1053 = -_569;
        float _1055 = _1053 + _1011;
        float _1057 = fma(_687, _687, _1045);
        float _1059 = -_563;
        float _1061 = _1059 + _1017;
        float _1063 = fma(_697, _697, _1057);
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = sqrt(_1063);
        float _1069 = 1.0 / _739;
        float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1073 = precise::min(_1067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1075 = _1073 * _1047;
        float _1077 = _1075 * _1069;
        float _1079 = _1071 * _1077;
        float _1081 = _1051 * _1077;
        float _1083 = fma(_1055, _1079, _671);
        float _1085 = fma(_1061, _1079, _665);
        float _1087 = fma(_1071, _1081, _683);
        _1039 = _1085;
        _1041 = _1083;
        _1043 = _1087;
    }
    float _1089 = _1039;
    float _1091 = _1041;
    float _1093 = _1043;
    float _1095 = _1037 * _1023;
    float _1097 = _1095 * 0.5;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1103);
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1099);
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1121 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1123 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1125 = 1.0 / _1105;
    float _1127 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1129 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1121);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1129);
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1147 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1143);
    float _1155 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1145);
    float _1157 = _1139;
    float _1159 = _1135;
    if (_1117)
    {
        _1157 = 1.0;
    }
    float _1161 = _1157;
    float _1163 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1165 = _1161;
    if (_1117)
    {
        _1159 = 1.0;
    }
    float _1167 = _1159;
    float _1169 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1125 * _1171;
    float _1175 = _1167;
    if (!_1117)
    {
        float _1177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1187 = _1185 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1183;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1165 = _1223;
    }
    float _1225 = _1165;
    if (!_1117)
    {
        float _1227 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = _1237 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = _1247 * _1249;
        float _1257 = 1.0 / _1255;
        float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1261 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1259;
        float _1263 = 1.0 / _1261;
        float _1265 = _1253 * _1257;
        float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1269 = fma(_1173, _1265, _1267);
        float _1271 = _1269 * _1263;
        float _1273 = precise::clamp(_1271, 0.0, 1.0);
        float _1275 = -_1273;
        float _1277 = _1275 + 1.0;
        _1175 = _1277;
    }
    float _1279 = _1175;
    float _1281 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1153);
    float _1285 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    bool _1287 = _1225 > 0.0;
    bool _1289 = isnan(_1225);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1299 = _1225 * _1279;
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1285);
    bool _1305 = _1279 <= 0.0;
    bool _1307 = !_1295;
    bool _1309 = _1305 || _1307;
    float _1311 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1315 = _1301 + _1303;
    float _1317 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1319 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1321 = _1315 * 0.5;
    float _1323 = _1317 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1091;
    out.m_58.y = _1089;
    out.m_58.z = _1093;
    out.gl_Position.x = _1313;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1303;
    out.m_60.z = _1321;
    out.m_60.w = _1303;
    out.m_35.x = _1323;
    if (!_1309)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1325;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _947 = false;
    bool _453 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_95);
        out.gl_Position.z = _1382;
    }
    if (!_83)
    {
        return out;
    }
    float _99 = in.m_37.w;
    float _101 = in.m_39.z;
    bool _103 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_99;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _101;
    if (_111)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1455 = as_type<float>(_133);
        out.gl_Position.z = _1455;
    }
    if (_125)
    {
        return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    float _159 = _155 * 0.15915493667125701904296875;
    bool _161 = !_153;
    int _163 = _161 ? (-1090519040) : 1056964608;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _159 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_149;
    int _179 = _177 ? (-1090519040) : 1056964608;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_179);
    out.m_46.y = as_type<float>(_163);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = fma(_175, 0.5, 0.5);
    float _209 = float(_197);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _209 * _219;
    int _223 = abs(_213);
    float _225 = -_207;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_199);
    float _231 = -_217;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_223);
    float _237 = fma(_229, _227, _221);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_205;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        float _263 = float(_79);
        float _265 = 1.0 / _263;
        float _267 = _115 * _265;
        _259 = _267;
    }
    _261 = false;
    float _269 = _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _285;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _289;
    float _315 = _273 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_305;
    float _331 = _329 + 1.0;
    float _333 = _327 * _331;
    float _335 = _277 * _311;
    bool _337 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_269);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = _281 * _313;
    bool _365 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_269);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = fma(_355, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = fma(_379, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _361;
    float _395 = fma(_385, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_375;
    float _401 = _399 + 1.0;
    float _403 = _391 * _393;
    float _405 = _395 * _393;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_381, _357, _411);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_397, _357, _417);
    float _427 = fma(_419, _333, _421);
    float _429 = fma(_423, _333, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_79);
        float _457 = 1.0 / _455;
        float _459 = _115 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_32.x;
    float _465 = in.m_32.y;
    float _467 = in.m_32.z;
    float _469 = in.m_48.x;
    float _471 = in.m_48.y;
    float _473 = in.m_48.z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = in.m_50.x;
    float _481 = in.m_50.y;
    float _483 = in.m_50.z;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = 1.0 / _477;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _487;
    float _499 = _465 * _471;
    float _501 = _465 * _481;
    float _503 = fma(_463, _469, _499);
    bool _505 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _507 = isnan(_461);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = _465 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = fma(_463, _479, _501);
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = fma(_463, _491, _517);
    float _539 = _521 * _489;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _461 + _541;
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = fma(_467, _473, _503);
    float _555 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = _535 * _547;
    float _559 = _551 * _497;
    float _561 = fma(_467, _483, _523);
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _565 = fma(_467, _495, _537);
    float _567 = _555 * _557;
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _573 = _563 + _571;
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _577 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_461);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _569 + _589;
    float _593 = _573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _461 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _575 + _599;
    float _603 = -_535;
    float _605 = _603 + 1.0;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _593);
    float _609 = -_587;
    float _611 = _609 + 1.0;
    float _613 = fma(_559, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _615 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _607);
    float _619 = _573 * _573;
    float _621 = _515 * _611;
    bool _623 = _617 >= 0.0;
    float _625 = fma(_591, _591, _619);
    float _627 = fma(_613, _621, _615);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _631 = fma(_601, _601, _625);
    float _633 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = rsqrt(_631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _587;
    if (_623)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _645 = _643;
    float _647 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_645);
    if (_623)
    {
        out.m_35.x = 0.0;
    }
    if (_623)
    {
        float _655 = _645 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_54.x = _641;
    out.m_54.y = _647;
    out.m_54.z = _649;
    out.m_54.w = _651;
    if (_623)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_657);
        out.gl_Position.z = _2298;
    }
    float _659 = _573 * _637;
    float _661 = _591 * _637;
    if (_623)
    {
        return out;
    }
    float _663 = -_659;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _667 = _601 * _637;
    float _669 = -_661;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _673 = in.m_56.x;
    float _675 = in.m_56.y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _679 = _665 + _677;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _687 = _671 + _685;
    float _689 = -_659;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _697 = _683 + _695;
    float _699 = -_661;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = _691 * _691;
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[28].x, _693);
    float _707 = -_667;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _711 = fma(_701, _701, _703);
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _715 = fma(_709, _709, _711);
    bool _717 = _713 >= 0.0;
    float _719 = sqrt(_715);
    float _721 = _431 * _673;
    float _723 = _433 * _675;
    float _725 = _241 * _721;
    float _727 = _241 * _723;
    float _729 = _713;
    if (_717)
    {
        _729 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _731 = _729;
    int _733 = as_type<int>(_731);
    if (_717)
    {
        out.m_35.x = 0.0;
    }
    if (_717)
    {
        float _735 = _731 * 5.0;
        _733 = as_type<int>(_735);
    }
    int _737 = _733;
    float _739 = _637 * _719;
    if (_717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_737);
        out.gl_Position.z = _2448;
    }
    if (_717)
    {
        return out;
    }
    float _741 = _727 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_179));
    float _749 = _739 * _741;
    float _751 = _739 * _743;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _755 = _753 * 0.5;
    float _757 = _745 * _749;
    float _759 = _747 * _751;
    float _761 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _785 = _569 + _779;
    float _787 = _575 + _781;
    float _789 = _563 + _783;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _793 = _785 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _797 = _787 + _795;
    float _799 = _793 * _793;
    float _801 = _797 * _797;
    float _803 = _799 + _801;
    float _805 = sqrt(_803);
    bool _807 = _805 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _759;
    float _811 = _783;
    float _813 = _755;
    float _815 = _801;
    float _817 = _785;
    if (!_807)
    {
        _809 = _799;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_807)
    {
        _811 = _787;
    }
    float _823 = _811;
    float _825 = _823;
    if (!_807)
    {
        _813 = _789;
    }
    float _827 = _813;
    bool _829 = !_807;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _805 + _835;
        float _839 = rsqrt(_803);
        float _841 = _837 * _833;
        float _843 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = fma(_849, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _857 = _839 * _855;
        float _859 = _853 + (-1.0);
        float _861 = fma(_793, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _863 = fma(_797, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _865 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _869 = _861 + _867;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _873 = _863 + _871;
        float _875 = fma(_789, _853, _865);
        float _877 = _869 * _869;
        float _879 = _873 * _873;
        _831 = _875;
        _821 = _877;
        _815 = _879;
        _825 = _863;
        _817 = _861;
    }
    float _881 = _831;
    float _883 = _821;
    float _885 = _815;
    float _887 = _825;
    float _889 = _817;
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _893 = _881 + _891;
    float _895 = fma(_893, _893, _883);
    float _897 = _895 + _885;
    float _899 = sqrt(_897);
    bool _901 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _903 = isnan(_899);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _909 = _905 || _907;
    float _911 = _895;
    if (!_909)
    {
        _911 = 1.0;
    }
    float _913 = _911;
    bool _915 = !_909;
    float _917 = _913;
    if (!_915)
    {
        bool _919 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _921 = isnan(_899);
        bool _923 = _919 || _921;
        bool _925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _927 = _923 || _925;
        if (!_927)
        {
            float _929 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _931 = _899 + _929;
            float _933 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _935 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _933;
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _939 = _937 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _941 = 1.0 / _935;
            float _943 = _931 * _941;
            float _945 = fma(_943, _939, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _917 = _945;
            _947 = true;
        }
        else
        {
            bool _949 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _951 = isnan(_899);
            bool _953 = _949 || _951;
            bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _957 = _953 || _955;
            if (!_957)
            {
                float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _961 = _899 + _959;
                float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _971 = 1.0 / _965;
                float _973 = _961 * _971;
                float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _917 = _975;
                _947 = true;
            }
            else
            {
                _917 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _947 = false;
    float _977 = _917;
    float _979 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _981 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _887 + _983;
    float _987 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _979);
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _991 = _889 + _989;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _981);
    float _1005 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _987);
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1009 = _881 + _1007;
    float _1011 = fma(_991, _977, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1013 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1017 = fma(_1009, _977, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_985, _977, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = 1.0 / _1015;
    float _1025 = -_661;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1029 = -_659;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = -_667;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1037 = _1021 + _1015;
    float _1039 = _1031;
    float _1041 = _1027;
    float _1043 = _1035;
    if (!_1001)
    {
        float _1045 = _679 * _679;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = -_575;
        float _1051 = _1049 + _1019;
        float _1053 = -_569;
        float _1055 = _1053 + _1011;
        float _1057 = fma(_687, _687, _1045);
        float _1059 = -_563;
        float _1061 = _1059 + _1017;
        float _1063 = fma(_697, _697, _1057);
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = sqrt(_1063);
        float _1069 = 1.0 / _739;
        float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1073 = precise::min(_1067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1075 = _1073 * _1047;
        float _1077 = _1075 * _1069;
        float _1079 = _1071 * _1077;
        float _1081 = _1051 * _1077;
        float _1083 = fma(_1055, _1079, _671);
        float _1085 = fma(_1061, _1079, _665);
        float _1087 = fma(_1071, _1081, _683);
        _1039 = _1085;
        _1041 = _1083;
        _1043 = _1087;
    }
    float _1089 = _1039;
    float _1091 = _1041;
    float _1093 = _1043;
    float _1095 = _1037 * _1023;
    float _1097 = _1095 * 0.5;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1103);
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1099);
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1121 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1123 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1125 = 1.0 / _1105;
    float _1127 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1129 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1121);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1129);
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1147 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1143);
    float _1155 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1145);
    float _1157 = _1139;
    float _1159 = _1135;
    if (_1117)
    {
        _1157 = 1.0;
    }
    float _1161 = _1157;
    float _1163 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1165 = _1161;
    if (_1117)
    {
        _1159 = 1.0;
    }
    float _1167 = _1159;
    float _1169 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1125 * _1171;
    float _1175 = _1167;
    if (!_1117)
    {
        float _1177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1187 = _1185 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1183;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1165 = _1223;
    }
    float _1225 = _1165;
    if (!_1117)
    {
        float _1227 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = _1237 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = _1247 * _1249;
        float _1257 = 1.0 / _1255;
        float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1261 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1259;
        float _1263 = 1.0 / _1261;
        float _1265 = _1253 * _1257;
        float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1269 = fma(_1173, _1265, _1267);
        float _1271 = _1269 * _1263;
        float _1273 = precise::clamp(_1271, 0.0, 1.0);
        float _1275 = -_1273;
        float _1277 = _1275 + 1.0;
        _1175 = _1277;
    }
    float _1279 = _1175;
    float _1281 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1153);
    float _1285 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    bool _1287 = _1225 > 0.0;
    bool _1289 = isnan(_1225);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1299 = _1225 * _1279;
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1285);
    bool _1305 = _1279 <= 0.0;
    bool _1307 = !_1295;
    bool _1309 = _1305 || _1307;
    float _1311 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1315 = _1301 + _1303;
    float _1317 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1319 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1321 = _1315 * 0.5;
    float _1323 = _1317 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1091;
    out.m_58.y = _1089;
    out.m_58.z = _1093;
    out.gl_Position.x = _1313;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1303;
    out.m_60.z = _1321;
    out.m_60.w = _1303;
    out.m_35.x = _1323;
    if (!_1309)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1325;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    bool _947 = false;
    bool _453 = false;
    bool _261 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _74 = in.m_32.w;
    float _76 = trunc(_74);
    int _79 = int(_76);
    bool _83 = _79 >= 1;
    float _85 = 0.0;
    if (!_83)
    {
        _85 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _87 = _85;
    float _89 = _87;
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _91 = 0;
    if (!_83)
    {
        float _93 = _87 * 5.0;
        _91 = as_type<int>(_93);
    }
    int _95 = _91;
    int _97 = _95;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1382 = as_type<float>(_95);
        out.gl_Position.z = _1382;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _99 = in.m_37.w;
    float _101 = in.m_39.z;
    bool _103 = _99 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_99);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_99;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _101;
    if (_111)
    {
        float _117 = float(_79);
        _89 = _117;
    }
    float _119 = _89;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_35.x = 0.0;
    }
    if (_125)
    {
        float _131 = _129 * 5.0;
        _97 = as_type<int>(_131);
    }
    int _133 = _97;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1455 = as_type<float>(_133);
        out.gl_Position.z = _1455;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _115 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    float _159 = _155 * 0.15915493667125701904296875;
    bool _161 = !_153;
    int _163 = _161 ? (-1090519040) : 1056964608;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _159 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_149;
    int _179 = _177 ? (-1090519040) : 1056964608;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_179);
    out.m_46.y = as_type<float>(_163);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = fma(_175, 0.5, 0.5);
    float _209 = float(_197);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _209 * _219;
    int _223 = abs(_213);
    float _225 = -_207;
    float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _229 = float(_199);
    float _231 = -_217;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_223);
    float _237 = fma(_229, _227, _221);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_205;
    float _259;
    if (!_243)
    {
        float _245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _247 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _251 = _249 * _245;
        float _253 = floor(_251);
        float _255 = -_253;
        float _257 = _251 + _255;
        _259 = _257;
        _261 = true;
    }
    else
    {
        float _263 = float(_79);
        float _265 = 1.0 / _263;
        float _267 = _115 * _265;
        _259 = _267;
    }
    _261 = false;
    float _269 = _259;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _285;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _289;
    float _315 = _273 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = -_305;
    float _331 = _329 + 1.0;
    float _333 = _327 * _331;
    float _335 = _277 * _311;
    bool _337 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _339 = isnan(_269);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_327;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = _347 * _351;
    float _359 = -_347;
    float _361 = _359 + 1.0;
    float _363 = _281 * _313;
    bool _365 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _367 = isnan(_269);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _377;
    float _381 = fma(_355, _363, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _391 = fma(_379, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _393 = _375 * _361;
    float _395 = fma(_385, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = fma(_389, _363, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_375;
    float _401 = _399 + 1.0;
    float _403 = _391 * _393;
    float _405 = _395 * _393;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_381, _357, _411);
    float _423 = fma(_415, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _425 = fma(_397, _357, _417);
    float _427 = fma(_419, _333, _421);
    float _429 = fma(_423, _333, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_79);
        float _457 = 1.0 / _455;
        float _459 = _115 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = in.m_32.x;
    float _465 = in.m_32.y;
    float _467 = in.m_32.z;
    float _469 = in.m_48.x;
    float _471 = in.m_48.y;
    float _473 = in.m_48.z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = in.m_50.x;
    float _481 = in.m_50.y;
    float _483 = in.m_50.z;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = 1.0 / _477;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _487;
    float _499 = _465 * _471;
    float _501 = _465 * _481;
    float _503 = fma(_463, _469, _499);
    bool _505 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _507 = isnan(_461);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = _465 * _493;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _519;
    float _523 = fma(_463, _479, _501);
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = fma(_463, _491, _517);
    float _539 = _521 * _489;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _543 = _461 + _541;
    float _545 = -_515;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _553 = fma(_467, _473, _503);
    float _555 = fma(_539, _543, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _557 = _535 * _547;
    float _559 = _551 * _497;
    float _561 = fma(_467, _483, _523);
    float _563 = _553 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _565 = fma(_467, _495, _537);
    float _567 = _555 * _557;
    float _569 = _561 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _571 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _573 = _563 + _571;
    float _575 = _565 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _577 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _579 = isnan(_461);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _591 = _569 + _589;
    float _593 = _573 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _597 = _461 + _595;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _575 + _599;
    float _603 = -_535;
    float _605 = _603 + 1.0;
    float _607 = fma(_591, (*spvDescriptorSet0.vp_c8)._m0[28].x, _593);
    float _609 = -_587;
    float _611 = _609 + 1.0;
    float _613 = fma(_559, _597, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _615 = fma(_605, (*spvDescriptorSet0.vp_c9)._m0[115].x, _567);
    float _617 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[28].z, _607);
    float _619 = _573 * _573;
    float _621 = _515 * _611;
    bool _623 = _617 >= 0.0;
    float _625 = fma(_591, _591, _619);
    float _627 = fma(_613, _621, _615);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _631 = fma(_601, _601, _625);
    float _633 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[117].x, _627);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = rsqrt(_631);
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _587;
    if (_623)
    {
        _643 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _645 = _643;
    float _647 = _629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _649 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _653 = as_type<int>(_645);
    if (_623)
    {
        out.m_35.x = 0.0;
    }
    if (_623)
    {
        float _655 = _645 * 5.0;
        _653 = as_type<int>(_655);
    }
    int _657 = _653;
    out.m_54.x = _641;
    out.m_54.y = _647;
    out.m_54.z = _649;
    out.m_54.w = _651;
    if (_623)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_657);
        out.gl_Position.z = _2298;
    }
    float _659 = _573 * _637;
    float _661 = _591 * _637;
    if (_623)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _663 = -_659;
    float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[18].w, _563);
    float _667 = _601 * _637;
    float _669 = -_661;
    float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _673 = in.m_56.x;
    float _675 = in.m_56.y;
    float _677 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _679 = _665 + _677;
    float _681 = -_667;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _687 = _671 + _685;
    float _689 = -_659;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _693 = _679 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _695 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _697 = _683 + _695;
    float _699 = -_661;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[18].w, _591);
    float _703 = _691 * _691;
    float _705 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[28].x, _693);
    float _707 = -_667;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _711 = fma(_701, _701, _703);
    float _713 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[28].z, _705);
    float _715 = fma(_709, _709, _711);
    bool _717 = _713 >= 0.0;
    float _719 = sqrt(_715);
    float _721 = _431 * _673;
    float _723 = _433 * _675;
    float _725 = _241 * _721;
    float _727 = _241 * _723;
    float _729 = _713;
    if (_717)
    {
        _729 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _731 = _729;
    int _733 = as_type<int>(_731);
    if (_717)
    {
        out.m_35.x = 0.0;
    }
    if (_717)
    {
        float _735 = _731 * 5.0;
        _733 = as_type<int>(_735);
    }
    int _737 = _733;
    float _739 = _637 * _719;
    if (_717)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2448 = as_type<float>(_737);
        out.gl_Position.z = _2448;
    }
    if (_717)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _741 = _727 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _743 = _725 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _745 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_163));
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_179));
    float _749 = _739 * _741;
    float _751 = _739 * _743;
    float _753 = _739 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _755 = _753 * 0.5;
    float _757 = _745 * _749;
    float _759 = _747 * _751;
    float _761 = _757 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _763 = _757 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
    float _769 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[26].x, _763);
    float _771 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _767);
    float _775 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _769);
    float _777 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _771);
    float _779 = _773 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _781 = _775 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _783 = _777 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _785 = _569 + _779;
    float _787 = _575 + _781;
    float _789 = _563 + _783;
    float _791 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _793 = _785 + _791;
    float _795 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _797 = _787 + _795;
    float _799 = _793 * _793;
    float _801 = _797 * _797;
    float _803 = _799 + _801;
    float _805 = sqrt(_803);
    bool _807 = _805 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _809 = _759;
    float _811 = _783;
    float _813 = _755;
    float _815 = _801;
    float _817 = _785;
    if (!_807)
    {
        _809 = _799;
    }
    float _819 = _809;
    float _821 = _819;
    if (!_807)
    {
        _811 = _787;
    }
    float _823 = _811;
    float _825 = _823;
    if (!_807)
    {
        _813 = _789;
    }
    float _827 = _813;
    bool _829 = !_807;
    float _831 = _827;
    if (!_829)
    {
        float _833 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _835 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _837 = _805 + _835;
        float _839 = rsqrt(_803);
        float _841 = _837 * _833;
        float _843 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = _841 * 0.15915493667125701904296875;
        float _847 = _845 * 6.283185482025146484375;
        float _849 = sin(_847);
        float _851 = _845 * 6.283185482025146484375;
        float _853 = cos(_851);
        float _855 = fma(_849, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _857 = _839 * _855;
        float _859 = _853 + (-1.0);
        float _861 = fma(_793, _857, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _863 = fma(_797, _857, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _865 = _859 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _869 = _861 + _867;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _873 = _863 + _871;
        float _875 = fma(_789, _853, _865);
        float _877 = _869 * _869;
        float _879 = _873 * _873;
        _831 = _875;
        _821 = _877;
        _815 = _879;
        _825 = _863;
        _817 = _861;
    }
    float _881 = _831;
    float _883 = _821;
    float _885 = _815;
    float _887 = _825;
    float _889 = _817;
    float _891 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _893 = _881 + _891;
    float _895 = fma(_893, _893, _883);
    float _897 = _895 + _885;
    float _899 = sqrt(_897);
    bool _901 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _903 = isnan(_899);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _909 = _905 || _907;
    float _911 = _895;
    if (!_909)
    {
        _911 = 1.0;
    }
    float _913 = _911;
    bool _915 = !_909;
    float _917 = _913;
    if (!_915)
    {
        bool _919 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _921 = isnan(_899);
        bool _923 = _919 || _921;
        bool _925 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _927 = _923 || _925;
        if (!_927)
        {
            float _929 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _931 = _899 + _929;
            float _933 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _935 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _933;
            float _937 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _939 = _937 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _941 = 1.0 / _935;
            float _943 = _931 * _941;
            float _945 = fma(_943, _939, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _917 = _945;
            _947 = true;
        }
        else
        {
            bool _949 = _899 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _951 = isnan(_899);
            bool _953 = _949 || _951;
            bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _957 = _953 || _955;
            if (!_957)
            {
                float _959 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _961 = _899 + _959;
                float _963 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _965 = _963 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _967 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _969 = _967 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _971 = 1.0 / _965;
                float _973 = _961 * _971;
                float _975 = fma(_973, _969, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _917 = _975;
                _947 = true;
            }
            else
            {
                _917 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _947 = false;
    float _977 = _917;
    float _979 = _665 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _981 = _665 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _983 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _985 = _887 + _983;
    float _987 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[11].x, _979);
    float _989 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _991 = _889 + _989;
    bool _993 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _995 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.5);
    bool _1001 = _997 || _999;
    float _1003 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[10].x, _981);
    float _1005 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _987);
    float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1009 = _881 + _1007;
    float _1011 = fma(_991, _977, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1013 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1003);
    float _1015 = _1005 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1017 = fma(_1009, _977, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1019 = fma(_985, _977, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1021 = _1013 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1023 = 1.0 / _1015;
    float _1025 = -_661;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1011);
    float _1029 = -_659;
    float _1031 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1017);
    float _1033 = -_667;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1019);
    float _1037 = _1021 + _1015;
    float _1039 = _1031;
    float _1041 = _1027;
    float _1043 = _1035;
    if (!_1001)
    {
        float _1045 = _679 * _679;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1049 = -_575;
        float _1051 = _1049 + _1019;
        float _1053 = -_569;
        float _1055 = _1053 + _1011;
        float _1057 = fma(_687, _687, _1045);
        float _1059 = -_563;
        float _1061 = _1059 + _1017;
        float _1063 = fma(_697, _697, _1057);
        float _1065 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = sqrt(_1063);
        float _1069 = 1.0 / _739;
        float _1071 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1073 = precise::min(_1067, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1075 = _1073 * _1047;
        float _1077 = _1075 * _1069;
        float _1079 = _1071 * _1077;
        float _1081 = _1051 * _1077;
        float _1083 = fma(_1055, _1079, _671);
        float _1085 = fma(_1061, _1079, _665);
        float _1087 = fma(_1071, _1081, _683);
        _1039 = _1085;
        _1041 = _1083;
        _1043 = _1087;
    }
    float _1089 = _1039;
    float _1091 = _1041;
    float _1093 = _1043;
    float _1095 = _1037 * _1023;
    float _1097 = _1095 * 0.5;
    float _1099 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1101 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1105 = fma(_1097, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1103);
    float _1107 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1099);
    bool _1109 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1113 = _1109 || _1111;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1101);
    float _1121 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1123 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1107);
    float _1125 = 1.0 / _1105;
    float _1127 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1129 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1131 = _1123 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1121);
    float _1135 = _1127 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1137 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1129);
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1143 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1145 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1147 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1133);
    float _1149 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1139);
    float _1151 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1141);
    float _1153 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1143);
    float _1155 = fma(_1135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1145);
    float _1157 = _1139;
    float _1159 = _1135;
    if (_1117)
    {
        _1157 = 1.0;
    }
    float _1161 = _1157;
    float _1163 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1137);
    float _1165 = _1161;
    if (_1117)
    {
        _1159 = 1.0;
    }
    float _1167 = _1159;
    float _1169 = _1147 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1173 = _1125 * _1171;
    float _1175 = _1167;
    if (!_1117)
    {
        float _1177 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1179 = _1177 * 0.15915493667125701904296875;
        float _1181 = _1179 * 6.283185482025146484375;
        float _1183 = cos(_1181);
        float _1185 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1187 = _1185 * 0.15915493667125701904296875;
        float _1189 = _1179 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = 1.0 / _1183;
        float _1195 = _1187 * 6.283185482025146484375;
        float _1197 = cos(_1195);
        float _1199 = _1191 * _1193;
        float _1201 = _1187 * 6.283185482025146484375;
        float _1203 = sin(_1201);
        float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1207 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1205;
        float _1209 = _1197 * _1199;
        float _1211 = 1.0 / _1207;
        float _1213 = 1.0 / _1209;
        float _1215 = _1203 * _1213;
        float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1219 = fma(_1173, _1215, _1217);
        float _1221 = _1219 * _1211;
        float _1223 = precise::clamp(_1221, 0.0, 1.0);
        _1165 = _1223;
    }
    float _1225 = _1165;
    if (!_1117)
    {
        float _1227 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1229 = _1227 * 0.15915493667125701904296875;
        float _1231 = _1229 * 6.283185482025146484375;
        float _1233 = cos(_1231);
        float _1235 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1237 = _1235 * 0.15915493667125701904296875;
        float _1239 = _1229 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = 1.0 / _1233;
        float _1245 = _1237 * 6.283185482025146484375;
        float _1247 = cos(_1245);
        float _1249 = _1241 * _1243;
        float _1251 = _1237 * 6.283185482025146484375;
        float _1253 = sin(_1251);
        float _1255 = _1247 * _1249;
        float _1257 = 1.0 / _1255;
        float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1261 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1259;
        float _1263 = 1.0 / _1261;
        float _1265 = _1253 * _1257;
        float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1269 = fma(_1173, _1265, _1267);
        float _1271 = _1269 * _1263;
        float _1273 = precise::clamp(_1271, 0.0, 1.0);
        float _1275 = -_1273;
        float _1277 = _1275 + 1.0;
        _1175 = _1277;
    }
    float _1279 = _1175;
    float _1281 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1283 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1153);
    float _1285 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1155);
    bool _1287 = _1225 > 0.0;
    bool _1289 = isnan(_1225);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan(0.0);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1149);
    float _1299 = _1225 * _1279;
    float _1301 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1283);
    float _1303 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1285);
    bool _1305 = _1279 <= 0.0;
    bool _1307 = !_1295;
    bool _1309 = _1305 || _1307;
    float _1311 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1151);
    float _1313 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1297);
    float _1315 = _1301 + _1303;
    float _1317 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1319 = fma(_1281, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1311);
    float _1321 = _1315 * 0.5;
    float _1323 = _1317 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1091;
    out.m_58.y = _1089;
    out.m_58.z = _1093;
    out.gl_Position.x = _1313;
    out.gl_Position.y = _1319;
    out.gl_Position.z = _1301;
    out.gl_Position.w = _1303;
    out.m_60.z = _1321;
    out.m_60.w = _1303;
    out.m_35.x = _1323;
    if (!_1309)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1325 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1325;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

