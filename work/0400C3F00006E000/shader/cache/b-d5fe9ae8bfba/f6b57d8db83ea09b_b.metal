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
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_28 [[attribute(2)]];
    float4 m_33 [[attribute(3)]];
    float4 m_35 [[attribute(4)]];
    float4 m_40 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_83);
        out.gl_Position.z = _1215;
    }
    if (!_71)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_67);
        _77 = _101;
    }
    float _103 = _77;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    int _115 = 0;
    if (_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_119);
        out.gl_Position.z = _1284;
    }
    if (_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_35.x;
    float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = _125 * _123;
    float _143 = 0.0;
    float _145 = _129;
    if (!_139)
    {
        float _147 = _129 * _129;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_139)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_177;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = -_169;
    float _195 = _153 + _193;
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_139;
    float _203 = _159;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _129 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _129);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_139;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _145 = _257;
    }
    float _259 = _145;
    float _261 = in.m_40.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_187, 0.5, 0.5);
    bool _273 = _195 < 0.5;
    float _275 = float(_273);
    float _277 = -_195;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = in.m_28.x;
    float _283 = in.m_28.y;
    float _285 = in.m_28.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _293 = !_183;
    int _295 = _293 ? 0 : 1;
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_289);
    float _307 = fma(_259, _161, _291);
    int _309 = abs(_295);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = fma(_259, _163, _311);
    float _325 = float(_305);
    float _327 = fma(_259, _165, _317);
    float _329 = float(_309);
    float _331 = abs(_279);
    float _333 = _325 * _331;
    float _335 = fma(_323, _261, _283);
    float _337 = fma(_327, _261, _285);
    float _339 = float(_321);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_307, _261, _281);
    float _345 = abs(_299);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_67);
        float _371 = 1.0 / _369;
        float _373 = _99 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = 1.0 / _387;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = 1.0 / _383;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _375 + _411;
    bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _417 = 1.0 / _391;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _375 + _421;
    float _425 = _423 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _375 + _427;
    out.m_42.x = _419;
    out.m_42.y = _405;
    out.m_42.z = _409;
    out.m_42.w = _403;
    float _431 = _413 * _407;
    float _433 = _429 * _395;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _375 + _447;
    float _451 = -_445;
    float _453 = _451 + 1.0;
    float _455 = _449 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _463 = isnan(_375);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    bool _477 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_375);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = fma(_459, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_475, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _471 * _453;
    bool _495 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_375);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    bool _515 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_375);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_471;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _505 * _513;
    float _537 = -_505;
    float _539 = _537 + 1.0;
    float _541 = _487 * _529;
    float _543 = fma(_509, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _545 = fma(_533, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = _525 * _539;
    float _549 = in.m_40.x;
    float _551 = in.m_40.y;
    float _553 = -_525;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _557;
    float _561 = _489 * _547;
    float _563 = _491 * _547;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _565;
    float _569 = fma(_559, _433, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = fma(_567, _433, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = fma(_543, _535, _571);
    float _587 = fma(_545, _535, _573);
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_569, _541, _585);
    float _595 = fma(_575, _541, _587);
    float _597 = fma(_589, _493, _593);
    float _599 = fma(_591, _493, _595);
    float _601 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].x, _597);
    float _603 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].y, _599);
    float _605 = _601 * _549;
    float _607 = _603 * _551;
    bool _609 = !_415;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _613 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_67);
        float _631 = 1.0 / _629;
        float _633 = _99 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_35.z;
    float _639 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _641 = in.m_35.w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = in.m_35.y;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _639);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _669 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _671 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    bool _677 = _121 > 0.5;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _681 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _669);
    bool _683 = _637 > 0.5;
    float _685 = _347 * _605;
    bool _687 = _641 > 0.5;
    float _689 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _695 = -_667;
    float _697 = fma(_689, 2.0, _695);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = 1.0 / _693;
    float _703 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _709 = _653 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = fma(_709, -2.0, _679);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _719 = -_199;
    int _721 = _677 ? as_type<int>(_719) : as_type<int>(_199);
    float _723 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _711);
    bool _725 = _653 > 0.5;
    float _727 = _715 * _701;
    float _729 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[78].w, _717);
    float _731 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _671);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _635 + _733;
    bool _737 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _739 = isnan(_635);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _751 = -_191;
    int _753 = _725 ? as_type<int>(_751) : as_type<int>(_191);
    float _755 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _757 = !_645;
    float _759 = _757 ? _199 : as_type<float>(_721);
    float _761 = -_747;
    float _763 = _761 + 1.0;
    bool _765 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_635);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_99;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    bool _781 = !_651;
    float _783 = _781 ? _191 : as_type<float>(_753);
    float _785 = _759 + 0.5;
    float _787 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _789 = _775 * _763;
    float _791 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _729);
    float _793 = _783 + (-0.5);
    float _795 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _797 = fma(_703, _785, _779);
    float _799 = _755 * _789;
    float _801 = -_749;
    float _803 = -_723;
    float _805 = fma(_801, _793, _803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _815 = _795 + _813;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _819 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[131].x, _799);
    float _821 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _825 = _811 + _823;
    float _827 = _815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _829 = _815 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _821 + _831;
    float _835 = -_191;
    int _837 = _687 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].x, _827);
    float _841 = -_199;
    int _843 = _683 ? as_type<int>(_841) : as_type<int>(_199);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _847 = fma(_825, _825, _829);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _839);
    bool _851 = !_657;
    float _853 = _851 ? _199 : as_type<float>(_843);
    float _855 = -_791;
    float _857 = _855 + 1.0;
    bool _859 = !_663;
    float _861 = _859 ? _191 : as_type<float>(_837);
    float _863 = fma(_833, _833, _847);
    bool _865 = _849 >= 0.0;
    float _867 = _853 + 0.5;
    float _869 = fma(_783, _857, _805);
    float _871 = -_861;
    float _873 = _871 + 0.5;
    float _875 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _819);
    float _877 = rsqrt(_863);
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _881 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = -_787;
    float _885 = _883 + 1.0;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _889 = _879 * _817;
    float _891 = _881 * _845;
    float _893 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = _845;
    if (_865)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = -_885;
    float _901 = fma(_759, _899, _797);
    float _903 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_44.w = _887;
    int _905 = as_type<int>(_897);
    if (_865)
    {
        float _907 = _897 * 5.0;
        _905 = as_type<int>(_907);
    }
    int _909 = _905;
    float _911 = _903 * _877;
    out.m_46.x = _901;
    out.m_46.y = _869;
    out.m_46.z = _889;
    out.m_46.w = _891;
    float _913 = _825 * _911;
    float _915 = as_type<float>(_909);
    if (_865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2585 = as_type<float>(_909);
        out.gl_Position.z = _2585;
    }
    float _917 = _815 * _911;
    if (_865)
    {
        out.m_31.x = 0.0;
    }
    if (_865)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _919 = -_917;
    float _921 = _795 + _919;
    float _923 = _833 * _911;
    float _925 = -_913;
    float _927 = _811 + _925;
    float _929 = -_917;
    float _931 = _815 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = -_923;
    float _939 = _821 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _927 + _941;
    float _945 = -_913;
    float _947 = _825 + _945;
    float _949 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _939 + _951;
    float _955 = _931 * _931;
    float _957 = -_923;
    float _959 = _833 + _957;
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _949);
    float _963 = _347 * _607;
    float _965 = fma(_947, _947, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _961);
    float _969 = fma(_959, _959, _965);
    bool _971 = _967 >= 0.0;
    float _973 = sqrt(_969);
    if (_971)
    {
        _915 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _975 = _915;
    int _977 = as_type<int>(_975);
    if (_971)
    {
        out.m_31.x = 0.0;
    }
    float _979 = _877 * _973;
    if (_971)
    {
        float _981 = _975 * 5.0;
        _977 = as_type<int>(_981);
    }
    int _983 = _977;
    if (_971)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_983);
        out.gl_Position.z = _2709;
    }
    if (_971)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _985 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _991 = _893 * _979;
    float _993 = _979 * _985;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _997 = _995 * 0.5;
    bool _999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1007 = _1003 || _1005;
    float _1009 = _989 * _991;
    float _1011 = _987 * _993;
    float _1013 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1015 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1017 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1013);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1015);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1019);
    float _1027 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1029 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1023);
    float _1031 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1037 = _811 + _1031;
    float _1039 = _795 + _1033;
    float _1041 = _821 + _1035;
    float _1043 = -_913;
    float _1045 = _1043 + _1037;
    float _1047 = -_917;
    float _1049 = _1047 + _1039;
    float _1051 = -_923;
    float _1053 = _1051 + _1041;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1053;
    if (!_1007)
    {
        float _1061 = _935 * _935;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1065 = fma(_943, _943, _1061);
        float _1067 = fma(_953, _953, _1065);
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = sqrt(_1067);
        float _1073 = 1.0 / _979;
        float _1075 = precise::min(_1071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1077 = _1075 * _1063;
        float _1079 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1081 = _1077 * _1073;
        float _1083 = _1079 * _1081;
        float _1085 = fma(_1031, _1083, _927);
        float _1087 = fma(_1033, _1083, _921);
        float _1089 = fma(_1035, _1083, _939);
        _1055 = _1087;
        _1057 = _1085;
        _1059 = _1089;
    }
    float _1091 = _1055;
    float _1093 = _1057;
    float _1095 = _1059;
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1097);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1105);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1107);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1133);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1147 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1139);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1141);
    float _1151 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1143);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1145);
    float _1155 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1147);
    float _1157 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    out.m_48.x = _1093;
    out.m_48.y = _1091;
    out.m_48.z = _1095;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1155;
    out.gl_Position.y = _1153;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1159;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_83);
        out.gl_Position.z = _1215;
    }
    if (!_71)
    {
        return out;
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_67);
        _77 = _101;
    }
    float _103 = _77;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    int _115 = 0;
    if (_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_119);
        out.gl_Position.z = _1284;
    }
    if (_109)
    {
        return out;
    }
    float _121 = in.m_35.x;
    float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = _125 * _123;
    float _143 = 0.0;
    float _145 = _129;
    if (!_139)
    {
        float _147 = _129 * _129;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_139)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_177;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = -_169;
    float _195 = _153 + _193;
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_139;
    float _203 = _159;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _129 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _129);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_139;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _145 = _257;
    }
    float _259 = _145;
    float _261 = in.m_40.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_187, 0.5, 0.5);
    bool _273 = _195 < 0.5;
    float _275 = float(_273);
    float _277 = -_195;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = in.m_28.x;
    float _283 = in.m_28.y;
    float _285 = in.m_28.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _293 = !_183;
    int _295 = _293 ? 0 : 1;
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_289);
    float _307 = fma(_259, _161, _291);
    int _309 = abs(_295);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = fma(_259, _163, _311);
    float _325 = float(_305);
    float _327 = fma(_259, _165, _317);
    float _329 = float(_309);
    float _331 = abs(_279);
    float _333 = _325 * _331;
    float _335 = fma(_323, _261, _283);
    float _337 = fma(_327, _261, _285);
    float _339 = float(_321);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_307, _261, _281);
    float _345 = abs(_299);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_67);
        float _371 = 1.0 / _369;
        float _373 = _99 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = 1.0 / _387;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = 1.0 / _383;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _375 + _411;
    bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _417 = 1.0 / _391;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _375 + _421;
    float _425 = _423 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _375 + _427;
    out.m_42.x = _419;
    out.m_42.y = _405;
    out.m_42.z = _409;
    out.m_42.w = _403;
    float _431 = _413 * _407;
    float _433 = _429 * _395;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _375 + _447;
    float _451 = -_445;
    float _453 = _451 + 1.0;
    float _455 = _449 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _463 = isnan(_375);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    bool _477 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_375);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = fma(_459, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_475, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _471 * _453;
    bool _495 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_375);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    bool _515 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_375);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_471;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _505 * _513;
    float _537 = -_505;
    float _539 = _537 + 1.0;
    float _541 = _487 * _529;
    float _543 = fma(_509, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _545 = fma(_533, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = _525 * _539;
    float _549 = in.m_40.x;
    float _551 = in.m_40.y;
    float _553 = -_525;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _557;
    float _561 = _489 * _547;
    float _563 = _491 * _547;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _565;
    float _569 = fma(_559, _433, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = fma(_567, _433, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = fma(_543, _535, _571);
    float _587 = fma(_545, _535, _573);
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_569, _541, _585);
    float _595 = fma(_575, _541, _587);
    float _597 = fma(_589, _493, _593);
    float _599 = fma(_591, _493, _595);
    float _601 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].x, _597);
    float _603 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].y, _599);
    float _605 = _601 * _549;
    float _607 = _603 * _551;
    bool _609 = !_415;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _613 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_67);
        float _631 = 1.0 / _629;
        float _633 = _99 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_35.z;
    float _639 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _641 = in.m_35.w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = in.m_35.y;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _639);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _669 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _671 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    bool _677 = _121 > 0.5;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _681 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _669);
    bool _683 = _637 > 0.5;
    float _685 = _347 * _605;
    bool _687 = _641 > 0.5;
    float _689 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _695 = -_667;
    float _697 = fma(_689, 2.0, _695);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = 1.0 / _693;
    float _703 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _709 = _653 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = fma(_709, -2.0, _679);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _719 = -_199;
    int _721 = _677 ? as_type<int>(_719) : as_type<int>(_199);
    float _723 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _711);
    bool _725 = _653 > 0.5;
    float _727 = _715 * _701;
    float _729 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[78].w, _717);
    float _731 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _671);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _635 + _733;
    bool _737 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _739 = isnan(_635);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _751 = -_191;
    int _753 = _725 ? as_type<int>(_751) : as_type<int>(_191);
    float _755 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _757 = !_645;
    float _759 = _757 ? _199 : as_type<float>(_721);
    float _761 = -_747;
    float _763 = _761 + 1.0;
    bool _765 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_635);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_99;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    bool _781 = !_651;
    float _783 = _781 ? _191 : as_type<float>(_753);
    float _785 = _759 + 0.5;
    float _787 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _789 = _775 * _763;
    float _791 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _729);
    float _793 = _783 + (-0.5);
    float _795 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _797 = fma(_703, _785, _779);
    float _799 = _755 * _789;
    float _801 = -_749;
    float _803 = -_723;
    float _805 = fma(_801, _793, _803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _815 = _795 + _813;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _819 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[131].x, _799);
    float _821 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _825 = _811 + _823;
    float _827 = _815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _829 = _815 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _821 + _831;
    float _835 = -_191;
    int _837 = _687 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].x, _827);
    float _841 = -_199;
    int _843 = _683 ? as_type<int>(_841) : as_type<int>(_199);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _847 = fma(_825, _825, _829);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _839);
    bool _851 = !_657;
    float _853 = _851 ? _199 : as_type<float>(_843);
    float _855 = -_791;
    float _857 = _855 + 1.0;
    bool _859 = !_663;
    float _861 = _859 ? _191 : as_type<float>(_837);
    float _863 = fma(_833, _833, _847);
    bool _865 = _849 >= 0.0;
    float _867 = _853 + 0.5;
    float _869 = fma(_783, _857, _805);
    float _871 = -_861;
    float _873 = _871 + 0.5;
    float _875 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _819);
    float _877 = rsqrt(_863);
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _881 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = -_787;
    float _885 = _883 + 1.0;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _889 = _879 * _817;
    float _891 = _881 * _845;
    float _893 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = _845;
    if (_865)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = -_885;
    float _901 = fma(_759, _899, _797);
    float _903 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_44.w = _887;
    int _905 = as_type<int>(_897);
    if (_865)
    {
        float _907 = _897 * 5.0;
        _905 = as_type<int>(_907);
    }
    int _909 = _905;
    float _911 = _903 * _877;
    out.m_46.x = _901;
    out.m_46.y = _869;
    out.m_46.z = _889;
    out.m_46.w = _891;
    float _913 = _825 * _911;
    float _915 = as_type<float>(_909);
    if (_865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2585 = as_type<float>(_909);
        out.gl_Position.z = _2585;
    }
    float _917 = _815 * _911;
    if (_865)
    {
        out.m_31.x = 0.0;
    }
    if (_865)
    {
        return out;
    }
    float _919 = -_917;
    float _921 = _795 + _919;
    float _923 = _833 * _911;
    float _925 = -_913;
    float _927 = _811 + _925;
    float _929 = -_917;
    float _931 = _815 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = -_923;
    float _939 = _821 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _927 + _941;
    float _945 = -_913;
    float _947 = _825 + _945;
    float _949 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _939 + _951;
    float _955 = _931 * _931;
    float _957 = -_923;
    float _959 = _833 + _957;
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _949);
    float _963 = _347 * _607;
    float _965 = fma(_947, _947, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _961);
    float _969 = fma(_959, _959, _965);
    bool _971 = _967 >= 0.0;
    float _973 = sqrt(_969);
    if (_971)
    {
        _915 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _975 = _915;
    int _977 = as_type<int>(_975);
    if (_971)
    {
        out.m_31.x = 0.0;
    }
    float _979 = _877 * _973;
    if (_971)
    {
        float _981 = _975 * 5.0;
        _977 = as_type<int>(_981);
    }
    int _983 = _977;
    if (_971)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_983);
        out.gl_Position.z = _2709;
    }
    if (_971)
    {
        return out;
    }
    float _985 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _991 = _893 * _979;
    float _993 = _979 * _985;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _997 = _995 * 0.5;
    bool _999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1007 = _1003 || _1005;
    float _1009 = _989 * _991;
    float _1011 = _987 * _993;
    float _1013 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1015 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1017 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1013);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1015);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1019);
    float _1027 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1029 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1023);
    float _1031 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1037 = _811 + _1031;
    float _1039 = _795 + _1033;
    float _1041 = _821 + _1035;
    float _1043 = -_913;
    float _1045 = _1043 + _1037;
    float _1047 = -_917;
    float _1049 = _1047 + _1039;
    float _1051 = -_923;
    float _1053 = _1051 + _1041;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1053;
    if (!_1007)
    {
        float _1061 = _935 * _935;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1065 = fma(_943, _943, _1061);
        float _1067 = fma(_953, _953, _1065);
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = sqrt(_1067);
        float _1073 = 1.0 / _979;
        float _1075 = precise::min(_1071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1077 = _1075 * _1063;
        float _1079 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1081 = _1077 * _1073;
        float _1083 = _1079 * _1081;
        float _1085 = fma(_1031, _1083, _927);
        float _1087 = fma(_1033, _1083, _921);
        float _1089 = fma(_1035, _1083, _939);
        _1055 = _1087;
        _1057 = _1085;
        _1059 = _1089;
    }
    float _1091 = _1055;
    float _1093 = _1057;
    float _1095 = _1059;
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1097);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1105);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1107);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1133);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1147 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1139);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1141);
    float _1151 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1143);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1145);
    float _1155 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1147);
    float _1157 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    out.m_48.x = _1093;
    out.m_48.y = _1091;
    out.m_48.z = _1095;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1155;
    out.gl_Position.y = _1153;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1159;
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
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_31 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _627 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_28.w;
    float _64 = trunc(_62);
    int _67 = int(_64);
    bool _71 = _67 >= 1;
    float _73 = 0.0;
    if (!_71)
    {
        _73 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _75 = _73;
    float _77 = _75;
    if (!_71)
    {
        out.m_31.x = 0.0;
    }
    int _79 = 0;
    if (!_71)
    {
        float _81 = _75 * 5.0;
        _79 = as_type<int>(_81);
    }
    int _83 = _79;
    if (!_71)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1215 = as_type<float>(_83);
        out.gl_Position.z = _1215;
    }
    if (!_71)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _85 = in.m_33.w;
    bool _87 = _85 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _89 = isnan(_85);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _95 = _91 || _93;
    float _97 = -_85;
    float _99 = _97 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_95)
    {
        float _101 = float(_67);
        _77 = _101;
    }
    float _103 = _77;
    bool _105 = _99 >= _103;
    bool _107 = !_95;
    bool _109 = _105 || _107;
    float _111 = _103;
    if (_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    if (_109)
    {
        out.m_31.x = 0.0;
    }
    int _115 = 0;
    if (_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1284 = as_type<float>(_119);
        out.gl_Position.z = _1284;
    }
    if (_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_35.x;
    float _123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _125 = _99 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _99 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _131 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _133 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _135 = _131 || _133;
    bool _137 = isnan(1.0);
    bool _139 = _135 || _137;
    float _141 = _125 * _123;
    float _143 = 0.0;
    float _145 = _129;
    if (!_139)
    {
        float _147 = _129 * _129;
        float _149 = _147 * 0.5;
        _143 = _149;
    }
    float _151 = _143;
    float _153 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[20].x, _141);
    float _155 = _151;
    if (!_139)
    {
        float _157 = _151 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _155 = _157;
    }
    float _159 = _155;
    float _161 = in.m_33.x;
    float _163 = in.m_33.y;
    float _165 = in.m_33.z;
    float _167 = _153 * 6.283185482025146484375;
    float _169 = floor(_153);
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    float _179 = _167 * 0.15915493667125701904296875;
    int _181 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _183 = _181 != 0;
    float _185 = _179 * 6.283185482025146484375;
    float _187 = cos(_185);
    bool _189 = !_177;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = -_169;
    float _195 = _153 + _193;
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_139;
    float _203 = _159;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _129 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _129);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_139;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _145 = _257;
    }
    float _259 = _145;
    float _261 = in.m_40.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = fma(_187, 0.5, 0.5);
    bool _273 = _195 < 0.5;
    float _275 = float(_273);
    float _277 = -_195;
    float _279 = fma(_277, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _281 = in.m_28.x;
    float _283 = in.m_28.y;
    float _285 = in.m_28.z;
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _293 = !_183;
    int _295 = _293 ? 0 : 1;
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_271;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _305 = abs(_289);
    float _307 = fma(_259, _161, _291);
    int _309 = abs(_295);
    float _311 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _313 = !_269;
    int _315 = _313 ? 0 : 1;
    float _317 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _321 = abs(_315);
    float _323 = fma(_259, _163, _311);
    float _325 = float(_305);
    float _327 = fma(_259, _165, _317);
    float _329 = float(_309);
    float _331 = abs(_279);
    float _333 = _325 * _331;
    float _335 = fma(_323, _261, _283);
    float _337 = fma(_327, _261, _285);
    float _339 = float(_321);
    float _341 = fma(_329, _303, _333);
    float _343 = fma(_307, _261, _281);
    float _345 = abs(_299);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_319;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _99);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_67);
        float _371 = 1.0 / _369;
        float _373 = _99 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = 1.0 / _379;
    float _395 = 1.0 / _387;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _405 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = 1.0 / _383;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _375 + _411;
    bool _415 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _417 = 1.0 / _391;
    float _419 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _375 + _421;
    float _425 = _423 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _375 + _427;
    out.m_42.x = _419;
    out.m_42.y = _405;
    out.m_42.z = _409;
    out.m_42.w = _403;
    float _431 = _413 * _407;
    float _433 = _429 * _395;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _375 + _447;
    float _451 = -_445;
    float _453 = _451 + 1.0;
    float _455 = _449 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _457;
    bool _461 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _463 = isnan(_375);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    bool _477 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _479 = isnan(_375);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = fma(_459, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_475, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _493 = _471 * _453;
    bool _495 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _497 = isnan(_375);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    bool _515 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_375);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -_471;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = _505 * _513;
    float _537 = -_505;
    float _539 = _537 + 1.0;
    float _541 = _487 * _529;
    float _543 = fma(_509, _431, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _545 = fma(_533, _431, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = _525 * _539;
    float _549 = in.m_40.x;
    float _551 = in.m_40.y;
    float _553 = -_525;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _557;
    float _561 = _489 * _547;
    float _563 = _491 * _547;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _565;
    float _569 = fma(_559, _433, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _571 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].x, _561);
    float _573 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = fma(_567, _433, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _585 = fma(_543, _535, _571);
    float _587 = fma(_545, _535, _573);
    float _589 = fma(_579, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _591 = fma(_583, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _593 = fma(_569, _541, _585);
    float _595 = fma(_575, _541, _587);
    float _597 = fma(_589, _493, _593);
    float _599 = fma(_591, _493, _595);
    float _601 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].x, _597);
    float _603 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[147].y, _599);
    float _605 = _601 * _549;
    float _607 = _603 * _551;
    bool _609 = !_415;
    float _625;
    if (!_609)
    {
        float _611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _613 = _121 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[11].w, _99);
        float _617 = _615 * _611;
        float _619 = floor(_617);
        float _621 = -_619;
        float _623 = _617 + _621;
        _625 = _623;
        _627 = true;
    }
    else
    {
        float _629 = float(_67);
        float _631 = 1.0 / _629;
        float _633 = _99 * _631;
        _625 = _633;
    }
    _627 = false;
    float _635 = _625;
    float _637 = in.m_35.z;
    float _639 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _641 = in.m_35.w;
    int _643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _645 = _643 != 0;
    float _647 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _651 = _649 != 0;
    float _653 = in.m_35.y;
    int _655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _657 = _655 != 0;
    float _659 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].x, _639);
    int _661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _663 = _661 != 0;
    float _665 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _669 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].x, _647);
    float _671 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _675 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].z, _659);
    bool _677 = _121 > 0.5;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _681 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].z, _669);
    bool _683 = _637 > 0.5;
    float _685 = _347 * _605;
    bool _687 = _641 > 0.5;
    float _689 = _121 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _695 = -_667;
    float _697 = fma(_689, 2.0, _695);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = 1.0 / _693;
    float _703 = _673 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _705 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _707 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _709 = _653 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _711 = fma(_709, -2.0, _679);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _719 = -_199;
    int _721 = _677 ? as_type<int>(_719) : as_type<int>(_199);
    float _723 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[76].y, _711);
    bool _725 = _653 > 0.5;
    float _727 = _715 * _701;
    float _729 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[78].w, _717);
    float _731 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].z, _671);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _635 + _733;
    bool _737 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _739 = isnan(_635);
    bool _741 = _737 || _739;
    bool _743 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _745 = _741 || _743;
    float _747 = float(_745);
    float _749 = _707 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _751 = -_191;
    int _753 = _725 ? as_type<int>(_751) : as_type<int>(_191);
    float _755 = fma(_727, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _757 = !_645;
    float _759 = _757 ? _199 : as_type<float>(_721);
    float _761 = -_747;
    float _763 = _761 + 1.0;
    bool _765 = _635 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_635);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_99;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    bool _781 = !_651;
    float _783 = _781 ? _191 : as_type<float>(_753);
    float _785 = _759 + 0.5;
    float _787 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].z, _705);
    float _789 = _775 * _763;
    float _791 = fma(_99, (*spvDescriptorSet0.vp_c9)._m0[77].w, _729);
    float _793 = _783 + (-0.5);
    float _795 = _675 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _797 = fma(_703, _785, _779);
    float _799 = _755 * _789;
    float _801 = -_749;
    float _803 = -_723;
    float _805 = fma(_801, _793, _803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _731 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _815 = _795 + _813;
    float _817 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _819 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[131].x, _799);
    float _821 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _823 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _825 = _811 + _823;
    float _827 = _815 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _829 = _815 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _833 = _821 + _831;
    float _835 = -_191;
    int _837 = _687 ? as_type<int>(_835) : as_type<int>(_191);
    float _839 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[28].x, _827);
    float _841 = -_199;
    int _843 = _683 ? as_type<int>(_841) : as_type<int>(_199);
    float _845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _847 = fma(_825, _825, _829);
    float _849 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[28].z, _839);
    bool _851 = !_657;
    float _853 = _851 ? _199 : as_type<float>(_843);
    float _855 = -_791;
    float _857 = _855 + 1.0;
    bool _859 = !_663;
    float _861 = _859 ? _191 : as_type<float>(_837);
    float _863 = fma(_833, _833, _847);
    bool _865 = _849 >= 0.0;
    float _867 = _853 + 0.5;
    float _869 = fma(_783, _857, _805);
    float _871 = -_861;
    float _873 = _871 + 0.5;
    float _875 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[132].x, _819);
    float _877 = rsqrt(_863);
    float _879 = _867 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _881 = _873 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _883 = -_787;
    float _885 = _883 + 1.0;
    float _887 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _889 = _879 * _817;
    float _891 = _881 * _845;
    float _893 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _895 = _845;
    if (_865)
    {
        _895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _897 = _895;
    float _899 = -_885;
    float _901 = fma(_759, _899, _797);
    float _903 = _893 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_44.w = _887;
    int _905 = as_type<int>(_897);
    if (_865)
    {
        float _907 = _897 * 5.0;
        _905 = as_type<int>(_907);
    }
    int _909 = _905;
    float _911 = _903 * _877;
    out.m_46.x = _901;
    out.m_46.y = _869;
    out.m_46.z = _889;
    out.m_46.w = _891;
    float _913 = _825 * _911;
    float _915 = as_type<float>(_909);
    if (_865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2585 = as_type<float>(_909);
        out.gl_Position.z = _2585;
    }
    float _917 = _815 * _911;
    if (_865)
    {
        out.m_31.x = 0.0;
    }
    if (_865)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _919 = -_917;
    float _921 = _795 + _919;
    float _923 = _833 * _911;
    float _925 = -_913;
    float _927 = _811 + _925;
    float _929 = -_917;
    float _931 = _815 + _929;
    float _933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _935 = _921 + _933;
    float _937 = -_923;
    float _939 = _821 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _927 + _941;
    float _945 = -_913;
    float _947 = _825 + _945;
    float _949 = _935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _953 = _939 + _951;
    float _955 = _931 * _931;
    float _957 = -_923;
    float _959 = _833 + _957;
    float _961 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[28].x, _949);
    float _963 = _347 * _607;
    float _965 = fma(_947, _947, _955);
    float _967 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[28].z, _961);
    float _969 = fma(_959, _959, _965);
    bool _971 = _967 >= 0.0;
    float _973 = sqrt(_969);
    if (_971)
    {
        _915 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _975 = _915;
    int _977 = as_type<int>(_975);
    if (_971)
    {
        out.m_31.x = 0.0;
    }
    float _979 = _877 * _973;
    if (_971)
    {
        float _981 = _975 * 5.0;
        _977 = as_type<int>(_981);
    }
    int _983 = _977;
    if (_971)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2709 = as_type<float>(_983);
        out.gl_Position.z = _2709;
    }
    if (_971)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _985 = _963 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _987 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _191);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _991 = _893 * _979;
    float _993 = _979 * _985;
    float _995 = _979 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _997 = _995 * 0.5;
    bool _999 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1007 = _1003 || _1005;
    float _1009 = _989 * _991;
    float _1011 = _987 * _993;
    float _1013 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1015 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1017 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1013);
    float _1021 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1015);
    float _1023 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1019);
    float _1027 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1029 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1023);
    float _1031 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1033 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1035 = _1029 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1037 = _811 + _1031;
    float _1039 = _795 + _1033;
    float _1041 = _821 + _1035;
    float _1043 = -_913;
    float _1045 = _1043 + _1037;
    float _1047 = -_917;
    float _1049 = _1047 + _1039;
    float _1051 = -_923;
    float _1053 = _1051 + _1041;
    float _1055 = _1049;
    float _1057 = _1045;
    float _1059 = _1053;
    if (!_1007)
    {
        float _1061 = _935 * _935;
        float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1065 = fma(_943, _943, _1061);
        float _1067 = fma(_953, _953, _1065);
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = sqrt(_1067);
        float _1073 = 1.0 / _979;
        float _1075 = precise::min(_1071, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1077 = _1075 * _1063;
        float _1079 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1081 = _1077 * _1073;
        float _1083 = _1079 * _1081;
        float _1085 = fma(_1031, _1083, _927);
        float _1087 = fma(_1033, _1083, _921);
        float _1089 = fma(_1035, _1083, _939);
        _1055 = _1087;
        _1057 = _1085;
        _1059 = _1089;
    }
    float _1091 = _1055;
    float _1093 = _1057;
    float _1095 = _1059;
    float _1097 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1101 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1103 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1105 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1097);
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1099);
    float _1109 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1101);
    float _1111 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1103);
    float _1113 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1105);
    float _1115 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1107);
    float _1117 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1109);
    float _1119 = fma(_1095, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1111);
    float _1121 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1123 = _1115 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1125 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1127 = _1119 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1131 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1133 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1135 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1129);
    float _1139 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1131);
    float _1141 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1133);
    float _1143 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1135);
    float _1145 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1137);
    float _1147 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1139);
    float _1149 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1141);
    float _1151 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1143);
    float _1153 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1145);
    float _1155 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1147);
    float _1157 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1149);
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1151);
    out.m_48.x = _1093;
    out.m_48.y = _1091;
    out.m_48.z = _1095;
    out.m_31.x = (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _1155;
    out.gl_Position.y = _1153;
    out.gl_Position.z = _1157;
    out.gl_Position.w = _1159;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_31.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_31.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_31.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_31.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

