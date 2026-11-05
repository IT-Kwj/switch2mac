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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
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
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1115 = false;
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
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_83)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_93);
        out.gl_Position.z = _1493;
    }
    if (!_83)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _97 = in.m_37.w;
    float _99 = in.m_39.z;
    bool _101 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_97;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _99;
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
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
        _95 = as_type<int>(_131);
    }
    int _133 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_133);
        out.gl_Position.z = _1566;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    bool _159 = !_153;
    int _161 = _159 ? (-1090519040) : 1056964608;
    float _163 = _155 * 0.15915493667125701904296875;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    bool _173 = !_149;
    int _175 = _173 ? (-1090519040) : 1056964608;
    float _177 = _163 * 6.283185482025146484375;
    float _179 = cos(_177);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_175);
    out.m_46.y = as_type<float>(_161);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = fma(_179, 0.5, 0.5);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _207 * _219;
    int _223 = abs(_213);
    float _225 = -_209;
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
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
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
        float _267 = _113 * _265;
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
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
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
        float _459 = _113 * _457;
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
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = in.m_50.x;
    float _485 = in.m_50.y;
    float _487 = in.m_50.z;
    float _489 = 1.0 / _481;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _477;
    float _499 = _465 * _471;
    float _501 = _465 * _485;
    float _503 = fma(_463, _469, _499);
    float _505 = _465 * _493;
    float _507 = fma(_463, _483, _501);
    float _509 = fma(_467, _473, _503);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _461 + _511;
    float _515 = fma(_463, _491, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _461 + _517;
    float _521 = fma(_467, _487, _507);
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _519 * _497;
    bool _539 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _541 = isnan(_461);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_467, _495, _515);
    bool _553 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _555 = isnan(_461);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _521 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _523 + _567;
    float _571 = _513 * _489;
    float _573 = _551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _565 + _575;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = -_563;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _573 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _591 = _549 * _583;
    float _593 = -_549;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _605;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _611 = _535 * _595;
    float _613 = fma(_599, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _615 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = fma(_607, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _619 = _609 >= 0.0;
    float _621 = _613 * _611;
    float _623 = _615 * _611;
    float _625 = _617 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _635 = -_535;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = fma(_629, _571, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _645 = fma(_633, _571, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].x, _621);
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].y, _623);
    float _651 = fma(_641, _571, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].z, _625);
    float _655 = fma(_643, _591, _647);
    float _657 = fma(_645, _591, _649);
    float _659 = _647;
    int _661 = as_type<int>(_651);
    if (_619)
    {
        _659 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _663 = _659;
    float _665 = fma(_651, _591, _653);
    float _667 = _569 * _569;
    float _669 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].y, _657);
    float _671 = _669;
    if (_619)
    {
        float _673 = _663 * 5.0;
        _661 = as_type<int>(_673);
    }
    int _675 = _661;
    float _677 = fma(_577, _577, _667);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].x, _655);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    float _683 = fma(_587, _587, _677);
    if (_619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_675);
        out.gl_Position.z = _2445;
    }
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = rsqrt(_683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _705 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_619)
    {
        out.m_35.x = 0.0;
    }
    float _715 = _569 * _687;
    float _717 = _577 * _687;
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    if (_619)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _719 = -_715;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _723 = _587 * _687;
    float _725 = -_717;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _721 + _729;
    float _733 = -_723;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _739 = _727 + _737;
    float _741 = _731 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _735 + _743;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[28].x, _741);
    float _749 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _747);
    bool _751 = _749 >= 0.0;
    if (_751)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _753 = _671;
    int _755 = as_type<int>(_753);
    if (_751)
    {
        out.m_35.x = 0.0;
    }
    if (_751)
    {
        float _757 = _753 * 5.0;
        _755 = as_type<int>(_757);
    }
    int _759 = _755;
    if (_751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2628 = as_type<float>(_759);
        out.gl_Position.z = _2628;
    }
    if (_751)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _761 = -_523;
    float _763 = _761 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = -_565;
    float _767 = _765 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _769 = -_573;
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = -_715;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _777 = _763 * _763;
    float _779 = -_717;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _783 = -_723;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _787 = _775 * _775;
    float _789 = fma(_767, _767, _777);
    float _791 = fma(_781, _781, _787);
    float _793 = fma(_771, _771, _789);
    float _795 = fma(_785, _785, _791);
    float _797 = rsqrt(_793);
    float _799 = sqrt(_795);
    float _801 = _767 * _797;
    float _803 = _763 * _797;
    float _805 = _771 * _797;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _809 = _801 * _807;
    float _811 = in.m_58.x;
    float _813 = in.m_58.y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _817 = _805 * _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _821 = -_809;
    float _823 = fma(_805, _819, _821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _827 = _803 * _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _831 = -_817;
    float _833 = fma(_803, _829, _831);
    float _835 = _687 * _799;
    float _837 = _823 * _823;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _841 = -_827;
    float _843 = fma(_801, _839, _841);
    float _845 = fma(_833, _833, _837);
    float _847 = fma(_843, _843, _845);
    float _849 = rsqrt(_847);
    float _851 = _433 * _813;
    float _853 = _431 * _811;
    float _855 = _241 * _851;
    float _857 = _241 * _853;
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823 * _849;
    float _867 = _833 * _849;
    float _869 = _835 * _863;
    float _871 = _843 * _849;
    float _873 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = _805 * _865;
    float _877 = _803 * _867;
    float _879 = _861 * _869;
    float _881 = _835 * _873;
    float _883 = -_875;
    float _885 = fma(_803, _871, _883);
    float _887 = -_877;
    float _889 = fma(_801, _865, _887);
    float _891 = _859 * _881;
    float _893 = _879 * _885;
    float _895 = _879 * _889;
    float _897 = _835 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _897 * 0.5;
    float _901 = fma(_891, _867, _893);
    float _903 = fma(_891, _871, _895);
    float _905 = _801 * _871;
    float _907 = fma(_899, _801, _901);
    float _909 = fma(_899, _805, _903);
    float _911 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _913 = precise::clamp(_911, 0.0, 1.0);
    float _915 = -_905;
    float _917 = fma(_805, _867, _915);
    float _919 = _565 + _907;
    float _921 = _573 + _909;
    float _923 = fma(_913, -0.64999997615814208984375, 1.0);
    float _925 = _879 * _917;
    float _927 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _929 = _919 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _933 = _921 + _931;
    float _935 = fma(_891, _865, _925);
    float _937 = fma(_929, _923, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _939 = fma(_933, _923, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _941 = fma(_899, _803, _935);
    float _943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _949 = _939 + _947;
    float _951 = _523 + _941;
    float _953 = _945 * _945;
    float _955 = _949 * _949;
    float _957 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _959 = _951 + _957;
    float _961 = _953 + _955;
    float _963 = fma(_959, _923, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _965 = sqrt(_961);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _801;
    float _971 = _867;
    float _973 = _899;
    float _975 = _865;
    float _977 = _959;
    if (!_967)
    {
        _969 = _955;
    }
    float _979 = _969;
    float _981 = _979;
    if (!_967)
    {
        _971 = _953;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_967)
    {
        _973 = _937;
    }
    float _987 = _973;
    float _989 = _987;
    if (!_967)
    {
        _975 = _939;
    }
    float _991 = _975;
    float _993 = _991;
    if (!_967)
    {
        _977 = _963;
    }
    float _995 = _977;
    bool _997 = !_967;
    float _999 = _995;
    if (!_997)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1005 = _965 + _1003;
        float _1007 = rsqrt(_961);
        float _1009 = _1005 * _1001;
        float _1011 = _963 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = _1009 * 0.15915493667125701904296875;
        float _1015 = _1013 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        float _1023 = fma(_1017, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1025 = _1007 * _1023;
        float _1027 = _1021 + (-1.0);
        float _1029 = fma(_945, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_949, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1033 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1037 = _1029 + _1035;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1041 = _1031 + _1039;
        float _1043 = fma(_963, _1021, _1033);
        float _1045 = _1037 * _1037;
        float _1047 = _1041 * _1041;
        _999 = _1043;
        _985 = _1045;
        _981 = _1047;
        _989 = _1029;
        _993 = _1031;
    }
    float _1049 = _999;
    float _1051 = _985;
    float _1053 = _981;
    float _1055 = _989;
    float _1057 = _993;
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1061 = _1049 + _1059;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    float _1063 = fma(_1061, _1061, _1051);
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    float _1065 = _1063 + _1053;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1071 = isnan(_1067);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1077 = _1073 || _1075;
    float _1079 = _1051;
    if (!_1077)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    bool _1083 = !_1077;
    float _1085 = _1081;
    if (!_1083)
    {
        bool _1087 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1089 = isnan(_1067);
        bool _1091 = _1087 || _1089;
        bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1095 = _1091 || _1093;
        if (!_1095)
        {
            float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1099 = _1067 + _1097;
            float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1103 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1101;
            float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1109 = 1.0 / _1103;
            float _1111 = _1099 * _1109;
            float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1085 = _1113;
            _1115 = true;
        }
        else
        {
            bool _1117 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1119 = isnan(_1067);
            bool _1121 = _1117 || _1119;
            bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1125 = _1121 || _1123;
            if (!_1125)
            {
                float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1129 = _1067 + _1127;
                float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1139 = 1.0 / _1133;
                float _1141 = _1129 * _1139;
                float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1085 = _1143;
                _1115 = true;
            }
            else
            {
                _1085 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1115 = false;
    float _1145 = _1085;
    float _1147 = _721 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _721 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1153 = _1055 + _1151;
    float _1155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    bool _1157 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1171 = _1049 + _1169;
    float _1173 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1155);
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1057 + _1175;
    float _1179 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1185 = fma(_1171, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1177, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = 1.0 / _1181;
    float _1191 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1193 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = -_717;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1207 = -_715;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1211 = -_723;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1215 = _1191 + _1181;
    float _1217 = _1209;
    float _1219 = _1205;
    float _1221 = _1213;
    if (!_1165)
    {
        float _1223 = _731 * _731;
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1227 = -_573;
        float _1229 = _1227 + _1187;
        float _1231 = fma(_739, _739, _1223);
        float _1233 = fma(_745, _745, _1231);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = sqrt(_1233);
        float _1239 = 1.0 / _835;
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1245 = _1243 * _1225;
        float _1247 = -_565;
        float _1249 = _1247 + _1183;
        float _1251 = _1245 * _1239;
        float _1253 = -_523;
        float _1255 = _1253 + _1185;
        float _1257 = _1241 * _1251;
        float _1259 = _1229 * _1251;
        float _1261 = fma(_1249, _1257, _727);
        float _1263 = fma(_1255, _1257, _721);
        float _1265 = fma(_1241, _1259, _735);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = _1215 * _1189;
    float _1275 = _1273 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1277);
    float _1287 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1291 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1283);
    float _1293 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1295 = _1285;
    if (_1201)
    {
        _1295 = 1.0;
    }
    float _1297 = _1295;
    float _1299 = _1297;
    if (!_1201)
    {
        float _1301 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1305 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
        float _1307 = _1301 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = _1307 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = 1.0 / _1311;
        float _1323 = _1315 * 6.283185482025146484375;
        float _1325 = cos(_1323);
        float _1327 = _1319 * _1321;
        float _1329 = 1.0 / _1305;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1331;
        float _1335 = _1325 * _1327;
        float _1337 = _1315 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1335;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1345 = _1329 * _1343;
        float _1347 = 1.0 / _1333;
        float _1349 = _1339 * _1341;
        float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1353 = fma(_1349, _1345, _1351);
        float _1355 = _1353 * _1347;
        float _1357 = precise::clamp(_1355, 0.0, 1.0);
        float _1359 = -_1357;
        float _1361 = _1359 + 1.0;
        _1299 = _1361;
    }
    float _1363 = _1299;
    float _1365 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1287);
    float _1367 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1371 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1291);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1393 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    bool _1403 = _1363 > 0.0;
    bool _1405 = isnan(_1363);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1395);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1415 + _1419;
    float _1427 = _1421 + _1419;
    float _1429 = _1419 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1427 * 0.5;
    float _1435 = fma(_1417, -0.5, _1429);
    out.m_35.x = _1423;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1421;
    out.gl_Position.w = _1419;
    out.m_60.x = _1431;
    out.m_60.y = _1435;
    out.m_60.z = _1433;
    out.m_60.w = _1419;
    if (_1411)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1437;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1115 = false;
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
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_83)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_93);
        out.gl_Position.z = _1493;
    }
    if (!_83)
    {
        return out;
    }
    float _97 = in.m_37.w;
    float _99 = in.m_39.z;
    bool _101 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_97;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _99;
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
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
        _95 = as_type<int>(_131);
    }
    int _133 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_133);
        out.gl_Position.z = _1566;
    }
    if (_125)
    {
        return out;
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    bool _159 = !_153;
    int _161 = _159 ? (-1090519040) : 1056964608;
    float _163 = _155 * 0.15915493667125701904296875;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    bool _173 = !_149;
    int _175 = _173 ? (-1090519040) : 1056964608;
    float _177 = _163 * 6.283185482025146484375;
    float _179 = cos(_177);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_175);
    out.m_46.y = as_type<float>(_161);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = fma(_179, 0.5, 0.5);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _207 * _219;
    int _223 = abs(_213);
    float _225 = -_209;
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
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
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
        float _267 = _113 * _265;
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
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
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
        float _459 = _113 * _457;
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
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = in.m_50.x;
    float _485 = in.m_50.y;
    float _487 = in.m_50.z;
    float _489 = 1.0 / _481;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _477;
    float _499 = _465 * _471;
    float _501 = _465 * _485;
    float _503 = fma(_463, _469, _499);
    float _505 = _465 * _493;
    float _507 = fma(_463, _483, _501);
    float _509 = fma(_467, _473, _503);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _461 + _511;
    float _515 = fma(_463, _491, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _461 + _517;
    float _521 = fma(_467, _487, _507);
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _519 * _497;
    bool _539 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _541 = isnan(_461);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_467, _495, _515);
    bool _553 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _555 = isnan(_461);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _521 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _523 + _567;
    float _571 = _513 * _489;
    float _573 = _551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _565 + _575;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = -_563;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _573 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _591 = _549 * _583;
    float _593 = -_549;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _605;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _611 = _535 * _595;
    float _613 = fma(_599, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _615 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = fma(_607, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _619 = _609 >= 0.0;
    float _621 = _613 * _611;
    float _623 = _615 * _611;
    float _625 = _617 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _635 = -_535;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = fma(_629, _571, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _645 = fma(_633, _571, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].x, _621);
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].y, _623);
    float _651 = fma(_641, _571, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].z, _625);
    float _655 = fma(_643, _591, _647);
    float _657 = fma(_645, _591, _649);
    float _659 = _647;
    int _661 = as_type<int>(_651);
    if (_619)
    {
        _659 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _663 = _659;
    float _665 = fma(_651, _591, _653);
    float _667 = _569 * _569;
    float _669 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].y, _657);
    float _671 = _669;
    if (_619)
    {
        float _673 = _663 * 5.0;
        _661 = as_type<int>(_673);
    }
    int _675 = _661;
    float _677 = fma(_577, _577, _667);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].x, _655);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    float _683 = fma(_587, _587, _677);
    if (_619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_675);
        out.gl_Position.z = _2445;
    }
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = rsqrt(_683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _705 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_619)
    {
        out.m_35.x = 0.0;
    }
    float _715 = _569 * _687;
    float _717 = _577 * _687;
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    if (_619)
    {
        return out;
    }
    float _719 = -_715;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _723 = _587 * _687;
    float _725 = -_717;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _721 + _729;
    float _733 = -_723;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _739 = _727 + _737;
    float _741 = _731 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _735 + _743;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[28].x, _741);
    float _749 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _747);
    bool _751 = _749 >= 0.0;
    if (_751)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _753 = _671;
    int _755 = as_type<int>(_753);
    if (_751)
    {
        out.m_35.x = 0.0;
    }
    if (_751)
    {
        float _757 = _753 * 5.0;
        _755 = as_type<int>(_757);
    }
    int _759 = _755;
    if (_751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2628 = as_type<float>(_759);
        out.gl_Position.z = _2628;
    }
    if (_751)
    {
        return out;
    }
    float _761 = -_523;
    float _763 = _761 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = -_565;
    float _767 = _765 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _769 = -_573;
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = -_715;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _777 = _763 * _763;
    float _779 = -_717;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _783 = -_723;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _787 = _775 * _775;
    float _789 = fma(_767, _767, _777);
    float _791 = fma(_781, _781, _787);
    float _793 = fma(_771, _771, _789);
    float _795 = fma(_785, _785, _791);
    float _797 = rsqrt(_793);
    float _799 = sqrt(_795);
    float _801 = _767 * _797;
    float _803 = _763 * _797;
    float _805 = _771 * _797;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _809 = _801 * _807;
    float _811 = in.m_58.x;
    float _813 = in.m_58.y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _817 = _805 * _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _821 = -_809;
    float _823 = fma(_805, _819, _821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _827 = _803 * _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _831 = -_817;
    float _833 = fma(_803, _829, _831);
    float _835 = _687 * _799;
    float _837 = _823 * _823;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _841 = -_827;
    float _843 = fma(_801, _839, _841);
    float _845 = fma(_833, _833, _837);
    float _847 = fma(_843, _843, _845);
    float _849 = rsqrt(_847);
    float _851 = _433 * _813;
    float _853 = _431 * _811;
    float _855 = _241 * _851;
    float _857 = _241 * _853;
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823 * _849;
    float _867 = _833 * _849;
    float _869 = _835 * _863;
    float _871 = _843 * _849;
    float _873 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = _805 * _865;
    float _877 = _803 * _867;
    float _879 = _861 * _869;
    float _881 = _835 * _873;
    float _883 = -_875;
    float _885 = fma(_803, _871, _883);
    float _887 = -_877;
    float _889 = fma(_801, _865, _887);
    float _891 = _859 * _881;
    float _893 = _879 * _885;
    float _895 = _879 * _889;
    float _897 = _835 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _897 * 0.5;
    float _901 = fma(_891, _867, _893);
    float _903 = fma(_891, _871, _895);
    float _905 = _801 * _871;
    float _907 = fma(_899, _801, _901);
    float _909 = fma(_899, _805, _903);
    float _911 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _913 = precise::clamp(_911, 0.0, 1.0);
    float _915 = -_905;
    float _917 = fma(_805, _867, _915);
    float _919 = _565 + _907;
    float _921 = _573 + _909;
    float _923 = fma(_913, -0.64999997615814208984375, 1.0);
    float _925 = _879 * _917;
    float _927 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _929 = _919 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _933 = _921 + _931;
    float _935 = fma(_891, _865, _925);
    float _937 = fma(_929, _923, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _939 = fma(_933, _923, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _941 = fma(_899, _803, _935);
    float _943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _949 = _939 + _947;
    float _951 = _523 + _941;
    float _953 = _945 * _945;
    float _955 = _949 * _949;
    float _957 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _959 = _951 + _957;
    float _961 = _953 + _955;
    float _963 = fma(_959, _923, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _965 = sqrt(_961);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _801;
    float _971 = _867;
    float _973 = _899;
    float _975 = _865;
    float _977 = _959;
    if (!_967)
    {
        _969 = _955;
    }
    float _979 = _969;
    float _981 = _979;
    if (!_967)
    {
        _971 = _953;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_967)
    {
        _973 = _937;
    }
    float _987 = _973;
    float _989 = _987;
    if (!_967)
    {
        _975 = _939;
    }
    float _991 = _975;
    float _993 = _991;
    if (!_967)
    {
        _977 = _963;
    }
    float _995 = _977;
    bool _997 = !_967;
    float _999 = _995;
    if (!_997)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1005 = _965 + _1003;
        float _1007 = rsqrt(_961);
        float _1009 = _1005 * _1001;
        float _1011 = _963 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = _1009 * 0.15915493667125701904296875;
        float _1015 = _1013 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        float _1023 = fma(_1017, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1025 = _1007 * _1023;
        float _1027 = _1021 + (-1.0);
        float _1029 = fma(_945, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_949, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1033 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1037 = _1029 + _1035;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1041 = _1031 + _1039;
        float _1043 = fma(_963, _1021, _1033);
        float _1045 = _1037 * _1037;
        float _1047 = _1041 * _1041;
        _999 = _1043;
        _985 = _1045;
        _981 = _1047;
        _989 = _1029;
        _993 = _1031;
    }
    float _1049 = _999;
    float _1051 = _985;
    float _1053 = _981;
    float _1055 = _989;
    float _1057 = _993;
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1061 = _1049 + _1059;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    float _1063 = fma(_1061, _1061, _1051);
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    float _1065 = _1063 + _1053;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1071 = isnan(_1067);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1077 = _1073 || _1075;
    float _1079 = _1051;
    if (!_1077)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    bool _1083 = !_1077;
    float _1085 = _1081;
    if (!_1083)
    {
        bool _1087 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1089 = isnan(_1067);
        bool _1091 = _1087 || _1089;
        bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1095 = _1091 || _1093;
        if (!_1095)
        {
            float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1099 = _1067 + _1097;
            float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1103 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1101;
            float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1109 = 1.0 / _1103;
            float _1111 = _1099 * _1109;
            float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1085 = _1113;
            _1115 = true;
        }
        else
        {
            bool _1117 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1119 = isnan(_1067);
            bool _1121 = _1117 || _1119;
            bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1125 = _1121 || _1123;
            if (!_1125)
            {
                float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1129 = _1067 + _1127;
                float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1139 = 1.0 / _1133;
                float _1141 = _1129 * _1139;
                float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1085 = _1143;
                _1115 = true;
            }
            else
            {
                _1085 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1115 = false;
    float _1145 = _1085;
    float _1147 = _721 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _721 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1153 = _1055 + _1151;
    float _1155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    bool _1157 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1171 = _1049 + _1169;
    float _1173 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1155);
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1057 + _1175;
    float _1179 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1185 = fma(_1171, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1177, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = 1.0 / _1181;
    float _1191 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1193 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = -_717;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1207 = -_715;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1211 = -_723;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1215 = _1191 + _1181;
    float _1217 = _1209;
    float _1219 = _1205;
    float _1221 = _1213;
    if (!_1165)
    {
        float _1223 = _731 * _731;
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1227 = -_573;
        float _1229 = _1227 + _1187;
        float _1231 = fma(_739, _739, _1223);
        float _1233 = fma(_745, _745, _1231);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = sqrt(_1233);
        float _1239 = 1.0 / _835;
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1245 = _1243 * _1225;
        float _1247 = -_565;
        float _1249 = _1247 + _1183;
        float _1251 = _1245 * _1239;
        float _1253 = -_523;
        float _1255 = _1253 + _1185;
        float _1257 = _1241 * _1251;
        float _1259 = _1229 * _1251;
        float _1261 = fma(_1249, _1257, _727);
        float _1263 = fma(_1255, _1257, _721);
        float _1265 = fma(_1241, _1259, _735);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = _1215 * _1189;
    float _1275 = _1273 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1277);
    float _1287 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1291 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1283);
    float _1293 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1295 = _1285;
    if (_1201)
    {
        _1295 = 1.0;
    }
    float _1297 = _1295;
    float _1299 = _1297;
    if (!_1201)
    {
        float _1301 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1305 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
        float _1307 = _1301 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = _1307 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = 1.0 / _1311;
        float _1323 = _1315 * 6.283185482025146484375;
        float _1325 = cos(_1323);
        float _1327 = _1319 * _1321;
        float _1329 = 1.0 / _1305;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1331;
        float _1335 = _1325 * _1327;
        float _1337 = _1315 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1335;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1345 = _1329 * _1343;
        float _1347 = 1.0 / _1333;
        float _1349 = _1339 * _1341;
        float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1353 = fma(_1349, _1345, _1351);
        float _1355 = _1353 * _1347;
        float _1357 = precise::clamp(_1355, 0.0, 1.0);
        float _1359 = -_1357;
        float _1361 = _1359 + 1.0;
        _1299 = _1361;
    }
    float _1363 = _1299;
    float _1365 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1287);
    float _1367 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1371 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1291);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1393 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    bool _1403 = _1363 > 0.0;
    bool _1405 = isnan(_1363);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1395);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1415 + _1419;
    float _1427 = _1421 + _1419;
    float _1429 = _1419 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1427 * 0.5;
    float _1435 = fma(_1417, -0.5, _1429);
    out.m_35.x = _1423;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1421;
    out.gl_Position.w = _1419;
    out.m_60.x = _1431;
    out.m_60.y = _1435;
    out.m_60.z = _1433;
    out.m_60.w = _1419;
    if (_1411)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1437;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1115 = false;
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
    if (!_83)
    {
        out.m_35.x = 0.0;
    }
    int _89 = 0;
    if (!_83)
    {
        float _91 = _87 * 5.0;
        _89 = as_type<int>(_91);
    }
    int _93 = _89;
    int _95 = _93;
    if (!_83)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1493 = as_type<float>(_93);
        out.gl_Position.z = _1493;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _97 = in.m_37.w;
    float _99 = in.m_39.z;
    bool _101 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _109 = _105 || _107;
    float _111 = -_97;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_41.z = _99;
    float _115 = 0.0;
    if (_109)
    {
        float _117 = float(_79);
        _115 = _117;
    }
    float _119 = _115;
    bool _121 = _113 >= _119;
    bool _123 = !_109;
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
        _95 = as_type<int>(_131);
    }
    int _133 = _95;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1566 = as_type<float>(_133);
        out.gl_Position.z = _1566;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_39.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = as_type<float>(int(gl_VertexIndex));
    float _143 = _139 * _137;
    float _145 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _143);
    int _147 = as_type<int>(_141) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_141) & 2;
    bool _153 = _151 != 0;
    float _155 = _145 * 6.283185482025146484375;
    float _157 = floor(_145);
    bool _159 = !_153;
    int _161 = _159 ? (-1090519040) : 1056964608;
    float _163 = _155 * 0.15915493667125701904296875;
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    bool _173 = !_149;
    int _175 = _173 ? (-1090519040) : 1056964608;
    float _177 = _163 * 6.283185482025146484375;
    float _179 = cos(_177);
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_167;
    int _187 = _185 ? 0 : 1;
    out.m_46.x = as_type<float>(_175);
    out.m_46.y = as_type<float>(_161);
    bool _189 = !_183;
    int _191 = _189 ? 0 : 1;
    float _193 = -_157;
    float _195 = _145 + _193;
    int _197 = abs(_187);
    int _199 = abs(_191);
    float _201 = -_195;
    float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = fma(_179, 0.5, 0.5);
    bool _211 = !_171;
    int _213 = _211 ? 0 : 1;
    bool _215 = _195 < 0.5;
    float _217 = float(_215);
    float _219 = abs(_203);
    float _221 = _207 * _219;
    int _223 = abs(_213);
    float _225 = -_209;
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
        float _249 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
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
        float _267 = _113 * _265;
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
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
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
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
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
        float _459 = _113 * _457;
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
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = in.m_50.x;
    float _485 = in.m_50.y;
    float _487 = in.m_50.z;
    float _489 = 1.0 / _481;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = in.m_52.z;
    float _497 = 1.0 / _477;
    float _499 = _465 * _471;
    float _501 = _465 * _485;
    float _503 = fma(_463, _469, _499);
    float _505 = _465 * _493;
    float _507 = fma(_463, _483, _501);
    float _509 = fma(_467, _473, _503);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _461 + _511;
    float _515 = fma(_463, _491, _505);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _519 = _461 + _517;
    float _521 = fma(_467, _487, _507);
    float _523 = _509 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _525 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _527 = isnan(_461);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = _519 * _497;
    bool _539 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _541 = isnan(_461);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = fma(_467, _495, _515);
    bool _553 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _555 = isnan(_461);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _521 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _569 = _523 + _567;
    float _571 = _513 * _489;
    float _573 = _551 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _575 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _577 = _565 + _575;
    float _579 = _569 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _581 = -_563;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _587 = _573 + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c8)._m0[28].x, _579);
    float _591 = _549 * _583;
    float _593 = -_549;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _597;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _605;
    float _609 = fma(_587, (*spvDescriptorSet0.vp_c8)._m0[28].z, _589);
    float _611 = _535 * _595;
    float _613 = fma(_599, _537, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _615 = fma(_603, _537, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = fma(_607, _537, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _619 = _609 >= 0.0;
    float _621 = _613 * _611;
    float _623 = _615 * _611;
    float _625 = _617 * _611;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _635 = -_535;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _643 = fma(_629, _571, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _645 = fma(_633, _571, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _647 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].x, _621);
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].y, _623);
    float _651 = fma(_641, _571, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _653 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[107].z, _625);
    float _655 = fma(_643, _591, _647);
    float _657 = fma(_645, _591, _649);
    float _659 = _647;
    int _661 = as_type<int>(_651);
    if (_619)
    {
        _659 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _663 = _659;
    float _665 = fma(_651, _591, _653);
    float _667 = _569 * _569;
    float _669 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].y, _657);
    float _671 = _669;
    if (_619)
    {
        float _673 = _663 * 5.0;
        _661 = as_type<int>(_673);
    }
    int _675 = _661;
    float _677 = fma(_577, _577, _667);
    float _679 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].x, _655);
    float _681 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[109].z, _665);
    float _683 = fma(_587, _587, _677);
    if (_619)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_675);
        out.gl_Position.z = _2445;
    }
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = rsqrt(_683);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _699 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _703 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _705 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_619)
    {
        out.m_35.x = 0.0;
    }
    float _715 = _569 * _687;
    float _717 = _577 * _687;
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    if (_619)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _719 = -_715;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _723 = _587 * _687;
    float _725 = -_717;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _565);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _731 = _721 + _729;
    float _733 = -_723;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _573);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _739 = _727 + _737;
    float _741 = _731 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _735 + _743;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[28].x, _741);
    float _749 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _747);
    bool _751 = _749 >= 0.0;
    if (_751)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _753 = _671;
    int _755 = as_type<int>(_753);
    if (_751)
    {
        out.m_35.x = 0.0;
    }
    if (_751)
    {
        float _757 = _753 * 5.0;
        _755 = as_type<int>(_757);
    }
    int _759 = _755;
    if (_751)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2628 = as_type<float>(_759);
        out.gl_Position.z = _2628;
    }
    if (_751)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _761 = -_523;
    float _763 = _761 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _765 = -_565;
    float _767 = _765 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _769 = -_573;
    float _771 = _769 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _773 = -_715;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _777 = _763 * _763;
    float _779 = -_717;
    float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _577);
    float _783 = -_723;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _587);
    float _787 = _775 * _775;
    float _789 = fma(_767, _767, _777);
    float _791 = fma(_781, _781, _787);
    float _793 = fma(_771, _771, _789);
    float _795 = fma(_785, _785, _791);
    float _797 = rsqrt(_793);
    float _799 = sqrt(_795);
    float _801 = _767 * _797;
    float _803 = _763 * _797;
    float _805 = _771 * _797;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _809 = _801 * _807;
    float _811 = in.m_58.x;
    float _813 = in.m_58.y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _817 = _805 * _815;
    float _819 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _821 = -_809;
    float _823 = fma(_805, _819, _821);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _827 = _803 * _825;
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _831 = -_817;
    float _833 = fma(_803, _829, _831);
    float _835 = _687 * _799;
    float _837 = _823 * _823;
    float _839 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _841 = -_827;
    float _843 = fma(_801, _839, _841);
    float _845 = fma(_833, _833, _837);
    float _847 = fma(_843, _843, _845);
    float _849 = rsqrt(_847);
    float _851 = _433 * _813;
    float _853 = _431 * _811;
    float _855 = _241 * _851;
    float _857 = _241 * _853;
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _861 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _863 = _855 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _865 = _823 * _849;
    float _867 = _833 * _849;
    float _869 = _835 * _863;
    float _871 = _843 * _849;
    float _873 = _857 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _875 = _805 * _865;
    float _877 = _803 * _867;
    float _879 = _861 * _869;
    float _881 = _835 * _873;
    float _883 = -_875;
    float _885 = fma(_803, _871, _883);
    float _887 = -_877;
    float _889 = fma(_801, _865, _887);
    float _891 = _859 * _881;
    float _893 = _879 * _885;
    float _895 = _879 * _889;
    float _897 = _835 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _899 = _897 * 0.5;
    float _901 = fma(_891, _867, _893);
    float _903 = fma(_891, _871, _895);
    float _905 = _801 * _871;
    float _907 = fma(_899, _801, _901);
    float _909 = fma(_899, _805, _903);
    float _911 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _913 = precise::clamp(_911, 0.0, 1.0);
    float _915 = -_905;
    float _917 = fma(_805, _867, _915);
    float _919 = _565 + _907;
    float _921 = _573 + _909;
    float _923 = fma(_913, -0.64999997615814208984375, 1.0);
    float _925 = _879 * _917;
    float _927 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _929 = _919 + _927;
    float _931 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _933 = _921 + _931;
    float _935 = fma(_891, _865, _925);
    float _937 = fma(_929, _923, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _939 = fma(_933, _923, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _941 = fma(_899, _803, _935);
    float _943 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _945 = _937 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _949 = _939 + _947;
    float _951 = _523 + _941;
    float _953 = _945 * _945;
    float _955 = _949 * _949;
    float _957 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _959 = _951 + _957;
    float _961 = _953 + _955;
    float _963 = fma(_959, _923, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _965 = sqrt(_961);
    bool _967 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _969 = _801;
    float _971 = _867;
    float _973 = _899;
    float _975 = _865;
    float _977 = _959;
    if (!_967)
    {
        _969 = _955;
    }
    float _979 = _969;
    float _981 = _979;
    if (!_967)
    {
        _971 = _953;
    }
    float _983 = _971;
    float _985 = _983;
    if (!_967)
    {
        _973 = _937;
    }
    float _987 = _973;
    float _989 = _987;
    if (!_967)
    {
        _975 = _939;
    }
    float _991 = _975;
    float _993 = _991;
    if (!_967)
    {
        _977 = _963;
    }
    float _995 = _977;
    bool _997 = !_967;
    float _999 = _995;
    if (!_997)
    {
        float _1001 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1005 = _965 + _1003;
        float _1007 = rsqrt(_961);
        float _1009 = _1005 * _1001;
        float _1011 = _963 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = _1009 * 0.15915493667125701904296875;
        float _1015 = _1013 * 6.283185482025146484375;
        float _1017 = sin(_1015);
        float _1019 = _1013 * 6.283185482025146484375;
        float _1021 = cos(_1019);
        float _1023 = fma(_1017, _1011, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1025 = _1007 * _1023;
        float _1027 = _1021 + (-1.0);
        float _1029 = fma(_945, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1031 = fma(_949, _1025, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1033 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1037 = _1029 + _1035;
        float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1041 = _1031 + _1039;
        float _1043 = fma(_963, _1021, _1033);
        float _1045 = _1037 * _1037;
        float _1047 = _1041 * _1041;
        _999 = _1043;
        _985 = _1045;
        _981 = _1047;
        _989 = _1029;
        _993 = _1031;
    }
    float _1049 = _999;
    float _1051 = _985;
    float _1053 = _981;
    float _1055 = _989;
    float _1057 = _993;
    float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1061 = _1049 + _1059;
    out.m_56.x = _709;
    out.m_56.y = _711;
    out.m_56.z = _713;
    out.m_56.w = _695;
    float _1063 = fma(_1061, _1061, _1051);
    out.m_54.x = _699;
    out.m_54.y = _693;
    out.m_54.z = _707;
    out.m_54.w = _697;
    float _1065 = _1063 + _1053;
    float _1067 = sqrt(_1065);
    bool _1069 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1071 = isnan(_1067);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1077 = _1073 || _1075;
    float _1079 = _1051;
    if (!_1077)
    {
        _1079 = 1.0;
    }
    float _1081 = _1079;
    bool _1083 = !_1077;
    float _1085 = _1081;
    if (!_1083)
    {
        bool _1087 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1089 = isnan(_1067);
        bool _1091 = _1087 || _1089;
        bool _1093 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1095 = _1091 || _1093;
        if (!_1095)
        {
            float _1097 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1099 = _1067 + _1097;
            float _1101 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1103 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1101;
            float _1105 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1107 = _1105 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1109 = 1.0 / _1103;
            float _1111 = _1099 * _1109;
            float _1113 = fma(_1111, _1107, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1085 = _1113;
            _1115 = true;
        }
        else
        {
            bool _1117 = _1067 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1119 = isnan(_1067);
            bool _1121 = _1117 || _1119;
            bool _1123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1125 = _1121 || _1123;
            if (!_1125)
            {
                float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1129 = _1067 + _1127;
                float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1135 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1137 = _1135 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1139 = 1.0 / _1133;
                float _1141 = _1129 * _1139;
                float _1143 = fma(_1141, _1137, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1085 = _1143;
                _1115 = true;
            }
            else
            {
                _1085 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1115 = false;
    float _1145 = _1085;
    float _1147 = _721 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1149 = _721 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1151 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1153 = _1055 + _1151;
    float _1155 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1147);
    bool _1157 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan(0.5);
    bool _1165 = _1161 || _1163;
    float _1167 = fma(_727, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1149);
    float _1169 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1171 = _1049 + _1169;
    float _1173 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1155);
    float _1175 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1177 = _1057 + _1175;
    float _1179 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1167);
    float _1181 = _1173 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1183 = fma(_1153, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1185 = fma(_1171, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1177, _1145, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1189 = 1.0 / _1181;
    float _1191 = _1179 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1193 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = -_717;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1183);
    float _1207 = -_715;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1185);
    float _1211 = -_723;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1187);
    float _1215 = _1191 + _1181;
    float _1217 = _1209;
    float _1219 = _1205;
    float _1221 = _1213;
    if (!_1165)
    {
        float _1223 = _731 * _731;
        float _1225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1227 = -_573;
        float _1229 = _1227 + _1187;
        float _1231 = fma(_739, _739, _1223);
        float _1233 = fma(_745, _745, _1231);
        float _1235 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1237 = sqrt(_1233);
        float _1239 = 1.0 / _835;
        float _1241 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1243 = precise::min(_1237, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1245 = _1243 * _1225;
        float _1247 = -_565;
        float _1249 = _1247 + _1183;
        float _1251 = _1245 * _1239;
        float _1253 = -_523;
        float _1255 = _1253 + _1185;
        float _1257 = _1241 * _1251;
        float _1259 = _1229 * _1251;
        float _1261 = fma(_1249, _1257, _727);
        float _1263 = fma(_1255, _1257, _721);
        float _1265 = fma(_1241, _1259, _735);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = _1215 * _1189;
    float _1275 = _1273 * 0.5;
    float _1277 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1279 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1281 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1283 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1285 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1277);
    float _1287 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1279);
    float _1289 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1281);
    float _1291 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1283);
    float _1293 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1285);
    float _1295 = _1285;
    if (_1201)
    {
        _1295 = 1.0;
    }
    float _1297 = _1295;
    float _1299 = _1297;
    if (!_1201)
    {
        float _1301 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1305 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1303);
        float _1307 = _1301 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1315 = _1313 * 0.15915493667125701904296875;
        float _1317 = _1307 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = 1.0 / _1311;
        float _1323 = _1315 * 6.283185482025146484375;
        float _1325 = cos(_1323);
        float _1327 = _1319 * _1321;
        float _1329 = 1.0 / _1305;
        float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1333 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1331;
        float _1335 = _1325 * _1327;
        float _1337 = _1315 * 6.283185482025146484375;
        float _1339 = sin(_1337);
        float _1341 = 1.0 / _1335;
        float _1343 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1345 = _1329 * _1343;
        float _1347 = 1.0 / _1333;
        float _1349 = _1339 * _1341;
        float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1353 = fma(_1349, _1345, _1351);
        float _1355 = _1353 * _1347;
        float _1357 = precise::clamp(_1355, 0.0, 1.0);
        float _1359 = -_1357;
        float _1361 = _1359 + 1.0;
        _1299 = _1361;
    }
    float _1363 = _1299;
    float _1365 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1287);
    float _1367 = _1293 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1369 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1289);
    float _1371 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1291);
    float _1373 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1379 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1383 = _1369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1375);
    float _1387 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1377);
    float _1389 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1379);
    float _1391 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1381);
    float _1393 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1385);
    float _1397 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1387);
    float _1399 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1389);
    float _1401 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1391);
    bool _1403 = _1363 > 0.0;
    bool _1405 = isnan(_1363);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan(0.0);
    bool _1411 = _1407 || _1409;
    float _1413 = _1363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1415 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1395);
    float _1417 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1397);
    float _1419 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1401);
    float _1421 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1399);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1415 + _1419;
    float _1427 = _1421 + _1419;
    float _1429 = _1419 * 0.5;
    float _1431 = _1425 * 0.5;
    float _1433 = _1427 * 0.5;
    float _1435 = fma(_1417, -0.5, _1429);
    out.m_35.x = _1423;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1417;
    out.gl_Position.z = _1421;
    out.gl_Position.w = _1419;
    out.m_60.x = _1431;
    out.m_60.y = _1435;
    out.m_60.z = _1433;
    out.m_60.w = _1419;
    if (_1411)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1437 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1437;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

