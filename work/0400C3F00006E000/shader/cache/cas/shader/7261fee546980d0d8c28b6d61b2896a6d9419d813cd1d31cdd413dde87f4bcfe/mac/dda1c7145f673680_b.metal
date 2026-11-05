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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_62 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_50 [[attribute(2)]];
    float4 m_52 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_34 [[attribute(6)]];
    float4 m_39 [[attribute(7)]];
    float4 m_41 [[attribute(8)]];
    float4 m_56 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1543 = false;
    bool _913 = false;
    bool _901 = false;
    bool _497 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1690 = as_type<float>(_99);
        out.gl_Position.z = _1690;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1759 = as_type<float>(_135);
        out.gl_Position.z = _1759;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    float _185 = _181 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    float _205 = _147 * _159;
    float _207 = _185 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_175;
    int _213 = _211 ? (-1090519040) : 1056964608;
    float _215 = fma(_145, _151, _203);
    float _217 = _147 * _167;
    bool _219 = !_197;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_145, _157, _205);
    bool _225 = !_189;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_145, _165, _217);
    int _231 = abs(_221);
    out.m_54.x = as_type<float>(_213);
    out.m_54.y = as_type<float>(_193);
    int _233 = abs(_227);
    float _235 = -_183;
    float _237 = _171 + _235;
    float _239 = fma(_149, _161, _223);
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_231);
    float _249 = fma(_209, 0.5, 0.5);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _237 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_245);
    float _261 = _247 * _259;
    int _263 = abs(_253);
    float _265 = -_249;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_233);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_269, _267, _261);
    float _279 = fma(_149, _155, _215);
    float _281 = fma(_149, _169, _229);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _277);
    bool _287 = !_241;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = 1.0 / _337;
    bool _345 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_313);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _333;
    float _359 = _317 * _339;
    bool _361 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_313);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_355;
    float _375 = _373 + 1.0;
    float _377 = _321 * _343;
    bool _379 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_313);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_313);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _389 * _375;
    float _405 = -_389;
    float _407 = _405 + 1.0;
    float _409 = _325 * _357;
    float _411 = -_371;
    float _413 = _411 + 1.0;
    float _415 = _401 * _407;
    float _417 = -_401;
    float _419 = _417 + 1.0;
    float _421 = _355 * _413;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_425, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_429, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = fma(_433, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = fma(_437, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _439 * _415;
    float _449 = _441 * _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_443, _403, _455);
    float _467 = fma(_459, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_445, _403, _461);
    float _471 = fma(_463, _421, _465);
    float _473 = fma(_467, _421, _469);
    float _475 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    bool _479 = !_341;
    float _495;
    if (!_479)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_83);
        float _501 = 1.0 / _499;
        float _503 = _117 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_34.x;
    float _509 = in.m_34.y;
    float _511 = in.m_34.z;
    float _513 = in.m_56.x;
    float _515 = in.m_56.y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = in.m_50.w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_48.w;
    float _527 = in.m_52.w;
    float _529 = _159 * _509;
    float _531 = _153 * _509;
    float _533 = _475 * _513;
    float _535 = _167 * _509;
    float _537 = fma(_157, _507, _529);
    float _539 = fma(_151, _507, _531);
    float _541 = _477 * _515;
    float _543 = fma(_165, _507, _535);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = fma(_155, _511, _539);
    float _555 = 1.0 / _547;
    float _557 = _285 * _533;
    float _559 = _285 * _541;
    float _561 = fma(_161, _511, _537);
    float _563 = fma(_169, _511, _543);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = 1.0 / _551;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _571 = _505 + _569;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _575 = _561 + _519;
    float _577 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _571 * _555;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _505 + _595;
    float _599 = _553 + _525;
    float _601 = fma(_589, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _575 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _617 = fma(_581, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    out.m_58.x = _577;
    out.m_58.y = _583;
    out.m_58.z = _523;
    out.m_58.w = _521;
    bool _621 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _623 = isnan(_505);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _563 + _527;
    bool _635 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _637 = isnan(_505);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_613;
    float _649 = _647 + 1.0;
    float _651 = _599 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _645 * _649;
    float _663 = _633 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _665 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = _597 * _567;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _673 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = _673 * _669;
    float _687 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].x, _675);
    float _689 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _693 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].x, _687);
    float _697 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].y, _689);
    float _699 = _631 * _683;
    float _701 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _703 = _695 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].y, _697);
    float _707 = _601 * _699;
    float _709 = _617 * _699;
    float _711 = _619 * _699;
    float _713 = _703 * _671;
    float _715 = _705 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _719 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].z, _701);
    float _721 = fma(_713, 0.5, 0.5);
    float _723 = _715 * _691;
    float _725 = -_631;
    float _727 = _725 + 1.0;
    float _729 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].z, _719);
    float _731 = fma(_655, _667, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_723, 0.5, 0.5);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _707);
    float _737 = _729 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _739 = floor(_721);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _711);
    float _743 = fma(_731, _661, _735);
    float _745 = fma(_679, _667, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _709);
    float _749 = fma(_693, _661, _741);
    float _751 = _737 * _717;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _755 = floor(_733);
    float _757 = fma(_745, _661, _747);
    float _759 = fma(_751, 0.5, 0.5);
    float _761 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].z, _749);
    float _763 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _765 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _665 * _753;
    float _769 = floor(_759);
    float _771 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].y, _757);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = -_739;
    float _779 = _721 + _777;
    float _781 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].x, _743);
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _763);
    float _787 = -_755;
    float _789 = _733 + _787;
    float _791 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _795 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, 2.0, -1.0);
    float _799 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = fma(_779, 2.0, -1.0);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _805 = _797 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _791);
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _793);
    float _813 = _801 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _815 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _817 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = -_769;
    float _821 = _759 + _819;
    float _823 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].y, _815);
    float _827 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = fma(_821, 2.0, -1.0);
    float _831 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _833 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _835 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _837 = _833 || _835;
    bool _839 = isnan(1.0);
    bool _841 = _837 || _839;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].z, _823);
    float _845 = _829 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].x, _831);
    float _849 = _803 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].y, _825);
    float _853 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].x, _847);
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].z, _843);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _859 = _807 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _861 = _811 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _863 = _853 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _865 = _851 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _867 = _855 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _827;
    out.m_60.y = _809;
    out.m_60.z = _799;
    out.m_60.w = _857;
    float _869 = _849 + _863;
    float _871 = _861 + _867;
    float _873 = _859 + _865;
    float _875 = _823;
    float _877 = _799;
    float _879 = _811;
    float _881 = _859;
    float _883 = _859;
    float _885 = _801;
    float _887 = _797;
    float _889 = _861;
    float _891 = _829;
    float _893 = _851;
    float _895 = _829;
    float _905;
    float _907;
    float _909;
    float _911;
    if (!_841)
    {
        bool _897 = _865 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _899 = !_897;
        _901 = _899;
        if (!_901)
        {
            float _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _905 = _903;
            _907 = 0.0;
            _909 = 0.0;
            _911 = 0.0;
            _913 = true;
        }
    }
    if ((!_913) || _901)
    {
        bool _949;
        if (!_901)
        {
            bool _915 = _865 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _917 = isnan(_865);
            bool _919 = _915 || _917;
            bool _921 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _923 = _919 || _921;
            bool _925 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _927 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _929 = !_923;
            bool _931 = _927 && _929;
            if (_931)
            {
                _875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _933 = _875;
            float _935 = _933;
            if (_931)
            {
                _877 = 0.0;
            }
            float _937 = _877;
            _907 = _937;
            if (_931)
            {
                _879 = 0.0;
            }
            float _939 = _879;
            _909 = _939;
            if (_931)
            {
                float _941 = _933 * 5.0;
                _935 = _941;
            }
            float _943 = _935;
            _905 = _943;
            if (_931)
            {
                _881 = 0.0;
            }
            float _945 = _881;
            bool _947 = !_923;
            _949 = _947 && _925;
            _883 = _945;
            _911 = _945;
        }
        if ((!_949) || _901)
        {
            _901 = false;
            float _951 = _883;
            bool _953 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _955 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _957 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _959 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _961 = _951;
            _905 = _871;
            _907 = _869;
            _909 = _873;
            if (_953)
            {
                float _963 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _959 = _963;
            }
            float _965 = _959;
            if (_953)
            {
                float _967 = abs(_801);
                float _969 = -_967;
                float _971 = _969 + 1.0;
                _885 = _971;
            }
            float _973 = _885;
            if (_955)
            {
                float _975 = abs(_797);
                float _977 = -_975;
                float _979 = _977 + 1.0;
                _887 = _979;
            }
            float _981 = _887;
            if (!_953)
            {
                _889 = 1.0;
            }
            float _983 = _889;
            float _985 = _983;
            if (_957)
            {
                float _987 = abs(_829);
                float _989 = -_987;
                float _991 = _989 + 1.0;
                _891 = _991;
            }
            float _993 = _891;
            _895 = _993;
            if (!_955)
            {
                _893 = 1.0;
            }
            float _995 = _893;
            float _997 = _995;
            if (!_957)
            {
                _961 = 1.0;
            }
            float _999 = _961;
            float _1001 = _809;
            float _1003 = _999;
            if (_955)
            {
                float _1005 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1001 = _1005;
            }
            float _1007 = _1001;
            float _1009 = _857;
            if (_957)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1009 = _1011;
            }
            float _1013 = _1009;
            if (_953)
            {
                float _1015 = _973 * _965;
                float _1017 = precise::clamp(_1015, 0.0, 1.0);
                _985 = _1017;
            }
            float _1019 = _985;
            if (_955)
            {
                float _1021 = _981 * _1007;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _997 = _1023;
            }
            float _1025 = _997;
            float _1027 = _1019 * _1025;
            if (_957)
            {
                float _1029 = _993 * _1013;
                float _1031 = precise::clamp(_1029, 0.0, 1.0);
                _1003 = _1031;
            }
            float _1033 = _1003;
            float _1035 = _1027 * _1033;
            _911 = _1035;
        }
    }
    _913 = false;
    float _1037 = _905;
    float _1039 = _907;
    float _1041 = _909;
    float _1043 = _895;
    float _1045 = _911;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1037 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1039 + _1051;
    float _1055 = _1049 * _1049;
    float _1057 = fma(_1053, _1053, _1055);
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1063 = !_1061;
    float _1065 = _1041;
    float _1067 = _1039;
    float _1069 = _1037;
    float _1071 = _1043;
    if (!_1063)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _1059 + _1075;
        float _1079 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_1057);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = _1093 + (-1.0);
        float _1101 = fma(_1053, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1049, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = fma(_1093, _1041, _1105);
        _1065 = _1107;
        _1067 = _1101;
        _1069 = _1103;
    }
    float _1109 = _1065;
    float _1111 = _1067;
    float _1113 = _1069;
    float _1115 = -_865;
    float _1117 = _1115 + _1109;
    float _1119 = -_863;
    float _1121 = _1119 + _1111;
    float _1123 = -_867;
    float _1125 = _1123 + _1113;
    float _1127 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * _1117;
    float _1131 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1135 = fma(_1121, _1121, _1129);
    float _1137 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1139 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1133);
    float _1141 = fma(_1125, _1125, _1135);
    float _1143 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1147 = sqrt(_1141);
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    float _1159 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = 1.0;
    bool _1165 = _1147 > 0.0;
    float _1167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1169 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1173 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1177 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1179 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1181 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1163);
    float _1185 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1179);
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1173);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1195 = _1181;
    float _1197 = _1113;
    float _1199 = _1109;
    float _1201 = _1111;
    if (!_1165)
    {
        _1071 = _1111;
    }
    float _1203 = _1071;
    float _1205 = _1203;
    if (!_1165)
    {
        _1195 = _1109;
    }
    float _1207 = _1195;
    bool _1209 = !_1165;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = _239 * _239;
        float _1215 = rsqrt(_1141);
        float _1217 = fma(_279, _279, _1213);
        float _1219 = fma(_281, _281, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1121 * _1215;
        float _1225 = _1117 * _1215;
        float _1227 = _1125 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1217;
        float _1233 = _1215;
        if (!_1229)
        {
            _1231 = _1111;
        }
        float _1235 = _1231;
        _1205 = _1235;
        if (!_1229)
        {
            _1233 = _1109;
        }
        float _1237 = _1233;
        bool _1239 = !_1229;
        _1211 = _1237;
        if (!_1239)
        {
            float _1241 = rsqrt(_1219);
            float _1243 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1245 = _239 * _1241;
            float _1247 = _279 * _1241;
            float _1249 = _281 * _1241;
            float _1251 = _1225 * _1245;
            float _1253 = fma(_1223, _1247, _1251);
            float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1257 = fma(_1227, _1249, _1253);
            float _1259 = _1257 * _1255;
            float _1261 = fma(_279, _1259, _1111);
            float _1263 = fma(_239, _1259, _1109);
            float _1265 = fma(_281, _1259, _1113);
            _1205 = _1261;
            _1211 = _1263;
            _1197 = _1265;
        }
    }
    float _1267 = _1205;
    float _1269 = _1211;
    float _1271 = _1197;
    float _1273 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1193 + _1189;
    float _1277 = _1271;
    if (_1157)
    {
        _1199 = _1267;
    }
    float _1279 = _1199;
    float _1281 = _1279;
    if (_1157)
    {
        _1201 = _1269;
    }
    float _1283 = _1201;
    float _1285 = _1283;
    if (!_1157)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _865 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _863 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_865;
        float _1299 = _1297 + _1269;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _867 + _1303;
        float _1307 = fma(_1293, _1293, _1301);
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1311 = fma(_1305, _1305, _1307);
        float _1313 = sqrt(_1311);
        float _1315 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1313, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1309;
        float _1321 = -_863;
        float _1323 = _1321 + _1267;
        float _1325 = _1315 * _1319;
        float _1327 = -_867;
        float _1329 = _1327 + _1271;
        float _1331 = fma(_1323, _1325, _863);
        float _1333 = fma(_1299, _1325, _865);
        float _1335 = fma(_1329, _1325, _867);
        _1285 = _1333;
        _1281 = _1331;
        _1277 = _1335;
    }
    float _1337 = _1285;
    float _1339 = _1281;
    float _1341 = _1277;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1343);
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1347);
    float _1357 = -_239;
    float _1359 = _1357 + _1337;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1355);
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_279;
    float _1375 = _1373 + _1339;
    float _1377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1183);
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1381 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1383 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1365);
    float _1385 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1379);
    float _1389 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1391 = 1.0 / _1381;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1399 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1397);
    float _1407 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1401);
    float _1411 = 1.0 / _1403;
    float _1413 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1417 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1419 = -_281;
    float _1421 = _1419 + _1341;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1425 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1427 = _1389 * _1391;
    float _1429 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1417);
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1425);
    float _1435 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1437 = _1427 > 0.0;
    float _1439 = _1429 + _1403;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1433);
    float _1443 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1445 = _1431 * _1411;
    bool _1447 = _1427 < 1.0;
    bool _1449 = _1447 && _1437;
    float _1451 = _1439 * 0.5;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1455 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1457 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1459 = _1423 * _1411;
    bool _1461 = _1445 > (-1.0);
    bool _1463 = _1461 && _1449;
    out.gl_Position.x = _1431;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1429;
    out.gl_Position.w = _1403;
    float _1465 = 1.0 / _1453;
    bool _1467 = _1459 > (-1.0);
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1455);
    float _1473 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1457);
    out.m_64.z = _1451;
    out.m_64.w = _1403;
    bool _1475 = _1445 < 1.0;
    bool _1477 = _1475 && _1469;
    float _1479 = _1435 + _1187;
    float _1481 = _1443 + _1185;
    float _1483 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1471);
    bool _1485 = _1459 < 1.0;
    bool _1487 = _1485 && _1477;
    float _1489 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1473);
    float _1491 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1499 = _1491 * _1391;
    float _1501 = _1493 * _1391;
    float _1503 = _1495 * _1465;
    float _1505 = _1497 * _1465;
    bool _1507 = !_1487;
    float _1541;
    if (!_1507)
    {
        float _1509 = -_1501;
        float _1511 = _1459 + _1509;
        float _1513 = -_1499;
        float _1515 = _1445 + _1513;
        float _1517 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _1519 = -_1503;
        float _1521 = _1445 + _1519;
        float _1523 = _1511 * _1511;
        float _1525 = -_1505;
        float _1527 = _1459 + _1525;
        float _1529 = fma(_1515, _1515, _1523);
        float _1531 = sqrt(_1529);
        bool _1533 = _1531 > 0.0;
        float _1535 = _1531;
        if (!_1533)
        {
            _1535 = _1517;
        }
        float _1537 = _1535;
        bool _1539 = !_1533;
        _1541 = _1537;
        _1543 = _1539;
        if (!_1543)
        {
            float _1545 = _1527 * _1527;
            float _1547 = fma(_1521, _1521, _1545);
            float _1549 = rsqrt(_1529);
            float _1551 = sqrt(_1547);
            float _1553 = _1515 * _1549;
            float _1555 = _1511 * _1549;
            bool _1557 = _1551 > 0.0;
            float _1559 = _1549;
            if (!_1557)
            {
                _1559 = _1517;
            }
            float _1561 = _1559;
            bool _1563 = !_1557;
            _1541 = _1561;
            _1543 = _1563;
            if (!_1543)
            {
                float _1565 = _665 * _1273;
                float _1567 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1193);
                float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
                float _1573 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1569);
                float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1435);
                float _1577 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
                float _1579 = rsqrt(_1547);
                float _1581 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
                float _1583 = _1567 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1585 = 1.0 / _1573;
                float _1587 = _1527 * _1583;
                float _1589 = _1521 * _1583;
                float _1591 = _1587 * _1587;
                float _1593 = fma(_1589, _1589, _1591);
                float _1595 = _1577 * _1585;
                float _1597 = _1581 * _1585;
                float _1599 = sqrt(_1593);
                float _1601 = _1595 * _1595;
                float _1603 = fma(_1597, _1597, _1601);
                float _1605 = _1527 * _1579;
                float _1607 = _1521 * _1579;
                float _1609 = sqrt(_1603);
                float _1611 = _1555 * _1605;
                float _1613 = fma(_1553, _1607, _1611);
                float _1615 = precise::min(0.0, _1613);
                float _1617 = _1403 * _1615;
                float _1619 = fma(_1599, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1609);
                float _1621 = fma(_1589, _1617, _1431);
                float _1623 = 1.0 / _1619;
                float _1625 = fma(_1587, _1617, _1423);
                out.gl_Position.x = _1621;
                out.gl_Position.y = _1625;
                float _1627 = _1609 * _1623;
                out.m_62.y = _1627;
                _1541 = _1517;
                _1543 = true;
            }
        }
    }
    else
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1629;
        _1541 = 0.0;
    }
    _1543 = false;
    float _1631 = _1541;
    float _1633 = _1631 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_37.x = _1633;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1543 = false;
    bool _913 = false;
    bool _901 = false;
    bool _497 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1690 = as_type<float>(_99);
        out.gl_Position.z = _1690;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1759 = as_type<float>(_135);
        out.gl_Position.z = _1759;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    float _185 = _181 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    float _205 = _147 * _159;
    float _207 = _185 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_175;
    int _213 = _211 ? (-1090519040) : 1056964608;
    float _215 = fma(_145, _151, _203);
    float _217 = _147 * _167;
    bool _219 = !_197;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_145, _157, _205);
    bool _225 = !_189;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_145, _165, _217);
    int _231 = abs(_221);
    out.m_54.x = as_type<float>(_213);
    out.m_54.y = as_type<float>(_193);
    int _233 = abs(_227);
    float _235 = -_183;
    float _237 = _171 + _235;
    float _239 = fma(_149, _161, _223);
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_231);
    float _249 = fma(_209, 0.5, 0.5);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _237 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_245);
    float _261 = _247 * _259;
    int _263 = abs(_253);
    float _265 = -_249;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_233);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_269, _267, _261);
    float _279 = fma(_149, _155, _215);
    float _281 = fma(_149, _169, _229);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _277);
    bool _287 = !_241;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = 1.0 / _337;
    bool _345 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_313);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _333;
    float _359 = _317 * _339;
    bool _361 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_313);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_355;
    float _375 = _373 + 1.0;
    float _377 = _321 * _343;
    bool _379 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_313);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_313);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _389 * _375;
    float _405 = -_389;
    float _407 = _405 + 1.0;
    float _409 = _325 * _357;
    float _411 = -_371;
    float _413 = _411 + 1.0;
    float _415 = _401 * _407;
    float _417 = -_401;
    float _419 = _417 + 1.0;
    float _421 = _355 * _413;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_425, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_429, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = fma(_433, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = fma(_437, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _439 * _415;
    float _449 = _441 * _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_443, _403, _455);
    float _467 = fma(_459, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_445, _403, _461);
    float _471 = fma(_463, _421, _465);
    float _473 = fma(_467, _421, _469);
    float _475 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    bool _479 = !_341;
    float _495;
    if (!_479)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_83);
        float _501 = 1.0 / _499;
        float _503 = _117 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_34.x;
    float _509 = in.m_34.y;
    float _511 = in.m_34.z;
    float _513 = in.m_56.x;
    float _515 = in.m_56.y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = in.m_50.w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_48.w;
    float _527 = in.m_52.w;
    float _529 = _159 * _509;
    float _531 = _153 * _509;
    float _533 = _475 * _513;
    float _535 = _167 * _509;
    float _537 = fma(_157, _507, _529);
    float _539 = fma(_151, _507, _531);
    float _541 = _477 * _515;
    float _543 = fma(_165, _507, _535);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = fma(_155, _511, _539);
    float _555 = 1.0 / _547;
    float _557 = _285 * _533;
    float _559 = _285 * _541;
    float _561 = fma(_161, _511, _537);
    float _563 = fma(_169, _511, _543);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = 1.0 / _551;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _571 = _505 + _569;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _575 = _561 + _519;
    float _577 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _571 * _555;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _505 + _595;
    float _599 = _553 + _525;
    float _601 = fma(_589, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _575 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _617 = fma(_581, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    out.m_58.x = _577;
    out.m_58.y = _583;
    out.m_58.z = _523;
    out.m_58.w = _521;
    bool _621 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _623 = isnan(_505);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _563 + _527;
    bool _635 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _637 = isnan(_505);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_613;
    float _649 = _647 + 1.0;
    float _651 = _599 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _645 * _649;
    float _663 = _633 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _665 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = _597 * _567;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _673 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = _673 * _669;
    float _687 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].x, _675);
    float _689 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _693 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].x, _687);
    float _697 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].y, _689);
    float _699 = _631 * _683;
    float _701 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _703 = _695 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].y, _697);
    float _707 = _601 * _699;
    float _709 = _617 * _699;
    float _711 = _619 * _699;
    float _713 = _703 * _671;
    float _715 = _705 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _719 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].z, _701);
    float _721 = fma(_713, 0.5, 0.5);
    float _723 = _715 * _691;
    float _725 = -_631;
    float _727 = _725 + 1.0;
    float _729 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].z, _719);
    float _731 = fma(_655, _667, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_723, 0.5, 0.5);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _707);
    float _737 = _729 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _739 = floor(_721);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _711);
    float _743 = fma(_731, _661, _735);
    float _745 = fma(_679, _667, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _709);
    float _749 = fma(_693, _661, _741);
    float _751 = _737 * _717;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _755 = floor(_733);
    float _757 = fma(_745, _661, _747);
    float _759 = fma(_751, 0.5, 0.5);
    float _761 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].z, _749);
    float _763 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _765 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _665 * _753;
    float _769 = floor(_759);
    float _771 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].y, _757);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = -_739;
    float _779 = _721 + _777;
    float _781 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].x, _743);
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _763);
    float _787 = -_755;
    float _789 = _733 + _787;
    float _791 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _795 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, 2.0, -1.0);
    float _799 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = fma(_779, 2.0, -1.0);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _805 = _797 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _791);
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _793);
    float _813 = _801 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _815 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _817 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = -_769;
    float _821 = _759 + _819;
    float _823 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].y, _815);
    float _827 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = fma(_821, 2.0, -1.0);
    float _831 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _833 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _835 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _837 = _833 || _835;
    bool _839 = isnan(1.0);
    bool _841 = _837 || _839;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].z, _823);
    float _845 = _829 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].x, _831);
    float _849 = _803 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].y, _825);
    float _853 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].x, _847);
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].z, _843);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _859 = _807 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _861 = _811 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _863 = _853 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _865 = _851 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _867 = _855 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _827;
    out.m_60.y = _809;
    out.m_60.z = _799;
    out.m_60.w = _857;
    float _869 = _849 + _863;
    float _871 = _861 + _867;
    float _873 = _859 + _865;
    float _875 = _823;
    float _877 = _799;
    float _879 = _811;
    float _881 = _859;
    float _883 = _859;
    float _885 = _801;
    float _887 = _797;
    float _889 = _861;
    float _891 = _829;
    float _893 = _851;
    float _895 = _829;
    float _905;
    float _907;
    float _909;
    float _911;
    if (!_841)
    {
        bool _897 = _865 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _899 = !_897;
        _901 = _899;
        if (!_901)
        {
            float _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _905 = _903;
            _907 = 0.0;
            _909 = 0.0;
            _911 = 0.0;
            _913 = true;
        }
    }
    if ((!_913) || _901)
    {
        bool _949;
        if (!_901)
        {
            bool _915 = _865 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _917 = isnan(_865);
            bool _919 = _915 || _917;
            bool _921 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _923 = _919 || _921;
            bool _925 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _927 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _929 = !_923;
            bool _931 = _927 && _929;
            if (_931)
            {
                _875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _933 = _875;
            float _935 = _933;
            if (_931)
            {
                _877 = 0.0;
            }
            float _937 = _877;
            _907 = _937;
            if (_931)
            {
                _879 = 0.0;
            }
            float _939 = _879;
            _909 = _939;
            if (_931)
            {
                float _941 = _933 * 5.0;
                _935 = _941;
            }
            float _943 = _935;
            _905 = _943;
            if (_931)
            {
                _881 = 0.0;
            }
            float _945 = _881;
            bool _947 = !_923;
            _949 = _947 && _925;
            _883 = _945;
            _911 = _945;
        }
        if ((!_949) || _901)
        {
            _901 = false;
            float _951 = _883;
            bool _953 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _955 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _957 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _959 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _961 = _951;
            _905 = _871;
            _907 = _869;
            _909 = _873;
            if (_953)
            {
                float _963 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _959 = _963;
            }
            float _965 = _959;
            if (_953)
            {
                float _967 = abs(_801);
                float _969 = -_967;
                float _971 = _969 + 1.0;
                _885 = _971;
            }
            float _973 = _885;
            if (_955)
            {
                float _975 = abs(_797);
                float _977 = -_975;
                float _979 = _977 + 1.0;
                _887 = _979;
            }
            float _981 = _887;
            if (!_953)
            {
                _889 = 1.0;
            }
            float _983 = _889;
            float _985 = _983;
            if (_957)
            {
                float _987 = abs(_829);
                float _989 = -_987;
                float _991 = _989 + 1.0;
                _891 = _991;
            }
            float _993 = _891;
            _895 = _993;
            if (!_955)
            {
                _893 = 1.0;
            }
            float _995 = _893;
            float _997 = _995;
            if (!_957)
            {
                _961 = 1.0;
            }
            float _999 = _961;
            float _1001 = _809;
            float _1003 = _999;
            if (_955)
            {
                float _1005 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1001 = _1005;
            }
            float _1007 = _1001;
            float _1009 = _857;
            if (_957)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1009 = _1011;
            }
            float _1013 = _1009;
            if (_953)
            {
                float _1015 = _973 * _965;
                float _1017 = precise::clamp(_1015, 0.0, 1.0);
                _985 = _1017;
            }
            float _1019 = _985;
            if (_955)
            {
                float _1021 = _981 * _1007;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _997 = _1023;
            }
            float _1025 = _997;
            float _1027 = _1019 * _1025;
            if (_957)
            {
                float _1029 = _993 * _1013;
                float _1031 = precise::clamp(_1029, 0.0, 1.0);
                _1003 = _1031;
            }
            float _1033 = _1003;
            float _1035 = _1027 * _1033;
            _911 = _1035;
        }
    }
    _913 = false;
    float _1037 = _905;
    float _1039 = _907;
    float _1041 = _909;
    float _1043 = _895;
    float _1045 = _911;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1037 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1039 + _1051;
    float _1055 = _1049 * _1049;
    float _1057 = fma(_1053, _1053, _1055);
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1063 = !_1061;
    float _1065 = _1041;
    float _1067 = _1039;
    float _1069 = _1037;
    float _1071 = _1043;
    if (!_1063)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _1059 + _1075;
        float _1079 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_1057);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = _1093 + (-1.0);
        float _1101 = fma(_1053, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1049, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = fma(_1093, _1041, _1105);
        _1065 = _1107;
        _1067 = _1101;
        _1069 = _1103;
    }
    float _1109 = _1065;
    float _1111 = _1067;
    float _1113 = _1069;
    float _1115 = -_865;
    float _1117 = _1115 + _1109;
    float _1119 = -_863;
    float _1121 = _1119 + _1111;
    float _1123 = -_867;
    float _1125 = _1123 + _1113;
    float _1127 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * _1117;
    float _1131 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1135 = fma(_1121, _1121, _1129);
    float _1137 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1139 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1133);
    float _1141 = fma(_1125, _1125, _1135);
    float _1143 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1147 = sqrt(_1141);
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    float _1159 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = 1.0;
    bool _1165 = _1147 > 0.0;
    float _1167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1169 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1173 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1177 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1179 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1181 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1163);
    float _1185 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1179);
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1173);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1195 = _1181;
    float _1197 = _1113;
    float _1199 = _1109;
    float _1201 = _1111;
    if (!_1165)
    {
        _1071 = _1111;
    }
    float _1203 = _1071;
    float _1205 = _1203;
    if (!_1165)
    {
        _1195 = _1109;
    }
    float _1207 = _1195;
    bool _1209 = !_1165;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = _239 * _239;
        float _1215 = rsqrt(_1141);
        float _1217 = fma(_279, _279, _1213);
        float _1219 = fma(_281, _281, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1121 * _1215;
        float _1225 = _1117 * _1215;
        float _1227 = _1125 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1217;
        float _1233 = _1215;
        if (!_1229)
        {
            _1231 = _1111;
        }
        float _1235 = _1231;
        _1205 = _1235;
        if (!_1229)
        {
            _1233 = _1109;
        }
        float _1237 = _1233;
        bool _1239 = !_1229;
        _1211 = _1237;
        if (!_1239)
        {
            float _1241 = rsqrt(_1219);
            float _1243 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1245 = _239 * _1241;
            float _1247 = _279 * _1241;
            float _1249 = _281 * _1241;
            float _1251 = _1225 * _1245;
            float _1253 = fma(_1223, _1247, _1251);
            float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1257 = fma(_1227, _1249, _1253);
            float _1259 = _1257 * _1255;
            float _1261 = fma(_279, _1259, _1111);
            float _1263 = fma(_239, _1259, _1109);
            float _1265 = fma(_281, _1259, _1113);
            _1205 = _1261;
            _1211 = _1263;
            _1197 = _1265;
        }
    }
    float _1267 = _1205;
    float _1269 = _1211;
    float _1271 = _1197;
    float _1273 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1193 + _1189;
    float _1277 = _1271;
    if (_1157)
    {
        _1199 = _1267;
    }
    float _1279 = _1199;
    float _1281 = _1279;
    if (_1157)
    {
        _1201 = _1269;
    }
    float _1283 = _1201;
    float _1285 = _1283;
    if (!_1157)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _865 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _863 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_865;
        float _1299 = _1297 + _1269;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _867 + _1303;
        float _1307 = fma(_1293, _1293, _1301);
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1311 = fma(_1305, _1305, _1307);
        float _1313 = sqrt(_1311);
        float _1315 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1313, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1309;
        float _1321 = -_863;
        float _1323 = _1321 + _1267;
        float _1325 = _1315 * _1319;
        float _1327 = -_867;
        float _1329 = _1327 + _1271;
        float _1331 = fma(_1323, _1325, _863);
        float _1333 = fma(_1299, _1325, _865);
        float _1335 = fma(_1329, _1325, _867);
        _1285 = _1333;
        _1281 = _1331;
        _1277 = _1335;
    }
    float _1337 = _1285;
    float _1339 = _1281;
    float _1341 = _1277;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1343);
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1347);
    float _1357 = -_239;
    float _1359 = _1357 + _1337;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1355);
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_279;
    float _1375 = _1373 + _1339;
    float _1377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1183);
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1381 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1383 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1365);
    float _1385 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1379);
    float _1389 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1391 = 1.0 / _1381;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1399 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1397);
    float _1407 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1401);
    float _1411 = 1.0 / _1403;
    float _1413 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1417 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1419 = -_281;
    float _1421 = _1419 + _1341;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1425 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1427 = _1389 * _1391;
    float _1429 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1417);
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1425);
    float _1435 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1437 = _1427 > 0.0;
    float _1439 = _1429 + _1403;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1433);
    float _1443 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1445 = _1431 * _1411;
    bool _1447 = _1427 < 1.0;
    bool _1449 = _1447 && _1437;
    float _1451 = _1439 * 0.5;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1455 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1457 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1459 = _1423 * _1411;
    bool _1461 = _1445 > (-1.0);
    bool _1463 = _1461 && _1449;
    out.gl_Position.x = _1431;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1429;
    out.gl_Position.w = _1403;
    float _1465 = 1.0 / _1453;
    bool _1467 = _1459 > (-1.0);
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1455);
    float _1473 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1457);
    out.m_64.z = _1451;
    out.m_64.w = _1403;
    bool _1475 = _1445 < 1.0;
    bool _1477 = _1475 && _1469;
    float _1479 = _1435 + _1187;
    float _1481 = _1443 + _1185;
    float _1483 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1471);
    bool _1485 = _1459 < 1.0;
    bool _1487 = _1485 && _1477;
    float _1489 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1473);
    float _1491 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1499 = _1491 * _1391;
    float _1501 = _1493 * _1391;
    float _1503 = _1495 * _1465;
    float _1505 = _1497 * _1465;
    bool _1507 = !_1487;
    float _1541;
    if (!_1507)
    {
        float _1509 = -_1501;
        float _1511 = _1459 + _1509;
        float _1513 = -_1499;
        float _1515 = _1445 + _1513;
        float _1517 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _1519 = -_1503;
        float _1521 = _1445 + _1519;
        float _1523 = _1511 * _1511;
        float _1525 = -_1505;
        float _1527 = _1459 + _1525;
        float _1529 = fma(_1515, _1515, _1523);
        float _1531 = sqrt(_1529);
        bool _1533 = _1531 > 0.0;
        float _1535 = _1531;
        if (!_1533)
        {
            _1535 = _1517;
        }
        float _1537 = _1535;
        bool _1539 = !_1533;
        _1541 = _1537;
        _1543 = _1539;
        if (!_1543)
        {
            float _1545 = _1527 * _1527;
            float _1547 = fma(_1521, _1521, _1545);
            float _1549 = rsqrt(_1529);
            float _1551 = sqrt(_1547);
            float _1553 = _1515 * _1549;
            float _1555 = _1511 * _1549;
            bool _1557 = _1551 > 0.0;
            float _1559 = _1549;
            if (!_1557)
            {
                _1559 = _1517;
            }
            float _1561 = _1559;
            bool _1563 = !_1557;
            _1541 = _1561;
            _1543 = _1563;
            if (!_1543)
            {
                float _1565 = _665 * _1273;
                float _1567 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1193);
                float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
                float _1573 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1569);
                float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1435);
                float _1577 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
                float _1579 = rsqrt(_1547);
                float _1581 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
                float _1583 = _1567 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1585 = 1.0 / _1573;
                float _1587 = _1527 * _1583;
                float _1589 = _1521 * _1583;
                float _1591 = _1587 * _1587;
                float _1593 = fma(_1589, _1589, _1591);
                float _1595 = _1577 * _1585;
                float _1597 = _1581 * _1585;
                float _1599 = sqrt(_1593);
                float _1601 = _1595 * _1595;
                float _1603 = fma(_1597, _1597, _1601);
                float _1605 = _1527 * _1579;
                float _1607 = _1521 * _1579;
                float _1609 = sqrt(_1603);
                float _1611 = _1555 * _1605;
                float _1613 = fma(_1553, _1607, _1611);
                float _1615 = precise::min(0.0, _1613);
                float _1617 = _1403 * _1615;
                float _1619 = fma(_1599, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1609);
                float _1621 = fma(_1589, _1617, _1431);
                float _1623 = 1.0 / _1619;
                float _1625 = fma(_1587, _1617, _1423);
                out.gl_Position.x = _1621;
                out.gl_Position.y = _1625;
                float _1627 = _1609 * _1623;
                out.m_62.y = _1627;
                _1541 = _1517;
                _1543 = true;
            }
        }
    }
    else
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1629;
        _1541 = 0.0;
    }
    _1543 = false;
    float _1631 = _1541;
    float _1633 = _1631 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_37.x = _1633;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1543 = false;
    bool _913 = false;
    bool _901 = false;
    bool _497 = false;
    bool _305 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_34.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_37.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1690 = as_type<float>(_99);
        out.gl_Position.z = _1690;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_39.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_37.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1759 = as_type<float>(_135);
        out.gl_Position.z = _1759;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_41.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = in.m_46.x;
    float _147 = in.m_46.y;
    float _149 = in.m_46.z;
    float _151 = in.m_48.x;
    float _153 = in.m_48.y;
    float _155 = in.m_48.z;
    float _157 = in.m_50.x;
    float _159 = in.m_50.y;
    float _161 = in.m_50.z;
    float _163 = _141 * _139;
    float _165 = in.m_52.x;
    float _167 = in.m_52.y;
    float _169 = in.m_52.z;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    int _173 = as_type<int>(_143) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_143) & 2;
    bool _179 = _177 != 0;
    float _181 = _171 * 6.283185482025146484375;
    float _183 = floor(_171);
    float _185 = _181 * 0.15915493667125701904296875;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_179;
    int _193 = _191 ? (-1090519040) : 1056964608;
    int _195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _197 = _195 != 0;
    int _199 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _201 = _199 != 0;
    float _203 = _147 * _153;
    float _205 = _147 * _159;
    float _207 = _185 * 6.283185482025146484375;
    float _209 = cos(_207);
    bool _211 = !_175;
    int _213 = _211 ? (-1090519040) : 1056964608;
    float _215 = fma(_145, _151, _203);
    float _217 = _147 * _167;
    bool _219 = !_197;
    int _221 = _219 ? 0 : 1;
    float _223 = fma(_145, _157, _205);
    bool _225 = !_189;
    int _227 = _225 ? 0 : 1;
    float _229 = fma(_145, _165, _217);
    int _231 = abs(_221);
    out.m_54.x = as_type<float>(_213);
    out.m_54.y = as_type<float>(_193);
    int _233 = abs(_227);
    float _235 = -_183;
    float _237 = _171 + _235;
    float _239 = fma(_149, _161, _223);
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = -_237;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_231);
    float _249 = fma(_209, 0.5, 0.5);
    bool _251 = !_201;
    int _253 = _251 ? 0 : 1;
    bool _255 = _237 < 0.5;
    float _257 = float(_255);
    float _259 = abs(_245);
    float _261 = _247 * _259;
    int _263 = abs(_253);
    float _265 = -_249;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = float(_233);
    float _271 = -_257;
    float _273 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _275 = float(_263);
    float _277 = fma(_269, _267, _261);
    float _279 = fma(_149, _155, _215);
    float _281 = fma(_149, _169, _229);
    float _283 = abs(_273);
    float _285 = fma(_275, _283, _277);
    bool _287 = !_241;
    float _303;
    if (!_287)
    {
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _295 = _293 * _289;
        float _297 = floor(_295);
        float _299 = -_297;
        float _301 = _295 + _299;
        _303 = _301;
        _305 = true;
    }
    else
    {
        float _307 = float(_83);
        float _309 = 1.0 / _307;
        float _311 = _117 * _309;
        _303 = _311;
    }
    _305 = false;
    float _313 = _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _317 = _313 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _313 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = 1.0 / _329;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _343 = 1.0 / _337;
    bool _345 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _347 = isnan(_313);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    float _357 = 1.0 / _333;
    float _359 = _317 * _339;
    bool _361 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_313);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_355;
    float _375 = _373 + 1.0;
    float _377 = _321 * _343;
    bool _379 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_313);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _313 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_313);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = _389 * _375;
    float _405 = -_389;
    float _407 = _405 + 1.0;
    float _409 = _325 * _357;
    float _411 = -_371;
    float _413 = _411 + 1.0;
    float _415 = _401 * _407;
    float _417 = -_401;
    float _419 = _417 + 1.0;
    float _421 = _355 * _413;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _439 = fma(_425, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _441 = fma(_429, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _443 = fma(_433, _409, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = fma(_437, _409, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _447 = _439 * _415;
    float _449 = _441 * _415;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _447);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _457;
    float _461 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _449);
    float _463 = fma(_453, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_443, _403, _455);
    float _467 = fma(_459, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _469 = fma(_445, _403, _461);
    float _471 = fma(_463, _421, _465);
    float _473 = fma(_467, _421, _469);
    float _475 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].x, _471);
    float _477 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[146].y, _473);
    bool _479 = !_341;
    float _495;
    if (!_479)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _483 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_83);
        float _501 = 1.0 / _499;
        float _503 = _117 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = in.m_34.x;
    float _509 = in.m_34.y;
    float _511 = in.m_34.z;
    float _513 = in.m_56.x;
    float _515 = in.m_56.y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _519 = in.m_50.w;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_48.w;
    float _527 = in.m_52.w;
    float _529 = _159 * _509;
    float _531 = _153 * _509;
    float _533 = _475 * _513;
    float _535 = _167 * _509;
    float _537 = fma(_157, _507, _529);
    float _539 = fma(_151, _507, _531);
    float _541 = _477 * _515;
    float _543 = fma(_165, _507, _535);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _553 = fma(_155, _511, _539);
    float _555 = 1.0 / _547;
    float _557 = _285 * _533;
    float _559 = _285 * _541;
    float _561 = fma(_161, _511, _537);
    float _563 = fma(_169, _511, _543);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _567 = 1.0 / _551;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _571 = _505 + _569;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _575 = _561 + _519;
    float _577 = _565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = _573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _585 = _571 * _555;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _591;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _505 + _595;
    float _599 = _553 + _525;
    float _601 = fma(_589, _585, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _575 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _617 = fma(_581, _585, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _619 = fma(_593, _585, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    out.m_58.x = _577;
    out.m_58.y = _583;
    out.m_58.z = _523;
    out.m_58.w = _521;
    bool _621 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _623 = isnan(_505);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _563 + _527;
    bool _635 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _637 = isnan(_505);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -_613;
    float _649 = _647 + 1.0;
    float _651 = _599 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = _645 * _649;
    float _663 = _633 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _665 = _557 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _667 = _597 * _567;
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_193));
    float _671 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _673 = _559 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _675 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    float _685 = _673 * _669;
    float _687 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].x, _675);
    float _689 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _693 = fma(_659, _667, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].x, _687);
    float _697 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].y, _689);
    float _699 = _631 * _683;
    float _701 = _615 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _703 = _695 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].y, _697);
    float _707 = _601 * _699;
    float _709 = _617 * _699;
    float _711 = _619 * _699;
    float _713 = _703 * _671;
    float _715 = _705 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _717 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _719 = fma(_651, (*spvDescriptorSet0.vp_c12)._m0[6].z, _701);
    float _721 = fma(_713, 0.5, 0.5);
    float _723 = _715 * _691;
    float _725 = -_631;
    float _727 = _725 + 1.0;
    float _729 = fma(_663, (*spvDescriptorSet0.vp_c12)._m0[8].z, _719);
    float _731 = fma(_655, _667, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _733 = fma(_723, 0.5, 0.5);
    float _735 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].x, _707);
    float _737 = _729 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _739 = floor(_721);
    float _741 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].z, _711);
    float _743 = fma(_731, _661, _735);
    float _745 = fma(_679, _667, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _747 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[107].y, _709);
    float _749 = fma(_693, _661, _741);
    float _751 = _737 * _717;
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_213));
    float _755 = floor(_733);
    float _757 = fma(_745, _661, _747);
    float _759 = fma(_751, 0.5, 0.5);
    float _761 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].z, _749);
    float _763 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _765 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _767 = _665 * _753;
    float _769 = floor(_759);
    float _771 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].y, _757);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _777 = -_739;
    float _779 = _721 + _777;
    float _781 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[109].x, _743);
    float _783 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].x, _763);
    float _787 = -_755;
    float _789 = _733 + _787;
    float _791 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].x, _765);
    float _793 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _795 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _797 = fma(_789, 2.0, -1.0);
    float _799 = _775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = fma(_779, 2.0, -1.0);
    float _803 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].z, _785);
    float _805 = _797 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _807 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].z, _791);
    float _809 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _811 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].z, _793);
    float _813 = _801 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _815 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _817 = _781 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = -_769;
    float _821 = _759 + _819;
    float _823 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _825 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].y, _815);
    float _827 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = fma(_821, 2.0, -1.0);
    float _831 = _805 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    bool _833 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _835 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _837 = _833 || _835;
    bool _839 = isnan(1.0);
    bool _841 = _837 || _839;
    float _843 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].z, _823);
    float _845 = _829 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _847 = fma(_813, (*spvDescriptorSet0.vp_c12)._m0[2].x, _831);
    float _849 = _803 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].y, _825);
    float _853 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].x, _847);
    float _855 = fma(_845, (*spvDescriptorSet0.vp_c12)._m0[4].z, _843);
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _859 = _807 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _861 = _811 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _863 = _853 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _865 = _851 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _867 = _855 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    out.m_60.x = _827;
    out.m_60.y = _809;
    out.m_60.z = _799;
    out.m_60.w = _857;
    float _869 = _849 + _863;
    float _871 = _861 + _867;
    float _873 = _859 + _865;
    float _875 = _823;
    float _877 = _799;
    float _879 = _811;
    float _881 = _859;
    float _883 = _859;
    float _885 = _801;
    float _887 = _797;
    float _889 = _861;
    float _891 = _829;
    float _893 = _851;
    float _895 = _829;
    float _905;
    float _907;
    float _909;
    float _911;
    if (!_841)
    {
        bool _897 = _865 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _899 = !_897;
        _901 = _899;
        if (!_901)
        {
            float _903 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _905 = _903;
            _907 = 0.0;
            _909 = 0.0;
            _911 = 0.0;
            _913 = true;
        }
    }
    if ((!_913) || _901)
    {
        bool _949;
        if (!_901)
        {
            bool _915 = _865 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _917 = isnan(_865);
            bool _919 = _915 || _917;
            bool _921 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _923 = _919 || _921;
            bool _925 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _927 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _929 = !_923;
            bool _931 = _927 && _929;
            if (_931)
            {
                _875 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _933 = _875;
            float _935 = _933;
            if (_931)
            {
                _877 = 0.0;
            }
            float _937 = _877;
            _907 = _937;
            if (_931)
            {
                _879 = 0.0;
            }
            float _939 = _879;
            _909 = _939;
            if (_931)
            {
                float _941 = _933 * 5.0;
                _935 = _941;
            }
            float _943 = _935;
            _905 = _943;
            if (_931)
            {
                _881 = 0.0;
            }
            float _945 = _881;
            bool _947 = !_923;
            _949 = _947 && _925;
            _883 = _945;
            _911 = _945;
        }
        if ((!_949) || _901)
        {
            _901 = false;
            float _951 = _883;
            bool _953 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _955 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _957 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _959 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            float _961 = _951;
            _905 = _871;
            _907 = _869;
            _909 = _873;
            if (_953)
            {
                float _963 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _959 = _963;
            }
            float _965 = _959;
            if (_953)
            {
                float _967 = abs(_801);
                float _969 = -_967;
                float _971 = _969 + 1.0;
                _885 = _971;
            }
            float _973 = _885;
            if (_955)
            {
                float _975 = abs(_797);
                float _977 = -_975;
                float _979 = _977 + 1.0;
                _887 = _979;
            }
            float _981 = _887;
            if (!_953)
            {
                _889 = 1.0;
            }
            float _983 = _889;
            float _985 = _983;
            if (_957)
            {
                float _987 = abs(_829);
                float _989 = -_987;
                float _991 = _989 + 1.0;
                _891 = _991;
            }
            float _993 = _891;
            _895 = _993;
            if (!_955)
            {
                _893 = 1.0;
            }
            float _995 = _893;
            float _997 = _995;
            if (!_957)
            {
                _961 = 1.0;
            }
            float _999 = _961;
            float _1001 = _809;
            float _1003 = _999;
            if (_955)
            {
                float _1005 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _1001 = _1005;
            }
            float _1007 = _1001;
            float _1009 = _857;
            if (_957)
            {
                float _1011 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _1009 = _1011;
            }
            float _1013 = _1009;
            if (_953)
            {
                float _1015 = _973 * _965;
                float _1017 = precise::clamp(_1015, 0.0, 1.0);
                _985 = _1017;
            }
            float _1019 = _985;
            if (_955)
            {
                float _1021 = _981 * _1007;
                float _1023 = precise::clamp(_1021, 0.0, 1.0);
                _997 = _1023;
            }
            float _1025 = _997;
            float _1027 = _1019 * _1025;
            if (_957)
            {
                float _1029 = _993 * _1013;
                float _1031 = precise::clamp(_1029, 0.0, 1.0);
                _1003 = _1031;
            }
            float _1033 = _1003;
            float _1035 = _1027 * _1033;
            _911 = _1035;
        }
    }
    _913 = false;
    float _1037 = _905;
    float _1039 = _907;
    float _1041 = _909;
    float _1043 = _895;
    float _1045 = _911;
    float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1049 = _1037 + _1047;
    float _1051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1053 = _1039 + _1051;
    float _1055 = _1049 * _1049;
    float _1057 = fma(_1053, _1053, _1055);
    float _1059 = sqrt(_1057);
    bool _1061 = _1059 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1063 = !_1061;
    float _1065 = _1041;
    float _1067 = _1039;
    float _1069 = _1037;
    float _1071 = _1043;
    if (!_1063)
    {
        float _1073 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1075 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1077 = _1059 + _1075;
        float _1079 = _1041 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1081 = rsqrt(_1057);
        float _1083 = _1077 * _1073;
        float _1085 = _1083 * 0.15915493667125701904296875;
        float _1087 = _1085 * 6.283185482025146484375;
        float _1089 = sin(_1087);
        float _1091 = _1085 * 6.283185482025146484375;
        float _1093 = cos(_1091);
        float _1095 = fma(_1089, _1079, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1097 = _1081 * _1095;
        float _1099 = _1093 + (-1.0);
        float _1101 = fma(_1053, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1103 = fma(_1049, _1097, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1105 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1107 = fma(_1093, _1041, _1105);
        _1065 = _1107;
        _1067 = _1101;
        _1069 = _1103;
    }
    float _1109 = _1065;
    float _1111 = _1067;
    float _1113 = _1069;
    float _1115 = -_865;
    float _1117 = _1115 + _1109;
    float _1119 = -_863;
    float _1121 = _1119 + _1111;
    float _1123 = -_867;
    float _1125 = _1123 + _1113;
    float _1127 = _865 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1129 = _1117 * _1117;
    float _1131 = _865 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1133 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1127);
    float _1135 = fma(_1121, _1121, _1129);
    float _1137 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1131);
    float _1139 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1133);
    float _1141 = fma(_1125, _1125, _1135);
    float _1143 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1137);
    float _1145 = _1139 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1147 = sqrt(_1141);
    bool _1149 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.5);
    bool _1157 = _1153 || _1155;
    float _1159 = _865 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1161 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1163 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.y = 1.0;
    bool _1165 = _1147 > 0.0;
    float _1167 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1159);
    float _1169 = _865 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1171 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1167);
    float _1173 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1169);
    float _1175 = _1171 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1177 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1179 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1181 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1183 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1163);
    float _1185 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1161);
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1179);
    float _1189 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1181);
    float _1191 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1173);
    float _1193 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _1195 = _1181;
    float _1197 = _1113;
    float _1199 = _1109;
    float _1201 = _1111;
    if (!_1165)
    {
        _1071 = _1111;
    }
    float _1203 = _1071;
    float _1205 = _1203;
    if (!_1165)
    {
        _1195 = _1109;
    }
    float _1207 = _1195;
    bool _1209 = !_1165;
    float _1211 = _1207;
    if (!_1209)
    {
        float _1213 = _239 * _239;
        float _1215 = rsqrt(_1141);
        float _1217 = fma(_279, _279, _1213);
        float _1219 = fma(_281, _281, _1217);
        float _1221 = sqrt(_1219);
        float _1223 = _1121 * _1215;
        float _1225 = _1117 * _1215;
        float _1227 = _1125 * _1215;
        bool _1229 = _1221 > 0.0;
        float _1231 = _1217;
        float _1233 = _1215;
        if (!_1229)
        {
            _1231 = _1111;
        }
        float _1235 = _1231;
        _1205 = _1235;
        if (!_1229)
        {
            _1233 = _1109;
        }
        float _1237 = _1233;
        bool _1239 = !_1229;
        _1211 = _1237;
        if (!_1239)
        {
            float _1241 = rsqrt(_1219);
            float _1243 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1245 = _239 * _1241;
            float _1247 = _279 * _1241;
            float _1249 = _281 * _1241;
            float _1251 = _1225 * _1245;
            float _1253 = fma(_1223, _1247, _1251);
            float _1255 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1257 = fma(_1227, _1249, _1253);
            float _1259 = _1257 * _1255;
            float _1261 = fma(_279, _1259, _1111);
            float _1263 = fma(_239, _1259, _1109);
            float _1265 = fma(_281, _1259, _1113);
            _1205 = _1261;
            _1211 = _1263;
            _1197 = _1265;
        }
    }
    float _1267 = _1205;
    float _1269 = _1211;
    float _1271 = _1197;
    float _1273 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1275 = _1193 + _1189;
    float _1277 = _1271;
    if (_1157)
    {
        _1199 = _1267;
    }
    float _1279 = _1199;
    float _1281 = _1279;
    if (_1157)
    {
        _1201 = _1269;
    }
    float _1283 = _1201;
    float _1285 = _1283;
    if (!_1157)
    {
        float _1287 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1289 = _865 + _1287;
        float _1291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1293 = _863 + _1291;
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1297 = -_865;
        float _1299 = _1297 + _1269;
        float _1301 = _1289 * _1289;
        float _1303 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1305 = _867 + _1303;
        float _1307 = fma(_1293, _1293, _1301);
        float _1309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1311 = fma(_1305, _1305, _1307);
        float _1313 = sqrt(_1311);
        float _1315 = _1295 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1317 = precise::min(_1313, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1319 = _1317 * _1309;
        float _1321 = -_863;
        float _1323 = _1321 + _1267;
        float _1325 = _1315 * _1319;
        float _1327 = -_867;
        float _1329 = _1327 + _1271;
        float _1331 = fma(_1323, _1325, _863);
        float _1333 = fma(_1299, _1325, _865);
        float _1335 = fma(_1329, _1325, _867);
        _1285 = _1333;
        _1281 = _1331;
        _1277 = _1335;
    }
    float _1337 = _1285;
    float _1339 = _1281;
    float _1341 = _1277;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1351 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1343);
    float _1353 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1347);
    float _1357 = -_239;
    float _1359 = _1357 + _1337;
    float _1361 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1351);
    float _1363 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1349);
    float _1367 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1355);
    float _1369 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1371 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1373 = -_279;
    float _1375 = _1373 + _1339;
    float _1377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1183);
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1381 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1275);
    float _1383 = fma(_1341, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1365);
    float _1385 = _1367 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1379);
    float _1389 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1391 = 1.0 / _1381;
    float _1393 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1395 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1387);
    float _1397 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1399 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1401 = _1369 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1403 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1395);
    float _1405 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1397);
    float _1407 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1399);
    float _1409 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1401);
    float _1411 = 1.0 / _1403;
    float _1413 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1405);
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1407);
    float _1417 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1409);
    float _1419 = -_281;
    float _1421 = _1419 + _1341;
    float _1423 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1413);
    float _1425 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _1427 = _1389 * _1391;
    float _1429 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1417);
    float _1431 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1415);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[638].x, _1425);
    float _1435 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    bool _1437 = _1427 > 0.0;
    float _1439 = _1429 + _1403;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[638].z, _1433);
    float _1443 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _1445 = _1431 * _1411;
    bool _1447 = _1427 < 1.0;
    bool _1449 = _1447 && _1437;
    float _1451 = _1439 * 0.5;
    float _1453 = _1441 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _1455 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _1457 = _1359 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _1459 = _1423 * _1411;
    bool _1461 = _1445 > (-1.0);
    bool _1463 = _1461 && _1449;
    out.gl_Position.x = _1431;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1429;
    out.gl_Position.w = _1403;
    float _1465 = 1.0 / _1453;
    bool _1467 = _1459 > (-1.0);
    bool _1469 = _1467 && _1463;
    float _1471 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[635].x, _1455);
    float _1473 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[636].x, _1457);
    out.m_64.z = _1451;
    out.m_64.w = _1403;
    bool _1475 = _1445 < 1.0;
    bool _1477 = _1475 && _1469;
    float _1479 = _1435 + _1187;
    float _1481 = _1443 + _1185;
    float _1483 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[635].z, _1471);
    bool _1485 = _1459 < 1.0;
    bool _1487 = _1485 && _1477;
    float _1489 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[636].z, _1473);
    float _1491 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1479);
    float _1493 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1481);
    float _1495 = _1483 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _1497 = _1489 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _1499 = _1491 * _1391;
    float _1501 = _1493 * _1391;
    float _1503 = _1495 * _1465;
    float _1505 = _1497 * _1465;
    bool _1507 = !_1487;
    float _1541;
    if (!_1507)
    {
        float _1509 = -_1501;
        float _1511 = _1459 + _1509;
        float _1513 = -_1499;
        float _1515 = _1445 + _1513;
        float _1517 = _1045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _1519 = -_1503;
        float _1521 = _1445 + _1519;
        float _1523 = _1511 * _1511;
        float _1525 = -_1505;
        float _1527 = _1459 + _1525;
        float _1529 = fma(_1515, _1515, _1523);
        float _1531 = sqrt(_1529);
        bool _1533 = _1531 > 0.0;
        float _1535 = _1531;
        if (!_1533)
        {
            _1535 = _1517;
        }
        float _1537 = _1535;
        bool _1539 = !_1533;
        _1541 = _1537;
        _1543 = _1539;
        if (!_1543)
        {
            float _1545 = _1527 * _1527;
            float _1547 = fma(_1521, _1521, _1545);
            float _1549 = rsqrt(_1529);
            float _1551 = sqrt(_1547);
            float _1553 = _1515 * _1549;
            float _1555 = _1511 * _1549;
            bool _1557 = _1551 > 0.0;
            float _1559 = _1549;
            if (!_1557)
            {
                _1559 = _1517;
            }
            float _1561 = _1559;
            bool _1563 = !_1557;
            _1541 = _1561;
            _1543 = _1563;
            if (!_1543)
            {
                float _1565 = _665 * _1273;
                float _1567 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
                float _1569 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1193);
                float _1571 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1443);
                float _1573 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1569);
                float _1575 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1435);
                float _1577 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1571);
                float _1579 = rsqrt(_1547);
                float _1581 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1575);
                float _1583 = _1567 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _1585 = 1.0 / _1573;
                float _1587 = _1527 * _1583;
                float _1589 = _1521 * _1583;
                float _1591 = _1587 * _1587;
                float _1593 = fma(_1589, _1589, _1591);
                float _1595 = _1577 * _1585;
                float _1597 = _1581 * _1585;
                float _1599 = sqrt(_1593);
                float _1601 = _1595 * _1595;
                float _1603 = fma(_1597, _1597, _1601);
                float _1605 = _1527 * _1579;
                float _1607 = _1521 * _1579;
                float _1609 = sqrt(_1603);
                float _1611 = _1555 * _1605;
                float _1613 = fma(_1553, _1607, _1611);
                float _1615 = precise::min(0.0, _1613);
                float _1617 = _1403 * _1615;
                float _1619 = fma(_1599, (*spvDescriptorSet0.vp_c13)._m0[1].x, _1609);
                float _1621 = fma(_1589, _1617, _1431);
                float _1623 = 1.0 / _1619;
                float _1625 = fma(_1587, _1617, _1423);
                out.gl_Position.x = _1621;
                out.gl_Position.y = _1625;
                float _1627 = _1609 * _1623;
                out.m_62.y = _1627;
                _1541 = _1517;
                _1543 = true;
            }
        }
    }
    else
    {
        float _1629 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _1629;
        _1541 = 0.0;
    }
    _1543 = false;
    float _1631 = _1541;
    float _1633 = _1631 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_37.x = _1633;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

