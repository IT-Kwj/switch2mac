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
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_33 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _283 = false;
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
        float _1285 = as_type<float>(_85);
        out.gl_Position.z = _1285;
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
        float _1354 = as_type<float>(_121);
        out.gl_Position.z = _1354;
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = 1.0 / _295;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = 1.0 / _307;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _291 + _321;
    float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _327 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _329 = 1.0 / _299;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _333 = 1.0 / _303;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _291 + _337;
    float _341 = _323 * _313;
    bool _343 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_291);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _339 * _309;
    bool _357 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_291);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _291 + _369;
    float _373 = _317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _291 + _375;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _377 * _329;
    out.m_44.x = _325;
    out.m_44.y = _335;
    out.m_44.z = _373;
    out.m_44.w = _319;
    float _385 = _371 * _333;
    bool _387 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_291);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _353 * _381;
    bool _401 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_291);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_42.x;
    bool _415 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _417 = isnan(_291);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = _425 * _429;
    float _433 = -_425;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = _411 * _435;
    float _447 = -_411;
    float _449 = _447 + 1.0;
    float _451 = fma(_439, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _397 * _449;
    float _465 = fma(_455, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = -_397;
    float _471 = _469 + 1.0;
    float _473 = _465 * _463;
    float _475 = _461 * _463;
    float _477 = _327 * _413;
    float _479 = in.m_40.x;
    float _481 = in.m_40.y;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _495 = fma(_467, _445, _483);
    float _497 = fma(_487, _385, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _503 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _509 = fma(_451, _445, _493);
    float _511 = trunc(_477);
    int _513 = int(_511);
    float _515 = fma(_501, _341, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _431, _495);
    float _519 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _521 = fma(_503, _431, _509);
    float _523 = fma(_515, _399, _517);
    float _525 = fma(_519, _399, _521);
    float _527 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _523);
    float _529 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _525);
    float _531 = _527 * _479;
    float _533 = _529 * _481;
    int _535 = _513 << 4;
    int _537 = _535 + 1968;
    bool _539 = !_331;
    float _555;
    if (!_539)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _543 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_69);
        float _561 = 1.0 / _559;
        float _563 = _103 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = in.m_42.z;
    float _569 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _571 = in.m_42.w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = in.m_42.y;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = 1.0 / _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    float _599 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _601 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
    float _603 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _599);
    bool _605 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _607 = isnan(_565);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _619 = _413 > 0.5;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _603);
    bool _639 = _567 > 0.5;
    float _641 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _645 = _571 > 0.5;
    float _647 = 1.0 / _623;
    float _649 = -_593;
    float _651 = fma(_643, 2.0, _649);
    float _653 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = _657 * _587;
    bool _663 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _665 = isnan(_565);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _679 = _565 + _677;
    float _681 = -_615;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_661, _679, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _695 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _697 = isnan(_565);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _673 * _683;
    float _709 = 1.0 / _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = _705 * _691;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _721 = _581 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _727 = _635 * _715;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _731 = fma(_721, -2.0, _719);
    float _733 = _725 * _647;
    float _735 = _693 * _727;
    float _737 = -_635;
    float _739 = _737 + 1.0;
    uint _742 = uint(int(uint(_537) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _760 = _565 + _758;
    float _762 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[131].x, _735);
    float _764 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _766 = _637 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_733, _760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _770;
    int _774 = _537 + 8;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[int(_778)][_780];
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _565 + _784;
    float _788 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    float _790 = -_177;
    int _792 = _619 ? as_type<int>(_790) : as_type<int>(_177);
    float _794 = _772 * _709;
    bool _796 = _581 > 0.5;
    float _798 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = fma(_768, _717, _762);
    float _802 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[78].w, _711);
    bool _804 = !_579;
    float _806 = _804 ? _177 : as_type<float>(_792);
    float _808 = fma(_794, _786, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _810 = -_181;
    int _812 = _796 ? as_type<int>(_810) : as_type<int>(_181);
    float _814 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _816 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _798 + _818;
    float _822 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _675);
    bool _824 = !_585;
    float _826 = _824 ? _181 : as_type<float>(_812);
    float _828 = -_103;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _832 = _806 + 0.5;
    float _834 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _766 + _836;
    float _840 = _820 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = fma(_808, _707, _800);
    float _844 = fma(_814, _832, _830);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _834 + _846;
    float _850 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _852 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[134].x, _842);
    float _854 = -_177;
    int _856 = _639 ? as_type<int>(_854) : as_type<int>(_177);
    float _858 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _731);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    float _862 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _802);
    bool _864 = !_591;
    float _866 = _864 ? _177 : as_type<float>(_856);
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _870 = -_181;
    int _872 = _645 ? as_type<int>(_870) : as_type<int>(_181);
    float _874 = _826 + (-0.5);
    bool _876 = _860 >= 0.0;
    float _878 = _866 + 0.5;
    bool _880 = !_597;
    float _882 = _880 ? _181 : as_type<float>(_872);
    float _884 = -_816;
    float _886 = -_858;
    float _888 = fma(_884, _874, _886);
    float _890 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _892 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _820 * _820;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -_882;
    float _900 = _898 + 0.5;
    float _902 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = fma(_838, _838, _894);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    float _910 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _914 = fma(_848, _848, _904);
    float _916 = fma(_826, _908, _888);
    float _918 = _826;
    if (_876)
    {
        _918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _920 = _918;
    float _922 = -_822;
    float _924 = _922 + 1.0;
    float _926 = rsqrt(_914);
    float _928 = _782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = _902 * _868;
    float _932 = -_924;
    float _934 = fma(_806, _932, _844);
    float _936 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _912 * _896;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _944 = as_type<int>(_920);
    if (_876)
    {
        float _946 = _920 * 5.0;
        _944 = as_type<int>(_946);
    }
    int _948 = _944;
    out.m_46.x = _934;
    out.m_46.y = _916;
    out.m_46.z = _930;
    out.m_46.w = _938;
    out.m_48.x = _936;
    out.m_48.y = _940;
    out.m_48.z = _942;
    out.m_48.w = _890;
    float _950 = _820 * _926;
    float _952 = _838 * _926;
    float _954 = as_type<float>(_948);
    if (_876)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_948);
        out.gl_Position.z = _2739;
    }
    if (_876)
    {
        out.m_33.x = 0.0;
    }
    if (_876)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _956 = -_950;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _960 = _848 * _926;
    float _962 = -_952;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _966 = -_950;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _958 + _970;
    float _974 = -_960;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = -_952;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _986 = _972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _968 * _968;
    float _994 = -_960;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[28].x, _986);
    float _1000 = fma(_984, _984, _992);
    float _1002 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    float _1004 = fma(_996, _996, _1000);
    bool _1006 = _1002 >= 0.0;
    float _1008 = sqrt(_1004);
    if (_1006)
    {
        _954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _954;
    int _1012 = as_type<int>(_1010);
    if (_1006)
    {
        out.m_33.x = 0.0;
    }
    float _1014 = _926 * _1008;
    if (_1006)
    {
        float _1016 = _1010 * 5.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    if (_1006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2870 = as_type<float>(_1018);
        out.gl_Position.z = _2870;
    }
    if (_1006)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1020 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1028 = _1014 * _1020;
    float _1030 = _1014 * _1022;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1034 = _1032 * 0.5;
    float _1036 = _1024 * _1028;
    float _1038 = _1026 * _1030;
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1046);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1048);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1058 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1064 = _834 + _1058;
    float _1066 = _766 + _1060;
    float _1068 = _798 + _1062;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = _1034;
    float _1088 = _1038;
    float _1090 = _1064;
    if (!_1084)
    {
        _1086 = _1064;
    }
    float _1092 = _1086;
    float _1094 = _1092;
    if (!_1084)
    {
        _1088 = _1066;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1084)
    {
        _1090 = _1068;
    }
    float _1100 = _1090;
    bool _1102 = !_1084;
    float _1104 = _1100;
    if (!_1102)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1110 = _1082 + _1108;
        float _1112 = rsqrt(_1080);
        float _1114 = _1110 * _1106;
        float _1116 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1114 * 0.15915493667125701904296875;
        float _1120 = _1118 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1118 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 + (-1.0);
        float _1130 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = fma(_1068, _1122, _1130);
        float _1136 = _1112 * _1132;
        float _1138 = fma(_1076, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1072, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1134;
        _1098 = _1138;
        _1094 = _1140;
    }
    float _1142 = _1104;
    float _1144 = _1098;
    float _1146 = _1094;
    float _1148 = -_950;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1152 = -_952;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1156 = -_960;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1160);
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1182 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1174);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1218 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1210);
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1222 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1224 = _1216 + _1218;
    float _1226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1228 = _1224 * 0.5;
    out.m_33.x = _1226;
    out.gl_Position.x = _1220;
    out.gl_Position.y = _1222;
    out.gl_Position.z = _1216;
    out.gl_Position.w = _1218;
    out.m_50.z = _1228;
    out.m_50.w = _1218;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _283 = false;
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
        float _1285 = as_type<float>(_85);
        out.gl_Position.z = _1285;
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
        float _1354 = as_type<float>(_121);
        out.gl_Position.z = _1354;
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = 1.0 / _295;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = 1.0 / _307;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _291 + _321;
    float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _327 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _329 = 1.0 / _299;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _333 = 1.0 / _303;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _291 + _337;
    float _341 = _323 * _313;
    bool _343 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_291);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _339 * _309;
    bool _357 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_291);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _291 + _369;
    float _373 = _317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _291 + _375;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _377 * _329;
    out.m_44.x = _325;
    out.m_44.y = _335;
    out.m_44.z = _373;
    out.m_44.w = _319;
    float _385 = _371 * _333;
    bool _387 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_291);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _353 * _381;
    bool _401 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_291);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_42.x;
    bool _415 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _417 = isnan(_291);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = _425 * _429;
    float _433 = -_425;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = _411 * _435;
    float _447 = -_411;
    float _449 = _447 + 1.0;
    float _451 = fma(_439, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _397 * _449;
    float _465 = fma(_455, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = -_397;
    float _471 = _469 + 1.0;
    float _473 = _465 * _463;
    float _475 = _461 * _463;
    float _477 = _327 * _413;
    float _479 = in.m_40.x;
    float _481 = in.m_40.y;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _495 = fma(_467, _445, _483);
    float _497 = fma(_487, _385, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _503 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _509 = fma(_451, _445, _493);
    float _511 = trunc(_477);
    int _513 = int(_511);
    float _515 = fma(_501, _341, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _431, _495);
    float _519 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _521 = fma(_503, _431, _509);
    float _523 = fma(_515, _399, _517);
    float _525 = fma(_519, _399, _521);
    float _527 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _523);
    float _529 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _525);
    float _531 = _527 * _479;
    float _533 = _529 * _481;
    int _535 = _513 << 4;
    int _537 = _535 + 1968;
    bool _539 = !_331;
    float _555;
    if (!_539)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _543 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_69);
        float _561 = 1.0 / _559;
        float _563 = _103 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = in.m_42.z;
    float _569 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _571 = in.m_42.w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = in.m_42.y;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = 1.0 / _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    float _599 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _601 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
    float _603 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _599);
    bool _605 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _607 = isnan(_565);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _619 = _413 > 0.5;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _603);
    bool _639 = _567 > 0.5;
    float _641 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _645 = _571 > 0.5;
    float _647 = 1.0 / _623;
    float _649 = -_593;
    float _651 = fma(_643, 2.0, _649);
    float _653 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = _657 * _587;
    bool _663 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _665 = isnan(_565);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _679 = _565 + _677;
    float _681 = -_615;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_661, _679, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _695 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _697 = isnan(_565);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _673 * _683;
    float _709 = 1.0 / _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = _705 * _691;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _721 = _581 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _727 = _635 * _715;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _731 = fma(_721, -2.0, _719);
    float _733 = _725 * _647;
    float _735 = _693 * _727;
    float _737 = -_635;
    float _739 = _737 + 1.0;
    uint _742 = uint(int(uint(_537) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _760 = _565 + _758;
    float _762 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[131].x, _735);
    float _764 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _766 = _637 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_733, _760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _770;
    int _774 = _537 + 8;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[int(_778)][_780];
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _565 + _784;
    float _788 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    float _790 = -_177;
    int _792 = _619 ? as_type<int>(_790) : as_type<int>(_177);
    float _794 = _772 * _709;
    bool _796 = _581 > 0.5;
    float _798 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = fma(_768, _717, _762);
    float _802 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[78].w, _711);
    bool _804 = !_579;
    float _806 = _804 ? _177 : as_type<float>(_792);
    float _808 = fma(_794, _786, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _810 = -_181;
    int _812 = _796 ? as_type<int>(_810) : as_type<int>(_181);
    float _814 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _816 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _798 + _818;
    float _822 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _675);
    bool _824 = !_585;
    float _826 = _824 ? _181 : as_type<float>(_812);
    float _828 = -_103;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _832 = _806 + 0.5;
    float _834 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _766 + _836;
    float _840 = _820 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = fma(_808, _707, _800);
    float _844 = fma(_814, _832, _830);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _834 + _846;
    float _850 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _852 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[134].x, _842);
    float _854 = -_177;
    int _856 = _639 ? as_type<int>(_854) : as_type<int>(_177);
    float _858 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _731);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    float _862 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _802);
    bool _864 = !_591;
    float _866 = _864 ? _177 : as_type<float>(_856);
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _870 = -_181;
    int _872 = _645 ? as_type<int>(_870) : as_type<int>(_181);
    float _874 = _826 + (-0.5);
    bool _876 = _860 >= 0.0;
    float _878 = _866 + 0.5;
    bool _880 = !_597;
    float _882 = _880 ? _181 : as_type<float>(_872);
    float _884 = -_816;
    float _886 = -_858;
    float _888 = fma(_884, _874, _886);
    float _890 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _892 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _820 * _820;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -_882;
    float _900 = _898 + 0.5;
    float _902 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = fma(_838, _838, _894);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    float _910 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _914 = fma(_848, _848, _904);
    float _916 = fma(_826, _908, _888);
    float _918 = _826;
    if (_876)
    {
        _918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _920 = _918;
    float _922 = -_822;
    float _924 = _922 + 1.0;
    float _926 = rsqrt(_914);
    float _928 = _782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = _902 * _868;
    float _932 = -_924;
    float _934 = fma(_806, _932, _844);
    float _936 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _912 * _896;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _944 = as_type<int>(_920);
    if (_876)
    {
        float _946 = _920 * 5.0;
        _944 = as_type<int>(_946);
    }
    int _948 = _944;
    out.m_46.x = _934;
    out.m_46.y = _916;
    out.m_46.z = _930;
    out.m_46.w = _938;
    out.m_48.x = _936;
    out.m_48.y = _940;
    out.m_48.z = _942;
    out.m_48.w = _890;
    float _950 = _820 * _926;
    float _952 = _838 * _926;
    float _954 = as_type<float>(_948);
    if (_876)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_948);
        out.gl_Position.z = _2739;
    }
    if (_876)
    {
        out.m_33.x = 0.0;
    }
    if (_876)
    {
        return out;
    }
    float _956 = -_950;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _960 = _848 * _926;
    float _962 = -_952;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _966 = -_950;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _958 + _970;
    float _974 = -_960;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = -_952;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _986 = _972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _968 * _968;
    float _994 = -_960;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[28].x, _986);
    float _1000 = fma(_984, _984, _992);
    float _1002 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    float _1004 = fma(_996, _996, _1000);
    bool _1006 = _1002 >= 0.0;
    float _1008 = sqrt(_1004);
    if (_1006)
    {
        _954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _954;
    int _1012 = as_type<int>(_1010);
    if (_1006)
    {
        out.m_33.x = 0.0;
    }
    float _1014 = _926 * _1008;
    if (_1006)
    {
        float _1016 = _1010 * 5.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    if (_1006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2870 = as_type<float>(_1018);
        out.gl_Position.z = _2870;
    }
    if (_1006)
    {
        return out;
    }
    float _1020 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1028 = _1014 * _1020;
    float _1030 = _1014 * _1022;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1034 = _1032 * 0.5;
    float _1036 = _1024 * _1028;
    float _1038 = _1026 * _1030;
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1046);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1048);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1058 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1064 = _834 + _1058;
    float _1066 = _766 + _1060;
    float _1068 = _798 + _1062;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = _1034;
    float _1088 = _1038;
    float _1090 = _1064;
    if (!_1084)
    {
        _1086 = _1064;
    }
    float _1092 = _1086;
    float _1094 = _1092;
    if (!_1084)
    {
        _1088 = _1066;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1084)
    {
        _1090 = _1068;
    }
    float _1100 = _1090;
    bool _1102 = !_1084;
    float _1104 = _1100;
    if (!_1102)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1110 = _1082 + _1108;
        float _1112 = rsqrt(_1080);
        float _1114 = _1110 * _1106;
        float _1116 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1114 * 0.15915493667125701904296875;
        float _1120 = _1118 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1118 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 + (-1.0);
        float _1130 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = fma(_1068, _1122, _1130);
        float _1136 = _1112 * _1132;
        float _1138 = fma(_1076, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1072, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1134;
        _1098 = _1138;
        _1094 = _1140;
    }
    float _1142 = _1104;
    float _1144 = _1098;
    float _1146 = _1094;
    float _1148 = -_950;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1152 = -_952;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1156 = -_960;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1160);
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1182 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1174);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1218 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1210);
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1222 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1224 = _1216 + _1218;
    float _1226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1228 = _1224 * 0.5;
    out.m_33.x = _1226;
    out.gl_Position.x = _1220;
    out.gl_Position.y = _1222;
    out.gl_Position.z = _1216;
    out.gl_Position.w = _1218;
    out.m_50.z = _1228;
    out.m_50.w = _1218;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    bool _557 = false;
    bool _283 = false;
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
        float _1285 = as_type<float>(_85);
        out.gl_Position.z = _1285;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1354 = as_type<float>(_121);
        out.gl_Position.z = _1354;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _125 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _125);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    bool _219 = !_137;
    if (!_219)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = 1.0 / _227;
        float _231 = _125 * _223;
        float _233 = exp2(_231);
        float _235 = -_233;
        float _237 = _235 + 1.0;
        float _239 = _237 * _229;
        _153 = _239;
    }
    float _241 = _153;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _251 = fma(_241, _139, _245);
    float _253 = fma(_241, _141, _247);
    float _255 = fma(_241, _143, _249);
    float _257 = fma(_251, _127, _145);
    float _259 = fma(_253, _127, _147);
    float _261 = fma(_255, _127, _149);
    bool _263 = !_243;
    float _281;
    if (!_263)
    {
        float _265 = in.m_42.x;
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _103);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_69);
        float _287 = 1.0 / _285;
        float _289 = _103 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _297 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _309 = 1.0 / _295;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = 1.0 / _307;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _323 = _291 + _321;
    float _325 = _315 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _327 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _329 = 1.0 / _299;
    bool _331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _333 = 1.0 / _303;
    float _335 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _291 + _337;
    float _341 = _323 * _313;
    bool _343 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _345 = isnan(_291);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = _339 * _309;
    bool _357 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _359 = isnan(_291);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _291 + _369;
    float _373 = _317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _377 = _291 + _375;
    float _379 = -_367;
    float _381 = _379 + 1.0;
    float _383 = _377 * _329;
    out.m_44.x = _325;
    out.m_44.y = _335;
    out.m_44.z = _373;
    out.m_44.w = _319;
    float _385 = _371 * _333;
    bool _387 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_291);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = _353 * _381;
    bool _401 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _403 = isnan(_291);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_42.x;
    bool _415 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _417 = isnan(_291);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = -_353;
    float _429 = _427 + 1.0;
    float _431 = _425 * _429;
    float _433 = -_425;
    float _435 = _433 + 1.0;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _441;
    float _445 = _411 * _435;
    float _447 = -_411;
    float _449 = _447 + 1.0;
    float _451 = fma(_439, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = fma(_443, _355, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _463 = _397 * _449;
    float _465 = fma(_455, _355, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _467 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _469 = -_397;
    float _471 = _469 + 1.0;
    float _473 = _465 * _463;
    float _475 = _461 * _463;
    float _477 = _327 * _413;
    float _479 = in.m_40.x;
    float _481 = in.m_40.y;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _489;
    float _493 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _495 = fma(_467, _445, _483);
    float _497 = fma(_487, _385, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _503 = fma(_491, _385, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _509 = fma(_451, _445, _493);
    float _511 = trunc(_477);
    int _513 = int(_511);
    float _515 = fma(_501, _341, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _517 = fma(_497, _431, _495);
    float _519 = fma(_507, _341, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _521 = fma(_503, _431, _509);
    float _523 = fma(_515, _399, _517);
    float _525 = fma(_519, _399, _521);
    float _527 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].x, _523);
    float _529 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[147].y, _525);
    float _531 = _527 * _479;
    float _533 = _529 * _481;
    int _535 = _513 << 4;
    int _537 = _535 + 1968;
    bool _539 = !_331;
    float _555;
    if (!_539)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _543 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].w, _103);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_69);
        float _561 = 1.0 / _559;
        float _563 = _103 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = in.m_42.z;
    float _569 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _571 = in.m_42.w;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _579 = _577 != 0;
    float _581 = in.m_42.y;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _585 = _583 != 0;
    float _587 = 1.0 / _575;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _591 = _589 != 0;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _597 = _595 != 0;
    float _599 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _601 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _569);
    float _603 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _599);
    bool _605 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _607 = isnan(_565);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _619 = _413 > 0.5;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_565);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _603);
    bool _639 = _567 > 0.5;
    float _641 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _643 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _645 = _571 > 0.5;
    float _647 = 1.0 / _623;
    float _649 = -_593;
    float _651 = fma(_643, 2.0, _649);
    float _653 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _641);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _655;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _661 = _657 * _587;
    bool _663 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _665 = isnan(_565);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    float _675 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _659);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _679 = _565 + _677;
    float _681 = -_615;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _689 = -_673;
    float _691 = _689 + 1.0;
    float _693 = fma(_661, _679, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _695 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _697 = isnan(_565);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = _673 * _683;
    float _709 = 1.0 / _687;
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _713 = -_705;
    float _715 = _713 + 1.0;
    float _717 = _705 * _691;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _721 = _581 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _727 = _635 * _715;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _731 = fma(_721, -2.0, _719);
    float _733 = _725 * _647;
    float _735 = _693 * _727;
    float _737 = -_635;
    float _739 = _737 + 1.0;
    uint _742 = uint(int(uint(_537) >> uint(2)));
    uint _744 = uint(int(uint(int(_742)) >> uint(2)));
    int _746 = int(_742) & 3;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[int(_744)][_746];
    int _750 = int(_742) + 1;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    int _754 = _750 & 3;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[int(_752)][_754];
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _760 = _565 + _758;
    float _762 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[131].x, _735);
    float _764 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _766 = _637 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = fma(_733, _760, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _770;
    int _774 = _537 + 8;
    uint _776 = uint(int(uint(_774) >> uint(2)));
    uint _778 = uint(int(uint(int(_776)) >> uint(2)));
    int _780 = int(_776) & 3;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[int(_778)][_780];
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _565 + _784;
    float _788 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _653);
    float _790 = -_177;
    int _792 = _619 ? as_type<int>(_790) : as_type<int>(_177);
    float _794 = _772 * _709;
    bool _796 = _581 > 0.5;
    float _798 = _788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _800 = fma(_768, _717, _762);
    float _802 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[78].w, _711);
    bool _804 = !_579;
    float _806 = _804 ? _177 : as_type<float>(_792);
    float _808 = fma(_794, _786, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _810 = -_181;
    int _812 = _796 ? as_type<int>(_810) : as_type<int>(_181);
    float _814 = _617 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _816 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _818 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _820 = _798 + _818;
    float _822 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].z, _675);
    bool _824 = !_585;
    float _826 = _824 ? _181 : as_type<float>(_812);
    float _828 = -_103;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[76].x, _651);
    float _832 = _806 + 0.5;
    float _834 = _764 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _838 = _766 + _836;
    float _840 = _820 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _842 = fma(_808, _707, _800);
    float _844 = fma(_814, _832, _830);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _848 = _834 + _846;
    float _850 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    float _852 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[134].x, _842);
    float _854 = -_177;
    int _856 = _639 ? as_type<int>(_854) : as_type<int>(_177);
    float _858 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[76].y, _731);
    float _860 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[28].z, _850);
    float _862 = fma(_103, (*spvDescriptorSet0.vp_c9)._m0[77].w, _802);
    bool _864 = !_591;
    float _866 = _864 ? _177 : as_type<float>(_856);
    float _868 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _870 = -_181;
    int _872 = _645 ? as_type<int>(_870) : as_type<int>(_181);
    float _874 = _826 + (-0.5);
    bool _876 = _860 >= 0.0;
    float _878 = _866 + 0.5;
    bool _880 = !_597;
    float _882 = _880 ? _181 : as_type<float>(_872);
    float _884 = -_816;
    float _886 = -_858;
    float _888 = fma(_884, _874, _886);
    float _890 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _892 = _756 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _894 = _820 * _820;
    float _896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _898 = -_882;
    float _900 = _898 + 0.5;
    float _902 = _878 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _904 = fma(_838, _838, _894);
    float _906 = -_862;
    float _908 = _906 + 1.0;
    float _910 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _912 = _900 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _914 = fma(_848, _848, _904);
    float _916 = fma(_826, _908, _888);
    float _918 = _826;
    if (_876)
    {
        _918 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _920 = _918;
    float _922 = -_822;
    float _924 = _922 + 1.0;
    float _926 = rsqrt(_914);
    float _928 = _782 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _930 = _902 * _868;
    float _932 = -_924;
    float _934 = fma(_806, _932, _844);
    float _936 = _910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _912 * _896;
    float _940 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _942 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _944 = as_type<int>(_920);
    if (_876)
    {
        float _946 = _920 * 5.0;
        _944 = as_type<int>(_946);
    }
    int _948 = _944;
    out.m_46.x = _934;
    out.m_46.y = _916;
    out.m_46.z = _930;
    out.m_46.w = _938;
    out.m_48.x = _936;
    out.m_48.y = _940;
    out.m_48.z = _942;
    out.m_48.w = _890;
    float _950 = _820 * _926;
    float _952 = _838 * _926;
    float _954 = as_type<float>(_948);
    if (_876)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2739 = as_type<float>(_948);
        out.gl_Position.z = _2739;
    }
    if (_876)
    {
        out.m_33.x = 0.0;
    }
    if (_876)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _956 = -_950;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _798);
    float _960 = _848 * _926;
    float _962 = -_952;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _966 = -_950;
    float _968 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _958 + _970;
    float _974 = -_960;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _978 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _980 = _964 + _978;
    float _982 = -_952;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    float _986 = _972 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = _976 + _988;
    float _992 = _968 * _968;
    float _994 = -_960;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _998 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[28].x, _986);
    float _1000 = fma(_984, _984, _992);
    float _1002 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    float _1004 = fma(_996, _996, _1000);
    bool _1006 = _1002 >= 0.0;
    float _1008 = sqrt(_1004);
    if (_1006)
    {
        _954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1010 = _954;
    int _1012 = as_type<int>(_1010);
    if (_1006)
    {
        out.m_33.x = 0.0;
    }
    float _1014 = _926 * _1008;
    if (_1006)
    {
        float _1016 = _1010 * 5.0;
        _1012 = as_type<int>(_1016);
    }
    int _1018 = _1012;
    if (_1006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2870 = as_type<float>(_1018);
        out.gl_Position.z = _2870;
    }
    if (_1006)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1020 = _533 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1022 = _531 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1024 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _1028 = _1014 * _1020;
    float _1030 = _1014 * _1022;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1034 = _1032 * 0.5;
    float _1036 = _1024 * _1028;
    float _1038 = _1026 * _1030;
    float _1040 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1044 = _1036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1046 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1042);
    float _1050 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1044);
    float _1052 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1046);
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1048);
    float _1056 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1050);
    float _1058 = _1052 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1060 = _1054 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1064 = _834 + _1058;
    float _1066 = _766 + _1060;
    float _1068 = _798 + _1062;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1076 = _1066 + _1074;
    float _1078 = _1072 * _1072;
    float _1080 = fma(_1076, _1076, _1078);
    float _1082 = sqrt(_1080);
    bool _1084 = _1082 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1086 = _1034;
    float _1088 = _1038;
    float _1090 = _1064;
    if (!_1084)
    {
        _1086 = _1064;
    }
    float _1092 = _1086;
    float _1094 = _1092;
    if (!_1084)
    {
        _1088 = _1066;
    }
    float _1096 = _1088;
    float _1098 = _1096;
    if (!_1084)
    {
        _1090 = _1068;
    }
    float _1100 = _1090;
    bool _1102 = !_1084;
    float _1104 = _1100;
    if (!_1102)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1110 = _1082 + _1108;
        float _1112 = rsqrt(_1080);
        float _1114 = _1110 * _1106;
        float _1116 = _1068 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1118 = _1114 * 0.15915493667125701904296875;
        float _1120 = _1118 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1118 * 6.283185482025146484375;
        float _1126 = sin(_1124);
        float _1128 = _1122 + (-1.0);
        float _1130 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1134 = fma(_1068, _1122, _1130);
        float _1136 = _1112 * _1132;
        float _1138 = fma(_1076, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1140 = fma(_1072, _1136, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1104 = _1134;
        _1098 = _1138;
        _1094 = _1140;
    }
    float _1142 = _1104;
    float _1144 = _1098;
    float _1146 = _1094;
    float _1148 = -_950;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1152 = -_952;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1144);
    float _1156 = -_960;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1160 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1162 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1164 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1168 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1160);
    float _1170 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1162);
    float _1172 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1168);
    float _1178 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1170);
    float _1180 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1182 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1174);
    float _1184 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1188 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1194 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1196 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1192);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1194);
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1196);
    float _1206 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1202);
    float _1212 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1204);
    float _1214 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1218 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1210);
    float _1220 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1212);
    float _1222 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1224 = _1216 + _1218;
    float _1226 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1228 = _1224 * 0.5;
    out.m_33.x = _1226;
    out.gl_Position.x = _1220;
    out.gl_Position.y = _1222;
    out.gl_Position.z = _1216;
    out.gl_Position.w = _1218;
    out.m_50.z = _1228;
    out.m_50.w = _1218;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

