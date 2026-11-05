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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_56 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_48 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_32 [[attribute(5)]];
    float4 m_37 [[attribute(6)]];
    float4 m_42 [[attribute(7)]];
    float4 m_44 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _465 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_32.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_35.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_99);
        out.gl_Position.z = _1467;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_37.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_35.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1536 = as_type<float>(_137);
        out.gl_Position.z = _1536;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_42.x;
    float _147 = _143 * _141;
    int _149 = as_type<int>(_139) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_139) & 2;
    bool _155 = _153 != 0;
    float _157 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    bool _159 = !_155;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_165;
    int _187 = _185 ? 0 : 1;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_183;
    int _195 = _193 ? 0 : 1;
    int _197 = abs(_187);
    int _199 = abs(_195);
    float _201 = -_173;
    float _203 = _157 + _201;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_169;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_191, 0.5, 0.5);
    float _219 = abs(_211);
    float _221 = _207 * _219;
    int _223 = abs(_215);
    bool _225 = _203 < 0.5;
    float _227 = float(_225);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_199);
    float _235 = float(_223);
    float _237 = -_227;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = fma(_233, _231, _221);
    float _243 = abs(_239);
    float _245 = fma(_235, _243, _241);
    bool _247 = !_205;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_85);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _305;
    float _313 = 1.0 / _301;
    float _315 = _277 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _273 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_273);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _281 * _311;
    bool _339 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_273);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_293;
    float _353 = _351 + 1.0;
    float _355 = _349 * _353;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _319 * _313;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_323, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -_349;
    float _389 = _387 + 1.0;
    float _391 = -_335;
    float _393 = _391 + 1.0;
    float _395 = fma(_383, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _335 * _389;
    float _399 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _367 * _393;
    float _403 = in.m_44.x;
    float _405 = in.m_44.y;
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _375 * _401;
    float _413 = _385 * _401;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _427 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_421, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_399, _397, _423);
    float _433 = fma(_395, _397, _425);
    float _435 = fma(_429, _355, _431);
    float _437 = fma(_427, _355, _433);
    float _439 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _435);
    float _441 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _437);
    float _443 = _439 * _403;
    float _445 = _441 * _405;
    bool _447 = !_309;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _117 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = _473 + _475;
    bool _479 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _481 = isnan(_473);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _473 + _491;
    bool _495 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _497 = isnan(_473);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    float _533 = _525 * _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _539;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _545 = 1.0 / _513;
    float _547 = _505 * _537;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    float _553 = _477 * _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _559;
    float _563 = fma(_541, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _565 = fma(_557, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _569 = _493 * _545;
    float _571 = _563 * _547;
    float _573 = _565 * _547;
    float _575 = _567 * _547;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _591 = fma(_579, _569, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_583, _569, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _573);
    float _597 = fma(_587, _569, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _575);
    float _601 = fma(_591, _533, _589);
    float _603 = fma(_593, _533, _595);
    float _605 = fma(_597, _533, _599);
    float _607 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].x, _601);
    float _609 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].y, _603);
    float _611 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].z, _605);
    bool _613 = !_543;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_85);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_32.x;
    float _643 = in.m_32.y;
    float _645 = in.m_32.z;
    bool _647 = _145 > 0.5;
    float _649 = _245 * _445;
    bool _651 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_639);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = in.m_46.x;
    float _665 = in.m_46.y;
    float _667 = in.m_46.z;
    float _669 = in.m_46.w;
    float _671 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = in.m_48.x;
    float _675 = in.m_48.y;
    float _677 = in.m_48.z;
    float _679 = in.m_48.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    float _689 = in.m_50.x;
    float _691 = in.m_50.y;
    float _693 = in.m_50.z;
    float _695 = in.m_50.w;
    float _697 = in.m_42.y;
    float _699 = _643 * _665;
    float _701 = _643 * _675;
    float _703 = fma(_641, _663, _699);
    float _705 = _643 * _691;
    float _707 = fma(_641, _673, _701);
    float _709 = fma(_645, _667, _703);
    float _711 = fma(_641, _689, _705);
    float _713 = fma(_645, _677, _707);
    float _715 = _709 + _669;
    float _717 = fma(_645, _693, _711);
    float _719 = _713 + _679;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _723 = _715 + _721;
    bool _725 = _697 > 0.5;
    float _727 = _717 + _695;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _731 = _719 + _729;
    float _733 = _723 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _741 = _727 + _739;
    float _743 = fma(_731, _731, _733);
    float _745 = 1.0 / _737;
    float _747 = fma(_741, _741, _743);
    float _749 = _245 * _443;
    float _751 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = sqrt(_747);
    float _755 = _751 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = rsqrt(_747);
    float _759 = _753 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _761;
    float _765 = precise::min(_755, _759);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _771 = _763 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _639 + _773;
    float _777 = _757 * _765;
    out.m_52.w = _765;
    float _779 = 1.0 / _769;
    float _781 = fma(_771, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _783 = _723 * _777;
    float _785 = _731 * _777;
    float _787 = _741 * _777;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = -_783;
    float _795 = _723 + _793;
    float _797 = -_785;
    float _799 = _731 + _797;
    float _801 = -_787;
    float _803 = _741 + _801;
    float _805 = _795 * _795;
    float _807 = fma(_799, _799, _805);
    bool _809 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _811 = isnan(_639);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 * _779;
    float _823 = fma(_803, _803, _807);
    bool _825 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _827 = isnan(_639);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_661;
    float _839 = _837 + 1.0;
    float _841 = sqrt(_823);
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = _781 * _843;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _853 = _639 + _851;
    float _855 = -_819;
    float _857 = _855 + 1.0;
    float _859 = -_161;
    int _861 = _725 ? as_type<int>(_859) : as_type<int>(_161);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _849);
    float _865 = fma(_821, _853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = !_683;
    float _871 = _869 ? _161 : as_type<float>(_861);
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _875 = -_179;
    int _877 = _647 ? as_type<int>(_875) : as_type<int>(_179);
    float _879 = _757 * _841;
    float _881 = _661 * _857;
    float _883 = -_871;
    float _885 = _883 + 0.5;
    bool _887 = !_687;
    float _889 = _887 ? _179 : as_type<float>(_877);
    float _891 = _671 * _879;
    float _893 = fma(_865, _881, _863);
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _897 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _891 * _873;
    float _901 = _751 * _879;
    float _903 = -_783;
    float _905 = _715 + _903;
    float _907 = _879 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _909 = _907 * 0.5;
    float _911 = _895 * _867;
    float _913 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _917 = _899 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = _899 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _921 = -_785;
    float _923 = _719 + _921;
    float _925 = _901 * _915;
    float _927 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = -_787;
    float _931 = _727 + _929;
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    float _945 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _949 = _889 + 0.5;
    float _951 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _957 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _959 = _727 + _951;
    float _961 = _719 + _953;
    float _963 = 1.0 / _955;
    float _965 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _961 + _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _977 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _979 = _969 * _969;
    float _981 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _893);
    float _983 = _965 * _933;
    float _985 = fma(_973, _973, _979);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_985);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = _987 + _955;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _999 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _995 * _963;
    float _1009 = _1007 * 0.5;
    float _1011 = _899 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    out.m_54.x = _983;
    out.m_54.y = _911;
    bool _1019 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    out.m_56.x = _923;
    out.m_56.y = _905;
    out.m_56.z = _931;
    float _1025 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1027 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1029 = isnan(0.5);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1035 = _1031 || _1033;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_58.x = _1001;
    out.m_58.y = _1003;
    out.m_58.z = _1005;
    out.m_58.w = _975;
    float _1039 = _715 + _1037;
    out.m_60.x = _1013;
    out.m_60.y = _1015;
    out.m_60.z = _1021;
    out.m_60.w = _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = _1021;
    float _1047 = _1013;
    float _1049 = _1015;
    float _1051 = _905;
    float _1053 = _923;
    if (!_1019)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = 1.0 / _1043;
    float _1059 = _1055;
    if (!_1019)
    {
        _1047 = _959;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (!_1019)
    {
        _1049 = _1039;
    }
    float _1065 = _1049;
    bool _1067 = !_1019;
    float _1069 = _1065;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _989 + _1073;
        float _1077 = rsqrt(_985);
        float _1079 = _1075 * _1071;
        float _1081 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = _1079 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = sin(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = fma(_1087, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1077 * _1093;
        float _1097 = _1091 + (-1.0);
        float _1099 = fma(_973, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = fma(_969, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1103 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1039, _1091, _1103);
        _1059 = _1099;
        _1069 = _1105;
        _1063 = _1101;
    }
    float _1107 = _1059;
    float _1109 = _1069;
    float _1111 = _1063;
    bool _1113 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1121 = _1117 || _1119;
    float _1123 = -_785;
    float _1125 = _1123 + _1107;
    float _1127 = -_783;
    float _1129 = _1127 + _1109;
    float _1131 = -_787;
    float _1133 = _1131 + _1111;
    float _1135 = _1129;
    float _1137 = _1125;
    float _1139 = _1133;
    if (!_1035)
    {
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1143 = _905 + _1141;
        float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1147 = _923 + _1145;
        float _1149 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1151 = -_715;
        float _1153 = _1151 + _1109;
        float _1155 = _1143 * _1143;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1159 = _931 + _1157;
        float _1161 = -_727;
        float _1163 = _1161 + _1111;
        float _1165 = fma(_1147, _1147, _1155);
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1169 = fma(_1159, _1159, _1165);
        float _1171 = sqrt(_1169);
        float _1173 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1175 = precise::min(_1171, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1177 = _1175 * _1167;
        float _1179 = -_719;
        float _1181 = _1179 + _1107;
        float _1183 = _1173 * _1177;
        float _1185 = fma(_1181, _1183, _923);
        float _1187 = fma(_1153, _1183, _905);
        float _1189 = fma(_1163, _1183, _931);
        _1135 = _1187;
        _1137 = _1185;
        _1139 = _1189;
    }
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1139;
    float _1197 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1121)
    {
        _1051 = 1.0;
    }
    float _1199 = _1051;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1199;
    if (_1121)
    {
        _1053 = 1.0;
    }
    float _1205 = _1053;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1197);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1211 = _1057 * _1209;
    float _1213 = _1205;
    if (!_1121)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1223;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1249 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1247;
        float _1251 = 1.0 / _1249;
        float _1253 = _1241 * _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1257 = fma(_1211, _1253, _1255);
        float _1259 = _1257 * _1251;
        float _1261 = precise::clamp(_1259, 0.0, 1.0);
        _1203 = _1261;
    }
    float _1263 = _1203;
    if (!_1121)
    {
        float _1265 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1267 * 0.15915493667125701904296875;
        float _1273 = _1269 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1275;
        float _1283 = _1271 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1285 * _1287;
        float _1295 = 1.0 / _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1297;
        float _1301 = 1.0 / _1299;
        float _1303 = _1291 * _1295;
        float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1307 = fma(_1211, _1303, _1305);
        float _1309 = _1307 * _1301;
        float _1311 = precise::clamp(_1309, 0.0, 1.0);
        float _1313 = -_1311;
        float _1315 = _1313 + 1.0;
        _1213 = _1315;
    }
    float _1317 = _1213;
    float _1319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1323 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1325 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1327 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1329 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1325);
    float _1335 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1349 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1333);
    float _1351 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    float _1355 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1343);
    float _1357 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    bool _1359 = _1263 > 0.0;
    bool _1361 = isnan(_1263);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1263 * _1317;
    float _1371 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1347);
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1355);
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    bool _1379 = _1317 <= 0.0;
    bool _1381 = !_1367;
    bool _1383 = _1379 || _1381;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1373);
    float _1391 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1385);
    float _1399 = _1389 + _1391;
    float _1401 = _1393 + _1391;
    float _1403 = _1391 * 0.5;
    float _1405 = _1399 * 0.5;
    float _1407 = _1401 * 0.5;
    float _1409 = fma(_1397, -0.5, _1403);
    out.m_62.x = _901;
    out.m_64.x = _1193;
    out.m_64.y = _1191;
    out.m_64.z = _1195;
    out.m_35.x = _1395;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1391;
    out.m_66.x = _1405;
    out.m_66.y = _1409;
    out.m_66.z = _1407;
    out.m_66.w = _1391;
    if (!_1383)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1411;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _465 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_32.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_35.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_99);
        out.gl_Position.z = _1467;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_37.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_35.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1536 = as_type<float>(_137);
        out.gl_Position.z = _1536;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_42.x;
    float _147 = _143 * _141;
    int _149 = as_type<int>(_139) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_139) & 2;
    bool _155 = _153 != 0;
    float _157 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    bool _159 = !_155;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_165;
    int _187 = _185 ? 0 : 1;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_183;
    int _195 = _193 ? 0 : 1;
    int _197 = abs(_187);
    int _199 = abs(_195);
    float _201 = -_173;
    float _203 = _157 + _201;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_169;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_191, 0.5, 0.5);
    float _219 = abs(_211);
    float _221 = _207 * _219;
    int _223 = abs(_215);
    bool _225 = _203 < 0.5;
    float _227 = float(_225);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_199);
    float _235 = float(_223);
    float _237 = -_227;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = fma(_233, _231, _221);
    float _243 = abs(_239);
    float _245 = fma(_235, _243, _241);
    bool _247 = !_205;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_85);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _305;
    float _313 = 1.0 / _301;
    float _315 = _277 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _273 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_273);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _281 * _311;
    bool _339 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_273);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_293;
    float _353 = _351 + 1.0;
    float _355 = _349 * _353;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _319 * _313;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_323, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -_349;
    float _389 = _387 + 1.0;
    float _391 = -_335;
    float _393 = _391 + 1.0;
    float _395 = fma(_383, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _335 * _389;
    float _399 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _367 * _393;
    float _403 = in.m_44.x;
    float _405 = in.m_44.y;
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _375 * _401;
    float _413 = _385 * _401;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _427 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_421, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_399, _397, _423);
    float _433 = fma(_395, _397, _425);
    float _435 = fma(_429, _355, _431);
    float _437 = fma(_427, _355, _433);
    float _439 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _435);
    float _441 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _437);
    float _443 = _439 * _403;
    float _445 = _441 * _405;
    bool _447 = !_309;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _117 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = _473 + _475;
    bool _479 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _481 = isnan(_473);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _473 + _491;
    bool _495 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _497 = isnan(_473);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    float _533 = _525 * _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _539;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _545 = 1.0 / _513;
    float _547 = _505 * _537;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    float _553 = _477 * _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _559;
    float _563 = fma(_541, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _565 = fma(_557, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _569 = _493 * _545;
    float _571 = _563 * _547;
    float _573 = _565 * _547;
    float _575 = _567 * _547;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _591 = fma(_579, _569, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_583, _569, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _573);
    float _597 = fma(_587, _569, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _575);
    float _601 = fma(_591, _533, _589);
    float _603 = fma(_593, _533, _595);
    float _605 = fma(_597, _533, _599);
    float _607 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].x, _601);
    float _609 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].y, _603);
    float _611 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].z, _605);
    bool _613 = !_543;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_85);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_32.x;
    float _643 = in.m_32.y;
    float _645 = in.m_32.z;
    bool _647 = _145 > 0.5;
    float _649 = _245 * _445;
    bool _651 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_639);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = in.m_46.x;
    float _665 = in.m_46.y;
    float _667 = in.m_46.z;
    float _669 = in.m_46.w;
    float _671 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = in.m_48.x;
    float _675 = in.m_48.y;
    float _677 = in.m_48.z;
    float _679 = in.m_48.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    float _689 = in.m_50.x;
    float _691 = in.m_50.y;
    float _693 = in.m_50.z;
    float _695 = in.m_50.w;
    float _697 = in.m_42.y;
    float _699 = _643 * _665;
    float _701 = _643 * _675;
    float _703 = fma(_641, _663, _699);
    float _705 = _643 * _691;
    float _707 = fma(_641, _673, _701);
    float _709 = fma(_645, _667, _703);
    float _711 = fma(_641, _689, _705);
    float _713 = fma(_645, _677, _707);
    float _715 = _709 + _669;
    float _717 = fma(_645, _693, _711);
    float _719 = _713 + _679;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _723 = _715 + _721;
    bool _725 = _697 > 0.5;
    float _727 = _717 + _695;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _731 = _719 + _729;
    float _733 = _723 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _741 = _727 + _739;
    float _743 = fma(_731, _731, _733);
    float _745 = 1.0 / _737;
    float _747 = fma(_741, _741, _743);
    float _749 = _245 * _443;
    float _751 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = sqrt(_747);
    float _755 = _751 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = rsqrt(_747);
    float _759 = _753 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _761;
    float _765 = precise::min(_755, _759);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _771 = _763 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _639 + _773;
    float _777 = _757 * _765;
    out.m_52.w = _765;
    float _779 = 1.0 / _769;
    float _781 = fma(_771, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _783 = _723 * _777;
    float _785 = _731 * _777;
    float _787 = _741 * _777;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = -_783;
    float _795 = _723 + _793;
    float _797 = -_785;
    float _799 = _731 + _797;
    float _801 = -_787;
    float _803 = _741 + _801;
    float _805 = _795 * _795;
    float _807 = fma(_799, _799, _805);
    bool _809 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _811 = isnan(_639);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 * _779;
    float _823 = fma(_803, _803, _807);
    bool _825 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _827 = isnan(_639);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_661;
    float _839 = _837 + 1.0;
    float _841 = sqrt(_823);
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = _781 * _843;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _853 = _639 + _851;
    float _855 = -_819;
    float _857 = _855 + 1.0;
    float _859 = -_161;
    int _861 = _725 ? as_type<int>(_859) : as_type<int>(_161);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _849);
    float _865 = fma(_821, _853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = !_683;
    float _871 = _869 ? _161 : as_type<float>(_861);
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _875 = -_179;
    int _877 = _647 ? as_type<int>(_875) : as_type<int>(_179);
    float _879 = _757 * _841;
    float _881 = _661 * _857;
    float _883 = -_871;
    float _885 = _883 + 0.5;
    bool _887 = !_687;
    float _889 = _887 ? _179 : as_type<float>(_877);
    float _891 = _671 * _879;
    float _893 = fma(_865, _881, _863);
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _897 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _891 * _873;
    float _901 = _751 * _879;
    float _903 = -_783;
    float _905 = _715 + _903;
    float _907 = _879 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _909 = _907 * 0.5;
    float _911 = _895 * _867;
    float _913 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _917 = _899 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = _899 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _921 = -_785;
    float _923 = _719 + _921;
    float _925 = _901 * _915;
    float _927 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = -_787;
    float _931 = _727 + _929;
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    float _945 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _949 = _889 + 0.5;
    float _951 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _957 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _959 = _727 + _951;
    float _961 = _719 + _953;
    float _963 = 1.0 / _955;
    float _965 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _961 + _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _977 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _979 = _969 * _969;
    float _981 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _893);
    float _983 = _965 * _933;
    float _985 = fma(_973, _973, _979);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_985);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = _987 + _955;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _999 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _995 * _963;
    float _1009 = _1007 * 0.5;
    float _1011 = _899 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    out.m_54.x = _983;
    out.m_54.y = _911;
    bool _1019 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    out.m_56.x = _923;
    out.m_56.y = _905;
    out.m_56.z = _931;
    float _1025 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1027 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1029 = isnan(0.5);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1035 = _1031 || _1033;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_58.x = _1001;
    out.m_58.y = _1003;
    out.m_58.z = _1005;
    out.m_58.w = _975;
    float _1039 = _715 + _1037;
    out.m_60.x = _1013;
    out.m_60.y = _1015;
    out.m_60.z = _1021;
    out.m_60.w = _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = _1021;
    float _1047 = _1013;
    float _1049 = _1015;
    float _1051 = _905;
    float _1053 = _923;
    if (!_1019)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = 1.0 / _1043;
    float _1059 = _1055;
    if (!_1019)
    {
        _1047 = _959;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (!_1019)
    {
        _1049 = _1039;
    }
    float _1065 = _1049;
    bool _1067 = !_1019;
    float _1069 = _1065;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _989 + _1073;
        float _1077 = rsqrt(_985);
        float _1079 = _1075 * _1071;
        float _1081 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = _1079 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = sin(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = fma(_1087, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1077 * _1093;
        float _1097 = _1091 + (-1.0);
        float _1099 = fma(_973, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = fma(_969, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1103 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1039, _1091, _1103);
        _1059 = _1099;
        _1069 = _1105;
        _1063 = _1101;
    }
    float _1107 = _1059;
    float _1109 = _1069;
    float _1111 = _1063;
    bool _1113 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1121 = _1117 || _1119;
    float _1123 = -_785;
    float _1125 = _1123 + _1107;
    float _1127 = -_783;
    float _1129 = _1127 + _1109;
    float _1131 = -_787;
    float _1133 = _1131 + _1111;
    float _1135 = _1129;
    float _1137 = _1125;
    float _1139 = _1133;
    if (!_1035)
    {
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1143 = _905 + _1141;
        float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1147 = _923 + _1145;
        float _1149 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1151 = -_715;
        float _1153 = _1151 + _1109;
        float _1155 = _1143 * _1143;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1159 = _931 + _1157;
        float _1161 = -_727;
        float _1163 = _1161 + _1111;
        float _1165 = fma(_1147, _1147, _1155);
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1169 = fma(_1159, _1159, _1165);
        float _1171 = sqrt(_1169);
        float _1173 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1175 = precise::min(_1171, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1177 = _1175 * _1167;
        float _1179 = -_719;
        float _1181 = _1179 + _1107;
        float _1183 = _1173 * _1177;
        float _1185 = fma(_1181, _1183, _923);
        float _1187 = fma(_1153, _1183, _905);
        float _1189 = fma(_1163, _1183, _931);
        _1135 = _1187;
        _1137 = _1185;
        _1139 = _1189;
    }
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1139;
    float _1197 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1121)
    {
        _1051 = 1.0;
    }
    float _1199 = _1051;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1199;
    if (_1121)
    {
        _1053 = 1.0;
    }
    float _1205 = _1053;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1197);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1211 = _1057 * _1209;
    float _1213 = _1205;
    if (!_1121)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1223;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1249 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1247;
        float _1251 = 1.0 / _1249;
        float _1253 = _1241 * _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1257 = fma(_1211, _1253, _1255);
        float _1259 = _1257 * _1251;
        float _1261 = precise::clamp(_1259, 0.0, 1.0);
        _1203 = _1261;
    }
    float _1263 = _1203;
    if (!_1121)
    {
        float _1265 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1267 * 0.15915493667125701904296875;
        float _1273 = _1269 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1275;
        float _1283 = _1271 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1285 * _1287;
        float _1295 = 1.0 / _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1297;
        float _1301 = 1.0 / _1299;
        float _1303 = _1291 * _1295;
        float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1307 = fma(_1211, _1303, _1305);
        float _1309 = _1307 * _1301;
        float _1311 = precise::clamp(_1309, 0.0, 1.0);
        float _1313 = -_1311;
        float _1315 = _1313 + 1.0;
        _1213 = _1315;
    }
    float _1317 = _1213;
    float _1319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1323 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1325 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1327 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1329 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1325);
    float _1335 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1349 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1333);
    float _1351 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    float _1355 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1343);
    float _1357 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    bool _1359 = _1263 > 0.0;
    bool _1361 = isnan(_1263);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1263 * _1317;
    float _1371 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1347);
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1355);
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    bool _1379 = _1317 <= 0.0;
    bool _1381 = !_1367;
    bool _1383 = _1379 || _1381;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1373);
    float _1391 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1385);
    float _1399 = _1389 + _1391;
    float _1401 = _1393 + _1391;
    float _1403 = _1391 * 0.5;
    float _1405 = _1399 * 0.5;
    float _1407 = _1401 * 0.5;
    float _1409 = fma(_1397, -0.5, _1403);
    out.m_62.x = _901;
    out.m_64.x = _1193;
    out.m_64.y = _1191;
    out.m_64.z = _1195;
    out.m_35.x = _1395;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1391;
    out.m_66.x = _1405;
    out.m_66.y = _1409;
    out.m_66.z = _1407;
    out.m_66.w = _1391;
    if (!_1383)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1411;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
    bool _465 = false;
    bool _265 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_32.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    if (!_89)
    {
        out.m_35.x = 0.0;
    }
    int _95 = 0;
    if (!_89)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1467 = as_type<float>(_99);
        out.gl_Position.z = _1467;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_37.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_35.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1536 = as_type<float>(_137);
        out.gl_Position.z = _1536;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_42.x;
    float _147 = _143 * _141;
    int _149 = as_type<int>(_139) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_139) & 2;
    bool _155 = _153 != 0;
    float _157 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    bool _159 = !_155;
    float _161 = _159 ? (-0.5) : 0.5;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _165 = _163 != 0;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _169 = _167 != 0;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    float _175 = _171 * 0.15915493667125701904296875;
    bool _177 = !_151;
    float _179 = _177 ? (-0.5) : 0.5;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    bool _185 = !_165;
    int _187 = _185 ? 0 : 1;
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_183;
    int _195 = _193 ? 0 : 1;
    int _197 = abs(_187);
    int _199 = abs(_195);
    float _201 = -_173;
    float _203 = _157 + _201;
    bool _205 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _207 = float(_197);
    float _209 = -_203;
    float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _213 = !_169;
    int _215 = _213 ? 0 : 1;
    float _217 = fma(_191, 0.5, 0.5);
    float _219 = abs(_211);
    float _221 = _207 * _219;
    int _223 = abs(_215);
    bool _225 = _203 < 0.5;
    float _227 = float(_225);
    float _229 = -_217;
    float _231 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _233 = float(_199);
    float _235 = float(_223);
    float _237 = -_227;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = fma(_233, _231, _221);
    float _243 = abs(_239);
    float _245 = fma(_235, _243, _241);
    bool _247 = !_205;
    float _263;
    if (!_247)
    {
        float _249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _251 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _255 = _253 * _249;
        float _257 = floor(_255);
        float _259 = -_257;
        float _261 = _255 + _259;
        _263 = _261;
        _265 = true;
    }
    else
    {
        float _267 = float(_85);
        float _269 = 1.0 / _267;
        float _271 = _117 * _269;
        _263 = _271;
    }
    _265 = false;
    float _273 = _263;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    bool _283 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_273);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _303;
    float _307 = 1.0 / _297;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _311 = 1.0 / _305;
    float _313 = 1.0 / _301;
    float _315 = _277 * _307;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _273 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _327 = isnan(_273);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _281 * _311;
    bool _339 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _341 = isnan(_273);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_293;
    float _353 = _351 + 1.0;
    float _355 = _349 * _353;
    bool _357 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _359 = isnan(_273);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _319 * _313;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_323, _315, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = fma(_373, _315, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _387 = -_349;
    float _389 = _387 + 1.0;
    float _391 = -_335;
    float _393 = _391 + 1.0;
    float _395 = fma(_383, _369, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _335 * _389;
    float _399 = fma(_379, _369, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _367 * _393;
    float _403 = in.m_44.x;
    float _405 = in.m_44.y;
    float _407 = -_367;
    float _409 = _407 + 1.0;
    float _411 = _375 * _401;
    float _413 = _385 * _401;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].x, _411);
    float _425 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[143].y, _413);
    float _427 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_421, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _431 = fma(_399, _397, _423);
    float _433 = fma(_395, _397, _425);
    float _435 = fma(_429, _355, _431);
    float _437 = fma(_427, _355, _433);
    float _439 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _435);
    float _441 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _437);
    float _443 = _439 * _403;
    float _445 = _441 * _405;
    bool _447 = !_309;
    float _463;
    if (!_447)
    {
        float _449 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _451 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _453 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _455 = _453 * _449;
        float _457 = floor(_455);
        float _459 = -_457;
        float _461 = _455 + _459;
        _463 = _461;
        _465 = true;
    }
    else
    {
        float _467 = float(_85);
        float _469 = 1.0 / _467;
        float _471 = _117 * _469;
        _463 = _471;
    }
    _465 = false;
    float _473 = _463;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _477 = _473 + _475;
    bool _479 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _481 = isnan(_473);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _493 = _473 + _491;
    bool _495 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _497 = isnan(_473);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _515 = _473 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _517 = isnan(_473);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_489;
    float _529 = _527 + 1.0;
    float _531 = 1.0 / _509;
    float _533 = _525 * _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _539;
    bool _543 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _545 = 1.0 / _513;
    float _547 = _505 * _537;
    float _549 = -_505;
    float _551 = _549 + 1.0;
    float _553 = _477 * _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _559;
    float _563 = fma(_541, _553, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _565 = fma(_557, _553, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _567 = fma(_561, _553, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _569 = _493 * _545;
    float _571 = _563 * _547;
    float _573 = _565 * _547;
    float _575 = _567 * _547;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _589 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _591 = fma(_579, _569, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _593 = fma(_583, _569, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _595 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].y, _573);
    float _597 = fma(_587, _569, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _599 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[107].z, _575);
    float _601 = fma(_591, _533, _589);
    float _603 = fma(_593, _533, _595);
    float _605 = fma(_597, _533, _599);
    float _607 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].x, _601);
    float _609 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].y, _603);
    float _611 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[109].z, _605);
    bool _613 = !_543;
    float _629;
    if (!_613)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _617 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_85);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_32.x;
    float _643 = in.m_32.y;
    float _645 = in.m_32.z;
    bool _647 = _145 > 0.5;
    float _649 = _245 * _445;
    bool _651 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_639);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = in.m_46.x;
    float _665 = in.m_46.y;
    float _667 = in.m_46.z;
    float _669 = in.m_46.w;
    float _671 = _649 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _673 = in.m_48.x;
    float _675 = in.m_48.y;
    float _677 = in.m_48.z;
    float _679 = in.m_48.w;
    int _681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _683 = _681 != 0;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    float _689 = in.m_50.x;
    float _691 = in.m_50.y;
    float _693 = in.m_50.z;
    float _695 = in.m_50.w;
    float _697 = in.m_42.y;
    float _699 = _643 * _665;
    float _701 = _643 * _675;
    float _703 = fma(_641, _663, _699);
    float _705 = _643 * _691;
    float _707 = fma(_641, _673, _701);
    float _709 = fma(_645, _667, _703);
    float _711 = fma(_641, _689, _705);
    float _713 = fma(_645, _677, _707);
    float _715 = _709 + _669;
    float _717 = fma(_645, _693, _711);
    float _719 = _713 + _679;
    float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _723 = _715 + _721;
    bool _725 = _697 > 0.5;
    float _727 = _717 + _695;
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _731 = _719 + _729;
    float _733 = _723 * _723;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _741 = _727 + _739;
    float _743 = fma(_731, _731, _733);
    float _745 = 1.0 / _737;
    float _747 = fma(_741, _741, _743);
    float _749 = _245 * _443;
    float _751 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _753 = sqrt(_747);
    float _755 = _751 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _757 = rsqrt(_747);
    float _759 = _753 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _761;
    float _765 = precise::min(_755, _759);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _771 = _763 * _745;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _775 = _639 + _773;
    float _777 = _757 * _765;
    out.m_52.w = _765;
    float _779 = 1.0 / _769;
    float _781 = fma(_771, _775, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _783 = _723 * _777;
    float _785 = _731 * _777;
    float _787 = _741 * _777;
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _793 = -_783;
    float _795 = _723 + _793;
    float _797 = -_785;
    float _799 = _731 + _797;
    float _801 = -_787;
    float _803 = _741 + _801;
    float _805 = _795 * _795;
    float _807 = fma(_799, _799, _805);
    bool _809 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _811 = isnan(_639);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = _791 * _779;
    float _823 = fma(_803, _803, _807);
    bool _825 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _827 = isnan(_639);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_661;
    float _839 = _837 + 1.0;
    float _841 = sqrt(_823);
    float _843 = _835 * _839;
    float _845 = -_835;
    float _847 = _845 + 1.0;
    float _849 = _781 * _843;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _853 = _639 + _851;
    float _855 = -_819;
    float _857 = _855 + 1.0;
    float _859 = -_161;
    int _861 = _725 ? as_type<int>(_859) : as_type<int>(_161);
    float _863 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[115].x, _849);
    float _865 = fma(_821, _853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _867 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _869 = !_683;
    float _871 = _869 ? _161 : as_type<float>(_861);
    float _873 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _161);
    float _875 = -_179;
    int _877 = _647 ? as_type<int>(_875) : as_type<int>(_179);
    float _879 = _757 * _841;
    float _881 = _661 * _857;
    float _883 = -_871;
    float _885 = _883 + 0.5;
    bool _887 = !_687;
    float _889 = _887 ? _179 : as_type<float>(_877);
    float _891 = _671 * _879;
    float _893 = fma(_865, _881, _863);
    float _895 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _897 = _607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _899 = _891 * _873;
    float _901 = _751 * _879;
    float _903 = -_783;
    float _905 = _715 + _903;
    float _907 = _879 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _909 = _907 * 0.5;
    float _911 = _895 * _867;
    float _913 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _915 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _917 = _899 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _919 = _899 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _921 = -_785;
    float _923 = _719 + _921;
    float _925 = _901 * _915;
    float _927 = _905 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = -_787;
    float _931 = _727 + _929;
    float _933 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _935 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[26].x, _917);
    float _937 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[24].x, _919);
    float _939 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _943 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[26].z, _935);
    float _945 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _947 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _939);
    float _949 = _889 + 0.5;
    float _951 = _943 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _953 = _945 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _955 = _947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _957 = fma(_923, (*spvDescriptorSet0.vp_c8)._m0[10].x, _941);
    float _959 = _727 + _951;
    float _961 = _719 + _953;
    float _963 = 1.0 / _955;
    float _965 = _949 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _967 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _969 = _959 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _973 = _961 + _971;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _977 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _979 = _969 * _969;
    float _981 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[117].x, _893);
    float _983 = _965 * _933;
    float _985 = fma(_973, _973, _979);
    float _987 = _977 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _989 = sqrt(_985);
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _995 = _987 + _955;
    float _997 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _999 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _995 * _963;
    float _1009 = _1007 * 0.5;
    float _1011 = _899 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1013 = _897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1015 = _999 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1017 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1011);
    out.m_54.x = _983;
    out.m_54.y = _911;
    bool _1019 = _989 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1021 = _913 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1023 = fma(_909, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1017);
    out.m_56.x = _923;
    out.m_56.y = _905;
    out.m_56.z = _931;
    float _1025 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1027 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1029 = isnan(0.5);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1035 = _1031 || _1033;
    float _1037 = _1023 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_58.x = _1001;
    out.m_58.y = _1003;
    out.m_58.z = _1005;
    out.m_58.w = _975;
    float _1039 = _715 + _1037;
    out.m_60.x = _1013;
    out.m_60.y = _1015;
    out.m_60.z = _1021;
    out.m_60.w = _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1043 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1041);
    float _1045 = _1021;
    float _1047 = _1013;
    float _1049 = _1015;
    float _1051 = _905;
    float _1053 = _923;
    if (!_1019)
    {
        _1045 = _961;
    }
    float _1055 = _1045;
    float _1057 = 1.0 / _1043;
    float _1059 = _1055;
    if (!_1019)
    {
        _1047 = _959;
    }
    float _1061 = _1047;
    float _1063 = _1061;
    if (!_1019)
    {
        _1049 = _1039;
    }
    float _1065 = _1049;
    bool _1067 = !_1019;
    float _1069 = _1065;
    if (!_1067)
    {
        float _1071 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1075 = _989 + _1073;
        float _1077 = rsqrt(_985);
        float _1079 = _1075 * _1071;
        float _1081 = _1039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1083 = _1079 * 0.15915493667125701904296875;
        float _1085 = _1083 * 6.283185482025146484375;
        float _1087 = sin(_1085);
        float _1089 = _1083 * 6.283185482025146484375;
        float _1091 = cos(_1089);
        float _1093 = fma(_1087, _1081, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1095 = _1077 * _1093;
        float _1097 = _1091 + (-1.0);
        float _1099 = fma(_973, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1101 = fma(_969, _1095, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1103 = _1097 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1105 = fma(_1039, _1091, _1103);
        _1059 = _1099;
        _1069 = _1105;
        _1063 = _1101;
    }
    float _1107 = _1059;
    float _1109 = _1069;
    float _1111 = _1063;
    bool _1113 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1115 = isnan(0.5);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1121 = _1117 || _1119;
    float _1123 = -_785;
    float _1125 = _1123 + _1107;
    float _1127 = -_783;
    float _1129 = _1127 + _1109;
    float _1131 = -_787;
    float _1133 = _1131 + _1111;
    float _1135 = _1129;
    float _1137 = _1125;
    float _1139 = _1133;
    if (!_1035)
    {
        float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1143 = _905 + _1141;
        float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1147 = _923 + _1145;
        float _1149 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1151 = -_715;
        float _1153 = _1151 + _1109;
        float _1155 = _1143 * _1143;
        float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1159 = _931 + _1157;
        float _1161 = -_727;
        float _1163 = _1161 + _1111;
        float _1165 = fma(_1147, _1147, _1155);
        float _1167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1169 = fma(_1159, _1159, _1165);
        float _1171 = sqrt(_1169);
        float _1173 = _1149 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1175 = precise::min(_1171, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1177 = _1175 * _1167;
        float _1179 = -_719;
        float _1181 = _1179 + _1107;
        float _1183 = _1173 * _1177;
        float _1185 = fma(_1181, _1183, _923);
        float _1187 = fma(_1153, _1183, _905);
        float _1189 = fma(_1163, _1183, _931);
        _1135 = _1187;
        _1137 = _1185;
        _1139 = _1189;
    }
    float _1191 = _1135;
    float _1193 = _1137;
    float _1195 = _1139;
    float _1197 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1121)
    {
        _1051 = 1.0;
    }
    float _1199 = _1051;
    float _1201 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1203 = _1199;
    if (_1121)
    {
        _1053 = 1.0;
    }
    float _1205 = _1053;
    float _1207 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1197);
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1211 = _1057 * _1209;
    float _1213 = _1205;
    if (!_1121)
    {
        float _1215 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1217 = _1215 * 0.15915493667125701904296875;
        float _1219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1221 = _1217 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = _1219 * 0.15915493667125701904296875;
        float _1227 = _1217 * 6.283185482025146484375;
        float _1229 = sin(_1227);
        float _1231 = 1.0 / _1223;
        float _1233 = _1225 * 6.283185482025146484375;
        float _1235 = cos(_1233);
        float _1237 = _1229 * _1231;
        float _1239 = _1225 * 6.283185482025146484375;
        float _1241 = sin(_1239);
        float _1243 = _1235 * _1237;
        float _1245 = 1.0 / _1243;
        float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1249 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1247;
        float _1251 = 1.0 / _1249;
        float _1253 = _1241 * _1245;
        float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1257 = fma(_1211, _1253, _1255);
        float _1259 = _1257 * _1251;
        float _1261 = precise::clamp(_1259, 0.0, 1.0);
        _1203 = _1261;
    }
    float _1263 = _1203;
    if (!_1121)
    {
        float _1265 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1267 * 0.15915493667125701904296875;
        float _1273 = _1269 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        float _1277 = _1269 * 6.283185482025146484375;
        float _1279 = sin(_1277);
        float _1281 = 1.0 / _1275;
        float _1283 = _1271 * 6.283185482025146484375;
        float _1285 = cos(_1283);
        float _1287 = _1279 * _1281;
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1285 * _1287;
        float _1295 = 1.0 / _1293;
        float _1297 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1299 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1297;
        float _1301 = 1.0 / _1299;
        float _1303 = _1291 * _1295;
        float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1307 = fma(_1211, _1303, _1305);
        float _1309 = _1307 * _1301;
        float _1311 = precise::clamp(_1309, 0.0, 1.0);
        float _1313 = -_1311;
        float _1315 = _1313 + 1.0;
        _1213 = _1315;
    }
    float _1317 = _1213;
    float _1319 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1321 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1201);
    float _1323 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1207);
    float _1325 = _1191 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1327 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1319);
    float _1329 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1321);
    float _1331 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1333 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1325);
    float _1335 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1339 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1341 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1343 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1345 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1347 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1339);
    float _1349 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1333);
    float _1351 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1353 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1341);
    float _1355 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1343);
    float _1357 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1345);
    bool _1359 = _1263 > 0.0;
    bool _1361 = isnan(_1263);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1263 * _1317;
    float _1371 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1347);
    float _1375 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1355);
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1353);
    bool _1379 = _1317 <= 0.0;
    bool _1381 = !_1367;
    bool _1383 = _1379 || _1381;
    float _1385 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1357);
    float _1387 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1389 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1373);
    float _1391 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1377);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1397 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1385);
    float _1399 = _1389 + _1391;
    float _1401 = _1393 + _1391;
    float _1403 = _1391 * 0.5;
    float _1405 = _1399 * 0.5;
    float _1407 = _1401 * 0.5;
    float _1409 = fma(_1397, -0.5, _1403);
    out.m_62.x = _901;
    out.m_64.x = _1193;
    out.m_64.y = _1191;
    out.m_64.z = _1195;
    out.m_35.x = _1395;
    out.gl_Position.x = _1389;
    out.gl_Position.y = _1397;
    out.gl_Position.z = _1393;
    out.gl_Position.w = _1391;
    out.m_66.x = _1405;
    out.m_66.y = _1409;
    out.m_66.z = _1407;
    out.m_66.w = _1391;
    if (!_1383)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _1411 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1411;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

