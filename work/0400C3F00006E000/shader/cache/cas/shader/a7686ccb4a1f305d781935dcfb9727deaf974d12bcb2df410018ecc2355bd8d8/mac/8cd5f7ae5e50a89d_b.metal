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
    float4 m_50 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_52 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_48 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _641 = false;
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
        float _1768 = as_type<float>(_95);
        out.gl_Position.z = _1768;
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
        float _1841 = as_type<float>(_133);
        out.gl_Position.z = _1841;
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
    bool _205 = !_171;
    int _207 = _205 ? 0 : 1;
    float _209 = float(_197);
    float _211 = fma(_179, 0.5, 0.5);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = abs(_203);
    float _219 = _209 * _217;
    float _221 = float(_199);
    bool _223 = _195 < 0.5;
    float _225 = float(_223);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = -_225;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_215);
    float _237 = fma(_221, _229, _219);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_213;
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
    bool _279 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _281 = isnan(_269);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _269 + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _301;
    float _315 = _305 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _327 * _387;
    float _397 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_327;
    float _401 = _399 + 1.0;
    float _403 = _389 * _395;
    float _405 = _391 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_393, _383, _415);
    float _425 = fma(_397, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
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
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = in.m_48.x;
    float _615 = in.m_48.y;
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _619 = _433 * _615;
    float _621 = _431 * _613;
    bool _623 = !_531;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_79);
        float _645 = 1.0 / _643;
        float _647 = _115 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_32.x;
    float _653 = in.m_32.y;
    float _655 = in.m_32.z;
    float _657 = in.m_52.x;
    float _659 = in.m_52.y;
    float _661 = in.m_52.z;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _671 = in.m_54.x;
    float _673 = in.m_54.y;
    float _675 = in.m_54.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _677;
    float _681 = 1.0 / _665;
    float _683 = in.m_56.x;
    float _685 = in.m_56.y;
    float _687 = in.m_56.z;
    float _689 = 1.0 / _679;
    float _691 = 1.0 / _669;
    float _693 = _653 * _659;
    float _695 = _653 * _673;
    float _697 = fma(_651, _657, _693);
    float _699 = _653 * _685;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _705 = fma(_651, _671, _695);
    float _707 = fma(_655, _661, _697);
    float _709 = fma(_651, _683, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = _649 + _711;
    float _715 = fma(_655, _675, _705);
    float _717 = 1.0 / _703;
    float _719 = _713 * _681;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _723 = _649 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _727 = _649 + _725;
    float _729 = fma(_655, _687, _709);
    float _731 = _723 * _689;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _649 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _741;
    float _745 = _727 * _691;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _747;
    float _751 = fma(_739, _719, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _753 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _759 = _735 * _717;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _769 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _771 = isnan(_649);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_749, _719, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _783 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _785 = isnan(_649);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_757, _745, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_763, _745, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_767, _745, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _801 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _803 = isnan(_649);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_779;
    float _815 = _813 + 1.0;
    float _817 = -_793;
    float _819 = _817 + 1.0;
    float _821 = _793 * _815;
    bool _823 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_649);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _843;
    float _847 = _811 * _819;
    float _849 = -_811;
    float _851 = _849 + 1.0;
    float _853 = fma(_837, _731, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _855 = fma(_845, _731, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _857 = fma(_841, _731, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _859 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_649);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _833 * _851;
    float _873 = -_833;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _881 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _887 = _869 * _875;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = fma(_885, _759, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _897 = _781 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _881 + _899;
    float _903 = fma(_891, _759, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _905 = _751 * _887;
    float _907 = _729 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _911 = _893 + _909;
    float _913 = _901 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _915 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = -_869;
    float _919 = _917 + 1.0;
    float _921 = _753 * _887;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _925 = _907 + _923;
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[28].x, _913);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _921);
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    float _937 = fma(_795, _871, _929);
    float _939 = _901 * _901;
    float _941 = fma(_797, _871, _931);
    float _943 = fma(_799, _871, _933);
    bool _945 = _935 >= 0.0;
    float _947 = fma(_853, _847, _937);
    float _949 = fma(_911, _911, _939);
    float _951 = fma(_855, _847, _941);
    float _953 = fma(_857, _847, _943);
    float _955 = fma(_895, _821, _947);
    float _957 = fma(_925, _925, _949);
    float _959 = fma(_903, _821, _951);
    float _961 = fma(_915, _821, _953);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].x, _955);
    float _965 = rsqrt(_957);
    float _967 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].y, _959);
    float _969 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].z, _961);
    float _971 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = _795;
    int _975 = as_type<int>(_957);
    if (_945)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _977 = _973;
    float _979 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_945)
    {
        float _985 = _977 * 5.0;
        _975 = as_type<int>(_985);
    }
    int _987 = _975;
    float _989 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = as_type<float>(_987);
    if (_945)
    {
        out.m_35.x = 0.0;
    }
    float _997 = _901 * _965;
    float _999 = _911 * _965;
    if (_945)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_987);
        out.gl_Position.z = _3267;
    }
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    if (_945)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1001 = -_997;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1005 = _925 * _965;
    float _1007 = -_999;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1013 = _1003 + _1011;
    float _1015 = -_1005;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1021 = _1009 + _1019;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1023);
    float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    bool _1033 = _1031 >= 0.0;
    if (_1033)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1035 = _995;
    int _1037 = as_type<int>(_1035);
    if (_1033)
    {
        out.m_35.x = 0.0;
    }
    if (_1033)
    {
        float _1039 = _1035 * 5.0;
        _1037 = as_type<int>(_1039);
    }
    int _1041 = _1037;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3365 = as_type<float>(_1041);
        out.gl_Position.z = _3365;
    }
    if (_1033)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1043 = -_881;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = -_893;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = -_907;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = -_997;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1059 = _1045 * _1045;
    float _1061 = -_999;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _911);
    float _1065 = -_1005;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1069 = _241 * _619;
    float _1071 = fma(_1049, _1049, _1059);
    float _1073 = _241 * _621;
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _1079 = fma(_1053, _1053, _1071);
    float _1081 = _1057 * _1057;
    float _1083 = rsqrt(_1079);
    float _1085 = fma(_1063, _1063, _1081);
    float _1087 = fma(_1067, _1067, _1085);
    float _1089 = sqrt(_1087);
    float _1091 = _1049 * _1083;
    float _1093 = _1053 * _1083;
    float _1095 = _1045 * _1083;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1099 = _1091 * _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _1093 * _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1107 = _1095 * _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1111 = -_1099;
    float _1113 = fma(_1093, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1117 = -_1103;
    float _1119 = fma(_1095, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1123 = -_1107;
    float _1125 = fma(_1091, _1121, _1123);
    float _1127 = _965 * _1089;
    float _1129 = _1113 * _1113;
    float _1131 = fma(_1119, _1119, _1129);
    float _1133 = fma(_1125, _1125, _1131);
    float _1135 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1137 = _1127 * _1135;
    float _1139 = rsqrt(_1133);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1143 = _1077 * _1137;
    float _1145 = _1127 * _1141;
    float _1147 = _1119 * _1139;
    float _1149 = _1113 * _1139;
    float _1151 = _1125 * _1139;
    float _1153 = _1095 * _1147;
    float _1155 = _1093 * _1149;
    float _1157 = -_1153;
    float _1159 = fma(_1091, _1149, _1157);
    float _1161 = -_1155;
    float _1163 = fma(_1095, _1151, _1161);
    float _1165 = _1075 * _1145;
    float _1167 = _1143 * _1159;
    float _1169 = _1143 * _1163;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = fma(_1165, _1151, _1167);
    float _1177 = fma(_1165, _1147, _1169);
    float _1179 = fma(_1173, _1093, _1175);
    float _1181 = fma(_1173, _1091, _1177);
    float _1183 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1091 * _1151;
    float _1189 = _907 + _1179;
    float _1191 = _893 + _1181;
    float _1193 = fma(_1185, -0.64999997615814208984375, 1.0);
    float _1195 = -_1187;
    float _1197 = fma(_1093, _1147, _1195);
    float _1199 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1201 = _1189 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1205 = _1191 + _1203;
    float _1207 = _1143 * _1197;
    float _1209 = fma(_1201, _1193, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1211 = fma(_1205, _1193, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1213 = fma(_1165, _1149, _1207);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1221 = _1211 + _1219;
    float _1223 = fma(_1173, _1095, _1213);
    float _1225 = _1217 * _1217;
    float _1227 = _1221 * _1221;
    float _1229 = _881 + _1223;
    float _1231 = _1227 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1235 = _1229 + _1233;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1235, _1193, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1241 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = _1095;
    float _1245 = _1149;
    float _1247 = _1093;
    float _1249 = _1197;
    float _1251 = _1187;
    if (!_1241)
    {
        _1243 = _1225;
    }
    float _1253 = _1243;
    float _1255 = _1253;
    if (!_1241)
    {
        _1245 = _1227;
    }
    float _1257 = _1245;
    float _1259 = _1257;
    if (!_1241)
    {
        _1247 = _1211;
    }
    float _1261 = _1247;
    float _1263 = _1261;
    if (!_1241)
    {
        _1249 = _1209;
    }
    float _1265 = _1249;
    float _1267 = _1265;
    if (!_1241)
    {
        _1251 = _1239;
    }
    float _1269 = _1251;
    bool _1271 = !_1241;
    float _1273 = _1269;
    if (!_1271)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1279 = _1237 + _1277;
        float _1281 = rsqrt(_1231);
        float _1283 = _1279 * _1275;
        float _1285 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = _1283 * 0.15915493667125701904296875;
        float _1289 = _1287 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = cos(_1293);
        float _1297 = fma(_1291, _1285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1299 = _1281 * _1297;
        float _1301 = _1295 + (-1.0);
        float _1303 = fma(_1221, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1217, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1311 = _1303 + _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1315 = _1305 + _1313;
        float _1317 = fma(_1239, _1295, _1307);
        float _1319 = _1311 * _1311;
        float _1321 = _1315 * _1315;
        _1273 = _1317;
        _1259 = _1319;
        _1255 = _1321;
        _1267 = _1305;
        _1263 = _1303;
    }
    float _1323 = _1273;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1267;
    float _1331 = _1263;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1335 = _1323 + _1333;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _1337 = fma(_1335, _1335, _1325);
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    float _1339 = _1337 + _1327;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1345 = isnan(_1341);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1351 = _1347 || _1349;
    float _1353 = _1325;
    if (!_1351)
    {
        _1353 = 1.0;
    }
    float _1355 = _1353;
    bool _1357 = !_1351;
    float _1359 = _1355;
    if (!_1357)
    {
        bool _1361 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1363 = isnan(_1341);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1369 = _1365 || _1367;
        if (!_1369)
        {
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = _1341 + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1375;
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1381 = _1379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1383 = 1.0 / _1377;
            float _1385 = _1373 * _1383;
            float _1387 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1359 = _1387;
            _1389 = true;
        }
        else
        {
            bool _1391 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1393 = isnan(_1341);
            bool _1395 = _1391 || _1393;
            bool _1397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1399 = _1395 || _1397;
            if (!_1399)
            {
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1341 + _1401;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1411 = _1409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1413 = 1.0 / _1407;
                float _1415 = _1403 * _1413;
                float _1417 = fma(_1415, _1411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1359 = _1417;
                _1389 = true;
            }
            else
            {
                _1359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1389 = false;
    float _1419 = _1359;
    float _1421 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1329 + _1423;
    float _1427 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1429 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1421);
    bool _1431 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.5);
    bool _1439 = _1435 || _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1443 = _1331 + _1441;
    float _1445 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1427);
    float _1447 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1429);
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1451 = _1323 + _1449;
    float _1453 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1445);
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1457 = fma(_1425, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1459 = fma(_1443, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1461 = fma(_1451, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1463 = 1.0 / _1455;
    float _1465 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1467 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    float _1477 = -_999;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1481 = -_997;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    float _1485 = -_1005;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1489 = _1465 + _1455;
    float _1491 = _1483;
    float _1493 = _1479;
    float _1495 = _1487;
    if (!_1439)
    {
        float _1497 = _1013 * _1013;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_907;
        float _1503 = _1501 + _1457;
        float _1505 = fma(_1021, _1021, _1497);
        float _1507 = fma(_1027, _1027, _1505);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1511 = sqrt(_1507);
        float _1513 = 1.0 / _1127;
        float _1515 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1499;
        float _1521 = -_893;
        float _1523 = _1521 + _1459;
        float _1525 = _1519 * _1513;
        float _1527 = -_881;
        float _1529 = _1527 + _1461;
        float _1531 = _1515 * _1525;
        float _1533 = _1503 * _1525;
        float _1535 = fma(_1523, _1531, _1009);
        float _1537 = fma(_1529, _1531, _1003);
        float _1539 = fma(_1515, _1533, _1017);
        _1491 = _1537;
        _1493 = _1535;
        _1495 = _1539;
    }
    float _1541 = _1491;
    float _1543 = _1493;
    float _1545 = _1495;
    float _1547 = _1489 * _1463;
    float _1549 = _1547 * 0.5;
    float _1551 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1551);
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1553);
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1565 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1567 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1559);
    float _1569 = _1559;
    if (_1475)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    float _1573 = _1571;
    if (!_1475)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1579 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
        float _1581 = _1575 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1589 = _1587 * 0.15915493667125701904296875;
        float _1591 = _1581 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = 1.0 / _1585;
        float _1597 = _1589 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        float _1601 = _1593 * _1595;
        float _1603 = 1.0 / _1579;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1605;
        float _1609 = _1599 * _1601;
        float _1611 = _1589 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1609;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1619 = _1603 * _1617;
        float _1621 = 1.0 / _1607;
        float _1623 = _1613 * _1615;
        float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1627 = fma(_1623, _1619, _1625);
        float _1629 = _1627 * _1621;
        float _1631 = precise::clamp(_1629, 0.0, 1.0);
        float _1633 = -_1631;
        float _1635 = _1633 + 1.0;
        _1573 = _1635;
    }
    float _1637 = _1573;
    float _1639 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1561);
    float _1641 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1645 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1565);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1655 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1649);
    float _1661 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1663 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1655);
    float _1667 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1671 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1661);
    float _1673 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1675 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1665);
    bool _1677 = _1637 > 0.0;
    bool _1679 = isnan(_1637);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(0.0);
    bool _1685 = _1681 || _1683;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1689 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1691 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1671);
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1675);
    float _1695 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = _1689 + _1693;
    float _1701 = _1695 + _1693;
    float _1703 = _1693 * 0.5;
    float _1705 = _1699 * 0.5;
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1691, -0.5, _1703);
    out.m_35.x = _1697;
    out.gl_Position.x = _1689;
    out.gl_Position.y = _1691;
    out.gl_Position.z = _1695;
    out.gl_Position.w = _1693;
    out.m_60.x = _1705;
    out.m_60.y = _1709;
    out.m_60.z = _1707;
    out.m_60.w = _1693;
    if (_1685)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _641 = false;
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
        float _1768 = as_type<float>(_95);
        out.gl_Position.z = _1768;
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
        float _1841 = as_type<float>(_133);
        out.gl_Position.z = _1841;
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
    bool _205 = !_171;
    int _207 = _205 ? 0 : 1;
    float _209 = float(_197);
    float _211 = fma(_179, 0.5, 0.5);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = abs(_203);
    float _219 = _209 * _217;
    float _221 = float(_199);
    bool _223 = _195 < 0.5;
    float _225 = float(_223);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = -_225;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_215);
    float _237 = fma(_221, _229, _219);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_213;
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
    bool _279 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _281 = isnan(_269);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _269 + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _301;
    float _315 = _305 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _327 * _387;
    float _397 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_327;
    float _401 = _399 + 1.0;
    float _403 = _389 * _395;
    float _405 = _391 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_393, _383, _415);
    float _425 = fma(_397, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
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
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = in.m_48.x;
    float _615 = in.m_48.y;
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _619 = _433 * _615;
    float _621 = _431 * _613;
    bool _623 = !_531;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_79);
        float _645 = 1.0 / _643;
        float _647 = _115 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_32.x;
    float _653 = in.m_32.y;
    float _655 = in.m_32.z;
    float _657 = in.m_52.x;
    float _659 = in.m_52.y;
    float _661 = in.m_52.z;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _671 = in.m_54.x;
    float _673 = in.m_54.y;
    float _675 = in.m_54.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _677;
    float _681 = 1.0 / _665;
    float _683 = in.m_56.x;
    float _685 = in.m_56.y;
    float _687 = in.m_56.z;
    float _689 = 1.0 / _679;
    float _691 = 1.0 / _669;
    float _693 = _653 * _659;
    float _695 = _653 * _673;
    float _697 = fma(_651, _657, _693);
    float _699 = _653 * _685;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _705 = fma(_651, _671, _695);
    float _707 = fma(_655, _661, _697);
    float _709 = fma(_651, _683, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = _649 + _711;
    float _715 = fma(_655, _675, _705);
    float _717 = 1.0 / _703;
    float _719 = _713 * _681;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _723 = _649 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _727 = _649 + _725;
    float _729 = fma(_655, _687, _709);
    float _731 = _723 * _689;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _649 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _741;
    float _745 = _727 * _691;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _747;
    float _751 = fma(_739, _719, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _753 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _759 = _735 * _717;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _769 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _771 = isnan(_649);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_749, _719, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _783 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _785 = isnan(_649);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_757, _745, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_763, _745, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_767, _745, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _801 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _803 = isnan(_649);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_779;
    float _815 = _813 + 1.0;
    float _817 = -_793;
    float _819 = _817 + 1.0;
    float _821 = _793 * _815;
    bool _823 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_649);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _843;
    float _847 = _811 * _819;
    float _849 = -_811;
    float _851 = _849 + 1.0;
    float _853 = fma(_837, _731, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _855 = fma(_845, _731, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _857 = fma(_841, _731, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _859 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_649);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _833 * _851;
    float _873 = -_833;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _881 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _887 = _869 * _875;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = fma(_885, _759, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _897 = _781 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _881 + _899;
    float _903 = fma(_891, _759, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _905 = _751 * _887;
    float _907 = _729 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _911 = _893 + _909;
    float _913 = _901 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _915 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = -_869;
    float _919 = _917 + 1.0;
    float _921 = _753 * _887;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _925 = _907 + _923;
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[28].x, _913);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _921);
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    float _937 = fma(_795, _871, _929);
    float _939 = _901 * _901;
    float _941 = fma(_797, _871, _931);
    float _943 = fma(_799, _871, _933);
    bool _945 = _935 >= 0.0;
    float _947 = fma(_853, _847, _937);
    float _949 = fma(_911, _911, _939);
    float _951 = fma(_855, _847, _941);
    float _953 = fma(_857, _847, _943);
    float _955 = fma(_895, _821, _947);
    float _957 = fma(_925, _925, _949);
    float _959 = fma(_903, _821, _951);
    float _961 = fma(_915, _821, _953);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].x, _955);
    float _965 = rsqrt(_957);
    float _967 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].y, _959);
    float _969 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].z, _961);
    float _971 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = _795;
    int _975 = as_type<int>(_957);
    if (_945)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _977 = _973;
    float _979 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_945)
    {
        float _985 = _977 * 5.0;
        _975 = as_type<int>(_985);
    }
    int _987 = _975;
    float _989 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = as_type<float>(_987);
    if (_945)
    {
        out.m_35.x = 0.0;
    }
    float _997 = _901 * _965;
    float _999 = _911 * _965;
    if (_945)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_987);
        out.gl_Position.z = _3267;
    }
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    if (_945)
    {
        return out;
    }
    float _1001 = -_997;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1005 = _925 * _965;
    float _1007 = -_999;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1013 = _1003 + _1011;
    float _1015 = -_1005;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1021 = _1009 + _1019;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1023);
    float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    bool _1033 = _1031 >= 0.0;
    if (_1033)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1035 = _995;
    int _1037 = as_type<int>(_1035);
    if (_1033)
    {
        out.m_35.x = 0.0;
    }
    if (_1033)
    {
        float _1039 = _1035 * 5.0;
        _1037 = as_type<int>(_1039);
    }
    int _1041 = _1037;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3365 = as_type<float>(_1041);
        out.gl_Position.z = _3365;
    }
    if (_1033)
    {
        return out;
    }
    float _1043 = -_881;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = -_893;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = -_907;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = -_997;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1059 = _1045 * _1045;
    float _1061 = -_999;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _911);
    float _1065 = -_1005;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1069 = _241 * _619;
    float _1071 = fma(_1049, _1049, _1059);
    float _1073 = _241 * _621;
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _1079 = fma(_1053, _1053, _1071);
    float _1081 = _1057 * _1057;
    float _1083 = rsqrt(_1079);
    float _1085 = fma(_1063, _1063, _1081);
    float _1087 = fma(_1067, _1067, _1085);
    float _1089 = sqrt(_1087);
    float _1091 = _1049 * _1083;
    float _1093 = _1053 * _1083;
    float _1095 = _1045 * _1083;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1099 = _1091 * _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _1093 * _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1107 = _1095 * _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1111 = -_1099;
    float _1113 = fma(_1093, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1117 = -_1103;
    float _1119 = fma(_1095, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1123 = -_1107;
    float _1125 = fma(_1091, _1121, _1123);
    float _1127 = _965 * _1089;
    float _1129 = _1113 * _1113;
    float _1131 = fma(_1119, _1119, _1129);
    float _1133 = fma(_1125, _1125, _1131);
    float _1135 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1137 = _1127 * _1135;
    float _1139 = rsqrt(_1133);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1143 = _1077 * _1137;
    float _1145 = _1127 * _1141;
    float _1147 = _1119 * _1139;
    float _1149 = _1113 * _1139;
    float _1151 = _1125 * _1139;
    float _1153 = _1095 * _1147;
    float _1155 = _1093 * _1149;
    float _1157 = -_1153;
    float _1159 = fma(_1091, _1149, _1157);
    float _1161 = -_1155;
    float _1163 = fma(_1095, _1151, _1161);
    float _1165 = _1075 * _1145;
    float _1167 = _1143 * _1159;
    float _1169 = _1143 * _1163;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = fma(_1165, _1151, _1167);
    float _1177 = fma(_1165, _1147, _1169);
    float _1179 = fma(_1173, _1093, _1175);
    float _1181 = fma(_1173, _1091, _1177);
    float _1183 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1091 * _1151;
    float _1189 = _907 + _1179;
    float _1191 = _893 + _1181;
    float _1193 = fma(_1185, -0.64999997615814208984375, 1.0);
    float _1195 = -_1187;
    float _1197 = fma(_1093, _1147, _1195);
    float _1199 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1201 = _1189 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1205 = _1191 + _1203;
    float _1207 = _1143 * _1197;
    float _1209 = fma(_1201, _1193, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1211 = fma(_1205, _1193, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1213 = fma(_1165, _1149, _1207);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1221 = _1211 + _1219;
    float _1223 = fma(_1173, _1095, _1213);
    float _1225 = _1217 * _1217;
    float _1227 = _1221 * _1221;
    float _1229 = _881 + _1223;
    float _1231 = _1227 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1235 = _1229 + _1233;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1235, _1193, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1241 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = _1095;
    float _1245 = _1149;
    float _1247 = _1093;
    float _1249 = _1197;
    float _1251 = _1187;
    if (!_1241)
    {
        _1243 = _1225;
    }
    float _1253 = _1243;
    float _1255 = _1253;
    if (!_1241)
    {
        _1245 = _1227;
    }
    float _1257 = _1245;
    float _1259 = _1257;
    if (!_1241)
    {
        _1247 = _1211;
    }
    float _1261 = _1247;
    float _1263 = _1261;
    if (!_1241)
    {
        _1249 = _1209;
    }
    float _1265 = _1249;
    float _1267 = _1265;
    if (!_1241)
    {
        _1251 = _1239;
    }
    float _1269 = _1251;
    bool _1271 = !_1241;
    float _1273 = _1269;
    if (!_1271)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1279 = _1237 + _1277;
        float _1281 = rsqrt(_1231);
        float _1283 = _1279 * _1275;
        float _1285 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = _1283 * 0.15915493667125701904296875;
        float _1289 = _1287 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = cos(_1293);
        float _1297 = fma(_1291, _1285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1299 = _1281 * _1297;
        float _1301 = _1295 + (-1.0);
        float _1303 = fma(_1221, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1217, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1311 = _1303 + _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1315 = _1305 + _1313;
        float _1317 = fma(_1239, _1295, _1307);
        float _1319 = _1311 * _1311;
        float _1321 = _1315 * _1315;
        _1273 = _1317;
        _1259 = _1319;
        _1255 = _1321;
        _1267 = _1305;
        _1263 = _1303;
    }
    float _1323 = _1273;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1267;
    float _1331 = _1263;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1335 = _1323 + _1333;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _1337 = fma(_1335, _1335, _1325);
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    float _1339 = _1337 + _1327;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1345 = isnan(_1341);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1351 = _1347 || _1349;
    float _1353 = _1325;
    if (!_1351)
    {
        _1353 = 1.0;
    }
    float _1355 = _1353;
    bool _1357 = !_1351;
    float _1359 = _1355;
    if (!_1357)
    {
        bool _1361 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1363 = isnan(_1341);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1369 = _1365 || _1367;
        if (!_1369)
        {
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = _1341 + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1375;
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1381 = _1379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1383 = 1.0 / _1377;
            float _1385 = _1373 * _1383;
            float _1387 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1359 = _1387;
            _1389 = true;
        }
        else
        {
            bool _1391 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1393 = isnan(_1341);
            bool _1395 = _1391 || _1393;
            bool _1397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1399 = _1395 || _1397;
            if (!_1399)
            {
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1341 + _1401;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1411 = _1409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1413 = 1.0 / _1407;
                float _1415 = _1403 * _1413;
                float _1417 = fma(_1415, _1411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1359 = _1417;
                _1389 = true;
            }
            else
            {
                _1359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1389 = false;
    float _1419 = _1359;
    float _1421 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1329 + _1423;
    float _1427 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1429 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1421);
    bool _1431 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.5);
    bool _1439 = _1435 || _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1443 = _1331 + _1441;
    float _1445 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1427);
    float _1447 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1429);
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1451 = _1323 + _1449;
    float _1453 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1445);
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1457 = fma(_1425, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1459 = fma(_1443, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1461 = fma(_1451, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1463 = 1.0 / _1455;
    float _1465 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1467 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    float _1477 = -_999;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1481 = -_997;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    float _1485 = -_1005;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1489 = _1465 + _1455;
    float _1491 = _1483;
    float _1493 = _1479;
    float _1495 = _1487;
    if (!_1439)
    {
        float _1497 = _1013 * _1013;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_907;
        float _1503 = _1501 + _1457;
        float _1505 = fma(_1021, _1021, _1497);
        float _1507 = fma(_1027, _1027, _1505);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1511 = sqrt(_1507);
        float _1513 = 1.0 / _1127;
        float _1515 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1499;
        float _1521 = -_893;
        float _1523 = _1521 + _1459;
        float _1525 = _1519 * _1513;
        float _1527 = -_881;
        float _1529 = _1527 + _1461;
        float _1531 = _1515 * _1525;
        float _1533 = _1503 * _1525;
        float _1535 = fma(_1523, _1531, _1009);
        float _1537 = fma(_1529, _1531, _1003);
        float _1539 = fma(_1515, _1533, _1017);
        _1491 = _1537;
        _1493 = _1535;
        _1495 = _1539;
    }
    float _1541 = _1491;
    float _1543 = _1493;
    float _1545 = _1495;
    float _1547 = _1489 * _1463;
    float _1549 = _1547 * 0.5;
    float _1551 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1551);
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1553);
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1565 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1567 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1559);
    float _1569 = _1559;
    if (_1475)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    float _1573 = _1571;
    if (!_1475)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1579 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
        float _1581 = _1575 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1589 = _1587 * 0.15915493667125701904296875;
        float _1591 = _1581 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = 1.0 / _1585;
        float _1597 = _1589 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        float _1601 = _1593 * _1595;
        float _1603 = 1.0 / _1579;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1605;
        float _1609 = _1599 * _1601;
        float _1611 = _1589 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1609;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1619 = _1603 * _1617;
        float _1621 = 1.0 / _1607;
        float _1623 = _1613 * _1615;
        float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1627 = fma(_1623, _1619, _1625);
        float _1629 = _1627 * _1621;
        float _1631 = precise::clamp(_1629, 0.0, 1.0);
        float _1633 = -_1631;
        float _1635 = _1633 + 1.0;
        _1573 = _1635;
    }
    float _1637 = _1573;
    float _1639 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1561);
    float _1641 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1645 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1565);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1655 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1649);
    float _1661 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1663 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1655);
    float _1667 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1671 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1661);
    float _1673 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1675 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1665);
    bool _1677 = _1637 > 0.0;
    bool _1679 = isnan(_1637);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(0.0);
    bool _1685 = _1681 || _1683;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1689 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1691 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1671);
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1675);
    float _1695 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = _1689 + _1693;
    float _1701 = _1695 + _1693;
    float _1703 = _1693 * 0.5;
    float _1705 = _1699 * 0.5;
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1691, -0.5, _1703);
    out.m_35.x = _1697;
    out.gl_Position.x = _1689;
    out.gl_Position.y = _1691;
    out.gl_Position.z = _1695;
    out.gl_Position.w = _1693;
    out.m_60.x = _1705;
    out.m_60.y = _1709;
    out.m_60.z = _1707;
    out.m_60.w = _1693;
    if (_1685)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_41 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1389 = false;
    bool _641 = false;
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
        float _1768 = as_type<float>(_95);
        out.gl_Position.z = _1768;
    }
    if (!_83)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1841 = as_type<float>(_133);
        out.gl_Position.z = _1841;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _205 = !_171;
    int _207 = _205 ? 0 : 1;
    float _209 = float(_197);
    float _211 = fma(_179, 0.5, 0.5);
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _215 = abs(_207);
    float _217 = abs(_203);
    float _219 = _209 * _217;
    float _221 = float(_199);
    bool _223 = _195 < 0.5;
    float _225 = float(_223);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = -_225;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_215);
    float _237 = fma(_221, _229, _219);
    float _239 = abs(_233);
    float _241 = fma(_235, _239, _237);
    bool _243 = !_213;
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
    bool _279 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _281 = isnan(_269);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _291;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _297 = _295 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _269 + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _293;
    float _313 = 1.0 / _301;
    float _315 = _305 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_289;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _395 = _327 * _387;
    float _397 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _399 = -_327;
    float _401 = _399 + 1.0;
    float _403 = _389 * _395;
    float _405 = _391 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_393, _383, _415);
    float _425 = fma(_397, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _451;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _439 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
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
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _461 + _463;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _481 = _461 + _479;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _503 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_461);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_477;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _501;
    float _521 = _513 * _517;
    float _523 = -_513;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _533 = 1.0 / _497;
    float _535 = _493 * _525;
    float _537 = -_493;
    float _539 = _537 + 1.0;
    float _541 = _481 * _519;
    float _543 = _465 * _533;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_529, _543, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _555 = fma(_547, _543, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _557 = fma(_551, _543, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _559 = _553 * _535;
    float _561 = _555 * _535;
    float _563 = _557 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _577 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].x, _559);
    float _579 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].y, _561);
    float _581 = fma(_567, _541, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _583 = fma(_571, _541, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _585 = fma(_575, _541, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _587 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[107].z, _563);
    float _589 = fma(_581, _521, _577);
    float _591 = fma(_583, _521, _579);
    float _593 = fma(_585, _521, _587);
    float _595 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].x, _589);
    float _597 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].y, _591);
    float _599 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[109].z, _593);
    float _601 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _607 = _599 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _601 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = in.m_48.x;
    float _615 = in.m_48.y;
    float _617 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _619 = _433 * _615;
    float _621 = _431 * _613;
    bool _623 = !_531;
    float _639;
    if (!_623)
    {
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _627 = _135 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].z, _115);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_79);
        float _645 = 1.0 / _643;
        float _647 = _115 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_32.x;
    float _653 = in.m_32.y;
    float _655 = in.m_32.z;
    float _657 = in.m_52.x;
    float _659 = in.m_52.y;
    float _661 = in.m_52.z;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _663;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _671 = in.m_54.x;
    float _673 = in.m_54.y;
    float _675 = in.m_54.z;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _677;
    float _681 = 1.0 / _665;
    float _683 = in.m_56.x;
    float _685 = in.m_56.y;
    float _687 = in.m_56.z;
    float _689 = 1.0 / _679;
    float _691 = 1.0 / _669;
    float _693 = _653 * _659;
    float _695 = _653 * _673;
    float _697 = fma(_651, _657, _693);
    float _699 = _653 * _685;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _705 = fma(_651, _671, _695);
    float _707 = fma(_655, _661, _697);
    float _709 = fma(_651, _683, _699);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _713 = _649 + _711;
    float _715 = fma(_655, _675, _705);
    float _717 = 1.0 / _703;
    float _719 = _713 * _681;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _723 = _649 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _727 = _649 + _725;
    float _729 = fma(_655, _687, _709);
    float _731 = _723 * _689;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _649 + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _741;
    float _745 = _727 * _691;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _747;
    float _751 = fma(_739, _719, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _753 = fma(_743, _719, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _759 = _735 * _717;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _769 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _771 = isnan(_649);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = fma(_749, _719, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _783 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _785 = isnan(_649);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_757, _745, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _797 = fma(_763, _745, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _799 = fma(_767, _745, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _801 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _803 = isnan(_649);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = -_779;
    float _815 = _813 + 1.0;
    float _817 = -_793;
    float _819 = _817 + 1.0;
    float _821 = _793 * _815;
    bool _823 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _825 = isnan(_649);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _843;
    float _847 = _811 * _819;
    float _849 = -_811;
    float _851 = _849 + 1.0;
    float _853 = fma(_837, _731, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _855 = fma(_845, _731, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _857 = fma(_841, _731, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _859 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _861 = isnan(_649);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _833 * _851;
    float _873 = -_833;
    float _875 = _873 + 1.0;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _881 = _715 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _887 = _869 * _875;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _893 = _707 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = fma(_885, _759, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _897 = _781 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _901 = _881 + _899;
    float _903 = fma(_891, _759, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _905 = _751 * _887;
    float _907 = _729 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _909 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _911 = _893 + _909;
    float _913 = _901 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _915 = fma(_879, _759, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = -_869;
    float _919 = _917 + 1.0;
    float _921 = _753 * _887;
    float _923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _925 = _907 + _923;
    float _927 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[28].x, _913);
    float _929 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].x, _905);
    float _931 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].y, _897);
    float _933 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[123].z, _921);
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[28].z, _927);
    float _937 = fma(_795, _871, _929);
    float _939 = _901 * _901;
    float _941 = fma(_797, _871, _931);
    float _943 = fma(_799, _871, _933);
    bool _945 = _935 >= 0.0;
    float _947 = fma(_853, _847, _937);
    float _949 = fma(_911, _911, _939);
    float _951 = fma(_855, _847, _941);
    float _953 = fma(_857, _847, _943);
    float _955 = fma(_895, _821, _947);
    float _957 = fma(_925, _925, _949);
    float _959 = fma(_903, _821, _951);
    float _961 = fma(_915, _821, _953);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].x, _955);
    float _965 = rsqrt(_957);
    float _967 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].y, _959);
    float _969 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[127].z, _961);
    float _971 = _963 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _973 = _795;
    int _975 = as_type<int>(_957);
    if (_945)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _977 = _973;
    float _979 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _981 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_945)
    {
        float _985 = _977 * 5.0;
        _975 = as_type<int>(_985);
    }
    int _987 = _975;
    float _989 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _991 = _979 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _993 = _981 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _995 = as_type<float>(_987);
    if (_945)
    {
        out.m_35.x = 0.0;
    }
    float _997 = _901 * _965;
    float _999 = _911 * _965;
    if (_945)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_987);
        out.gl_Position.z = _3267;
    }
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    if (_945)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1001 = -_997;
    float _1003 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[18].w, _881);
    float _1005 = _925 * _965;
    float _1007 = -_999;
    float _1009 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _893);
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1013 = _1003 + _1011;
    float _1015 = -_1005;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _1019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1021 = _1009 + _1019;
    float _1023 = _1013 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1027 = _1017 + _1025;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1023);
    float _1031 = fma(_1027, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    bool _1033 = _1031 >= 0.0;
    if (_1033)
    {
        _995 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1035 = _995;
    int _1037 = as_type<int>(_1035);
    if (_1033)
    {
        out.m_35.x = 0.0;
    }
    if (_1033)
    {
        float _1039 = _1035 * 5.0;
        _1037 = as_type<int>(_1039);
    }
    int _1041 = _1037;
    if (_1033)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3365 = as_type<float>(_1041);
        out.gl_Position.z = _3365;
    }
    if (_1033)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1043 = -_881;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1047 = -_893;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1051 = -_907;
    float _1053 = _1051 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1055 = -_997;
    float _1057 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[18].w, _901);
    float _1059 = _1045 * _1045;
    float _1061 = -_999;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _911);
    float _1065 = -_1005;
    float _1067 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _925);
    float _1069 = _241 * _619;
    float _1071 = fma(_1049, _1049, _1059);
    float _1073 = _241 * _621;
    float _1075 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_175));
    float _1077 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_161));
    float _1079 = fma(_1053, _1053, _1071);
    float _1081 = _1057 * _1057;
    float _1083 = rsqrt(_1079);
    float _1085 = fma(_1063, _1063, _1081);
    float _1087 = fma(_1067, _1067, _1085);
    float _1089 = sqrt(_1087);
    float _1091 = _1049 * _1083;
    float _1093 = _1053 * _1083;
    float _1095 = _1045 * _1083;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1099 = _1091 * _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _1093 * _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1107 = _1095 * _1105;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1111 = -_1099;
    float _1113 = fma(_1093, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1117 = -_1103;
    float _1119 = fma(_1095, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1123 = -_1107;
    float _1125 = fma(_1091, _1121, _1123);
    float _1127 = _965 * _1089;
    float _1129 = _1113 * _1113;
    float _1131 = fma(_1119, _1119, _1129);
    float _1133 = fma(_1125, _1125, _1131);
    float _1135 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1137 = _1127 * _1135;
    float _1139 = rsqrt(_1133);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1143 = _1077 * _1137;
    float _1145 = _1127 * _1141;
    float _1147 = _1119 * _1139;
    float _1149 = _1113 * _1139;
    float _1151 = _1125 * _1139;
    float _1153 = _1095 * _1147;
    float _1155 = _1093 * _1149;
    float _1157 = -_1153;
    float _1159 = fma(_1091, _1149, _1157);
    float _1161 = -_1155;
    float _1163 = fma(_1095, _1151, _1161);
    float _1165 = _1075 * _1145;
    float _1167 = _1143 * _1159;
    float _1169 = _1143 * _1163;
    float _1171 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = fma(_1165, _1151, _1167);
    float _1177 = fma(_1165, _1147, _1169);
    float _1179 = fma(_1173, _1093, _1175);
    float _1181 = fma(_1173, _1091, _1177);
    float _1183 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1091 * _1151;
    float _1189 = _907 + _1179;
    float _1191 = _893 + _1181;
    float _1193 = fma(_1185, -0.64999997615814208984375, 1.0);
    float _1195 = -_1187;
    float _1197 = fma(_1093, _1147, _1195);
    float _1199 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1201 = _1189 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1205 = _1191 + _1203;
    float _1207 = _1143 * _1197;
    float _1209 = fma(_1201, _1193, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1211 = fma(_1205, _1193, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1213 = fma(_1165, _1149, _1207);
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1221 = _1211 + _1219;
    float _1223 = fma(_1173, _1095, _1213);
    float _1225 = _1217 * _1217;
    float _1227 = _1221 * _1221;
    float _1229 = _881 + _1223;
    float _1231 = _1227 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1235 = _1229 + _1233;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1235, _1193, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1241 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1243 = _1095;
    float _1245 = _1149;
    float _1247 = _1093;
    float _1249 = _1197;
    float _1251 = _1187;
    if (!_1241)
    {
        _1243 = _1225;
    }
    float _1253 = _1243;
    float _1255 = _1253;
    if (!_1241)
    {
        _1245 = _1227;
    }
    float _1257 = _1245;
    float _1259 = _1257;
    if (!_1241)
    {
        _1247 = _1211;
    }
    float _1261 = _1247;
    float _1263 = _1261;
    if (!_1241)
    {
        _1249 = _1209;
    }
    float _1265 = _1249;
    float _1267 = _1265;
    if (!_1241)
    {
        _1251 = _1239;
    }
    float _1269 = _1251;
    bool _1271 = !_1241;
    float _1273 = _1269;
    if (!_1271)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1279 = _1237 + _1277;
        float _1281 = rsqrt(_1231);
        float _1283 = _1279 * _1275;
        float _1285 = _1239 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1287 = _1283 * 0.15915493667125701904296875;
        float _1289 = _1287 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 * 6.283185482025146484375;
        float _1295 = cos(_1293);
        float _1297 = fma(_1291, _1285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1299 = _1281 * _1297;
        float _1301 = _1295 + (-1.0);
        float _1303 = fma(_1221, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1217, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1307 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1311 = _1303 + _1309;
        float _1313 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1315 = _1305 + _1313;
        float _1317 = fma(_1239, _1295, _1307);
        float _1319 = _1311 * _1311;
        float _1321 = _1315 * _1315;
        _1273 = _1317;
        _1259 = _1319;
        _1255 = _1321;
        _1267 = _1305;
        _1263 = _1303;
    }
    float _1323 = _1273;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1267;
    float _1331 = _1263;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1335 = _1323 + _1333;
    out.m_50.x = _609;
    out.m_50.y = _611;
    out.m_50.z = _617;
    out.m_50.w = _605;
    float _1337 = fma(_1335, _1335, _1325);
    out.m_58.x = _989;
    out.m_58.y = _991;
    out.m_58.z = _993;
    out.m_58.w = _983;
    float _1339 = _1337 + _1327;
    float _1341 = sqrt(_1339);
    bool _1343 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1345 = isnan(_1341);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1351 = _1347 || _1349;
    float _1353 = _1325;
    if (!_1351)
    {
        _1353 = 1.0;
    }
    float _1355 = _1353;
    bool _1357 = !_1351;
    float _1359 = _1355;
    if (!_1357)
    {
        bool _1361 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1363 = isnan(_1341);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1369 = _1365 || _1367;
        if (!_1369)
        {
            float _1371 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1373 = _1341 + _1371;
            float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1377 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1375;
            float _1379 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1381 = _1379 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1383 = 1.0 / _1377;
            float _1385 = _1373 * _1383;
            float _1387 = fma(_1385, _1381, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1359 = _1387;
            _1389 = true;
        }
        else
        {
            bool _1391 = _1341 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1393 = isnan(_1341);
            bool _1395 = _1391 || _1393;
            bool _1397 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1399 = _1395 || _1397;
            if (!_1399)
            {
                float _1401 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1403 = _1341 + _1401;
                float _1405 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1407 = _1405 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1409 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1411 = _1409 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1413 = 1.0 / _1407;
                float _1415 = _1403 * _1413;
                float _1417 = fma(_1415, _1411, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1359 = _1417;
                _1389 = true;
            }
            else
            {
                _1359 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1389 = false;
    float _1419 = _1359;
    float _1421 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1425 = _1329 + _1423;
    float _1427 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1429 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1421);
    bool _1431 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.5);
    bool _1439 = _1435 || _1437;
    float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1443 = _1331 + _1441;
    float _1445 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1427);
    float _1447 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1429);
    float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1451 = _1323 + _1449;
    float _1453 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1445);
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1457 = fma(_1425, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1459 = fma(_1443, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1461 = fma(_1451, _1419, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1463 = 1.0 / _1455;
    float _1465 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1467 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1469 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1471 = _1467 || _1469;
    bool _1473 = isnan(0.5);
    bool _1475 = _1471 || _1473;
    float _1477 = -_999;
    float _1479 = fma(_1477, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1459);
    float _1481 = -_997;
    float _1483 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1461);
    float _1485 = -_1005;
    float _1487 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1489 = _1465 + _1455;
    float _1491 = _1483;
    float _1493 = _1479;
    float _1495 = _1487;
    if (!_1439)
    {
        float _1497 = _1013 * _1013;
        float _1499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1501 = -_907;
        float _1503 = _1501 + _1457;
        float _1505 = fma(_1021, _1021, _1497);
        float _1507 = fma(_1027, _1027, _1505);
        float _1509 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1511 = sqrt(_1507);
        float _1513 = 1.0 / _1127;
        float _1515 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1517 = precise::min(_1511, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1519 = _1517 * _1499;
        float _1521 = -_893;
        float _1523 = _1521 + _1459;
        float _1525 = _1519 * _1513;
        float _1527 = -_881;
        float _1529 = _1527 + _1461;
        float _1531 = _1515 * _1525;
        float _1533 = _1503 * _1525;
        float _1535 = fma(_1523, _1531, _1009);
        float _1537 = fma(_1529, _1531, _1003);
        float _1539 = fma(_1515, _1533, _1017);
        _1491 = _1537;
        _1493 = _1535;
        _1495 = _1539;
    }
    float _1541 = _1491;
    float _1543 = _1493;
    float _1545 = _1495;
    float _1547 = _1489 * _1463;
    float _1549 = _1547 * 0.5;
    float _1551 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1553 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1557 = _1541 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1559 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1551);
    float _1561 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1553);
    float _1563 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1555);
    float _1565 = fma(_1543, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1557);
    float _1567 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1559);
    float _1569 = _1559;
    if (_1475)
    {
        _1569 = 1.0;
    }
    float _1571 = _1569;
    float _1573 = _1571;
    if (!_1475)
    {
        float _1575 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1577 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1579 = fma(_1549, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1577);
        float _1581 = _1575 * 0.15915493667125701904296875;
        float _1583 = _1581 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1589 = _1587 * 0.15915493667125701904296875;
        float _1591 = _1581 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = 1.0 / _1585;
        float _1597 = _1589 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        float _1601 = _1593 * _1595;
        float _1603 = 1.0 / _1579;
        float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1607 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1605;
        float _1609 = _1599 * _1601;
        float _1611 = _1589 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1609;
        float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1619 = _1603 * _1617;
        float _1621 = 1.0 / _1607;
        float _1623 = _1613 * _1615;
        float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1627 = fma(_1623, _1619, _1625);
        float _1629 = _1627 * _1621;
        float _1631 = precise::clamp(_1629, 0.0, 1.0);
        float _1633 = -_1631;
        float _1635 = _1633 + 1.0;
        _1573 = _1635;
    }
    float _1637 = _1573;
    float _1639 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1561);
    float _1641 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1643 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1645 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1565);
    float _1647 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1649 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1653 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1655 = _1641 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1657 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1649);
    float _1661 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1651);
    float _1663 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1653);
    float _1665 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1655);
    float _1667 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1669 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1671 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1661);
    float _1673 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1675 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1665);
    bool _1677 = _1637 > 0.0;
    bool _1679 = isnan(_1637);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(0.0);
    bool _1685 = _1681 || _1683;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1689 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1669);
    float _1691 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1671);
    float _1693 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1675);
    float _1695 = fma(_1667, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1673);
    float _1697 = _1687 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1699 = _1689 + _1693;
    float _1701 = _1695 + _1693;
    float _1703 = _1693 * 0.5;
    float _1705 = _1699 * 0.5;
    float _1707 = _1701 * 0.5;
    float _1709 = fma(_1691, -0.5, _1703);
    out.m_35.x = _1697;
    out.gl_Position.x = _1689;
    out.gl_Position.y = _1691;
    out.gl_Position.z = _1695;
    out.gl_Position.w = _1693;
    out.m_60.x = _1705;
    out.m_60.y = _1709;
    out.m_60.z = _1707;
    out.m_60.w = _1693;
    if (_1685)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1711 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1711;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_41.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_41.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_41.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_41.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

