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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
};

struct main0_out
{
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_37 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_52 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _994 = false;
    bool _431 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_77)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_87);
        out.gl_Position.z = _1286;
    }
    if (!_77)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_73);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1355 = as_type<float>(_125);
        out.gl_Position.z = _1355;
    }
    if (_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = in.m_42.x;
    float _131 = in.m_42.y;
    float _133 = in.m_42.z;
    int _135 = as_type<int>(_127) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_127) & 2;
    bool _141 = _139 != 0;
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _145 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _149 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _151 = !_137;
    float _153 = _151 ? (-0.5) : 0.5;
    float _155 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _145);
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _147);
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _149);
    bool _161 = !_141;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _155);
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _169 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    bool _171 = !_143;
    float _189;
    if (!_171)
    {
        float _173 = in.m_44.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_73);
        float _195 = 1.0 / _193;
        float _197 = _105 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _199 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _231 = isnan(_199);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _215;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _219;
    float _247 = 1.0 / _223;
    float _249 = _203 * _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _199 + _251;
    float _255 = 1.0 / _227;
    float _257 = _207 * _245;
    bool _259 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _261 = isnan(_199);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_199);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _211 * _247;
    float _285 = -_239;
    float _287 = _285 + 1.0;
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = _269 * _287;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _253 * _255;
    float _301 = _281 * _291;
    bool _303 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_199);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_281;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _313 * _317;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -_335;
    float _355 = _353 + 1.0;
    float _357 = fma(_343, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _335 * _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = _345 * _361;
    float _373 = _319 * _361;
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _391 = fma(_357, _347, _379);
    float _393 = fma(_359, _347, _381);
    float _395 = fma(_385, _299, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _397 = fma(_389, _299, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _399 = fma(_375, _301, _391);
    float _401 = fma(_377, _301, _393);
    float _403 = fma(_395, _293, _399);
    float _405 = fma(_397, _293, _401);
    float _407 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].x, _403);
    float _409 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].y, _405);
    bool _411 = !_243;
    float _429;
    if (!_411)
    {
        float _413 = in.m_44.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_73);
        float _435 = 1.0 / _433;
        float _437 = _105 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_44.x;
    float _443 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _447 = in.m_32.x;
    float _449 = in.m_32.y;
    float _451 = in.m_32.z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = in.m_44.y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _439 + _463;
    float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _469 = _443 * _441;
    bool _471 = _441 > 0.5;
    float _473 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    float _481 = trunc(_469);
    int _483 = int(_481);
    float _485 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _487 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _489 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _475);
    bool _491 = _457 > 0.5;
    float _493 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _485);
    float _495 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _487);
    float _497 = 1.0 / _479;
    float _499 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _501 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _511 = _483 << 4;
    int _513 = _511 + 1968;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _507 + _523;
    uint _528 = uint(int(uint(_513) >> uint(2)));
    uint _530 = uint(int(uint(int(_528)) >> uint(2)));
    int _532 = int(_528) & 3;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[int(_530)][_532];
    int _536 = int(_528) + 1;
    uint _538 = uint(int(uint(_536) >> uint(2)));
    int _540 = _536 & 3;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[int(_538)][_540];
    float _544 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _509 + _546;
    float _550 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _552 = _465 * _497;
    bool _554 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_439);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _544 + _566;
    bool _570 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _572 = isnan(_439);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_505, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _584 = _513 + 8;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    uint _588 = uint(int(uint(int(_586)) >> uint(2)));
    int _590 = int(_586) & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = -_564;
    float _596 = _594 + 1.0;
    float _598 = fma(_517, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _600 = fma(_521, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _602 = -_153;
    int _604 = _471 ? as_type<int>(_602) : as_type<int>(_153);
    float _606 = _580 * _596;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = -_163;
    int _614 = _491 ? as_type<int>(_612) : as_type<int>(_163);
    float _616 = _582 * _606;
    float _618 = _598 * _606;
    float _620 = _600 * _606;
    bool _622 = !_455;
    float _624 = _622 ? _153 : as_type<float>(_604);
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].x, _616);
    float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _550);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].y, _618);
    bool _632 = !_461;
    float _634 = _632 ? _163 : as_type<float>(_614);
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    float _640 = _624 + 0.5;
    float _642 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].x, _626);
    float _644 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].z, _636);
    float _646 = -_634;
    float _648 = _646 + 0.5;
    float _650 = _525 * _525;
    bool _652 = _638 >= 0.0;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = fma(_548, _548, _650);
    float _660 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].y, _630);
    float _662 = _656 * _445;
    float _664 = fma(_568, _568, _658);
    float _666 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _672 = rsqrt(_664);
    float _674 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _678 = as_type<int>(_670);
    if (_652)
    {
        _676 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _680 = _676;
    float _682 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _686 = _542 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _688 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _654 * _467;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_652)
    {
        float _698 = _680 * 5.0;
        _678 = as_type<int>(_698);
    }
    int _700 = _678;
    float _702 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_46.x = _690;
    out.m_46.y = _662;
    float _704 = _525 * _672;
    float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _682;
    out.m_48.y = _688;
    out.m_48.z = _696;
    out.m_48.w = _668;
    float _708 = _548 * _672;
    out.m_50.x = _692;
    out.m_50.y = _694;
    out.m_50.z = _706;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_700);
        out.gl_Position.z = _2357;
    }
    if (_652)
    {
        out.m_35.x = 0.0;
    }
    if (_652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _714 = _568 * _672;
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _712 + _724;
    float _728 = -_714;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _718 + _732;
    float _736 = -_708;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _740 = _726 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _744 = _730 + _742;
    float _746 = _722 * _722;
    float _748 = in.m_52.x;
    float _750 = in.m_52.y;
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _740);
    float _754 = -_714;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _758 = fma(_738, _738, _746);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _756, _758);
    bool _764 = _760 >= 0.0;
    float _766 = sqrt(_762);
    float _768 = _744;
    if (_764)
    {
        _768 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _770 = _768;
    int _772 = as_type<int>(_770);
    if (_764)
    {
        out.m_35.x = 0.0;
    }
    float _774 = _407 * _748;
    float _776 = _409 * _750;
    float _778 = _672 * _766;
    if (_764)
    {
        float _780 = _770 * 5.0;
        _772 = as_type<int>(_780);
    }
    int _782 = _772;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_782);
        out.gl_Position.z = _2499;
    }
    if (_764)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _784 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _792 = _784 * _778;
    float _794 = _786 * _778;
    float _796 = _778 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _798 = _796 * 0.5;
    float _800 = _788 * _792;
    float _802 = _790 * _794;
    float _804 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _806 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _808 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _806);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[25].x, _808);
    float _816 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _810);
    float _818 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _814);
    float _822 = _816 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _828 = _509 + _822;
    float _830 = _544 + _824;
    float _832 = _507 + _826;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _828 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _830 + _838;
    float _842 = _836 * _836;
    float _844 = _840 * _840;
    float _846 = _842 + _844;
    float _848 = sqrt(_846);
    bool _850 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _798;
    float _854 = _826;
    float _856 = _808;
    float _858 = _828;
    float _860 = _844;
    if (!_850)
    {
        _852 = _828;
    }
    float _862 = _852;
    float _864 = _862;
    if (!_850)
    {
        _854 = _842;
    }
    float _866 = _854;
    float _868 = _866;
    if (!_850)
    {
        _856 = _830;
    }
    float _870 = _856;
    float _872 = _870;
    if (!_850)
    {
        _858 = _832;
    }
    float _874 = _858;
    bool _876 = !_850;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _848 + _882;
        float _886 = _832 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = rsqrt(_846);
        float _890 = _884 * _880;
        float _892 = _890 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _904 = _888 * _902;
        float _906 = _900 + (-1.0);
        float _908 = fma(_836, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_840, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _912 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _916 = _908 + _914;
        float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _920 = _910 + _918;
        float _922 = fma(_832, _900, _912);
        float _924 = _916 * _916;
        float _926 = _920 * _920;
        _878 = _922;
        _868 = _924;
        _860 = _926;
        _864 = _908;
        _872 = _910;
    }
    float _928 = _878;
    float _930 = _868;
    float _932 = _860;
    float _934 = _864;
    float _936 = _872;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _928 + _938;
    float _942 = fma(_940, _940, _930);
    float _944 = _942 + _932;
    float _946 = sqrt(_944);
    bool _948 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _950 = isnan(_946);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _956 = _952 || _954;
    float _958 = _930;
    if (!_956)
    {
        _958 = 1.0;
    }
    float _960 = _958;
    bool _962 = !_956;
    float _964 = _960;
    if (!_962)
    {
        bool _966 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _968 = isnan(_946);
        bool _970 = _966 || _968;
        bool _972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _974 = _970 || _972;
        if (!_974)
        {
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _978 = _946 + _976;
            float _980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _980;
            float _984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _986 = _984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _988 = 1.0 / _982;
            float _990 = _978 * _988;
            float _992 = fma(_990, _986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _964 = _992;
            _994 = true;
        }
        else
        {
            bool _996 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _998 = isnan(_946);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1004 = _1000 || _1002;
            if (!_1004)
            {
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1008 = _946 + _1006;
                float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1012 = _1010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1016 = _1014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1018 = 1.0 / _1012;
                float _1020 = _1008 * _1018;
                float _1022 = fma(_1020, _1016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _964 = _1022;
                _994 = true;
            }
            else
            {
                _964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _994 = false;
    float _1024 = _964;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1028 = _928 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1032 = _934 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1036 = _936 + _1034;
    float _1038 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1032, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1042 = fma(_1036, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1044 = -_507;
    float _1046 = _1044 + _1038;
    float _1048 = -_509;
    float _1050 = _1048 + _1040;
    float _1052 = -_544;
    float _1054 = _1052 + _1042;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = sqrt(_1060);
    bool _1064 = _1062 > 0.0;
    float _1066 = _1062;
    float _1068 = _1032;
    float _1070 = _1036;
    if (!_1064)
    {
        _1066 = _1040;
    }
    float _1072 = _1066;
    float _1074 = _1072;
    if (!_1064)
    {
        _1068 = _1038;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    float _1080 = _1076;
    if (!_1064)
    {
        _1070 = _1042;
    }
    float _1082 = _1070;
    bool _1084 = !_1064;
    float _1086 = _1082;
    if (!_1084)
    {
        float _1088 = _167 * _167;
        float _1090 = fma(_165, _165, _1088);
        float _1092 = rsqrt(_1060);
        float _1094 = fma(_169, _169, _1090);
        float _1096 = sqrt(_1094);
        float _1098 = _1050 * _1092;
        float _1100 = _1046 * _1092;
        float _1102 = _1054 * _1092;
        bool _1104 = _1096 > 0.0;
        float _1106 = _1092;
        float _1108 = _1096;
        if (!_1104)
        {
            _1106 = _1040;
        }
        float _1110 = _1106;
        _1074 = _1110;
        if (!_1104)
        {
            _1078 = _1038;
        }
        float _1112 = _1078;
        _1080 = _1112;
        if (!_1104)
        {
            _1108 = _1042;
        }
        float _1114 = _1108;
        bool _1116 = !_1104;
        _1086 = _1114;
        if (!_1116)
        {
            float _1118 = rsqrt(_1094);
            float _1120 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1122 = _167 * _1118;
            float _1124 = _165 * _1118;
            float _1126 = _1100 * _1122;
            float _1128 = _169 * _1118;
            float _1130 = fma(_1098, _1124, _1126);
            float _1132 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1134 = fma(_1102, _1128, _1130);
            float _1136 = _1134 * _1132;
            float _1138 = fma(_165, _1136, _1040);
            float _1140 = fma(_167, _1136, _1038);
            float _1142 = fma(_169, _1136, _1042);
            _1080 = _1140;
            _1074 = _1138;
            _1086 = _1142;
        }
    }
    float _1144 = _1080;
    float _1146 = _1074;
    float _1148 = _1086;
    float _1150 = -_704;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1154 = -_708;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1158 = -_714;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1218 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1212);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1224 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1216);
    float _1226 = _1218 + _1220;
    float _1228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1230 = _1226 * 0.5;
    out.m_35.x = _1228;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1218;
    out.gl_Position.w = _1220;
    out.m_54.z = _1230;
    out.m_54.w = _1220;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _994 = false;
    bool _431 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_77)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_87);
        out.gl_Position.z = _1286;
    }
    if (!_77)
    {
        return out;
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_73);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1355 = as_type<float>(_125);
        out.gl_Position.z = _1355;
    }
    if (_117)
    {
        return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = in.m_42.x;
    float _131 = in.m_42.y;
    float _133 = in.m_42.z;
    int _135 = as_type<int>(_127) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_127) & 2;
    bool _141 = _139 != 0;
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _145 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _149 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _151 = !_137;
    float _153 = _151 ? (-0.5) : 0.5;
    float _155 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _145);
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _147);
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _149);
    bool _161 = !_141;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _155);
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _169 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    bool _171 = !_143;
    float _189;
    if (!_171)
    {
        float _173 = in.m_44.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_73);
        float _195 = 1.0 / _193;
        float _197 = _105 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _199 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _231 = isnan(_199);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _215;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _219;
    float _247 = 1.0 / _223;
    float _249 = _203 * _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _199 + _251;
    float _255 = 1.0 / _227;
    float _257 = _207 * _245;
    bool _259 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _261 = isnan(_199);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_199);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _211 * _247;
    float _285 = -_239;
    float _287 = _285 + 1.0;
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = _269 * _287;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _253 * _255;
    float _301 = _281 * _291;
    bool _303 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_199);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_281;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _313 * _317;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -_335;
    float _355 = _353 + 1.0;
    float _357 = fma(_343, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _335 * _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = _345 * _361;
    float _373 = _319 * _361;
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _391 = fma(_357, _347, _379);
    float _393 = fma(_359, _347, _381);
    float _395 = fma(_385, _299, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _397 = fma(_389, _299, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _399 = fma(_375, _301, _391);
    float _401 = fma(_377, _301, _393);
    float _403 = fma(_395, _293, _399);
    float _405 = fma(_397, _293, _401);
    float _407 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].x, _403);
    float _409 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].y, _405);
    bool _411 = !_243;
    float _429;
    if (!_411)
    {
        float _413 = in.m_44.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_73);
        float _435 = 1.0 / _433;
        float _437 = _105 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_44.x;
    float _443 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _447 = in.m_32.x;
    float _449 = in.m_32.y;
    float _451 = in.m_32.z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = in.m_44.y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _439 + _463;
    float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _469 = _443 * _441;
    bool _471 = _441 > 0.5;
    float _473 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    float _481 = trunc(_469);
    int _483 = int(_481);
    float _485 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _487 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _489 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _475);
    bool _491 = _457 > 0.5;
    float _493 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _485);
    float _495 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _487);
    float _497 = 1.0 / _479;
    float _499 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _501 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _511 = _483 << 4;
    int _513 = _511 + 1968;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _507 + _523;
    uint _528 = uint(int(uint(_513) >> uint(2)));
    uint _530 = uint(int(uint(int(_528)) >> uint(2)));
    int _532 = int(_528) & 3;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[int(_530)][_532];
    int _536 = int(_528) + 1;
    uint _538 = uint(int(uint(_536) >> uint(2)));
    int _540 = _536 & 3;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[int(_538)][_540];
    float _544 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _509 + _546;
    float _550 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _552 = _465 * _497;
    bool _554 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_439);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _544 + _566;
    bool _570 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _572 = isnan(_439);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_505, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _584 = _513 + 8;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    uint _588 = uint(int(uint(int(_586)) >> uint(2)));
    int _590 = int(_586) & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = -_564;
    float _596 = _594 + 1.0;
    float _598 = fma(_517, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _600 = fma(_521, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _602 = -_153;
    int _604 = _471 ? as_type<int>(_602) : as_type<int>(_153);
    float _606 = _580 * _596;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = -_163;
    int _614 = _491 ? as_type<int>(_612) : as_type<int>(_163);
    float _616 = _582 * _606;
    float _618 = _598 * _606;
    float _620 = _600 * _606;
    bool _622 = !_455;
    float _624 = _622 ? _153 : as_type<float>(_604);
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].x, _616);
    float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _550);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].y, _618);
    bool _632 = !_461;
    float _634 = _632 ? _163 : as_type<float>(_614);
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    float _640 = _624 + 0.5;
    float _642 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].x, _626);
    float _644 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].z, _636);
    float _646 = -_634;
    float _648 = _646 + 0.5;
    float _650 = _525 * _525;
    bool _652 = _638 >= 0.0;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = fma(_548, _548, _650);
    float _660 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].y, _630);
    float _662 = _656 * _445;
    float _664 = fma(_568, _568, _658);
    float _666 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _672 = rsqrt(_664);
    float _674 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _678 = as_type<int>(_670);
    if (_652)
    {
        _676 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _680 = _676;
    float _682 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _686 = _542 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _688 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _654 * _467;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_652)
    {
        float _698 = _680 * 5.0;
        _678 = as_type<int>(_698);
    }
    int _700 = _678;
    float _702 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_46.x = _690;
    out.m_46.y = _662;
    float _704 = _525 * _672;
    float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _682;
    out.m_48.y = _688;
    out.m_48.z = _696;
    out.m_48.w = _668;
    float _708 = _548 * _672;
    out.m_50.x = _692;
    out.m_50.y = _694;
    out.m_50.z = _706;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_700);
        out.gl_Position.z = _2357;
    }
    if (_652)
    {
        out.m_35.x = 0.0;
    }
    if (_652)
    {
        return out;
    }
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _714 = _568 * _672;
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _712 + _724;
    float _728 = -_714;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _718 + _732;
    float _736 = -_708;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _740 = _726 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _744 = _730 + _742;
    float _746 = _722 * _722;
    float _748 = in.m_52.x;
    float _750 = in.m_52.y;
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _740);
    float _754 = -_714;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _758 = fma(_738, _738, _746);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _756, _758);
    bool _764 = _760 >= 0.0;
    float _766 = sqrt(_762);
    float _768 = _744;
    if (_764)
    {
        _768 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _770 = _768;
    int _772 = as_type<int>(_770);
    if (_764)
    {
        out.m_35.x = 0.0;
    }
    float _774 = _407 * _748;
    float _776 = _409 * _750;
    float _778 = _672 * _766;
    if (_764)
    {
        float _780 = _770 * 5.0;
        _772 = as_type<int>(_780);
    }
    int _782 = _772;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_782);
        out.gl_Position.z = _2499;
    }
    if (_764)
    {
        return out;
    }
    float _784 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _792 = _784 * _778;
    float _794 = _786 * _778;
    float _796 = _778 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _798 = _796 * 0.5;
    float _800 = _788 * _792;
    float _802 = _790 * _794;
    float _804 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _806 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _808 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _806);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[25].x, _808);
    float _816 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _810);
    float _818 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _814);
    float _822 = _816 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _828 = _509 + _822;
    float _830 = _544 + _824;
    float _832 = _507 + _826;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _828 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _830 + _838;
    float _842 = _836 * _836;
    float _844 = _840 * _840;
    float _846 = _842 + _844;
    float _848 = sqrt(_846);
    bool _850 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _798;
    float _854 = _826;
    float _856 = _808;
    float _858 = _828;
    float _860 = _844;
    if (!_850)
    {
        _852 = _828;
    }
    float _862 = _852;
    float _864 = _862;
    if (!_850)
    {
        _854 = _842;
    }
    float _866 = _854;
    float _868 = _866;
    if (!_850)
    {
        _856 = _830;
    }
    float _870 = _856;
    float _872 = _870;
    if (!_850)
    {
        _858 = _832;
    }
    float _874 = _858;
    bool _876 = !_850;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _848 + _882;
        float _886 = _832 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = rsqrt(_846);
        float _890 = _884 * _880;
        float _892 = _890 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _904 = _888 * _902;
        float _906 = _900 + (-1.0);
        float _908 = fma(_836, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_840, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _912 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _916 = _908 + _914;
        float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _920 = _910 + _918;
        float _922 = fma(_832, _900, _912);
        float _924 = _916 * _916;
        float _926 = _920 * _920;
        _878 = _922;
        _868 = _924;
        _860 = _926;
        _864 = _908;
        _872 = _910;
    }
    float _928 = _878;
    float _930 = _868;
    float _932 = _860;
    float _934 = _864;
    float _936 = _872;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _928 + _938;
    float _942 = fma(_940, _940, _930);
    float _944 = _942 + _932;
    float _946 = sqrt(_944);
    bool _948 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _950 = isnan(_946);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _956 = _952 || _954;
    float _958 = _930;
    if (!_956)
    {
        _958 = 1.0;
    }
    float _960 = _958;
    bool _962 = !_956;
    float _964 = _960;
    if (!_962)
    {
        bool _966 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _968 = isnan(_946);
        bool _970 = _966 || _968;
        bool _972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _974 = _970 || _972;
        if (!_974)
        {
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _978 = _946 + _976;
            float _980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _980;
            float _984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _986 = _984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _988 = 1.0 / _982;
            float _990 = _978 * _988;
            float _992 = fma(_990, _986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _964 = _992;
            _994 = true;
        }
        else
        {
            bool _996 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _998 = isnan(_946);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1004 = _1000 || _1002;
            if (!_1004)
            {
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1008 = _946 + _1006;
                float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1012 = _1010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1016 = _1014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1018 = 1.0 / _1012;
                float _1020 = _1008 * _1018;
                float _1022 = fma(_1020, _1016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _964 = _1022;
                _994 = true;
            }
            else
            {
                _964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _994 = false;
    float _1024 = _964;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1028 = _928 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1032 = _934 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1036 = _936 + _1034;
    float _1038 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1032, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1042 = fma(_1036, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1044 = -_507;
    float _1046 = _1044 + _1038;
    float _1048 = -_509;
    float _1050 = _1048 + _1040;
    float _1052 = -_544;
    float _1054 = _1052 + _1042;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = sqrt(_1060);
    bool _1064 = _1062 > 0.0;
    float _1066 = _1062;
    float _1068 = _1032;
    float _1070 = _1036;
    if (!_1064)
    {
        _1066 = _1040;
    }
    float _1072 = _1066;
    float _1074 = _1072;
    if (!_1064)
    {
        _1068 = _1038;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    float _1080 = _1076;
    if (!_1064)
    {
        _1070 = _1042;
    }
    float _1082 = _1070;
    bool _1084 = !_1064;
    float _1086 = _1082;
    if (!_1084)
    {
        float _1088 = _167 * _167;
        float _1090 = fma(_165, _165, _1088);
        float _1092 = rsqrt(_1060);
        float _1094 = fma(_169, _169, _1090);
        float _1096 = sqrt(_1094);
        float _1098 = _1050 * _1092;
        float _1100 = _1046 * _1092;
        float _1102 = _1054 * _1092;
        bool _1104 = _1096 > 0.0;
        float _1106 = _1092;
        float _1108 = _1096;
        if (!_1104)
        {
            _1106 = _1040;
        }
        float _1110 = _1106;
        _1074 = _1110;
        if (!_1104)
        {
            _1078 = _1038;
        }
        float _1112 = _1078;
        _1080 = _1112;
        if (!_1104)
        {
            _1108 = _1042;
        }
        float _1114 = _1108;
        bool _1116 = !_1104;
        _1086 = _1114;
        if (!_1116)
        {
            float _1118 = rsqrt(_1094);
            float _1120 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1122 = _167 * _1118;
            float _1124 = _165 * _1118;
            float _1126 = _1100 * _1122;
            float _1128 = _169 * _1118;
            float _1130 = fma(_1098, _1124, _1126);
            float _1132 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1134 = fma(_1102, _1128, _1130);
            float _1136 = _1134 * _1132;
            float _1138 = fma(_165, _1136, _1040);
            float _1140 = fma(_167, _1136, _1038);
            float _1142 = fma(_169, _1136, _1042);
            _1080 = _1140;
            _1074 = _1138;
            _1086 = _1142;
        }
    }
    float _1144 = _1080;
    float _1146 = _1074;
    float _1148 = _1086;
    float _1150 = -_704;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1154 = -_708;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1158 = -_714;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1218 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1212);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1224 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1216);
    float _1226 = _1218 + _1220;
    float _1228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1230 = _1226 * 0.5;
    out.m_35.x = _1228;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1218;
    out.gl_Position.w = _1220;
    out.m_54.z = _1230;
    out.m_54.w = _1220;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _994 = false;
    bool _431 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _68 = in.m_32.w;
    float _70 = trunc(_68);
    int _73 = int(_70);
    bool _77 = _73 >= 1;
    float _79 = 0.0;
    if (!_77)
    {
        _79 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _81 = _79;
    if (!_77)
    {
        out.m_35.x = 0.0;
    }
    int _83 = 0;
    if (!_77)
    {
        float _85 = _81 * 5.0;
        _83 = as_type<int>(_85);
    }
    int _87 = _83;
    int _89 = _87;
    if (!_77)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1286 = as_type<float>(_87);
        out.gl_Position.z = _1286;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _91 = in.m_37.w;
    bool _93 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _95 = isnan(_91);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _101 = _97 || _99;
    float _103 = -_91;
    float _105 = _103 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _107 = 0.0;
    if (_101)
    {
        float _109 = float(_73);
        _107 = _109;
    }
    float _111 = _107;
    bool _113 = _105 >= _111;
    bool _115 = !_101;
    bool _117 = _113 || _115;
    float _119 = _111;
    if (_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (_117)
    {
        out.m_35.x = 0.0;
    }
    if (_117)
    {
        float _123 = _121 * 5.0;
        _89 = as_type<int>(_123);
    }
    int _125 = _89;
    if (_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1355 = as_type<float>(_125);
        out.gl_Position.z = _1355;
    }
    if (_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = in.m_42.x;
    float _131 = in.m_42.y;
    float _133 = in.m_42.z;
    int _135 = as_type<int>(_127) & 1;
    bool _137 = _135 != 0;
    int _139 = as_type<int>(_127) & 2;
    bool _141 = _139 != 0;
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _145 = _131 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _147 = _131 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _149 = _131 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _151 = !_137;
    float _153 = _151 ? (-0.5) : 0.5;
    float _155 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[4].x, _145);
    float _157 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[5].x, _147);
    float _159 = fma(_129, (*spvDescriptorSet0.vp_c10)._m0[6].x, _149);
    bool _161 = !_141;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[4].z, _155);
    float _167 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[5].z, _157);
    float _169 = fma(_133, (*spvDescriptorSet0.vp_c10)._m0[6].z, _159);
    bool _171 = !_143;
    float _189;
    if (!_171)
    {
        float _173 = in.m_44.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_73);
        float _195 = 1.0 / _193;
        float _197 = _105 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _207 = _199 + _205;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _211 = _199 + _209;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _219 = _217 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _223 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _221;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _227 = _225 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _229 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _231 = isnan(_199);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = 1.0 / _215;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _245 = 1.0 / _219;
    float _247 = 1.0 / _223;
    float _249 = _203 * _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _199 + _251;
    float _255 = 1.0 / _227;
    float _257 = _207 * _245;
    bool _259 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _261 = isnan(_199);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_199);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _211 * _247;
    float _285 = -_239;
    float _287 = _285 + 1.0;
    float _289 = -_269;
    float _291 = _289 + 1.0;
    float _293 = _269 * _287;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _253 * _255;
    float _301 = _281 * _291;
    bool _303 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_199);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_281;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _249, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _321;
    bool _325 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_199);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = fma(_323, _249, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _347 = _313 * _317;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -_335;
    float _355 = _353 + 1.0;
    float _357 = fma(_343, _257, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _361 = _335 * _351;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = _345 * _361;
    float _373 = _319 * _361;
    float _375 = fma(_365, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _391 = fma(_357, _347, _379);
    float _393 = fma(_359, _347, _381);
    float _395 = fma(_385, _299, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _397 = fma(_389, _299, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _399 = fma(_375, _301, _391);
    float _401 = fma(_377, _301, _393);
    float _403 = fma(_395, _293, _399);
    float _405 = fma(_397, _293, _401);
    float _407 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].x, _403);
    float _409 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[147].y, _405);
    bool _411 = !_243;
    float _429;
    if (!_411)
    {
        float _413 = in.m_44.x;
        float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _417 = _413 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _419 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[11].x, _105);
        float _421 = _419 * _415;
        float _423 = floor(_421);
        float _425 = -_423;
        float _427 = _421 + _425;
        _429 = _427;
        _431 = true;
    }
    else
    {
        float _433 = float(_73);
        float _435 = 1.0 / _433;
        float _437 = _105 * _435;
        _429 = _437;
    }
    _431 = false;
    float _439 = _429;
    float _441 = in.m_44.x;
    float _443 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _447 = in.m_32.x;
    float _449 = in.m_32.y;
    float _451 = in.m_32.z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    float _457 = in.m_44.y;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _465 = _439 + _463;
    float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _469 = _443 * _441;
    bool _471 = _441 > 0.5;
    float _473 = _449 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _475 = _449 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    float _481 = trunc(_469);
    int _483 = int(_481);
    float _485 = _449 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _487 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[4].x, _473);
    float _489 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[5].x, _475);
    bool _491 = _457 > 0.5;
    float _493 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[6].x, _485);
    float _495 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _487);
    float _497 = 1.0 / _479;
    float _499 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _501 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _489);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _503;
    float _507 = _501 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = _495 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _511 = _483 << 4;
    int _513 = _511 + 1968;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _519;
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _507 + _523;
    uint _528 = uint(int(uint(_513) >> uint(2)));
    uint _530 = uint(int(uint(int(_528)) >> uint(2)));
    int _532 = int(_528) & 3;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[int(_530)][_532];
    int _536 = int(_528) + 1;
    uint _538 = uint(int(uint(_536) >> uint(2)));
    int _540 = _536 & 3;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[int(_538)][_540];
    float _544 = _499 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _548 = _509 + _546;
    float _550 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _552 = _465 * _497;
    bool _554 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _556 = isnan(_439);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _568 = _544 + _566;
    bool _570 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _572 = isnan(_439);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = fma(_505, _552, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    int _584 = _513 + 8;
    uint _586 = uint(int(uint(_584) >> uint(2)));
    uint _588 = uint(int(uint(int(_586)) >> uint(2)));
    int _590 = int(_586) & 3;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[int(_588)][_590];
    float _594 = -_564;
    float _596 = _594 + 1.0;
    float _598 = fma(_517, _552, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _600 = fma(_521, _552, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _602 = -_153;
    int _604 = _471 ? as_type<int>(_602) : as_type<int>(_153);
    float _606 = _580 * _596;
    float _608 = -_580;
    float _610 = _608 + 1.0;
    float _612 = -_163;
    int _614 = _491 ? as_type<int>(_612) : as_type<int>(_163);
    float _616 = _582 * _606;
    float _618 = _598 * _606;
    float _620 = _600 * _606;
    bool _622 = !_455;
    float _624 = _622 ? _153 : as_type<float>(_604);
    float _626 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].x, _616);
    float _628 = fma(_548, (*spvDescriptorSet0.vp_c8)._m0[28].x, _550);
    float _630 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].y, _618);
    bool _632 = !_461;
    float _634 = _632 ? _163 : as_type<float>(_614);
    float _636 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[107].z, _620);
    float _638 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[28].z, _628);
    float _640 = _624 + 0.5;
    float _642 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].x, _626);
    float _644 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].z, _636);
    float _646 = -_634;
    float _648 = _646 + 0.5;
    float _650 = _525 * _525;
    bool _652 = _638 >= 0.0;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _658 = fma(_548, _548, _650);
    float _660 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[108].y, _630);
    float _662 = _656 * _445;
    float _664 = fma(_568, _568, _658);
    float _666 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _672 = rsqrt(_664);
    float _674 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    int _678 = as_type<int>(_670);
    if (_652)
    {
        _676 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _680 = _676;
    float _682 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _684 = _534 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _686 = _542 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _688 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _654 * _467;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_652)
    {
        float _698 = _680 * 5.0;
        _678 = as_type<int>(_698);
    }
    int _700 = _678;
    float _702 = _592 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_46.x = _690;
    out.m_46.y = _662;
    float _704 = _525 * _672;
    float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_48.x = _682;
    out.m_48.y = _688;
    out.m_48.z = _696;
    out.m_48.w = _668;
    float _708 = _548 * _672;
    out.m_50.x = _692;
    out.m_50.y = _694;
    out.m_50.z = _706;
    if (_652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2357 = as_type<float>(_700);
        out.gl_Position.z = _2357;
    }
    if (_652)
    {
        out.m_35.x = 0.0;
    }
    if (_652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _710 = -_704;
    float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _714 = _568 * _672;
    float _716 = -_708;
    float _718 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _720 = -_704;
    float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    float _724 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _726 = _712 + _724;
    float _728 = -_714;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _544);
    float _732 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _734 = _718 + _732;
    float _736 = -_708;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _548);
    float _740 = _726 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _742 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _744 = _730 + _742;
    float _746 = _722 * _722;
    float _748 = in.m_52.x;
    float _750 = in.m_52.y;
    float _752 = fma(_734, (*spvDescriptorSet0.vp_c8)._m0[28].x, _740);
    float _754 = -_714;
    float _756 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _758 = fma(_738, _738, _746);
    float _760 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[28].z, _752);
    float _762 = fma(_756, _756, _758);
    bool _764 = _760 >= 0.0;
    float _766 = sqrt(_762);
    float _768 = _744;
    if (_764)
    {
        _768 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _770 = _768;
    int _772 = as_type<int>(_770);
    if (_764)
    {
        out.m_35.x = 0.0;
    }
    float _774 = _407 * _748;
    float _776 = _409 * _750;
    float _778 = _672 * _766;
    if (_764)
    {
        float _780 = _770 * 5.0;
        _772 = as_type<int>(_780);
    }
    int _782 = _772;
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2499 = as_type<float>(_782);
        out.gl_Position.z = _2499;
    }
    if (_764)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _784 = _776 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _790 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _792 = _784 * _778;
    float _794 = _786 * _778;
    float _796 = _778 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _798 = _796 * 0.5;
    float _800 = _788 * _792;
    float _802 = _790 * _794;
    float _804 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _806 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _808 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _804);
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[26].x, _806);
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[25].x, _808);
    float _816 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _810);
    float _818 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _812);
    float _820 = fma(_798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _814);
    float _822 = _816 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _824 = _818 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _826 = _820 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _828 = _509 + _822;
    float _830 = _544 + _824;
    float _832 = _507 + _826;
    float _834 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _836 = _828 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _840 = _830 + _838;
    float _842 = _836 * _836;
    float _844 = _840 * _840;
    float _846 = _842 + _844;
    float _848 = sqrt(_846);
    bool _850 = _848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _798;
    float _854 = _826;
    float _856 = _808;
    float _858 = _828;
    float _860 = _844;
    if (!_850)
    {
        _852 = _828;
    }
    float _862 = _852;
    float _864 = _862;
    if (!_850)
    {
        _854 = _842;
    }
    float _866 = _854;
    float _868 = _866;
    if (!_850)
    {
        _856 = _830;
    }
    float _870 = _856;
    float _872 = _870;
    if (!_850)
    {
        _858 = _832;
    }
    float _874 = _858;
    bool _876 = !_850;
    float _878 = _874;
    if (!_876)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _884 = _848 + _882;
        float _886 = _832 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = rsqrt(_846);
        float _890 = _884 * _880;
        float _892 = _890 * 0.15915493667125701904296875;
        float _894 = _892 * 6.283185482025146484375;
        float _896 = sin(_894);
        float _898 = _892 * 6.283185482025146484375;
        float _900 = cos(_898);
        float _902 = fma(_896, _886, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _904 = _888 * _902;
        float _906 = _900 + (-1.0);
        float _908 = fma(_836, _904, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _910 = fma(_840, _904, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _912 = _906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _916 = _908 + _914;
        float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _920 = _910 + _918;
        float _922 = fma(_832, _900, _912);
        float _924 = _916 * _916;
        float _926 = _920 * _920;
        _878 = _922;
        _868 = _924;
        _860 = _926;
        _864 = _908;
        _872 = _910;
    }
    float _928 = _878;
    float _930 = _868;
    float _932 = _860;
    float _934 = _864;
    float _936 = _872;
    float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _940 = _928 + _938;
    float _942 = fma(_940, _940, _930);
    float _944 = _942 + _932;
    float _946 = sqrt(_944);
    bool _948 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _950 = isnan(_946);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _956 = _952 || _954;
    float _958 = _930;
    if (!_956)
    {
        _958 = 1.0;
    }
    float _960 = _958;
    bool _962 = !_956;
    float _964 = _960;
    if (!_962)
    {
        bool _966 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _968 = isnan(_946);
        bool _970 = _966 || _968;
        bool _972 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _974 = _970 || _972;
        if (!_974)
        {
            float _976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _978 = _946 + _976;
            float _980 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _982 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _980;
            float _984 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _986 = _984 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _988 = 1.0 / _982;
            float _990 = _978 * _988;
            float _992 = fma(_990, _986, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _964 = _992;
            _994 = true;
        }
        else
        {
            bool _996 = _946 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _998 = isnan(_946);
            bool _1000 = _996 || _998;
            bool _1002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1004 = _1000 || _1002;
            if (!_1004)
            {
                float _1006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1008 = _946 + _1006;
                float _1010 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1012 = _1010 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1016 = _1014 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1018 = 1.0 / _1012;
                float _1020 = _1008 * _1018;
                float _1022 = fma(_1020, _1016, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _964 = _1022;
                _994 = true;
            }
            else
            {
                _964 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _994 = false;
    float _1024 = _964;
    float _1026 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1028 = _928 + _1026;
    float _1030 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1032 = _934 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1036 = _936 + _1034;
    float _1038 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1040 = fma(_1032, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1042 = fma(_1036, _1024, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1044 = -_507;
    float _1046 = _1044 + _1038;
    float _1048 = -_509;
    float _1050 = _1048 + _1040;
    float _1052 = -_544;
    float _1054 = _1052 + _1042;
    float _1056 = _1046 * _1046;
    float _1058 = fma(_1050, _1050, _1056);
    float _1060 = fma(_1054, _1054, _1058);
    float _1062 = sqrt(_1060);
    bool _1064 = _1062 > 0.0;
    float _1066 = _1062;
    float _1068 = _1032;
    float _1070 = _1036;
    if (!_1064)
    {
        _1066 = _1040;
    }
    float _1072 = _1066;
    float _1074 = _1072;
    if (!_1064)
    {
        _1068 = _1038;
    }
    float _1076 = _1068;
    float _1078 = _1076;
    float _1080 = _1076;
    if (!_1064)
    {
        _1070 = _1042;
    }
    float _1082 = _1070;
    bool _1084 = !_1064;
    float _1086 = _1082;
    if (!_1084)
    {
        float _1088 = _167 * _167;
        float _1090 = fma(_165, _165, _1088);
        float _1092 = rsqrt(_1060);
        float _1094 = fma(_169, _169, _1090);
        float _1096 = sqrt(_1094);
        float _1098 = _1050 * _1092;
        float _1100 = _1046 * _1092;
        float _1102 = _1054 * _1092;
        bool _1104 = _1096 > 0.0;
        float _1106 = _1092;
        float _1108 = _1096;
        if (!_1104)
        {
            _1106 = _1040;
        }
        float _1110 = _1106;
        _1074 = _1110;
        if (!_1104)
        {
            _1078 = _1038;
        }
        float _1112 = _1078;
        _1080 = _1112;
        if (!_1104)
        {
            _1108 = _1042;
        }
        float _1114 = _1108;
        bool _1116 = !_1104;
        _1086 = _1114;
        if (!_1116)
        {
            float _1118 = rsqrt(_1094);
            float _1120 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1122 = _167 * _1118;
            float _1124 = _165 * _1118;
            float _1126 = _1100 * _1122;
            float _1128 = _169 * _1118;
            float _1130 = fma(_1098, _1124, _1126);
            float _1132 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1134 = fma(_1102, _1128, _1130);
            float _1136 = _1134 * _1132;
            float _1138 = fma(_165, _1136, _1040);
            float _1140 = fma(_167, _1136, _1038);
            float _1142 = fma(_169, _1136, _1042);
            _1080 = _1140;
            _1074 = _1138;
            _1086 = _1142;
        }
    }
    float _1144 = _1080;
    float _1146 = _1074;
    float _1148 = _1086;
    float _1150 = -_704;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1154 = -_708;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1158 = -_714;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1162 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1164 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1166 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1168 = _1152 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1170 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1162);
    float _1172 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1164);
    float _1174 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1166);
    float _1176 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1168);
    float _1178 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1170);
    float _1180 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1172);
    float _1182 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1174);
    float _1184 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1176);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1192 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1194 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1198 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1200 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1196);
    float _1206 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1200);
    float _1210 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1202);
    float _1212 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1204);
    float _1214 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1208);
    float _1218 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1210);
    float _1220 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1212);
    float _1222 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1214);
    float _1224 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1216);
    float _1226 = _1218 + _1220;
    float _1228 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1230 = _1226 * 0.5;
    out.m_35.x = _1228;
    out.gl_Position.x = _1222;
    out.gl_Position.y = _1224;
    out.gl_Position.z = _1218;
    out.gl_Position.w = _1220;
    out.m_54.z = _1230;
    out.m_54.w = _1220;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

