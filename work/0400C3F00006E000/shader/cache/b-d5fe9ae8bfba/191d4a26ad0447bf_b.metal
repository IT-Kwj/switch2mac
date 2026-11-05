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
    float4 m_46 [[user(locn0)]];
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
    float4 m_42 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _493 = false;
    bool _389 = false;
    bool _267 = false;
    bool _165 = false;
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
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_87);
        out.gl_Position.z = _1189;
    }
    if (!_75)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _89 = in.m_37.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_71);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _81;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    int _119 = 0;
    if (_115)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1257 = as_type<float>(_123);
        out.gl_Position.z = _1257;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _103 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _191;
    float _195 = -_189;
    float _197 = _195 + 1.0;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _217 = 1.0 / _193;
    float _219 = _209 * _197;
    float _221 = -_209;
    float _223 = _221 + 1.0;
    float _225 = _177 * _217;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _227;
    float _231 = fma(_213, _225, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _233 = fma(_229, _225, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _235 = _231 * _219;
    float _237 = _233 * _219;
    float _239 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].x, _235);
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].y, _237);
    float _243 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].x, _239);
    float _245 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].y, _241);
    bool _247 = !_215;
    float _265;
    if (!_247)
    {
        float _249 = in.m_42.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
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
        float _273 = _103 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = in.m_44.x;
    float _279 = in.m_44.y;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = 1.0 / _299;
    float _309 = _245 * _279;
    float _311 = _243 * _277;
    float _313 = _283 * _307;
    bool _315 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _317 = isnan(_275);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _335;
    float _339 = _325 * _305;
    float _341 = fma(_329, _313, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _343 = fma(_337, _313, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _345 = fma(_333, _313, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _341 * _339;
    float _353 = _343 * _339;
    float _355 = _345 * _339;
    float _357 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _351);
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _353);
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _355);
    float _363 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].x, _357);
    float _365 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].y, _359);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].z, _361);
    bool _369 = !_301;
    float _387;
    if (!_369)
    {
        float _371 = in.m_42.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_71);
        float _393 = 1.0 / _391;
        float _395 = _103 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    bool _399 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_397);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _397 + _431;
    float _435 = -_409;
    float _437 = _435 + 1.0;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _441 = 1.0 / _413;
    float _443 = _425 * _437;
    float _445 = -_425;
    float _447 = _445 + 1.0;
    float _449 = _429 * _441;
    float _451 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _453 = fma(_449, _433, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _455 = _365 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _453 * _443;
    float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _457);
    float _463 = _363 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _461);
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _469;
    out.m_46.y = _459;
    out.m_46.z = _465;
    out.m_46.w = _471;
    bool _473 = !_439;
    float _491;
    if (!_473)
    {
        float _475 = in.m_42.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_71);
        float _497 = 1.0 / _495;
        float _499 = _103 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_32.x;
    float _505 = in.m_32.y;
    float _507 = in.m_32.z;
    float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _511 = in.m_42.x;
    float _513 = in.m_42.y;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _515;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _529 = _501 + _527;
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _533 = 1.0 / _517;
    float _535 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _541 = _513 > 0.5;
    float _543 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
    float _545 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
    bool _549 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _551 = isnan(_501);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _563 = _529 * _533;
    float _565 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
    bool _567 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _569 = isnan(_501);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = _511 > 0.5;
    float _597 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _599 = fma(_589, _563, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _601 = _577 * _593;
    float _603 = fma(_581, _563, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _605 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _607 = -_139;
    int _609 = _595 ? as_type<int>(_607) : as_type<int>(_139);
    float _611 = _599 * _601;
    float _613 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _603 * _601;
    float _617 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _605 * _601;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _613 + _621;
    float _625 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _617 + _627;
    float _631 = -_143;
    int _633 = _541 ? as_type<int>(_631) : as_type<int>(_143);
    float _635 = _623 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _625 + _637;
    float _641 = -_577;
    float _643 = _641 + 1.0;
    bool _645 = !_525;
    float _647 = _645 ? _143 : as_type<float>(_633);
    float _649 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _635);
    bool _651 = !_521;
    float _653 = _651 ? _139 : as_type<float>(_609);
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].x, _611);
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].y, _615);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _649);
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].z, _619);
    float _663 = -_647;
    float _665 = _663 + 0.5;
    float _667 = _623 * _623;
    float _669 = _653 + 0.5;
    bool _671 = _659 >= 0.0;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_629, _629, _667);
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].x, _655);
    float _681 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].y, _657);
    float _683 = fma(_639, _639, _675);
    float _685 = _677 * _509;
    float _687 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].z, _661);
    float _689 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = rsqrt(_683);
    float _693 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _615;
    int _699 = as_type<int>(_689);
    float _701 = _613;
    if (_671)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _703 = _697;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _673 * _531;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _711;
    if (_671)
    {
        float _715 = _703 * 5.0;
        _699 = as_type<int>(_715);
    }
    int _717 = _699;
    out.m_48.x = _685;
    out.m_48.y = _707;
    out.m_50.x = _705;
    out.m_50.y = _709;
    out.m_50.z = _711;
    float _719 = _623 * _691;
    float _721 = _629 * _691;
    if (_671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_717);
        out.gl_Position.z = _2251;
    }
    if (_671)
    {
        out.m_35.x = 0.0;
    }
    if (_671)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = _639 * _691;
    float _729 = -_721;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _733 = -_719;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _739 = _725 + _737;
    float _741 = -_727;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _625);
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _731 + _745;
    float _749 = -_721;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _753 = _739 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _757 = _743 + _755;
    float _759 = -_727;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _753);
    float _765 = _735 * _735;
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_751, _751, _765);
    bool _771 = _767 >= 0.0;
    float _773 = fma(_761, _761, _769);
    float _775 = sqrt(_773);
    if (_771)
    {
        _713 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _777 = _713;
    int _779 = as_type<int>(_777);
    if (_771)
    {
        out.m_35.x = 0.0;
    }
    if (_771)
    {
        float _781 = _777 * 5.0;
        _779 = as_type<int>(_781);
    }
    int _783 = _779;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_783);
        out.gl_Position.z = _2379;
    }
    float _785 = _691 * _775;
    if (_771)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _787 = _309 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _795 = _785 * _787;
    float _797 = _785 * _789;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = _799 * 0.5;
    float _803 = _791 * _795;
    float _805 = _793 * _797;
    float _807 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _817);
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _617 + _825;
    float _831 = _625 + _827;
    float _833 = _823 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _829 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _831 + _839;
    float _843 = _613 + _833;
    float _845 = _837 * _837;
    float _847 = _841 * _841;
    float _849 = _845 + _847;
    float _851 = sqrt(_849);
    bool _853 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _823;
    float _857 = _811;
    float _859 = _833;
    float _861 = _847;
    if (!_853)
    {
        _855 = _845;
    }
    float _863 = _855;
    float _865 = _863;
    if (!_853)
    {
        _857 = _829;
    }
    float _867 = _857;
    float _869 = _867;
    if (!_853)
    {
        _859 = _831;
    }
    float _871 = _859;
    float _873 = _871;
    if (!_853)
    {
        _701 = _843;
    }
    float _875 = _701;
    bool _877 = !_853;
    float _879 = _875;
    if (!_877)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _885 = _851 + _883;
        float _887 = _843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = rsqrt(_849);
        float _891 = _885 * _881;
        float _893 = _891 * 0.15915493667125701904296875;
        float _895 = _893 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _905 = _889 * _903;
        float _907 = _901 + (-1.0);
        float _909 = fma(_837, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_841, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = _907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _917 = _909 + _915;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _921 = _911 + _919;
        float _923 = fma(_843, _901, _913);
        float _925 = _917 * _917;
        float _927 = _921 * _921;
        _879 = _923;
        _865 = _925;
        _861 = _927;
        _869 = _909;
        _873 = _911;
    }
    float _929 = _879;
    float _931 = _865;
    float _933 = _861;
    float _935 = _869;
    float _937 = _873;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _941 = _929 + _939;
    float _943 = fma(_941, _941, _931);
    float _945 = _943 + _933;
    float _947 = sqrt(_945);
    bool _949 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _951 = isnan(_947);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _957 = _953 || _955;
    float _959 = _931;
    if (!_957)
    {
        _959 = 1.0;
    }
    float _961 = _959;
    bool _963 = !_957;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_947);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _947 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_947);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _947 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1029 = _929 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1033 = _935 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1037 = _937 + _1035;
    float _1039 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1041 = fma(_1033, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1043 = fma(_1037, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1045 = -_719;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1049 = -_721;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1053 = -_727;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1059);
    float _1067 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1061);
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1075 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1089);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1095);
    float _1105 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1109 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1113 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1103);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1113);
    out.m_35.x = _1057;
    float _1123 = _1115 + _1119;
    float _1125 = _1121 + _1119;
    float _1127 = _1119 * 0.5;
    float _1129 = _1123 * 0.5;
    float _1131 = _1125 * 0.5;
    float _1133 = fma(_1117, -0.5, _1127);
    out.gl_Position.x = _1115;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1121;
    out.gl_Position.w = _1119;
    out.m_52.x = _1129;
    out.m_52.y = _1133;
    out.m_52.z = _1131;
    out.m_52.w = _1119;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _493 = false;
    bool _389 = false;
    bool _267 = false;
    bool _165 = false;
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
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_87);
        out.gl_Position.z = _1189;
    }
    if (!_75)
    {
        return out;
    }
    float _89 = in.m_37.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_71);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _81;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    int _119 = 0;
    if (_115)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1257 = as_type<float>(_123);
        out.gl_Position.z = _1257;
    }
    if (_115)
    {
        return out;
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _103 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _191;
    float _195 = -_189;
    float _197 = _195 + 1.0;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _217 = 1.0 / _193;
    float _219 = _209 * _197;
    float _221 = -_209;
    float _223 = _221 + 1.0;
    float _225 = _177 * _217;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _227;
    float _231 = fma(_213, _225, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _233 = fma(_229, _225, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _235 = _231 * _219;
    float _237 = _233 * _219;
    float _239 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].x, _235);
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].y, _237);
    float _243 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].x, _239);
    float _245 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].y, _241);
    bool _247 = !_215;
    float _265;
    if (!_247)
    {
        float _249 = in.m_42.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
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
        float _273 = _103 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = in.m_44.x;
    float _279 = in.m_44.y;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = 1.0 / _299;
    float _309 = _245 * _279;
    float _311 = _243 * _277;
    float _313 = _283 * _307;
    bool _315 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _317 = isnan(_275);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _335;
    float _339 = _325 * _305;
    float _341 = fma(_329, _313, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _343 = fma(_337, _313, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _345 = fma(_333, _313, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _341 * _339;
    float _353 = _343 * _339;
    float _355 = _345 * _339;
    float _357 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _351);
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _353);
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _355);
    float _363 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].x, _357);
    float _365 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].y, _359);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].z, _361);
    bool _369 = !_301;
    float _387;
    if (!_369)
    {
        float _371 = in.m_42.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_71);
        float _393 = 1.0 / _391;
        float _395 = _103 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    bool _399 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_397);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _397 + _431;
    float _435 = -_409;
    float _437 = _435 + 1.0;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _441 = 1.0 / _413;
    float _443 = _425 * _437;
    float _445 = -_425;
    float _447 = _445 + 1.0;
    float _449 = _429 * _441;
    float _451 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _453 = fma(_449, _433, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _455 = _365 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _453 * _443;
    float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _457);
    float _463 = _363 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _461);
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _469;
    out.m_46.y = _459;
    out.m_46.z = _465;
    out.m_46.w = _471;
    bool _473 = !_439;
    float _491;
    if (!_473)
    {
        float _475 = in.m_42.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_71);
        float _497 = 1.0 / _495;
        float _499 = _103 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_32.x;
    float _505 = in.m_32.y;
    float _507 = in.m_32.z;
    float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _511 = in.m_42.x;
    float _513 = in.m_42.y;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _515;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _529 = _501 + _527;
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _533 = 1.0 / _517;
    float _535 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _541 = _513 > 0.5;
    float _543 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
    float _545 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
    bool _549 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _551 = isnan(_501);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _563 = _529 * _533;
    float _565 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
    bool _567 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _569 = isnan(_501);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = _511 > 0.5;
    float _597 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _599 = fma(_589, _563, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _601 = _577 * _593;
    float _603 = fma(_581, _563, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _605 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _607 = -_139;
    int _609 = _595 ? as_type<int>(_607) : as_type<int>(_139);
    float _611 = _599 * _601;
    float _613 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _603 * _601;
    float _617 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _605 * _601;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _613 + _621;
    float _625 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _617 + _627;
    float _631 = -_143;
    int _633 = _541 ? as_type<int>(_631) : as_type<int>(_143);
    float _635 = _623 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _625 + _637;
    float _641 = -_577;
    float _643 = _641 + 1.0;
    bool _645 = !_525;
    float _647 = _645 ? _143 : as_type<float>(_633);
    float _649 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _635);
    bool _651 = !_521;
    float _653 = _651 ? _139 : as_type<float>(_609);
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].x, _611);
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].y, _615);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _649);
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].z, _619);
    float _663 = -_647;
    float _665 = _663 + 0.5;
    float _667 = _623 * _623;
    float _669 = _653 + 0.5;
    bool _671 = _659 >= 0.0;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_629, _629, _667);
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].x, _655);
    float _681 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].y, _657);
    float _683 = fma(_639, _639, _675);
    float _685 = _677 * _509;
    float _687 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].z, _661);
    float _689 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = rsqrt(_683);
    float _693 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _615;
    int _699 = as_type<int>(_689);
    float _701 = _613;
    if (_671)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _703 = _697;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _673 * _531;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _711;
    if (_671)
    {
        float _715 = _703 * 5.0;
        _699 = as_type<int>(_715);
    }
    int _717 = _699;
    out.m_48.x = _685;
    out.m_48.y = _707;
    out.m_50.x = _705;
    out.m_50.y = _709;
    out.m_50.z = _711;
    float _719 = _623 * _691;
    float _721 = _629 * _691;
    if (_671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_717);
        out.gl_Position.z = _2251;
    }
    if (_671)
    {
        out.m_35.x = 0.0;
    }
    if (_671)
    {
        return out;
    }
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = _639 * _691;
    float _729 = -_721;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _733 = -_719;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _739 = _725 + _737;
    float _741 = -_727;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _625);
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _731 + _745;
    float _749 = -_721;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _753 = _739 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _757 = _743 + _755;
    float _759 = -_727;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _753);
    float _765 = _735 * _735;
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_751, _751, _765);
    bool _771 = _767 >= 0.0;
    float _773 = fma(_761, _761, _769);
    float _775 = sqrt(_773);
    if (_771)
    {
        _713 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _777 = _713;
    int _779 = as_type<int>(_777);
    if (_771)
    {
        out.m_35.x = 0.0;
    }
    if (_771)
    {
        float _781 = _777 * 5.0;
        _779 = as_type<int>(_781);
    }
    int _783 = _779;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_783);
        out.gl_Position.z = _2379;
    }
    float _785 = _691 * _775;
    if (_771)
    {
        return out;
    }
    float _787 = _309 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _795 = _785 * _787;
    float _797 = _785 * _789;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = _799 * 0.5;
    float _803 = _791 * _795;
    float _805 = _793 * _797;
    float _807 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _817);
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _617 + _825;
    float _831 = _625 + _827;
    float _833 = _823 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _829 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _831 + _839;
    float _843 = _613 + _833;
    float _845 = _837 * _837;
    float _847 = _841 * _841;
    float _849 = _845 + _847;
    float _851 = sqrt(_849);
    bool _853 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _823;
    float _857 = _811;
    float _859 = _833;
    float _861 = _847;
    if (!_853)
    {
        _855 = _845;
    }
    float _863 = _855;
    float _865 = _863;
    if (!_853)
    {
        _857 = _829;
    }
    float _867 = _857;
    float _869 = _867;
    if (!_853)
    {
        _859 = _831;
    }
    float _871 = _859;
    float _873 = _871;
    if (!_853)
    {
        _701 = _843;
    }
    float _875 = _701;
    bool _877 = !_853;
    float _879 = _875;
    if (!_877)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _885 = _851 + _883;
        float _887 = _843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = rsqrt(_849);
        float _891 = _885 * _881;
        float _893 = _891 * 0.15915493667125701904296875;
        float _895 = _893 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _905 = _889 * _903;
        float _907 = _901 + (-1.0);
        float _909 = fma(_837, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_841, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = _907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _917 = _909 + _915;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _921 = _911 + _919;
        float _923 = fma(_843, _901, _913);
        float _925 = _917 * _917;
        float _927 = _921 * _921;
        _879 = _923;
        _865 = _925;
        _861 = _927;
        _869 = _909;
        _873 = _911;
    }
    float _929 = _879;
    float _931 = _865;
    float _933 = _861;
    float _935 = _869;
    float _937 = _873;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _941 = _929 + _939;
    float _943 = fma(_941, _941, _931);
    float _945 = _943 + _933;
    float _947 = sqrt(_945);
    bool _949 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _951 = isnan(_947);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _957 = _953 || _955;
    float _959 = _931;
    if (!_957)
    {
        _959 = 1.0;
    }
    float _961 = _959;
    bool _963 = !_957;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_947);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _947 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_947);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _947 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1029 = _929 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1033 = _935 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1037 = _937 + _1035;
    float _1039 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1041 = fma(_1033, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1043 = fma(_1037, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1045 = -_719;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1049 = -_721;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1053 = -_727;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1059);
    float _1067 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1061);
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1075 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1089);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1095);
    float _1105 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1109 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1113 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1103);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1113);
    out.m_35.x = _1057;
    float _1123 = _1115 + _1119;
    float _1125 = _1121 + _1119;
    float _1127 = _1119 * 0.5;
    float _1129 = _1123 * 0.5;
    float _1131 = _1125 * 0.5;
    float _1133 = fma(_1117, -0.5, _1127);
    out.gl_Position.x = _1115;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1121;
    out.gl_Position.w = _1119;
    out.m_52.x = _1129;
    out.m_52.y = _1133;
    out.m_52.z = _1131;
    out.m_52.w = _1119;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _995 = false;
    bool _493 = false;
    bool _389 = false;
    bool _267 = false;
    bool _165 = false;
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
    if (!_75)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1189 = as_type<float>(_87);
        out.gl_Position.z = _1189;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _89 = in.m_37.w;
    bool _91 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _99 = _95 || _97;
    float _101 = -_89;
    float _103 = _101 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _105 = 0.0;
    if (_99)
    {
        float _107 = float(_71);
        _105 = _107;
    }
    float _109 = _105;
    bool _111 = _103 >= _109;
    bool _113 = !_99;
    bool _115 = _111 || _113;
    if (_115)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _81;
    if (_115)
    {
        out.m_35.x = 0.0;
    }
    int _119 = 0;
    if (_115)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    if (_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1257 = as_type<float>(_123);
        out.gl_Position.z = _1257;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = as_type<float>(int(gl_VertexIndex));
    bool _127 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _129 = as_type<int>(_125) & 1;
    bool _131 = _129 != 0;
    int _133 = as_type<int>(_125) & 2;
    bool _135 = _133 != 0;
    bool _137 = !_131;
    float _139 = _137 ? (-0.5) : 0.5;
    bool _141 = !_135;
    float _143 = _141 ? (-0.5) : 0.5;
    bool _145 = !_127;
    float _163;
    if (!_145)
    {
        float _147 = in.m_42.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_71);
        float _169 = 1.0 / _167;
        float _171 = _103 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _177 = _173 + _175;
    bool _179 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _187 = _183 || _185;
    float _189 = float(_187);
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _191;
    float _195 = -_189;
    float _197 = _195 + 1.0;
    bool _199 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _201 = isnan(_173);
    bool _203 = _199 || _201;
    bool _205 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _207 = _203 || _205;
    float _209 = float(_207);
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _211;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _217 = 1.0 / _193;
    float _219 = _209 * _197;
    float _221 = -_209;
    float _223 = _221 + 1.0;
    float _225 = _177 * _217;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _227;
    float _231 = fma(_213, _225, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _233 = fma(_229, _225, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _235 = _231 * _219;
    float _237 = _233 * _219;
    float _239 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].x, _235);
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[143].y, _237);
    float _243 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].x, _239);
    float _245 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[144].y, _241);
    bool _247 = !_215;
    float _265;
    if (!_247)
    {
        float _249 = in.m_42.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[11].x, _103);
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
        float _273 = _103 * _271;
        _265 = _273;
    }
    _267 = false;
    float _275 = _265;
    float _277 = in.m_44.x;
    float _279 = in.m_44.y;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _283 = _275 + _281;
    bool _285 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _287 = isnan(_275);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = 1.0 / _299;
    float _309 = _245 * _279;
    float _311 = _243 * _277;
    float _313 = _283 * _307;
    bool _315 = _275 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _317 = isnan(_275);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _335;
    float _339 = _325 * _305;
    float _341 = fma(_329, _313, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _343 = fma(_337, _313, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _345 = fma(_333, _313, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = _341 * _339;
    float _353 = _343 * _339;
    float _355 = _345 * _339;
    float _357 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].x, _351);
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].y, _353);
    float _361 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[107].z, _355);
    float _363 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].x, _357);
    float _365 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].y, _359);
    float _367 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[108].z, _361);
    bool _369 = !_301;
    float _387;
    if (!_369)
    {
        float _371 = in.m_42.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_71);
        float _393 = 1.0 / _391;
        float _395 = _103 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    bool _399 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _401 = isnan(_397);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _415 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _417 = isnan(_397);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _433 = _397 + _431;
    float _435 = -_409;
    float _437 = _435 + 1.0;
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _441 = 1.0 / _413;
    float _443 = _425 * _437;
    float _445 = -_425;
    float _447 = _445 + 1.0;
    float _449 = _429 * _441;
    float _451 = _367 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _453 = fma(_449, _433, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _455 = _365 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _453 * _443;
    float _459 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[115].x, _457);
    float _463 = _363 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _465 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[116].x, _461);
    float _469 = _463 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_46.x = _469;
    out.m_46.y = _459;
    out.m_46.z = _465;
    out.m_46.w = _471;
    bool _473 = !_439;
    float _491;
    if (!_473)
    {
        float _475 = in.m_42.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[11].z, _103);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_71);
        float _497 = 1.0 / _495;
        float _499 = _103 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_32.x;
    float _505 = in.m_32.y;
    float _507 = in.m_32.z;
    float _509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _511 = in.m_42.x;
    float _513 = in.m_42.y;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _515;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _525 = _523 != 0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _529 = _501 + _527;
    float _531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _533 = 1.0 / _517;
    float _535 = _505 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _537 = _505 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _539 = _505 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _541 = _513 > 0.5;
    float _543 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[4].x, _535);
    float _545 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[6].x, _539);
    float _547 = fma(_503, (*spvDescriptorSet0.vp_c10)._m0[5].x, _537);
    bool _549 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _551 = isnan(_501);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[6].z, _545);
    float _563 = _529 * _533;
    float _565 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[5].z, _547);
    bool _567 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _569 = isnan(_501);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _587;
    float _591 = -_559;
    float _593 = _591 + 1.0;
    bool _595 = _511 > 0.5;
    float _597 = fma(_507, (*spvDescriptorSet0.vp_c10)._m0[4].z, _543);
    float _599 = fma(_589, _563, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _601 = _577 * _593;
    float _603 = fma(_581, _563, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _605 = fma(_585, _563, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _607 = -_139;
    int _609 = _595 ? as_type<int>(_607) : as_type<int>(_139);
    float _611 = _599 * _601;
    float _613 = _565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _615 = _603 * _601;
    float _617 = _597 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _619 = _605 * _601;
    float _621 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _623 = _613 + _621;
    float _625 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _629 = _617 + _627;
    float _631 = -_143;
    int _633 = _541 ? as_type<int>(_631) : as_type<int>(_143);
    float _635 = _623 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _639 = _625 + _637;
    float _641 = -_577;
    float _643 = _641 + 1.0;
    bool _645 = !_525;
    float _647 = _645 ? _143 : as_type<float>(_633);
    float _649 = fma(_629, (*spvDescriptorSet0.vp_c8)._m0[28].x, _635);
    bool _651 = !_521;
    float _653 = _651 ? _139 : as_type<float>(_609);
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].x, _611);
    float _657 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].y, _615);
    float _659 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].z, _649);
    float _661 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[123].z, _619);
    float _663 = -_647;
    float _665 = _663 + 0.5;
    float _667 = _623 * _623;
    float _669 = _653 + 0.5;
    bool _671 = _659 >= 0.0;
    float _673 = _665 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _675 = fma(_629, _629, _667);
    float _677 = _669 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _679 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].x, _655);
    float _681 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].y, _657);
    float _683 = fma(_639, _639, _675);
    float _685 = _677 * _509;
    float _687 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[124].z, _661);
    float _689 = _679 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _691 = rsqrt(_683);
    float _693 = _681 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _615;
    int _699 = as_type<int>(_689);
    float _701 = _613;
    if (_671)
    {
        _697 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _703 = _697;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _673 * _531;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _711;
    if (_671)
    {
        float _715 = _703 * 5.0;
        _699 = as_type<int>(_715);
    }
    int _717 = _699;
    out.m_48.x = _685;
    out.m_48.y = _707;
    out.m_50.x = _705;
    out.m_50.y = _709;
    out.m_50.z = _711;
    float _719 = _623 * _691;
    float _721 = _629 * _691;
    if (_671)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2251 = as_type<float>(_717);
        out.gl_Position.z = _2251;
    }
    if (_671)
    {
        out.m_35.x = 0.0;
    }
    if (_671)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _723 = -_719;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = _639 * _691;
    float _729 = -_721;
    float _731 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _617);
    float _733 = -_719;
    float _735 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _623);
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _739 = _725 + _737;
    float _741 = -_727;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[18].w, _625);
    float _745 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _747 = _731 + _745;
    float _749 = -_721;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    float _753 = _739 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _757 = _743 + _755;
    float _759 = -_727;
    float _761 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[28].x, _753);
    float _765 = _735 * _735;
    float _767 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[28].z, _763);
    float _769 = fma(_751, _751, _765);
    bool _771 = _767 >= 0.0;
    float _773 = fma(_761, _761, _769);
    float _775 = sqrt(_773);
    if (_771)
    {
        _713 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _777 = _713;
    int _779 = as_type<int>(_777);
    if (_771)
    {
        out.m_35.x = 0.0;
    }
    if (_771)
    {
        float _781 = _777 * 5.0;
        _779 = as_type<int>(_781);
    }
    int _783 = _779;
    if (_771)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2379 = as_type<float>(_783);
        out.gl_Position.z = _2379;
    }
    float _785 = _691 * _775;
    if (_771)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _787 = _309 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _789 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _143);
    float _793 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _139);
    float _795 = _785 * _787;
    float _797 = _785 * _789;
    float _799 = _785 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _801 = _799 * 0.5;
    float _803 = _791 * _795;
    float _805 = _793 * _797;
    float _807 = _803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _809 = _803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _811 = _803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _813 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _807);
    float _815 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _809);
    float _817 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _811);
    float _819 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[24].z, _813);
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[26].z, _815);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c8)._m0[25].z, _817);
    float _825 = _819 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _827 = _821 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _829 = _617 + _825;
    float _831 = _625 + _827;
    float _833 = _823 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _835 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _837 = _829 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _841 = _831 + _839;
    float _843 = _613 + _833;
    float _845 = _837 * _837;
    float _847 = _841 * _841;
    float _849 = _845 + _847;
    float _851 = sqrt(_849);
    bool _853 = _851 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _855 = _823;
    float _857 = _811;
    float _859 = _833;
    float _861 = _847;
    if (!_853)
    {
        _855 = _845;
    }
    float _863 = _855;
    float _865 = _863;
    if (!_853)
    {
        _857 = _829;
    }
    float _867 = _857;
    float _869 = _867;
    if (!_853)
    {
        _859 = _831;
    }
    float _871 = _859;
    float _873 = _871;
    if (!_853)
    {
        _701 = _843;
    }
    float _875 = _701;
    bool _877 = !_853;
    float _879 = _875;
    if (!_877)
    {
        float _881 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _883 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _885 = _851 + _883;
        float _887 = _843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _889 = rsqrt(_849);
        float _891 = _885 * _881;
        float _893 = _891 * 0.15915493667125701904296875;
        float _895 = _893 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 * 6.283185482025146484375;
        float _901 = cos(_899);
        float _903 = fma(_897, _887, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _905 = _889 * _903;
        float _907 = _901 + (-1.0);
        float _909 = fma(_837, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_841, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _913 = _907 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _917 = _909 + _915;
        float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _921 = _911 + _919;
        float _923 = fma(_843, _901, _913);
        float _925 = _917 * _917;
        float _927 = _921 * _921;
        _879 = _923;
        _865 = _925;
        _861 = _927;
        _869 = _909;
        _873 = _911;
    }
    float _929 = _879;
    float _931 = _865;
    float _933 = _861;
    float _935 = _869;
    float _937 = _873;
    float _939 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _941 = _929 + _939;
    float _943 = fma(_941, _941, _931);
    float _945 = _943 + _933;
    float _947 = sqrt(_945);
    bool _949 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _951 = isnan(_947);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _957 = _953 || _955;
    float _959 = _931;
    if (!_957)
    {
        _959 = 1.0;
    }
    float _961 = _959;
    bool _963 = !_957;
    float _965 = _961;
    if (!_963)
    {
        bool _967 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _969 = isnan(_947);
        bool _971 = _967 || _969;
        bool _973 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _975 = _971 || _973;
        if (!_975)
        {
            float _977 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _979 = _947 + _977;
            float _981 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _983 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _981;
            float _985 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _987 = _985 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _989 = 1.0 / _983;
            float _991 = _979 * _989;
            float _993 = fma(_991, _987, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _965 = _993;
            _995 = true;
        }
        else
        {
            bool _997 = _947 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _999 = isnan(_947);
            bool _1001 = _997 || _999;
            bool _1003 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1005 = _1001 || _1003;
            if (!_1005)
            {
                float _1007 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1009 = _947 + _1007;
                float _1011 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1013 = _1011 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1015 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1017 = _1015 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1019 = 1.0 / _1013;
                float _1021 = _1009 * _1019;
                float _1023 = fma(_1021, _1017, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _965 = _1023;
                _995 = true;
            }
            else
            {
                _965 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _995 = false;
    float _1025 = _965;
    float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1029 = _929 + _1027;
    float _1031 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1033 = _935 + _1031;
    float _1035 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1037 = _937 + _1035;
    float _1039 = fma(_1029, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1041 = fma(_1033, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1043 = fma(_1037, _1025, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1045 = -_719;
    float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1039);
    float _1049 = -_721;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1041);
    float _1053 = -_727;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1043);
    float _1057 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1059 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1063 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1065 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1059);
    float _1067 = _1047 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1069 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1061);
    float _1071 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1063);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1065);
    float _1075 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1067);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1069);
    float _1079 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1081 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1083 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1075);
    float _1085 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1087 = _1079 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1093 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1095 = _1081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1097 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1089);
    float _1099 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1091);
    float _1101 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1093);
    float _1103 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1095);
    float _1105 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1107 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1097);
    float _1109 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1111 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1101);
    float _1113 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1103);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1107);
    float _1117 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1109);
    float _1119 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1111);
    float _1121 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1113);
    out.m_35.x = _1057;
    float _1123 = _1115 + _1119;
    float _1125 = _1121 + _1119;
    float _1127 = _1119 * 0.5;
    float _1129 = _1123 * 0.5;
    float _1131 = _1125 * 0.5;
    float _1133 = fma(_1117, -0.5, _1127);
    out.gl_Position.x = _1115;
    out.gl_Position.y = _1117;
    out.gl_Position.z = _1121;
    out.gl_Position.w = _1119;
    out.m_52.x = _1129;
    out.m_52.y = _1133;
    out.m_52.z = _1131;
    out.m_52.w = _1119;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

