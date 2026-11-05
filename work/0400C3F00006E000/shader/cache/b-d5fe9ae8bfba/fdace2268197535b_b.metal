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
    float4 m_48 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _856 = as_type<float>(_85);
        out.gl_Position.z = _856;
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
        float _925 = as_type<float>(_121);
        out.gl_Position.z = _925;
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
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _303 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _305 = isnan(_291);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _301;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _323 = _321 != 0;
    float _325 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _327 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _291 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _333;
    bool _337 = _293 > 0.5;
    float _339 = _335 * _319;
    bool _341 = _295 > 0.5;
    float _343 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _353 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_291);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    bool _367 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = isnan(_291);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _351;
    float _381 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _383 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _389 = -_377;
    float _391 = _389 + 1.0;
    float _393 = _377 * _347;
    float _395 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _327);
    float _397 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _399 = _363 * _391;
    float _401 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _403 = _395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -_363;
    float _407 = _405 + 1.0;
    float _409 = _383 * _399;
    float _411 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _415 = _291 + _413;
    float _417 = _397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _425 = _411 + _423;
    float _427 = _387 * _379;
    float _429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _431 = _417 + _429;
    float _433 = -_181;
    int _435 = _341 ? as_type<int>(_433) : as_type<int>(_181);
    float _437 = _425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _439 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _437);
    float _447 = _425 * _425;
    float _449 = -_177;
    int _451 = _337 ? as_type<int>(_449) : as_type<int>(_177);
    float _453 = fma(_439, _393, _441);
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[28].z, _445);
    bool _457 = !_323;
    float _459 = _457 ? _181 : as_type<float>(_435);
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _463 = !_317;
    float _465 = _463 ? _177 : as_type<float>(_451);
    float _467 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[117].x, _453);
    bool _469 = _455 >= 0.0;
    float _471 = fma(_421, _421, _447);
    float _473 = -_459;
    float _475 = _473 + 0.5;
    float _477 = _465 + 0.5;
    float _479 = fma(_431, _431, _471);
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _487 = _481 * _443;
    float _489 = rsqrt(_479);
    float _491 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _493 = _443;
    if (_469)
    {
        _493 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _495 = _493;
    float _497 = _483 * _461;
    out.m_44.w = _485;
    int _499 = as_type<int>(_495);
    if (_469)
    {
        float _501 = _495 * 5.0;
        _499 = as_type<int>(_501);
    }
    int _503 = _499;
    out.m_46.x = _497;
    out.m_46.y = _487;
    out.m_48.w = _491;
    if (_469)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_503);
        out.gl_Position.z = _1547;
    }
    float _505 = _425 * _489;
    float _507 = _421 * _489;
    if (_469)
    {
        out.m_33.x = 0.0;
    }
    if (_469)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _509 = -_505;
    float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _411);
    float _513 = _431 * _489;
    float _515 = -_507;
    float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _519 = -_505;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _425);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _511 + _523;
    float _527 = -_513;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _517 + _531;
    float _535 = -_507;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _539 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _543 = _529 + _541;
    float _545 = _521 * _521;
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _539);
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].z, _547);
    bool _551 = _549 >= 0.0;
    float _553 = _543;
    if (_551)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    int _557 = as_type<int>(_555);
    if (_551)
    {
        out.m_33.x = 0.0;
    }
    if (_551)
    {
        float _559 = _555 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    if (_551)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_561);
        out.gl_Position.z = _1665;
    }
    if (_551)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _563 = in.m_40.x;
    float _565 = in.m_40.y;
    float _567 = -_513;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _571 = fma(_537, _537, _545);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _577 = fma(_569, _569, _571);
    float _579 = sqrt(_577);
    float _581 = _565 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = _489 * _579;
    float _585 = _563 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _589 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _583 * _587;
    float _593 = _583 * _589;
    float _595 = _573 * _591;
    float _597 = _583 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _599 = _597 * 0.5;
    float _601 = _575 * _593;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _615 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _611);
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _613);
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = _619 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = _417 + _621;
    float _629 = _403 + _623;
    float _631 = _411 + _625;
    float _633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _635 = _627 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _639 = _629 + _637;
    float _641 = _635 * _635;
    float _643 = fma(_639, _639, _641);
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _625;
    float _651 = _601;
    float _653 = _599;
    if (!_647)
    {
        _649 = _629;
    }
    float _655 = _649;
    float _657 = _655;
    if (!_647)
    {
        _651 = _627;
    }
    float _659 = _651;
    float _661 = _659;
    if (!_647)
    {
        _653 = _631;
    }
    float _663 = _653;
    bool _665 = !_647;
    float _667 = _663;
    if (!_665)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _673 = _645 + _671;
        float _675 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = rsqrt(_643);
        float _679 = _673 * _669;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _681 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 + (-1.0);
        float _693 = _691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = fma(_689, _675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = fma(_631, _685, _693);
        float _699 = _677 * _695;
        float _701 = fma(_639, _699, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_635, _699, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _667 = _697;
        _657 = _701;
        _661 = _703;
    }
    float _705 = _667;
    float _707 = _657;
    float _709 = _661;
    float _711 = -_505;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _715 = -_507;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _719 = -_513;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _729 = _713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _725);
    float _735 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _727);
    float _737 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _729);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _731);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _733);
    float _743 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _735);
    float _745 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _755 = _747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _761 = _747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _755);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _757);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _759);
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _761);
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _763);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _765);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _769);
    float _779 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _771);
    float _781 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _773);
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _775);
    float _785 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _777);
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _789 = _779 + _783;
    float _791 = _781 + _783;
    float _793 = _783 * 0.5;
    float _795 = _789 * 0.5;
    float _797 = _791 * 0.5;
    float _799 = fma(_785, -0.5, _793);
    out.m_33.x = _787;
    out.gl_Position.x = _779;
    out.gl_Position.y = _785;
    out.gl_Position.z = _781;
    out.gl_Position.w = _783;
    out.m_50.x = _795;
    out.m_50.y = _799;
    out.m_50.z = _797;
    out.m_50.w = _783;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _856 = as_type<float>(_85);
        out.gl_Position.z = _856;
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
        float _925 = as_type<float>(_121);
        out.gl_Position.z = _925;
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
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _303 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _305 = isnan(_291);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _301;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _323 = _321 != 0;
    float _325 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _327 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _291 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _333;
    bool _337 = _293 > 0.5;
    float _339 = _335 * _319;
    bool _341 = _295 > 0.5;
    float _343 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _353 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_291);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    bool _367 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = isnan(_291);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _351;
    float _381 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _383 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _389 = -_377;
    float _391 = _389 + 1.0;
    float _393 = _377 * _347;
    float _395 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _327);
    float _397 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _399 = _363 * _391;
    float _401 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _403 = _395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -_363;
    float _407 = _405 + 1.0;
    float _409 = _383 * _399;
    float _411 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _415 = _291 + _413;
    float _417 = _397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _425 = _411 + _423;
    float _427 = _387 * _379;
    float _429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _431 = _417 + _429;
    float _433 = -_181;
    int _435 = _341 ? as_type<int>(_433) : as_type<int>(_181);
    float _437 = _425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _439 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _437);
    float _447 = _425 * _425;
    float _449 = -_177;
    int _451 = _337 ? as_type<int>(_449) : as_type<int>(_177);
    float _453 = fma(_439, _393, _441);
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[28].z, _445);
    bool _457 = !_323;
    float _459 = _457 ? _181 : as_type<float>(_435);
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _463 = !_317;
    float _465 = _463 ? _177 : as_type<float>(_451);
    float _467 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[117].x, _453);
    bool _469 = _455 >= 0.0;
    float _471 = fma(_421, _421, _447);
    float _473 = -_459;
    float _475 = _473 + 0.5;
    float _477 = _465 + 0.5;
    float _479 = fma(_431, _431, _471);
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _487 = _481 * _443;
    float _489 = rsqrt(_479);
    float _491 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _493 = _443;
    if (_469)
    {
        _493 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _495 = _493;
    float _497 = _483 * _461;
    out.m_44.w = _485;
    int _499 = as_type<int>(_495);
    if (_469)
    {
        float _501 = _495 * 5.0;
        _499 = as_type<int>(_501);
    }
    int _503 = _499;
    out.m_46.x = _497;
    out.m_46.y = _487;
    out.m_48.w = _491;
    if (_469)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_503);
        out.gl_Position.z = _1547;
    }
    float _505 = _425 * _489;
    float _507 = _421 * _489;
    if (_469)
    {
        out.m_33.x = 0.0;
    }
    if (_469)
    {
        return out;
    }
    float _509 = -_505;
    float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _411);
    float _513 = _431 * _489;
    float _515 = -_507;
    float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _519 = -_505;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _425);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _511 + _523;
    float _527 = -_513;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _517 + _531;
    float _535 = -_507;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _539 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _543 = _529 + _541;
    float _545 = _521 * _521;
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _539);
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].z, _547);
    bool _551 = _549 >= 0.0;
    float _553 = _543;
    if (_551)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    int _557 = as_type<int>(_555);
    if (_551)
    {
        out.m_33.x = 0.0;
    }
    if (_551)
    {
        float _559 = _555 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    if (_551)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_561);
        out.gl_Position.z = _1665;
    }
    if (_551)
    {
        return out;
    }
    float _563 = in.m_40.x;
    float _565 = in.m_40.y;
    float _567 = -_513;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _571 = fma(_537, _537, _545);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _577 = fma(_569, _569, _571);
    float _579 = sqrt(_577);
    float _581 = _565 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = _489 * _579;
    float _585 = _563 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _589 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _583 * _587;
    float _593 = _583 * _589;
    float _595 = _573 * _591;
    float _597 = _583 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _599 = _597 * 0.5;
    float _601 = _575 * _593;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _615 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _611);
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _613);
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = _619 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = _417 + _621;
    float _629 = _403 + _623;
    float _631 = _411 + _625;
    float _633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _635 = _627 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _639 = _629 + _637;
    float _641 = _635 * _635;
    float _643 = fma(_639, _639, _641);
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _625;
    float _651 = _601;
    float _653 = _599;
    if (!_647)
    {
        _649 = _629;
    }
    float _655 = _649;
    float _657 = _655;
    if (!_647)
    {
        _651 = _627;
    }
    float _659 = _651;
    float _661 = _659;
    if (!_647)
    {
        _653 = _631;
    }
    float _663 = _653;
    bool _665 = !_647;
    float _667 = _663;
    if (!_665)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _673 = _645 + _671;
        float _675 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = rsqrt(_643);
        float _679 = _673 * _669;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _681 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 + (-1.0);
        float _693 = _691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = fma(_689, _675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = fma(_631, _685, _693);
        float _699 = _677 * _695;
        float _701 = fma(_639, _699, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_635, _699, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _667 = _697;
        _657 = _701;
        _661 = _703;
    }
    float _705 = _667;
    float _707 = _657;
    float _709 = _661;
    float _711 = -_505;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _715 = -_507;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _719 = -_513;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _729 = _713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _725);
    float _735 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _727);
    float _737 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _729);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _731);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _733);
    float _743 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _735);
    float _745 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _755 = _747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _761 = _747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _755);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _757);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _759);
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _761);
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _763);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _765);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _769);
    float _779 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _771);
    float _781 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _773);
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _775);
    float _785 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _777);
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _789 = _779 + _783;
    float _791 = _781 + _783;
    float _793 = _783 * 0.5;
    float _795 = _789 * 0.5;
    float _797 = _791 * 0.5;
    float _799 = fma(_785, -0.5, _793);
    out.m_33.x = _787;
    out.gl_Position.x = _779;
    out.gl_Position.y = _785;
    out.gl_Position.z = _781;
    out.gl_Position.w = _783;
    out.m_50.x = _795;
    out.m_50.y = _799;
    out.m_50.z = _797;
    out.m_50.w = _783;
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
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_33 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _856 = as_type<float>(_85);
        out.gl_Position.z = _856;
    }
    if (!_73)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _925 = as_type<float>(_121);
        out.gl_Position.z = _925;
    }
    if (_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _269 = _265 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[11].y, _103);
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
    float _293 = in.m_42.x;
    float _295 = in.m_42.y;
    float _297 = _259 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _303 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _305 = isnan(_291);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _301;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _323 = _321 != 0;
    float _325 = _259 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _327 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].x, _325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _331 = _291 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _333;
    bool _337 = _293 > 0.5;
    float _339 = _335 * _319;
    bool _341 = _295 > 0.5;
    float _343 = _259 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _353 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _355 = isnan(_291);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].x, _343);
    bool _367 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _369 = isnan(_291);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _351;
    float _381 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].x, _297);
    float _383 = fma(_339, _331, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _389 = -_377;
    float _391 = _389 + 1.0;
    float _393 = _377 * _347;
    float _395 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[4].z, _327);
    float _397 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[6].z, _381);
    float _399 = _363 * _391;
    float _401 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[5].z, _365);
    float _403 = _395 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _405 = -_363;
    float _407 = _405 + 1.0;
    float _409 = _383 * _399;
    float _411 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _415 = _291 + _413;
    float _417 = _397 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _421 = _403 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _425 = _411 + _423;
    float _427 = _387 * _379;
    float _429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _431 = _417 + _429;
    float _433 = -_181;
    int _435 = _341 ? as_type<int>(_433) : as_type<int>(_181);
    float _437 = _425 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _439 = fma(_427, _415, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _441 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[115].x, _409);
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = fma(_421, (*spvDescriptorSet0.vp_c8)._m0[28].x, _437);
    float _447 = _425 * _425;
    float _449 = -_177;
    int _451 = _337 ? as_type<int>(_449) : as_type<int>(_177);
    float _453 = fma(_439, _393, _441);
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c8)._m0[28].z, _445);
    bool _457 = !_323;
    float _459 = _457 ? _181 : as_type<float>(_435);
    float _461 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _463 = !_317;
    float _465 = _463 ? _177 : as_type<float>(_451);
    float _467 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[117].x, _453);
    bool _469 = _455 >= 0.0;
    float _471 = fma(_421, _421, _447);
    float _473 = -_459;
    float _475 = _473 + 0.5;
    float _477 = _465 + 0.5;
    float _479 = fma(_431, _431, _471);
    float _481 = _475 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _483 = _477 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _487 = _481 * _443;
    float _489 = rsqrt(_479);
    float _491 = _467 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _493 = _443;
    if (_469)
    {
        _493 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _495 = _493;
    float _497 = _483 * _461;
    out.m_44.w = _485;
    int _499 = as_type<int>(_495);
    if (_469)
    {
        float _501 = _495 * 5.0;
        _499 = as_type<int>(_501);
    }
    int _503 = _499;
    out.m_46.x = _497;
    out.m_46.y = _487;
    out.m_48.w = _491;
    if (_469)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1547 = as_type<float>(_503);
        out.gl_Position.z = _1547;
    }
    float _505 = _425 * _489;
    float _507 = _421 * _489;
    if (_469)
    {
        out.m_33.x = 0.0;
    }
    if (_469)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _509 = -_505;
    float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _411);
    float _513 = _431 * _489;
    float _515 = -_507;
    float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _403);
    float _519 = -_505;
    float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _425);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _511 + _523;
    float _527 = -_513;
    float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[18].w, _417);
    float _531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _533 = _517 + _531;
    float _535 = -_507;
    float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[18].w, _421);
    float _539 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _543 = _529 + _541;
    float _545 = _521 * _521;
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[28].x, _539);
    float _549 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].z, _547);
    bool _551 = _549 >= 0.0;
    float _553 = _543;
    if (_551)
    {
        _553 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _555 = _553;
    int _557 = as_type<int>(_555);
    if (_551)
    {
        out.m_33.x = 0.0;
    }
    if (_551)
    {
        float _559 = _555 * 5.0;
        _557 = as_type<int>(_559);
    }
    int _561 = _557;
    if (_551)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1665 = as_type<float>(_561);
        out.gl_Position.z = _1665;
    }
    if (_551)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _563 = in.m_40.x;
    float _565 = in.m_40.y;
    float _567 = -_513;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[18].w, _431);
    float _571 = fma(_537, _537, _545);
    float _573 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _577 = fma(_569, _569, _571);
    float _579 = sqrt(_577);
    float _581 = _565 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = _489 * _579;
    float _585 = _563 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _587 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _589 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _583 * _587;
    float _593 = _583 * _589;
    float _595 = _573 * _591;
    float _597 = _583 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _599 = _597 * 0.5;
    float _601 = _575 * _593;
    float _603 = _595 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _605 = _595 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _595 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[26].x, _603);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _615 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[26].z, _609);
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[24].z, _611);
    float _619 = fma(_599, (*spvDescriptorSet0.vp_c8)._m0[25].z, _613);
    float _621 = _615 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _623 = _617 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _625 = _619 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _627 = _417 + _621;
    float _629 = _403 + _623;
    float _631 = _411 + _625;
    float _633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _635 = _627 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _639 = _629 + _637;
    float _641 = _635 * _635;
    float _643 = fma(_639, _639, _641);
    float _645 = sqrt(_643);
    bool _647 = _645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _649 = _625;
    float _651 = _601;
    float _653 = _599;
    if (!_647)
    {
        _649 = _629;
    }
    float _655 = _649;
    float _657 = _655;
    if (!_647)
    {
        _651 = _627;
    }
    float _659 = _651;
    float _661 = _659;
    if (!_647)
    {
        _653 = _631;
    }
    float _663 = _653;
    bool _665 = !_647;
    float _667 = _663;
    if (!_665)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _671 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _673 = _645 + _671;
        float _675 = _631 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _677 = rsqrt(_643);
        float _679 = _673 * _669;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _681 * 6.283185482025146484375;
        float _685 = cos(_683);
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 + (-1.0);
        float _693 = _691 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _695 = fma(_689, _675, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _697 = fma(_631, _685, _693);
        float _699 = _677 * _695;
        float _701 = fma(_639, _699, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _703 = fma(_635, _699, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _667 = _697;
        _657 = _701;
        _661 = _703;
    }
    float _705 = _667;
    float _707 = _657;
    float _709 = _661;
    float _711 = -_505;
    float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    float _715 = -_507;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _707);
    float _719 = -_513;
    float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _709);
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _729 = _713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[1].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[0].x, _725);
    float _735 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[2].x, _727);
    float _737 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[3].x, _729);
    float _739 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[1].z, _731);
    float _741 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[0].z, _733);
    float _743 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[2].z, _735);
    float _745 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[3].z, _737);
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _751 = _743 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _753 = _745 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _755 = _747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _757 = _747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _759 = _747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _761 = _747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _763 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _755);
    float _765 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _757);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _759);
    float _769 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _761);
    float _771 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[4].z, _763);
    float _773 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[6].z, _765);
    float _775 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[7].z, _767);
    float _777 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[5].z, _769);
    float _779 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[4].w, _771);
    float _781 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[6].w, _773);
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[7].w, _775);
    float _785 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[5].w, _777);
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _789 = _779 + _783;
    float _791 = _781 + _783;
    float _793 = _783 * 0.5;
    float _795 = _789 * 0.5;
    float _797 = _791 * 0.5;
    float _799 = fma(_785, -0.5, _793);
    out.m_33.x = _787;
    out.gl_Position.x = _779;
    out.gl_Position.y = _785;
    out.gl_Position.z = _781;
    out.gl_Position.w = _783;
    out.m_50.x = _795;
    out.m_50.y = _799;
    out.m_50.z = _797;
    out.m_50.w = _783;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_33.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_33.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_33.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_33.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

