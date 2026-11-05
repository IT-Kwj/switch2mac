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
    float4 m_54 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_30 [[attribute(5)]];
    float4 m_35 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_40 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_91);
        out.gl_Position.z = _1192;
    }
    if (!_79)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1261 = as_type<float>(_127);
        out.gl_Position.z = _1261;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_40.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_35.x;
    float _147 = in.m_35.y;
    float _149 = in.m_35.z;
    float _151 = in.m_30.x;
    float _153 = in.m_30.y;
    float _155 = in.m_30.z;
    int _157 = as_type<int>(_129) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_129) & 2;
    bool _163 = _161 != 0;
    float _165 = _129;
    float _167 = _131;
    if (!_143)
    {
        float _169 = _131 * _131;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_159;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _173;
    if (!_143)
    {
        float _181 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _183;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _297 + _315;
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _339 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _341 = isnan(_297);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_313;
    float _353 = _351 + 1.0;
    float _355 = 1.0 / _333;
    float _357 = _349 * _353;
    float _359 = -_349;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _363;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _337;
    float _371 = _329 * _361;
    float _373 = -_329;
    float _375 = _373 + 1.0;
    float _377 = _301 * _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _317 * _369;
    float _395 = _387 * _371;
    float _397 = _389 * _371;
    float _399 = _391 * _371;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _413 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].x, _395);
    float _415 = fma(_403, _393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_407, _393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].y, _397);
    float _421 = fma(_411, _393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _423 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].z, _399);
    float _425 = fma(_415, _357, _413);
    float _427 = fma(_417, _357, _419);
    float _429 = fma(_421, _357, _423);
    float _431 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].x, _425);
    float _433 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].y, _427);
    float _435 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].z, _429);
    bool _437 = !_367;
    float _455;
    if (!_437)
    {
        float _439 = in.m_42.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_75);
        float _461 = 1.0 / _459;
        float _463 = _109 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = in.m_44.w;
    float _475 = in.m_46.x;
    float _477 = in.m_46.y;
    float _479 = in.m_46.z;
    float _481 = in.m_46.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = in.m_48.x;
    float _493 = in.m_48.y;
    float _495 = in.m_48.z;
    float _497 = in.m_48.w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = in.m_40.x;
    float _503 = in.m_40.y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = in.m_42.x;
    float _511 = in.m_42.y;
    float _513 = _265 * _469;
    float _515 = fma(_263, _467, _513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _265 * _477;
    float _523 = _265 * _493;
    float _525 = fma(_267, _471, _515);
    float _527 = 1.0 / _519;
    float _529 = fma(_263, _475, _521);
    float _531 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _533 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _537 = fma(_263, _491, _523);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _543 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = fma(_267, _479, _529);
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _553 = _543 * _541;
    float _555 = fma(_267, _495, _537);
    bool _557 = _509 > 0.5;
    float _559 = _549 + _481;
    float _561 = _547 * _527;
    float _563 = _539 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _465 + _565;
    bool _569 = _511 > 0.5;
    float _571 = _555 + _497;
    float _573 = _563 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _575 = _563 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _573);
    float _581 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _581);
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _595 = _525 + _473;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _571 + _591;
    float _603 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _595 + _593;
    float _609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _611 = _601 + _609;
    float _613 = _559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _615 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_465);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _607 + _627;
    float _631 = _611 * _611;
    out.m_50.x = _603;
    out.m_50.y = _605;
    out.m_50.z = _507;
    out.m_50.w = _505;
    float _633 = 1.0 / _599;
    bool _635 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_465);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _563 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _647);
    float _655 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _653);
    float _657 = -_187;
    float _659 = _569 ? _657 : _187;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _663 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[11].x, _613);
    float _665 = fma(_629, _629, _631);
    float _667 = -_625;
    float _669 = _667 + 1.0;
    float _671 = _559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _673 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _663);
    bool _675 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _677 = isnan(_465);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _645 * _669;
    float _689 = sqrt(_665);
    float _691 = _673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[10].x, _671);
    float _699 = _651 * _633;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _465 + _701;
    float _705 = _685 * _695;
    float _707 = -_177;
    int _709 = _557 ? as_type<int>(_707) : as_type<int>(_177);
    float _711 = 1.0 / _691;
    float _713 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _577 * _705;
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _655 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _723 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _725 = fma(_699, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    bool _729 = _689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = _723 + _691;
    bool _733 = !_485;
    float _735 = _733 ? _177 : as_type<float>(_709);
    float _737 = _559 + _721;
    float _739 = fma(_725, _687, _727);
    bool _741 = !_489;
    float _743 = _741 ? _187 : _659;
    float _745 = _731 * _711;
    float _747 = _745 * 0.5;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _739);
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _761);
    float _765 = _659;
    float _767 = _721;
    float _769 = _607;
    float _771 = _611;
    if (!_729)
    {
        _765 = _601;
    }
    float _773 = _765;
    float _775 = _773;
    if (!_729)
    {
        _767 = _737;
    }
    float _777 = _767;
    bool _779 = !_729;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _689 + _785;
        float _789 = rsqrt(_665);
        float _791 = _787 * _783;
        float _793 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        float _805 = _799 + (-1.0);
        float _807 = fma(_803, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _789 * _807;
        float _813 = fma(_737, _799, _809);
        float _815 = fma(_629, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _817 = fma(_611, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _769 = _815;
        _781 = _813;
        _775 = _817;
    }
    float _819 = _769;
    float _821 = _781;
    float _823 = _775;
    float _825 = _821;
    float _827 = _823;
    if (_757)
    {
        _771 = _819;
    }
    float _829 = _771;
    float _831 = _829;
    if (!_757)
    {
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _835 = _559 + _833;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _839 = _595 + _837;
        float _841 = -_595;
        float _843 = _841 + _819;
        float _845 = -_559;
        float _847 = _845 + _821;
        float _849 = _835 * _835;
        float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _853 = _571 + _851;
        float _855 = -_571;
        float _857 = _855 + _823;
        float _859 = fma(_839, _839, _849);
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _863 = fma(_853, _853, _859);
        float _865 = sqrt(_863);
        float _867 = precise::min(_865, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _869 = _867 * _861;
        float _871 = fma(_843, _869, _595);
        float _873 = fma(_847, _869, _559);
        float _875 = fma(_857, _869, _571);
        _825 = _873;
        _831 = _871;
        _827 = _875;
    }
    float _877 = _825;
    float _879 = _831;
    float _881 = _827;
    float _883 = 1.0 / _763;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _893 = _889 || _891;
    float _895 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _909 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _911 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _907);
    float _917 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _909);
    float _919 = _909;
    float _921 = _901;
    if (_893)
    {
        _919 = 1.0;
    }
    float _923 = _919;
    float _925 = _911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _927 = _923;
    if (_893)
    {
        _921 = 1.0;
    }
    float _929 = _921;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _933 = _883 * _931;
    float _935 = _929;
    if (!_893)
    {
        float _937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _943 = _939 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 0.15915493667125701904296875;
        float _949 = _939 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = 1.0 / _945;
        float _955 = _947 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _951 * _953;
        float _961 = _947 * 6.283185482025146484375;
        float _963 = sin(_961);
        float _965 = _957 * _959;
        float _967 = 1.0 / _965;
        float _969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _971 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _969;
        float _973 = 1.0 / _971;
        float _975 = _963 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_933, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _927 = _983;
    }
    float _985 = _927;
    if (!_893)
    {
        float _987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _991 = _987 * 0.15915493667125701904296875;
        float _993 = _989 * 0.15915493667125701904296875;
        float _995 = _991 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = sin(_999);
        float _1003 = 1.0 / _997;
        float _1005 = _993 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1001 * _1003;
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = _1007 * _1009;
        float _1017 = 1.0 / _1015;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1019;
        float _1023 = 1.0 / _1021;
        float _1025 = _1013 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = fma(_933, _1025, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        float _1035 = -_1033;
        float _1037 = _1035 + 1.0;
        _935 = _1037;
    }
    float _1039 = _935;
    float _1041 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _925 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _925 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _925 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _925 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    bool _1057 = _985 > 0.0;
    bool _1059 = isnan(_985);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1069 = _735 + 0.5;
    float _1071 = _915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1075 = _985 * _1039;
    bool _1077 = _1039 <= 0.0;
    bool _1079 = !_1065;
    bool _1081 = _1077 || _1079;
    float _1083 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1055);
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1093 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = _1083 * _661;
    float _1097 = -_743;
    float _1099 = _1097 + 0.5;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1085);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1089);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1091);
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1113 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1115 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1117 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1107 + _1109;
    float _1121 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1123 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1125 = _1111 * _1073;
    float _1127 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * 0.5;
    out.m_52.x = _1095;
    out.m_52.y = _1125;
    out.m_54.x = _1127;
    out.m_54.y = _1129;
    out.m_54.z = _1131;
    out.m_54.w = _1121;
    out.m_33.x = _1123;
    out.gl_Position.x = _1103;
    out.gl_Position.y = _1105;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _1109;
    out.m_56.z = _1133;
    out.m_56.w = _1109;
    if (!_1081)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_33.x = 0.0;
    float _1135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1135;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_91);
        out.gl_Position.z = _1192;
    }
    if (!_79)
    {
        return out;
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1261 = as_type<float>(_127);
        out.gl_Position.z = _1261;
    }
    if (_119)
    {
        return out;
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_40.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_35.x;
    float _147 = in.m_35.y;
    float _149 = in.m_35.z;
    float _151 = in.m_30.x;
    float _153 = in.m_30.y;
    float _155 = in.m_30.z;
    int _157 = as_type<int>(_129) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_129) & 2;
    bool _163 = _161 != 0;
    float _165 = _129;
    float _167 = _131;
    if (!_143)
    {
        float _169 = _131 * _131;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_159;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _173;
    if (!_143)
    {
        float _181 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _183;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _297 + _315;
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _339 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _341 = isnan(_297);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_313;
    float _353 = _351 + 1.0;
    float _355 = 1.0 / _333;
    float _357 = _349 * _353;
    float _359 = -_349;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _363;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _337;
    float _371 = _329 * _361;
    float _373 = -_329;
    float _375 = _373 + 1.0;
    float _377 = _301 * _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _317 * _369;
    float _395 = _387 * _371;
    float _397 = _389 * _371;
    float _399 = _391 * _371;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _413 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].x, _395);
    float _415 = fma(_403, _393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_407, _393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].y, _397);
    float _421 = fma(_411, _393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _423 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].z, _399);
    float _425 = fma(_415, _357, _413);
    float _427 = fma(_417, _357, _419);
    float _429 = fma(_421, _357, _423);
    float _431 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].x, _425);
    float _433 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].y, _427);
    float _435 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].z, _429);
    bool _437 = !_367;
    float _455;
    if (!_437)
    {
        float _439 = in.m_42.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_75);
        float _461 = 1.0 / _459;
        float _463 = _109 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = in.m_44.w;
    float _475 = in.m_46.x;
    float _477 = in.m_46.y;
    float _479 = in.m_46.z;
    float _481 = in.m_46.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = in.m_48.x;
    float _493 = in.m_48.y;
    float _495 = in.m_48.z;
    float _497 = in.m_48.w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = in.m_40.x;
    float _503 = in.m_40.y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = in.m_42.x;
    float _511 = in.m_42.y;
    float _513 = _265 * _469;
    float _515 = fma(_263, _467, _513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _265 * _477;
    float _523 = _265 * _493;
    float _525 = fma(_267, _471, _515);
    float _527 = 1.0 / _519;
    float _529 = fma(_263, _475, _521);
    float _531 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _533 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _537 = fma(_263, _491, _523);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _543 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = fma(_267, _479, _529);
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _553 = _543 * _541;
    float _555 = fma(_267, _495, _537);
    bool _557 = _509 > 0.5;
    float _559 = _549 + _481;
    float _561 = _547 * _527;
    float _563 = _539 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _465 + _565;
    bool _569 = _511 > 0.5;
    float _571 = _555 + _497;
    float _573 = _563 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _575 = _563 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _573);
    float _581 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _581);
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _595 = _525 + _473;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _571 + _591;
    float _603 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _595 + _593;
    float _609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _611 = _601 + _609;
    float _613 = _559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _615 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_465);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _607 + _627;
    float _631 = _611 * _611;
    out.m_50.x = _603;
    out.m_50.y = _605;
    out.m_50.z = _507;
    out.m_50.w = _505;
    float _633 = 1.0 / _599;
    bool _635 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_465);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _563 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _647);
    float _655 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _653);
    float _657 = -_187;
    float _659 = _569 ? _657 : _187;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _663 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[11].x, _613);
    float _665 = fma(_629, _629, _631);
    float _667 = -_625;
    float _669 = _667 + 1.0;
    float _671 = _559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _673 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _663);
    bool _675 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _677 = isnan(_465);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _645 * _669;
    float _689 = sqrt(_665);
    float _691 = _673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[10].x, _671);
    float _699 = _651 * _633;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _465 + _701;
    float _705 = _685 * _695;
    float _707 = -_177;
    int _709 = _557 ? as_type<int>(_707) : as_type<int>(_177);
    float _711 = 1.0 / _691;
    float _713 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _577 * _705;
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _655 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _723 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _725 = fma(_699, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    bool _729 = _689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = _723 + _691;
    bool _733 = !_485;
    float _735 = _733 ? _177 : as_type<float>(_709);
    float _737 = _559 + _721;
    float _739 = fma(_725, _687, _727);
    bool _741 = !_489;
    float _743 = _741 ? _187 : _659;
    float _745 = _731 * _711;
    float _747 = _745 * 0.5;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _739);
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _761);
    float _765 = _659;
    float _767 = _721;
    float _769 = _607;
    float _771 = _611;
    if (!_729)
    {
        _765 = _601;
    }
    float _773 = _765;
    float _775 = _773;
    if (!_729)
    {
        _767 = _737;
    }
    float _777 = _767;
    bool _779 = !_729;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _689 + _785;
        float _789 = rsqrt(_665);
        float _791 = _787 * _783;
        float _793 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        float _805 = _799 + (-1.0);
        float _807 = fma(_803, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _789 * _807;
        float _813 = fma(_737, _799, _809);
        float _815 = fma(_629, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _817 = fma(_611, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _769 = _815;
        _781 = _813;
        _775 = _817;
    }
    float _819 = _769;
    float _821 = _781;
    float _823 = _775;
    float _825 = _821;
    float _827 = _823;
    if (_757)
    {
        _771 = _819;
    }
    float _829 = _771;
    float _831 = _829;
    if (!_757)
    {
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _835 = _559 + _833;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _839 = _595 + _837;
        float _841 = -_595;
        float _843 = _841 + _819;
        float _845 = -_559;
        float _847 = _845 + _821;
        float _849 = _835 * _835;
        float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _853 = _571 + _851;
        float _855 = -_571;
        float _857 = _855 + _823;
        float _859 = fma(_839, _839, _849);
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _863 = fma(_853, _853, _859);
        float _865 = sqrt(_863);
        float _867 = precise::min(_865, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _869 = _867 * _861;
        float _871 = fma(_843, _869, _595);
        float _873 = fma(_847, _869, _559);
        float _875 = fma(_857, _869, _571);
        _825 = _873;
        _831 = _871;
        _827 = _875;
    }
    float _877 = _825;
    float _879 = _831;
    float _881 = _827;
    float _883 = 1.0 / _763;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _893 = _889 || _891;
    float _895 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _909 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _911 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _907);
    float _917 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _909);
    float _919 = _909;
    float _921 = _901;
    if (_893)
    {
        _919 = 1.0;
    }
    float _923 = _919;
    float _925 = _911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _927 = _923;
    if (_893)
    {
        _921 = 1.0;
    }
    float _929 = _921;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _933 = _883 * _931;
    float _935 = _929;
    if (!_893)
    {
        float _937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _943 = _939 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 0.15915493667125701904296875;
        float _949 = _939 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = 1.0 / _945;
        float _955 = _947 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _951 * _953;
        float _961 = _947 * 6.283185482025146484375;
        float _963 = sin(_961);
        float _965 = _957 * _959;
        float _967 = 1.0 / _965;
        float _969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _971 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _969;
        float _973 = 1.0 / _971;
        float _975 = _963 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_933, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _927 = _983;
    }
    float _985 = _927;
    if (!_893)
    {
        float _987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _991 = _987 * 0.15915493667125701904296875;
        float _993 = _989 * 0.15915493667125701904296875;
        float _995 = _991 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = sin(_999);
        float _1003 = 1.0 / _997;
        float _1005 = _993 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1001 * _1003;
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = _1007 * _1009;
        float _1017 = 1.0 / _1015;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1019;
        float _1023 = 1.0 / _1021;
        float _1025 = _1013 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = fma(_933, _1025, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        float _1035 = -_1033;
        float _1037 = _1035 + 1.0;
        _935 = _1037;
    }
    float _1039 = _935;
    float _1041 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _925 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _925 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _925 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _925 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    bool _1057 = _985 > 0.0;
    bool _1059 = isnan(_985);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1069 = _735 + 0.5;
    float _1071 = _915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1075 = _985 * _1039;
    bool _1077 = _1039 <= 0.0;
    bool _1079 = !_1065;
    bool _1081 = _1077 || _1079;
    float _1083 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1055);
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1093 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = _1083 * _661;
    float _1097 = -_743;
    float _1099 = _1097 + 0.5;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1085);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1089);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1091);
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1113 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1115 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1117 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1107 + _1109;
    float _1121 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1123 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1125 = _1111 * _1073;
    float _1127 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * 0.5;
    out.m_52.x = _1095;
    out.m_52.y = _1125;
    out.m_54.x = _1127;
    out.m_54.y = _1129;
    out.m_54.z = _1131;
    out.m_54.w = _1121;
    out.m_33.x = _1123;
    out.gl_Position.x = _1103;
    out.gl_Position.y = _1105;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _1109;
    out.m_56.z = _1133;
    out.m_56.w = _1109;
    if (!_1081)
    {
        return out;
    }
    out.m_33.x = 0.0;
    float _1135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1135;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _70 = in.m_30.w;
    float _72 = trunc(_70);
    int _75 = int(_72);
    bool _79 = _75 >= 1;
    float _81 = 0.0;
    if (!_79)
    {
        _81 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _83 = _81;
    float _85 = _83;
    if (!_79)
    {
        out.m_33.x = 0.0;
    }
    int _87 = 0;
    if (!_79)
    {
        float _89 = _83 * 5.0;
        _87 = as_type<int>(_89);
    }
    int _91 = _87;
    int _93 = _91;
    if (!_79)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1192 = as_type<float>(_91);
        out.gl_Position.z = _1192;
    }
    if (!_79)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _95 = in.m_35.w;
    bool _97 = _95 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _105 = _101 || _103;
    float _107 = -_95;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_105)
    {
        float _111 = float(_75);
        _85 = _111;
    }
    float _113 = _85;
    bool _115 = _109 >= _113;
    bool _117 = !_105;
    bool _119 = _115 || _117;
    float _121 = _113;
    if (_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    if (_119)
    {
        out.m_33.x = 0.0;
    }
    if (_119)
    {
        float _125 = _123 * 5.0;
        _93 = as_type<int>(_125);
    }
    int _127 = _93;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1261 = as_type<float>(_127);
        out.gl_Position.z = _1261;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = as_type<float>(int(gl_VertexIndex));
    float _131 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _133 = in.m_40.w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = in.m_35.x;
    float _147 = in.m_35.y;
    float _149 = in.m_35.z;
    float _151 = in.m_30.x;
    float _153 = in.m_30.y;
    float _155 = in.m_30.z;
    int _157 = as_type<int>(_129) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_129) & 2;
    bool _163 = _161 != 0;
    float _165 = _129;
    float _167 = _131;
    if (!_143)
    {
        float _169 = _131 * _131;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    bool _175 = !_159;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _173;
    if (!_143)
    {
        float _181 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    bool _185 = !_163;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_143;
    float _191 = _183;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _131 * _195;
        float _205 = 1.0 / _199;
        float _207 = _201 * 0.693147182464599609375;
        float _209 = exp2(_203);
        float _211 = 1.0 / _207;
        float _213 = _209 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _211, _131);
        float _219 = _217 * _205;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_143;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _131 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _167 = _245;
    }
    float _247 = _167;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _145, _251);
    float _259 = fma(_247, _147, _253);
    float _261 = fma(_247, _149, _255);
    float _263 = fma(_257, _133, _151);
    float _265 = fma(_259, _133, _153);
    float _267 = fma(_261, _133, _155);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_42.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_75);
        float _293 = 1.0 / _291;
        float _295 = _109 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _301 = _297 + _299;
    bool _303 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _305 = isnan(_297);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _297 + _315;
    bool _319 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _321 = isnan(_297);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _339 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _341 = isnan(_297);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_313;
    float _353 = _351 + 1.0;
    float _355 = 1.0 / _333;
    float _357 = _349 * _353;
    float _359 = -_349;
    float _361 = _359 + 1.0;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _363;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = 1.0 / _337;
    float _371 = _329 * _361;
    float _373 = -_329;
    float _375 = _373 + 1.0;
    float _377 = _301 * _355;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _383;
    float _387 = fma(_365, _377, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _389 = fma(_381, _377, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _391 = fma(_385, _377, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _393 = _317 * _369;
    float _395 = _387 * _371;
    float _397 = _389 * _371;
    float _399 = _391 * _371;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _413 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].x, _395);
    float _415 = fma(_403, _393, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _417 = fma(_407, _393, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _419 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].y, _397);
    float _421 = fma(_411, _393, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _423 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[107].z, _399);
    float _425 = fma(_415, _357, _413);
    float _427 = fma(_417, _357, _419);
    float _429 = fma(_421, _357, _423);
    float _431 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].x, _425);
    float _433 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].y, _427);
    float _435 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[109].z, _429);
    bool _437 = !_367;
    float _455;
    if (!_437)
    {
        float _439 = in.m_42.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        float _459 = float(_75);
        float _461 = 1.0 / _459;
        float _463 = _109 * _461;
        _455 = _463;
    }
    _457 = false;
    float _465 = _455;
    float _467 = in.m_44.x;
    float _469 = in.m_44.y;
    float _471 = in.m_44.z;
    float _473 = in.m_44.w;
    float _475 = in.m_46.x;
    float _477 = in.m_46.y;
    float _479 = in.m_46.z;
    float _481 = in.m_46.w;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _489 = _487 != 0;
    float _491 = in.m_48.x;
    float _493 = in.m_48.y;
    float _495 = in.m_48.z;
    float _497 = in.m_48.w;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _501 = in.m_40.x;
    float _503 = in.m_40.y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _509 = in.m_42.x;
    float _511 = in.m_42.y;
    float _513 = _265 * _469;
    float _515 = fma(_263, _467, _513);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _265 * _477;
    float _523 = _265 * _493;
    float _525 = fma(_267, _471, _515);
    float _527 = 1.0 / _519;
    float _529 = fma(_263, _475, _521);
    float _531 = _503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _533 = _501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _537 = fma(_263, _491, _523);
    float _539 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _543 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _545;
    float _549 = fma(_267, _479, _529);
    float _551 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _553 = _543 * _541;
    float _555 = fma(_267, _495, _537);
    bool _557 = _509 > 0.5;
    float _559 = _549 + _481;
    float _561 = _547 * _527;
    float _563 = _539 * _535;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _567 = _465 + _565;
    bool _569 = _511 > 0.5;
    float _571 = _555 + _497;
    float _573 = _563 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _575 = _563 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _577 = fma(_561, _567, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _579 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _573);
    float _581 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _575);
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _585 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[26].z, _579);
    float _587 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[24].z, _581);
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _591 = _585 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _593 = _587 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _595 = _525 + _473;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _571 + _591;
    float _603 = _583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _607 = _595 + _593;
    float _609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _611 = _601 + _609;
    float _613 = _559 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _615 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _617 = isnan(_465);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _629 = _607 + _627;
    float _631 = _611 * _611;
    out.m_50.x = _603;
    out.m_50.y = _605;
    out.m_50.z = _507;
    out.m_50.w = _505;
    float _633 = 1.0 / _599;
    bool _635 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_465);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = _563 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _647);
    float _655 = fma(_551, (*spvDescriptorSet0.vp_c8)._m0[25].z, _653);
    float _657 = -_187;
    float _659 = _569 ? _657 : _187;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _663 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[11].x, _613);
    float _665 = fma(_629, _629, _631);
    float _667 = -_625;
    float _669 = _667 + 1.0;
    float _671 = _559 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _673 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[11].z, _663);
    bool _675 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _677 = isnan(_465);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _645 * _669;
    float _689 = sqrt(_665);
    float _691 = _673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _693 = -_645;
    float _695 = _693 + 1.0;
    float _697 = fma(_595, (*spvDescriptorSet0.vp_c8)._m0[10].x, _671);
    float _699 = _651 * _633;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _465 + _701;
    float _705 = _685 * _695;
    float _707 = -_177;
    int _709 = _557 ? as_type<int>(_707) : as_type<int>(_177);
    float _711 = 1.0 / _691;
    float _713 = fma(_571, (*spvDescriptorSet0.vp_c8)._m0[10].z, _697);
    float _715 = _577 * _705;
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _655 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _723 = _713 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _725 = fma(_699, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    bool _729 = _689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = _723 + _691;
    bool _733 = !_485;
    float _735 = _733 ? _177 : as_type<float>(_709);
    float _737 = _559 + _721;
    float _739 = fma(_725, _687, _727);
    bool _741 = !_489;
    float _743 = _741 ? _187 : _659;
    float _745 = _731 * _711;
    float _747 = _745 * 0.5;
    bool _749 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _751 = isnan(0.5);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _757 = _753 || _755;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[117].x, _739);
    float _761 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _763 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[30].w, _761);
    float _765 = _659;
    float _767 = _721;
    float _769 = _607;
    float _771 = _611;
    if (!_729)
    {
        _765 = _601;
    }
    float _773 = _765;
    float _775 = _773;
    if (!_729)
    {
        _767 = _737;
    }
    float _777 = _767;
    bool _779 = !_729;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _689 + _785;
        float _789 = rsqrt(_665);
        float _791 = _787 * _783;
        float _793 = _737 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        float _805 = _799 + (-1.0);
        float _807 = fma(_803, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _809 = _805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _811 = _789 * _807;
        float _813 = fma(_737, _799, _809);
        float _815 = fma(_629, _811, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _817 = fma(_611, _811, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _769 = _815;
        _781 = _813;
        _775 = _817;
    }
    float _819 = _769;
    float _821 = _781;
    float _823 = _775;
    float _825 = _821;
    float _827 = _823;
    if (_757)
    {
        _771 = _819;
    }
    float _829 = _771;
    float _831 = _829;
    if (!_757)
    {
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _835 = _559 + _833;
        float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _839 = _595 + _837;
        float _841 = -_595;
        float _843 = _841 + _819;
        float _845 = -_559;
        float _847 = _845 + _821;
        float _849 = _835 * _835;
        float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _853 = _571 + _851;
        float _855 = -_571;
        float _857 = _855 + _823;
        float _859 = fma(_839, _839, _849);
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _863 = fma(_853, _853, _859);
        float _865 = sqrt(_863);
        float _867 = precise::min(_865, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _869 = _867 * _861;
        float _871 = fma(_843, _869, _595);
        float _873 = fma(_847, _869, _559);
        float _875 = fma(_857, _869, _571);
        _825 = _873;
        _831 = _871;
        _827 = _875;
    }
    float _877 = _825;
    float _879 = _831;
    float _881 = _827;
    float _883 = 1.0 / _763;
    bool _885 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _887 = isnan(0.5);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _893 = _889 || _891;
    float _895 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _897 = _877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _899 = _877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _901 = _877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _903 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _895);
    float _905 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _897);
    float _907 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _899);
    float _909 = fma(_879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _901);
    float _911 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _913 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _907);
    float _917 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _909);
    float _919 = _909;
    float _921 = _901;
    if (_893)
    {
        _919 = 1.0;
    }
    float _923 = _919;
    float _925 = _911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _927 = _923;
    if (_893)
    {
        _921 = 1.0;
    }
    float _929 = _921;
    float _931 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _933 = _883 * _931;
    float _935 = _929;
    if (!_893)
    {
        float _937 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _939 = _937 * 0.15915493667125701904296875;
        float _941 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _943 = _939 * 6.283185482025146484375;
        float _945 = cos(_943);
        float _947 = _941 * 0.15915493667125701904296875;
        float _949 = _939 * 6.283185482025146484375;
        float _951 = sin(_949);
        float _953 = 1.0 / _945;
        float _955 = _947 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _951 * _953;
        float _961 = _947 * 6.283185482025146484375;
        float _963 = sin(_961);
        float _965 = _957 * _959;
        float _967 = 1.0 / _965;
        float _969 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _971 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _969;
        float _973 = 1.0 / _971;
        float _975 = _963 * _967;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = fma(_933, _975, _977);
        float _981 = _979 * _973;
        float _983 = precise::clamp(_981, 0.0, 1.0);
        _927 = _983;
    }
    float _985 = _927;
    if (!_893)
    {
        float _987 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _989 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _991 = _987 * 0.15915493667125701904296875;
        float _993 = _989 * 0.15915493667125701904296875;
        float _995 = _991 * 6.283185482025146484375;
        float _997 = cos(_995);
        float _999 = _991 * 6.283185482025146484375;
        float _1001 = sin(_999);
        float _1003 = 1.0 / _997;
        float _1005 = _993 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        float _1009 = _1001 * _1003;
        float _1011 = _993 * 6.283185482025146484375;
        float _1013 = sin(_1011);
        float _1015 = _1007 * _1009;
        float _1017 = 1.0 / _1015;
        float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1021 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1019;
        float _1023 = 1.0 / _1021;
        float _1025 = _1013 * _1017;
        float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1029 = fma(_933, _1025, _1027);
        float _1031 = _1029 * _1023;
        float _1033 = precise::clamp(_1031, 0.0, 1.0);
        float _1035 = -_1033;
        float _1037 = _1035 + 1.0;
        _935 = _1037;
    }
    float _1039 = _935;
    float _1041 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1043 = _925 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1045 = _925 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1047 = _925 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1049 = _925 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1043);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1045);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1047);
    bool _1057 = _985 > 0.0;
    bool _1059 = isnan(_985);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1049);
    float _1069 = _735 + 0.5;
    float _1071 = _915 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1075 = _985 * _1039;
    bool _1077 = _1039 <= 0.0;
    bool _1079 = !_1065;
    bool _1081 = _1077 || _1079;
    float _1083 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1051);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1053);
    float _1089 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1055);
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1093 = _917 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1095 = _1083 * _661;
    float _1097 = -_743;
    float _1099 = _1097 + 0.5;
    float _1101 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1103 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1085);
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1087);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1089);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1091);
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1113 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1115 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1117 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1119 = _1107 + _1109;
    float _1121 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1123 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1125 = _1111 * _1073;
    float _1127 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1129 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1133 = _1119 * 0.5;
    out.m_52.x = _1095;
    out.m_52.y = _1125;
    out.m_54.x = _1127;
    out.m_54.y = _1129;
    out.m_54.z = _1131;
    out.m_54.w = _1121;
    out.m_33.x = _1123;
    out.gl_Position.x = _1103;
    out.gl_Position.y = _1105;
    out.gl_Position.z = _1107;
    out.gl_Position.w = _1109;
    out.m_56.z = _1133;
    out.m_56.w = _1109;
    if (!_1081)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_33.x = 0.0;
    float _1135 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1135;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

